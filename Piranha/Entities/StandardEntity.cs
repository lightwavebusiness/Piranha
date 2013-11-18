﻿using System;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Runtime.Serialization.Formatters.Binary;
using System.Web;

namespace Piranha.Entities
{
	/// <summary>
	/// Base class for a standard Piranha entity owned by a system user.
	/// </summary>
	/// <typeparam name="T">The entity type</typeparam>
	[Serializable]
	public abstract class StandardEntity<T> : BaseEntity where T : StandardEntity<T>
	{
		#region Members
		/// <summary>
		/// Whether not authenticated users should be able to save and delete.
		/// </summary>
		protected bool AllowAnonymous = false ;
		#endregion

		#region Properties
		/// <summary>
		/// Gets/sets the unique id.
		/// </summary>
		public Guid Id { get ; set ; }

		/// <summary>
		/// Gets/sets the date the entity was initially created.
		/// </summary>
		public DateTime Created { get ; set ; }

		/// <summary>
		/// Gets/sets the date the entity was last updated.
		/// </summary>
		public DateTime Updated { get ; set ; }
		#endregion

		/// <summary>
		/// Attaches the entity to the given context.
		/// </summary>
		/// <param name="db">The db context</param>
		public void Attach(DataContext db) {
			if (this.Id == Guid.Empty || db.Set<T>().Count(t => t.Id == this.Id) == 0)
				db.Entry(this).State = EntityState.Added ;
			else db.Entry(this).State = EntityState.Modified ;
		}

		/// <summary>
		/// Saves the current entity.
		/// </summary>
		/// <param name="db">The db context</param>
		/// <param name="state">The current entity state</param>
		public override void OnSave(DataContext db, EntityState state) {
			if (db.Identity != Guid.Empty || Application.Current.SecurityManager.IsAuthenticated || AllowAnonymous) {
				if (state == EntityState.Added) {
					if (Id == Guid.Empty)
						Id = Guid.NewGuid() ;
					Created = Updated = DateTime.Now ;
				} else if (state == EntityState.Modified) {
					Updated = DateTime.Now ;
				}
			} else throw new UnauthorizedAccessException("User must be logged in to save entity") ;
		}

		/// <summary>
		/// Deletes the current entity.
		/// </summary>
		/// <param name="db">The db context</param>
		public override void OnDelete(DataContext db) {
			if (db.Identity == Guid.Empty && !Application.Current.SecurityManager.IsAuthenticated && !AllowAnonymous)
				throw new UnauthorizedAccessException("User must be logged in to delete entity") ;
		}

        /// <summary>
        /// Performs a binary deep clone of the current entity.
        /// </summary>
        /// <returns>The cloned entity</returns>
		public T Clone() {
			using (var ms = new MemoryStream()) {
				var formatter = new BinaryFormatter() ;
				formatter.Serialize(ms, this) ;
				ms.Position = 0 ;

				return (T)formatter.Deserialize(ms);
			}
		}
	}
}
