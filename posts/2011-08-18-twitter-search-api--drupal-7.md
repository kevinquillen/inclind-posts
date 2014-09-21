---
layout: journal
title: Twitter Search API & Drupal 7
tags: 
- delaware web developer
- data integration
- integration
- drupal 7
- twitter
- feeds module
- json
- mobile websites
- importing feeds in drupal
- twitter rss is gone
show_chat: true
show_contacts: false
---

I recently had the opportunity to cookup a mobile website for our friends at the <a href="http://www.ustravel.org" target="_blank">U.S. Travel Association</a> which will be launching this month. A feature of the site included a combined view of tweets that included a few accounts and a hashtag. After a bit of research and module testing I just didn't find a solution that worked for Drupal 7.  Previously, using Drupal 6 we had parsed an RSS feed of a specific user account but that recipe didn't quite work now that Twitter has put an emphasis on using their REST API (or Streaming API). No biggie, we work with multiple APIs on a daily basis, and the Twitter REST API is pretty cool. <h2>The Basic Recipe</h2> The basic recipe starts with a foundation of <a href="http://drupal.org/project/drupal" target="_blank">Drupal 7</a> with the following modules (versions are noted but I doubt they'll be accurate for long): <ul>
<li>
<a href="http://drupal.org/project/feeds" target="_blank">Feeds</a> (7.x-2.0-alpha4)</li>
<li>
<a href="http://drupal.org/project/feeds_jsonpath_parser" target="_blank">Feeds JSONPath Parser</a> (7.x-1.0-beta2)</li>
<li>
<a href="http://drupal.org/project/views" target="_blank">Views</a> (7.x-3.0-rc1)</li>
</ul> * Drush commands: 'drush dl job_scheduler feeds feeds_jsonpath_parser views', 'drush en feeds feeds_ui feeds_jsonpath_parser views views_ui job_scheduler'  * Don't forget to follow the install instructions for feeds_jsonpath_parser (download a file and clear cache, not hard). <h2>What is JSON?</h2> JSON stands for JavaScript Object Notation and is a super quick text based format for sending and receiving data, similar to XML. JSON allows the sending of data in a much lighter and more human readable method, making it faster and easier to parse the data on the receiving end. A lot of web apps, APIs and web services make use of or offer JSON as one of its data formats. <h2>Learn the Twitter Search API</h2> Now its time to familiarize yourself with the <a href="https://dev.twitter.com/docs/using-search" target="_blank">Twitter Search API</a> and the source feed data. You'll find that queries can be made based on user account (to and from), hashtag and even geography. Some example queries include: <ul>
<li>User account: http://search.twitter.com/search.json?q=to%3A[USERNAME]%20OR%20from%3A[USERNAME]</li>
<li>Hashtag: http://search.twitter.com/search.json?q=%23[HASHTAG]</li>
</ul> You should definatley try out <a href="http://jsonviewer.stack.hu/" target="_blank">http://jsonviewer.stack.hu/</a>. It will make your life livable while figuring our how to map the JSON data when configuring the feed (Cheers! to <a href="http://drupal.org/node/1060956#comment-4105342" target="_blank">7wonders</a> for this reference). See what I'm talking about:  <h2>Setup the Feed</h2> So, at this point the modules are installed and you've taken a moment to scroll up and down the Twitter Search API documentation page. Now the configuration can begin: <h3>Content Types</h3> The Feeds module will need two content types setup. Its bascially a parent / child type setup. I setup the following: <ul>
<li><strong>Twitter Feed</strong></li>
<li>
<strong>Tweets</strong> - I added fields to correlate to the JSON results above.</li>
</ul><h3>Configure the Feed</h3> Navigation to the feed importers interface (/admin/structure/feeds) and click the "New Importer" tab:   Give the feed a name like "Twitter Import", a machine name "twitter_import" and a friendly description so you know why this was configured 6 months from now.   Viola, you have a new feed. Configuration time!   You'll need to first attach the feed to the Twitter Feed content type:   The fetcher settings are find. Jump down and change the parser to JSONPath parser:   The node processor settings need some adjustment. You want Tweet nodes generated when the feed processes so change the Content Type accordingly. You may also want to fiddle with the text format setting etc...    Now the fun begins. My mappings look like this (basically covering the results we eyed earlier when looking at the JSON response from Twitter):   Now that we have mappings, the JSONPath parser needs final configuration (take note of the context setting). Depending on what you query at Twitter the result set may differ:  <h3>Setup a Twitter Feed Node</h3> Now you should be able to hit up /node/add and create a Twitter Feed node. Your twitter search API query will be entered here:   The feed should process immediately upon saving and generate Tweet nodes if there are results for your search. <h2>Views of Tweets</h2> Now that we have nodes being generated for various Twitter queries a page or block view might be in order.....if you are interested in the presentation side of rending a tweet let me know...I'm out of time for this post.  Thanks to all those who contribute to the Drupal project and contrubted modules like Feeds and Feeds JSONPath Parser!