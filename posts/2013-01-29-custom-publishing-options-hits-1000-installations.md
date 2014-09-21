---
layout: journal
title: Custom Publishing Options' Hits 1000 Installations!
tags: 
- custom drupal modules
- drupal development
- custom web development
- development
- drupal 7 publishing workflow
- custom publishing options
- drupal published status
- how to add more to drupal publish options
show_chat: true
show_contacts: false
---

Out of the box, Drupal comes with 3 workflow states for node types: Published, Sticky, and Promote to Frontpage. &#39;Published&#39; is useful enough to control if content is visible to non-administrative users, but what if you want to mark content as Archived, Featured, or other custom statuses? You could add a Field on the content type, but that comes with some overhead to manage across multiple content types. Plus, you have to remember to remove it from the display, and set user permissions on the Field. That&#39;s a lot of work for busy content creators! <a href="http://drupal.org/project/custom_pub" target="_blank" title="Drupal Module - Custom Publishing Options | Inclind Inc">Custom Publishing Options</a> extends the published status functionality of node content in Drupal to allow site administrators to define their own publish states. Each state is added to the database node schema and extends the node entity info to mark it as a property. This enables you to integrate custom states quickly into existing workflows, or develop new ones for content creators. This flexibility allows, for example, creating a View of nodes that are marked &#39;Archive&#39; or any custom status, without needing to unpublish them to filter them from other Views. You could also have a &#39;Featured&#39; status, to flag content for a slider rotation View, as well, it&#39;s really up to you. <p style="text-align: center;"><img alt="Inclind Inc - Custom Publishing Options" src="/sites/default/files/cpo.png" style="width: 579px; height: 349px;" /> We picked up and developed this module for Drupal 7 while working on a project for a local popular classifieds service in 2011. After just a year, it has gone from 350 to over 1100 installations, which is very exciting. Not quite <a href="http://drupal.org/project/views" target="_blank">Views</a> numbers by any means, but still fun to see consistent growth. We plan on adding support for NoSQL databases and ApacheSolr support in the near future, so keep an eye out!