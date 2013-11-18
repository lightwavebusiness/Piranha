﻿using System;
using System.Collections.Generic;

namespace Piranha.Entities
{
	/// <summary>
	/// The group entity.
	/// </summary>
	[Serializable]
	public class Group : BaseEntity
	{
		#region Properties
		/// <summary>
		/// Gets/sets the unique group id.
		/// </summary>
		public Guid Id { get ; set ; }

		/// <summary>
		/// Gets/sets the id of the optional parent group.
		/// </summary>
		public Guid? ParentId { get ; set ; }

		/// <summary>
		/// Gets/sets the unique group name.
		/// </summary>
		public string Name { get ; set ; }

		/// <summary>
		/// Gets/sets the group description.
		/// </summary>
		public string Description { get ; set ; }

		/// <summary>
		/// Gets/sets the date the group was initially created.
		/// </summary>
		public DateTime Created { get ; set ; }

		/// <summary>
		/// Gets/sets the date the group was last updated.
		/// </summary>
		public DateTime Updated { get ; set ; }
		#endregion

		#region Navigation properties
		/// <summary>
		/// Gets/sets the optional parent group.
		/// </summary>
		public Group Parent { get ; set ; }

		/// <summary>
		/// Gets/sets the permissions attached to the group.
		/// </summary>
		public IList<Permission> Permissions { get ; set ; }

		/// <summary>
		/// Gets/sets the currently available extensions.
		/// </summary>
		public IList<Extension> Extensions { get ; set ; }
		#endregion

		/// <summary>
		/// Default constructor.
		/// </summary>
		public Group() {
			Extensions = new List<Extension>() ;
		}
	}
}
