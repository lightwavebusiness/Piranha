﻿-- Default users
INSERT INTO sysuser (sysuser_id, sysuser_apikey, sysuser_login, sysuser_group_id, sysuser_created, sysuser_updated)
VALUES ('ca19d4e7-92f0-42f6-926a-68413bbdafbc', 'FE868D4F-797C-4E60-B876-64E6FC2424AA', 'sys', '7c536b66-d292-4369-8f37-948b32229b83',
	GETDATE(), GETDATE());

-- Default groups
INSERT INTO sysgroup (sysgroup_id, sysgroup_parent_id, sysgroup_name, sysgroup_description, sysgroup_created, sysgroup_updated)
VALUES ('7c536b66-d292-4369-8f37-948b32229b83', NULL, 'Systemadministrator', 
	'System administrator group with full permissions.', GETDATE(), GETDATE());
INSERT INTO sysgroup (sysgroup_id, sysgroup_parent_id, sysgroup_name, sysgroup_description, sysgroup_created, sysgroup_updated)
VALUES ('8940b41a-e3a9-44f3-b564-bfd281416141', '7c536b66-d292-4369-8f37-948b32229b83', 'Administrator', 
	'Web site administrator group.', GETDATE(), GETDATE());

-- Default access
INSERT INTO sysaccess (sysaccess_id, sysaccess_group_id, sysaccess_function, sysaccess_description, sysaccess_locked, sysaccess_created, sysaccess_updated)
VALUES ('4fbdedb7-10ec-4a10-8f82-7d4c5cf61f2c', '8940b41a-e3a9-44f3-b564-bfd281416141', 'ADMIN', 
	'Access to login to the admin panel.', 1, GETDATE(), GETDATE());
INSERT INTO sysaccess (sysaccess_id, sysaccess_group_id, sysaccess_function, sysaccess_description, sysaccess_locked, sysaccess_created, sysaccess_updated)
VALUES ('00074fd5-6c81-4181-8a09-ba6ef94f8364', '7c536b66-d292-4369-8f37-948b32229b83', 
	'ADMIN_PAGE_TEMPLATE', 'Access to add, update and delete page types.', 1, GETDATE(), GETDATE());
INSERT INTO sysaccess (sysaccess_id, sysaccess_group_id, sysaccess_function, sysaccess_description, sysaccess_locked, sysaccess_created, sysaccess_updated)
VALUES ('ff296d65-d24d-446a-8f02-d93a7ab57086', '7c536b66-d292-4369-8f37-948b32229b83', 
	'ADMIN_POST_TEMPLATE', 'Access to add, update and delete post types.', 1, GETDATE(), GETDATE());
INSERT INTO sysaccess (sysaccess_id, sysaccess_group_id, sysaccess_function, sysaccess_description, sysaccess_locked, sysaccess_created, sysaccess_updated)
VALUES ('0c19578a-d6c0-45f8-9ffd-bcffa5d84772', '7c536b66-d292-4369-8f37-948b32229b83', 
	'ADMIN_PARAM', 'Access to add, update and delete system parameters.', 1, GETDATE(), GETDATE());
INSERT INTO sysaccess (sysaccess_id, sysaccess_group_id, sysaccess_function, sysaccess_description, sysaccess_locked, sysaccess_created, sysaccess_updated)
VALUES ('0f367b04-ef7b-4007-88bd-7d78cbdea64a', '7c536b66-d292-4369-8f37-948b32229b83', 
	'ADMIN_ACCESS', 'Access to add, update and delete access rules.', 1, GETDATE(), GETDATE());
INSERT INTO sysaccess (sysaccess_id, sysaccess_group_id, sysaccess_function, sysaccess_description, sysaccess_locked, sysaccess_created, sysaccess_updated)
VALUES ('08d17dbf-cd1d-40a9-b558-0866210ac4ec', '8940b41a-e3a9-44f3-b564-bfd281416141', 
	'ADMIN_GROUP', 'Access to add, update and delete user groups.', 1, GETDATE(), GETDATE());
INSERT INTO sysaccess (sysaccess_id, sysaccess_group_id, sysaccess_function, sysaccess_description, sysaccess_locked, sysaccess_created, sysaccess_updated)
VALUES ('36fbc1ad-4e17-4767-9fdc-af92802e5ebb', '8940b41a-e3a9-44f3-b564-bfd281416141', 
	'ADMIN_PAGE', 'Access to add and update pages.', 1, GETDATE(), GETDATE());
INSERT INTO sysaccess (sysaccess_id, sysaccess_group_id, sysaccess_function, sysaccess_description, sysaccess_locked, sysaccess_created, sysaccess_updated)
VALUES ('c8b44826-d3e6-4add-b241-8ce95429a17e', '8940b41a-e3a9-44f3-b564-bfd281416141', 
	'ADMIN_POST', 'Access to add and update posts.', 1, GETDATE(), GETDATE());
INSERT INTO sysaccess (sysaccess_id, sysaccess_group_id, sysaccess_function, sysaccess_description, sysaccess_locked, sysaccess_created, sysaccess_updated)
VALUES ('79ED0E9E-188C-4C5B-81BA-DB15BB9F8AD5', '8940b41a-e3a9-44f3-b564-bfd281416141', 
	'ADMIN_CATEGORY', 'Access to add, update and delete categories.', 1, GETDATE(), GETDATE());
INSERT INTO sysaccess (sysaccess_id, sysaccess_group_id, sysaccess_function, sysaccess_description, sysaccess_locked, sysaccess_created, sysaccess_updated)
VALUES ('E08AE820-D438-4A38-B6E1-AC3ACA3CF933', '8940b41a-e3a9-44f3-b564-bfd281416141', 
	'ADMIN_CONTENT', 'Access to add and update images & documents.', 1, GETDATE(), GETDATE());
INSERT INTO sysaccess (sysaccess_id, sysaccess_group_id, sysaccess_function, sysaccess_description, sysaccess_locked, sysaccess_created, sysaccess_updated)
VALUES ('8a4ca0f3-261b-4689-8c1f-98065b65f9ee', '8940b41a-e3a9-44f3-b564-bfd281416141', 
	'ADMIN_USER', 'Access to add, update and delete users.', 1, GETDATE(), GETDATE());
INSERT INTO sysaccess (sysaccess_id, sysaccess_group_id, sysaccess_function, sysaccess_description, sysaccess_locked, sysaccess_created, sysaccess_updated)
VALUES ('f65bd7dd-6dfe-45b7-87e3-20a11e1f8d55', '8940b41a-e3a9-44f3-b564-bfd281416141', 'ADMIN_COMMENT', 
	'Access to administrate comments.', 1, GETDATE(), GETDATE());
INSERT INTO sysaccess (sysaccess_id, sysaccess_group_id, sysaccess_function, sysaccess_description, sysaccess_locked, sysaccess_created, sysaccess_updated)
VALUES ('f71ca1b9-1276-4c3e-a090-5fba6c4980ce', '8940b41a-e3a9-44f3-b564-bfd281416141', 'ADMIN_SITETREE', 
	'Access to administrate site trees.', 1, GETDATE(), GETDATE());
INSERT INTO sysaccess (sysaccess_id, sysaccess_group_id, sysaccess_function, sysaccess_description, sysaccess_locked, sysaccess_created, sysaccess_updated)
VALUES ('da291f10-5bb6-44a5-ae20-1c9932c870e9', '8940b41a-e3a9-44f3-b564-bfd281416141', 
	'ADMIN_PAGE_PUBLISH', 'Access to publish, depublish and delete pages.', 1, GETDATE(), GETDATE());
INSERT INTO sysaccess (sysaccess_id, sysaccess_group_id, sysaccess_function, sysaccess_description, sysaccess_locked, sysaccess_created, sysaccess_updated)
VALUES ('1bb90c7d-f3dd-43fe-aff5-985368d316e6', '8940b41a-e3a9-44f3-b564-bfd281416141', 
	'ADMIN_POST_PUBLISH', 'Access to publish, depublish and delete posts.', 1, GETDATE(), GETDATE());
INSERT INTO sysaccess (sysaccess_id, sysaccess_group_id, sysaccess_function, sysaccess_description, sysaccess_locked, sysaccess_created, sysaccess_updated)
VALUES ('222119de-a510-427f-92ff-3d357bdf0c2c', '8940b41a-e3a9-44f3-b564-bfd281416141', 
	'ADMIN_CONTENT_PUBLISH', 'Access to publish, depublish and delete images & documents.', 1, GETDATE(), GETDATE());

-- Default params
INSERT INTO sysparam (sysparam_id, sysparam_name, sysparam_value, sysparam_description, sysparam_locked, sysparam_created, sysparam_updated)
VALUES ('9a14664f-806d-4a4f-9a72-e8368fb358d5', 'SITE_VERSION', '32', 'The currently installed version of Piranha.', 1, 
	GETDATE(), GETDATE());
INSERT INTO sysparam (sysparam_id, sysparam_name, sysparam_value, sysparam_description, sysparam_locked, sysparam_created, sysparam_updated)
VALUES ('CF06BF4C-C426-4047-8E5E-6E0082AAF1BF', 'SITE_LAST_MODIFIED', GETDATE(), 'Global last modification date.', 1, 
	GETDATE(), GETDATE());
INSERT INTO sysparam (sysparam_id, sysparam_name, sysparam_value, sysparam_description, sysparam_locked, sysparam_created, sysparam_updated)
VALUES ('C08B1891-ABA2-4E0D-AD61-2ABDFBA81A59', 'CACHE_PUBLIC_EXPIRES', 0, 'How many minutes browsers are allowed to cache public content.', 1, 
	GETDATE(), GETDATE());
INSERT INTO sysparam (sysparam_id, sysparam_name, sysparam_value, sysparam_description, sysparam_locked, sysparam_created, sysparam_updated)
VALUES ('48BDF688-BA95-46B4-91C7-6A8430F387FF', 'CACHE_PUBLIC_MAXAGE', 0, 'How many minutes cached content is valid in the browser.', 1, 
	GETDATE(), GETDATE());
INSERT INTO sysparam (sysparam_id, sysparam_name, sysparam_value, sysparam_description, sysparam_locked, sysparam_created, sysparam_updated)
VALUES ('08E8A582-7825-43B2-A12D-2522889F04BE', 'IMAGE_MAX_WIDTH', 940, 'Maximum width for uploaded images.', 1, 
	GETDATE(), GETDATE());
INSERT INTO sysparam (sysparam_id, sysparam_name, sysparam_value, sysparam_description, sysparam_locked, sysparam_created, sysparam_updated)
VALUES ('095502DD-D655-4001-86F9-97D18222A548', 'SITEMAP_EXPANDED_LEVELS', '0', 'The number of pre-expanded levels in the manager panel for the page list.', 1, 
	GETDATE(), GETDATE());
INSERT INTO sysparam (sysparam_id, sysparam_name, sysparam_value, sysparam_description, sysparam_locked, sysparam_created, sysparam_updated)
VALUES ('40230360-71CE-441E-A8DF-D50CFA79ACC2', 'RSS_NUM_POSTS', 10, 'The maximum number posts to be exported in a feed. For an infinite amount of posts, use the value 0.', 1,
	GETDATE(), GETDATE());
INSERT INTO sysparam (sysparam_id, sysparam_name, sysparam_value, sysparam_description, sysparam_locked, sysparam_created, sysparam_updated)
VALUES ('A64A8479-8125-47BA-9980-B30B36E744D3', 'RSS_USE_EXCERPT', '1', 'Weather to use an excerpt in the feeds or export the full content.', 1,
	GETDATE(), GETDATE());
INSERT INTO sysparam (sysparam_id, sysparam_name, sysparam_value, sysparam_description, sysparam_locked, sysparam_created, sysparam_updated)
VALUES ('5A0D6307-F041-41A1-B63A-563E712F3B8C', 'HIERARCHICAL_PERMALINKS', '0', 'Weather or not permalink generation should be hierarchical.', 1,
	GETDATE(), GETDATE());
INSERT INTO sysparam (sysparam_id, sysparam_name, sysparam_value, sysparam_description, sysparam_locked, sysparam_created, sysparam_updated)
VALUES ('4C694949-DEE0-465E-AB08-253927BDCBD8', 'SITE_PRIVATE_KEY', SUBSTRING(REPLACE(CAST(NEWID() AS NVARCHAR(38)), '-', ''), 1, 16), 
	'The private key used for public key encryption.', 1, GETDATE(), GETDATE());

-- Default templates
INSERT INTO pagetemplate (pagetemplate_id, pagetemplate_name, pagetemplate_description, pagetemplate_preview, pagetemplate_created, pagetemplate_updated)
VALUES ('906761ea-6c04-4f4b-9365-f2c350ff4372', 'Standard page', 'Standard page type.',
	'<table class="template"><tr><td id="Content"></td></tr></table>', GETDATE(), GETDATE());
INSERT INTO posttemplate (posttemplate_id, posttemplate_name, posttemplate_description, posttemplate_preview, posttemplate_created, posttemplate_updated)
VALUES ('5017dbe4-5685-4941-921b-ca922edc7a12', 'Standard post', 'Standard post type.', 
	'<table class="template"><tr><td></td></tr></table>', GETDATE(), GETDATE());
INSERT INTO regiontemplate (regiontemplate_id, regiontemplate_template_id, regiontemplate_internal_id, regiontemplate_seqno,
	regiontemplate_name, regiontemplate_type, regiontemplate_created, regiontemplate_updated)
VALUES ('96ADAC79-5DC5-453D-A0DE-A6871D74FD99', '906761ea-6c04-4f4b-9365-f2c350ff4372', 'Content', 1, 
	'Content', 'Piranha.Extend.Regions.HtmlRegion', GETDATE(), GETDATE());

-- Default namespaces
INSERT INTO [namespace] ([namespace_id], [namespace_internal_id], [namespace_name], [namespace_description], [namespace_created], [namespace_updated])
	VALUES ('8FF4A4B4-9B6C-4176-AAA2-DB031D75AC03', 'DEFAULT', 'Default namespace', 'This is the default namespace for all pages and posts.',
		GETDATE(), GETDATE());
INSERT INTO [namespace] ([namespace_id], [namespace_internal_id], [namespace_name], [namespace_description], [namespace_created], [namespace_updated])
	VALUES ('AE46C4C4-20F7-4582-888D-DFC148FE9067', 'CATEGORY', 'Category namespace', 'This is the namespace for all categories.',
		GETDATE(), GETDATE());
INSERT INTO [namespace] ([namespace_id], [namespace_internal_id], [namespace_name], [namespace_description], [namespace_created], [namespace_updated])
	VALUES ('C8342FB4-D38E-4EAF-BBC1-4EF3BDD7500C', 'ARCHIVE', 'Archive namespace', 'This is the archive namespace for all post types.',
		GETDATE(), GETDATE());
INSERT INTO [namespace] ([namespace_id], [namespace_internal_id], [namespace_name], [namespace_description], [namespace_created], [namespace_updated])
	VALUES ('368249B1-7F9C-4974-B9E3-A55D068DD9B6', 'MEDIA', 'Media namespace', 'This is the media namespace for all images & documents.',
		GETDATE(), GETDATE());

-- Default site tree
INSERT INTO [sitetree] ([sitetree_id], [sitetree_namespace_id], [sitetree_internal_id], [sitetree_name], [sitetree_description], [sitetree_meta_title],
	[sitetree_meta_description], [sitetree_created], [sitetree_updated])
VALUES ('C2F87B2B-F585-4696-8A2B-3C9DF882701E', '8FF4A4B4-9B6C-4176-AAA2-DB031D75AC03', 'DEFAULT_SITE', 'Default site', 'This is the default site tree.',
	'My site', 'Welcome the the template site', GETDATE(), GETDATE());

-- Add site template and page for the default site
INSERT INTO pagetemplate (pagetemplate_id, pagetemplate_name, pagetemplate_site_template, pagetemplate_created, pagetemplate_updated)
VALUES ('C2F87B2B-F585-4696-8A2B-3C9DF882701E', 'C2F87B2B-F585-4696-8A2B-3C9DF882701E', 1,
	 GETDATE(), GETDATE());
INSERT INTO permalink (permalink_id, permalink_namespace_id, permalink_type, permalink_name, permalink_created, permalink_updated)
VALUES ('2E168001-D113-4216-ACC5-03C61C2D0C21', '8FF4A4B4-9B6C-4176-AAA2-DB031D75AC03', 'SITE', 'C2F87B2B-F585-4696-8A2B-3C9DF882701E', 
	GETDATE(), GETDATE());
INSERT INTO page (page_id, page_sitetree_id, page_draft, page_template_id, page_permalink_id, page_parent_id, page_seqno, page_title, 
	page_created, page_updated, page_published, page_last_published)
VALUES ('94823A5C-1E29-4BDB-84E4-9B5F636CDDB5', 'C2F87B2B-F585-4696-8A2B-3C9DF882701E', 1, 'C2F87B2B-F585-4696-8A2B-3C9DF882701E', '2E168001-D113-4216-ACC5-03C61C2D0C21', 
	'C2F87B2B-F585-4696-8A2B-3C9DF882701E', 1, 'C2F87B2B-F585-4696-8A2B-3C9DF882701E', GETDATE(), GETDATE(), GETDATE(), GETDATE());
INSERT INTO page (page_id, page_sitetree_id, page_draft, page_template_id, page_permalink_id, page_parent_id, page_seqno, page_title, 
	page_created, page_updated, page_published, page_last_published)
VALUES ('94823A5C-1E29-4BDB-84E4-9B5F636CDDB5', 'C2F87B2B-F585-4696-8A2B-3C9DF882701E', 0, 'C2F87B2B-F585-4696-8A2B-3C9DF882701E', '2E168001-D113-4216-ACC5-03C61C2D0C21', 
	'C2F87B2B-F585-4696-8A2B-3C9DF882701E', 1, 'C2F87B2B-F585-4696-8A2B-3C9DF882701E', GETDATE(), GETDATE(), GETDATE(), GETDATE());

-- Permalink
INSERT INTO permalink (permalink_id, permalink_namespace_id, permalink_type, permalink_name, permalink_created, permalink_updated)
VALUES ('1e64c1d4-e24f-4c7c-8f61-f3a75ad2e2fe', '8FF4A4B4-9B6C-4176-AAA2-DB031D75AC03', 'PAGE', 'start', GETDATE(), GETDATE());

-- Default page
INSERT INTO page (page_id, page_sitetree_id, page_draft, page_template_id, page_permalink_id, page_seqno, page_title, page_keywords, page_description,
	page_created, page_updated, page_published, page_last_published, page_last_modified)
VALUES ('7849b6d6-dc43-43f6-8b5a-5770ab89fbcf', 'C2F87B2B-F585-4696-8A2B-3C9DF882701E', 1, '906761ea-6c04-4f4b-9365-f2c350ff4372', '1e64c1d4-e24f-4c7c-8f61-f3a75ad2e2fe', 
	1, 'Start', 'Piranha, Welcome', 'Welcome to Piranha', GETDATE(), GETDATE(), GETDATE(), GETDATE(), GETDATE());
INSERT INTO page (page_id, page_sitetree_id, page_draft, page_template_id, page_permalink_id, page_seqno, page_title, page_keywords, page_description,
	page_created, page_updated, page_published, page_last_published, page_last_modified)
VALUES ('7849b6d6-dc43-43f6-8b5a-5770ab89fbcf', 'C2F87B2B-F585-4696-8A2B-3C9DF882701E', 0, '906761ea-6c04-4f4b-9365-f2c350ff4372', '1e64c1d4-e24f-4c7c-8f61-f3a75ad2e2fe', 
	1, 'Start', 'Piranha, Welcome', 'Welcome to Piranha', GETDATE(), GETDATE(), GETDATE(), GETDATE(), GETDATE());

-- Region
INSERT INTO region (region_id, region_draft, region_page_id, region_page_draft, region_regiontemplate_id,
	region_body, region_created, region_updated)
VALUES ('87ec4dbd-c3ba-4a6b-af49-78421528c363', 1, '7849b6d6-dc43-43f6-8b5a-5770ab89fbcf', 1, '96ADAC79-5DC5-453D-A0DE-A6871D74FD99',
	'<p>Welcome to Piranha -  the fun, fast and lightweight framework for developing cms-based web applications with an extra bite.</p>', GETDATE(), GETDATE());
INSERT INTO region (region_id, region_draft, region_page_id, region_page_draft, region_regiontemplate_id, 
	region_body, region_created, region_updated)
VALUES ('87ec4dbd-c3ba-4a6b-af49-78421528c363', 0, '7849b6d6-dc43-43f6-8b5a-5770ab89fbcf', 0, '96ADAC79-5DC5-453D-A0DE-A6871D74FD99',
	'<p>Welcome to Piranha -  the fun, fast and lightweight framework for developing cms-based web applications with an extra bite.</p>', GETDATE(), GETDATE());
