﻿using System;
using System.Collections.Generic;
using System.ComponentModel.Composition;
using System.ComponentModel.Composition.Hosting;
using System.Linq;
using System.Reflection;
using System.Resources;
using System.Text;
using System.Web;
using System.Web.Compilation;

namespace Piranha.Extend
{
	/// <summary>
	/// The extension manager handles all of the extensions, modules and regions available
	/// for the system including the once included in the core framework.
	/// </summary>
	public sealed class ExtensionManager : IPartImportsSatisfiedNotification
	{
		#region Members
		/// <summary>
		/// Static singleton instance of the extension manager.
		/// </summary>
		public static readonly ExtensionManager Current = new ExtensionManager() ;

		/// <summary>
		/// The private composition container.
		/// </summary>
		private CompositionContainer Container = null ;

		/// <summary>
		/// The currently available extensions.
		/// </summary>
		[ImportMany(AllowRecomposition=true)]
		private IEnumerable<Lazy<IExtension, IExtensionMeta>> Extensions { get ; set ; }

		/// <summary>
		/// The currently code-defined page types.
		/// </summary>
		[ImportMany(AllowRecomposition=true)]
		internal IEnumerable<IPageType> PageTypes { get ; set ; }

		/// <summary>
		/// The currently code-defined post types.
		/// </summary>
		[ImportMany(AllowRecomposition=true)]
		internal IEnumerable<IPostType> PostTypes { get ; set ; }
		#endregion

		/// <summary>
		/// Default private constructor.
		/// </summary>
		private ExtensionManager() {
			// Let MEF scan for imports
			var catalog = new AggregateCatalog() ;

			catalog.Catalogs.Add(new DirectoryCatalog("Bin")) ;

#if !NET40
			if (!System.Web.Compilation.BuildManager.IsPrecompiledApp) {
#endif
				try {
					// This feature only exists for Web Pages
					catalog.Catalogs.Add(new AssemblyCatalog(Assembly.Load("App_Code"))) ;
				} catch {}
#if !NET40
			}
#endif

			Container = new CompositionContainer(catalog) ;
			Container.ComposeParts(this) ;
		}

		/// <summary>
		/// Trigged when all imports are loaded. Initializes all of the extensions.
		/// </summary>
		public void OnImportsSatisfied() {
			using (var db = new DataContext()) {
				// Run the ensure method for all extensions.
				foreach (var ext in Extensions)
					ext.Value.Ensure(db) ;
			}
			// Ensure page types
			EnsurePageTypes() ;

			// Ensure post types
			EnsurePostTypes() ;
		}

		/// <summary>
		/// Gets weather of not an extension of the given type exists in the extension manager.
		/// </summary>
		/// <param name="type">The extension type</param>
		/// <returns>If the extension exists</returns>
		public bool HasType(string type) {
			return Extensions.Where(e => e.Value.GetType().FullName == type).SingleOrDefault() != null ;
		}

		/// <summary>
		/// Creates a new extensions of the given type.
		/// </summary>
		/// <param name="type">The extension type</param>
		/// <param name="args">Optional constructor arguments</param>
		/// <returns>The new instance</returns>
		public IExtension CreateInstance(string type, params object[] args) {
			if (HasType(type)) {
				var ext = Extensions.Where(e => e.Value.GetType().FullName == type).Single() ;
				return (IExtension)Activator.CreateInstance(ext.Value.GetType(), args) ;
			}
			return null ;
		}

		/// <summary>
		/// Gets the name for the extension of the given type.
		/// </summary>
		/// <param name="type">The extension type</param>
		/// <returns>The name</returns>
		public string GetNameByType(string type) {
			var ext = Extensions.Where(e => e.Value.GetType().FullName == type).SingleOrDefault() ;
			if (ext != null) {
				if (ext.Metadata.ResourceType != null && !String.IsNullOrEmpty(ext.Metadata.Name)) {
					var mgr = new ResourceManager(ext.Metadata.ResourceType) ;
					return mgr.GetString(ext.Metadata.Name) ;
				}
				return ext.Metadata.Name ;
			}
			return "" ;
		}

		/// <summary>
		/// Gets the internal id for the extension of the given type.
		/// </summary>
		/// <param name="type">The extension type</param>
		/// <returns>The internal id</returns>
		public string GetInternalIdByType(string type) {
			var ext = Extensions.Where(e => e.Value.GetType().FullName == type).SingleOrDefault() ;
			if (ext != null)
				return !String.IsNullOrEmpty(ext.Metadata.InternalId) ? ext.Metadata.InternalId : 
					ext.Metadata.Name.Replace(" ", "").Replace(".", "") ;
			return "" ;
		}

		/// <summary>
		/// Gets the icon path for the extension of the given type.
		/// </summary>
		/// <param name="type">The extension type</param>
		/// <returns>The icon path</returns>
		public string GetIconPathByType(string type) {
			var ext = Extensions.Where(e => e.Value.GetType().FullName == type).SingleOrDefault() ;
			if (ext != null)
				return !String.IsNullOrEmpty(ext.Metadata.IconPath) ? ext.Metadata.IconPath :
					"~/res.ashx/areas/manager/content/img/ico-missing-ico.png" ;
			return "" ;
		}

		/// <summary>
		/// Gets the real type from its string representation.
		/// </summary>
		/// <param name="type">The extension type</param>
		/// <returns>The real type</returns>
		public Type GetType(string type) {
			return Extensions.Where(e => e.Value.GetType().FullName == type).Select(e => e.Value.GetType()).Single() ;
		}

		/// <summary>
		/// Gets the extensions available for the given extension type.
		/// </summary>
		/// <param name="type">The extension type</param>
		/// <returns></returns>
		public IEnumerable<Lazy<IExtension, IExtensionMeta>> GetByExtensionType(ExtensionType type) {
			return Extensions.Where(e => e.Metadata.Type.HasFlag(type)).ToList() ;
		}

		/// <summary>
		/// Gets the extensions available for the given type.
		/// </summary>
		/// <param name="type">The extension type</param>
		/// <param name="draft">Whether the entity is a draft or not</param>
		/// <returns>A list of extensions</returns>
		public List<Models.Extension> GetByType(ExtensionType type, bool draft = false) {
			var extensions = new List<Models.Extension>() ;

			foreach (var ext in Extensions.Where(e => e.Metadata.Type.HasFlag(type))) {
				extensions.Add(new Models.Extension() {
					IsDraft = draft,
					Type = ext.Value.GetType().FullName,
					Body = (IExtension)Activator.CreateInstance(ext.Value.GetType())
				}) ;
			}
			return extensions ;
		}

		/// <summary>
		/// Gets the extensions available for the given type and entity.
		/// </summary>
		/// <param name="type">The extension type</param>
		/// <param name="id">The entity id</param>
		/// <param name="draft">Whether the entity is a draft or not</param>
		/// <returns>A list of extensions</returns>
		public List<Models.Extension> GetByTypeAndEntity(ExtensionType type, Guid id, bool draft) {
			var ret = new List<Models.Extension>() ;
			var tmp = GetByType(type, draft) ;

			foreach (var e in tmp) {
				var ext = Models.Extension.GetSingle("extension_type = @0 AND extension_parent_id = @1 AND extension_draft = @2",
					e.Type, id, draft) ;
				if (ext != null)
					ret.Add(ext) ;
				else ret.Add(e) ;
			}
			return ret ;
		}

		/// <summary>
		/// Empty stub that just forces the initialization of the extension manager.
		/// </summary>
		internal void ForceInit() {}

		/// <summary>
		/// Creates and updates all page types defined by code.
		/// </summary>
		private void EnsurePageTypes() {
			foreach (var type in PageTypes) {
				var pt = Models.PageTemplate.Get("pagetemplate_type=@0", type.GetType().FullName).SingleOrDefault() ;
				
				Models.Manager.TemplateModels.PageEditModel m = null ;

				// Get or create the page type
				if (pt != null)
					m = Models.Manager.TemplateModels.PageEditModel.GetById(pt.Id, false) ;
				else m = new Models.Manager.TemplateModels.PageEditModel(false) ;

				// Set all meta data
				if (m.Template.IsNew)
					m.Template.Id = Guid.NewGuid() ;
				m.Template.Name = type.Name ;
				m.Template.Description = type.Description ;
				m.Template.Preview = new HtmlString(type.Preview) ;
				m.Template.Controller = type.Controller ;
				m.Template.ShowController = type.ShowController ;
				m.Template.View = type.View ;
				m.Template.ShowView = type.ShowView ;
				m.Template.Properties.Clear() ;
				m.Template.Properties.AddRange(type.Properties) ;
				m.Template.Type = type.GetType().FullName ;

				var old = new List<Models.RegionTemplate>() ;
				m.Regions.ForEach(r => old.Add(r)) ;
				m.Regions.Clear() ;

				// Create region templates
				for (int n = 1; n <= type.Regions.Count; n++) {
					var reg = type.Regions[n - 1] ;

					var rt = old.Where(r => r.InternalId == reg.InternalId && r.Type == reg.Type.FullName).SingleOrDefault() ;
					if (rt == null)
						rt = new Models.RegionTemplate() ;

					rt.TemplateId = m.Template.Id ;
					rt.InternalId = reg.InternalId ;
					rt.Name = reg.Name ;
					rt.Type = reg.Type.FullName ;
					rt.Seqno = n ;
				
					m.Regions.Add(rt) ;
				}
				// Delete removed region templates
				var removed = old.Where(r => !m.Regions.Contains(r)) ;

				// Save Template
				foreach (var rem in removed)
					rem.Delete() ;
				m.SaveAll() ;
			}
		}

		/// <summary>
		/// Creates and updates all post types defined by code.
		/// </summary>
		private void EnsurePostTypes() {
			foreach (var type in PostTypes) {
				var pt = Models.PostTemplate.Get("posttemplate_type=@0", type.GetType().FullName).SingleOrDefault() ;
				
				Models.Manager.TemplateModels.PostEditModel m = null ;

				// Get or create the page type
				if (pt != null)
					m = Models.Manager.TemplateModels.PostEditModel.GetById(pt.Id) ;
				else m = new Models.Manager.TemplateModels.PostEditModel() ;

				// Set all meta data
				if (m.Template.IsNew)
					m.Template.Id = Guid.NewGuid() ;
				m.Template.Name = type.Name ;
				m.Template.Description = type.Description ;
				m.Template.Preview = new HtmlString(type.Preview) ;
				m.Template.Controller = type.Controller ;
				m.Template.ShowController = type.ShowController ;
				m.Template.View = type.View ;
				m.Template.ShowView = type.ShowView ;
				m.Template.Properties.Clear() ;
				m.Template.Properties.AddRange(type.Properties) ;
				m.Template.Type = type.GetType().FullName ;

				// Save Template
				m.SaveAll() ;
			}
		}
	}
}
