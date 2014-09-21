---
layout: journal
title: Creating 'Share' Links Manually in Drupal
tags: 
- facebook
- social media
- google plus
- twitter
- share content in drupal
show_chat: true
show_contacts: false
---

Providing links to share content on social networks is a crucial component to most modern websites. While there are a few plugins and modules to accomplish this easily in Wordpress or Drupal, such as <a href="http://wordpress.org/extend/plugins/social-media-widget/" target="_blank">SocialMediaWidget</a> or <a href="http://drupal.org/project/sharethis">ShareThis</a>, there are instances when you need social sharing links to fit a custom design.&nbsp; For example, <a href="http://help.sharethis.com/integration/drupal" target="_blank">ShareThis</a> easily provides you with social media icons in a couple of different configurations. However, what if you wanted to achieve the following design element in your website? <p style="text-align: center; "><img alt="" src="/sites/default/files/social-bar.jpg" style="width: 594px; height: 30px; " /> <p style="text-align: left; ">There is not going to be a code snippet generator from these services that will match your custom design. Fortunately, most social media services provide simple APIs so you can integrate share codes yourself for instances like this. <p style="text-align: left; ">From the above image, we need to share content to Facebook, Twitter, and Google+. Keep in mind that these links are meant to share content, and not necessarily generic links to social media services, or the account pages of the company you are viewing. We need to do a little work, so roll up those sleeves and get ready to do a little programming. <p style="text-align: left; ">We really only need these links to do one simple thing, to allow you to share what you are looking at. To do that, all we need to do is pass a URL and title of the page, the social media services will take care of the rest. As a bonus, this design does not include like/tweet/plus counts, so the overhead of needing javascript and iframes to carry that is non-existent. If you ever wonder why sites like Mashable or TechCrunch feel super slow? Part of that is attributed to using the javascript code snippets to include their share links. <p style="text-align: left; ">Facebook and Twitter are pretty straightforward. The basic link format for both services can be constructed like so: https://www.facebook.com/sharer.php?u=&lt;url to share&gt;&amp;t=&lt;title of content&gt; and https://twitter.com/share?url=(url) So lets get cracking! Drupal is going to make this really easy for us. All we have to utilize in the Drupal API is the url() function, so we can pass in a link and have it properly formatted without having to hardcode it (a no-no!). We also need to utilize PHPs urlencode function, so we can properly pass this data to our social media services. The easiest place to make a change like this is in a view or node type template (.tpl) file in Drupal. Assuming you know how to do the required CSS for the image above, all we have left is to insert our links, with an image inside of them. &lt;a href=&quot;https://www.facebook.com/sharer.php?u=&lt;?php print urlencode(url($node-&gt;path, array(&#39;absolute&#39; =&gt; TRUE))) ?&gt;&amp;t=&lt;?php print urlencode($node-&gt;title) ?&gt;&quot;&gt;&lt;img src=&quot;&lt;?php print base_path() . path_to_theme(); ?&gt;/images/fb-button.gif&quot; alt=&quot;&quot; width=&quot;28&quot; height=&quot;23&quot;&gt;&lt;/a&gt; and for Twitter: &lt;a href=&quot;https://twitter.com/share?url=&lt;?php print urlencode(url($node-&gt;path, array(&#39;absolute&#39; =&gt; TRUE))) ?&gt;&quot;&gt;&lt;img src=&quot;&lt;?php print base_path() . path_to_theme(); ?&gt;/images/twitter-button.gif&quot; alt=&quot;&quot; width=&quot;28&quot; height=&quot;23&quot;&gt;&lt;/a&gt; That&#39;s all! So what is this actually doing? url($node-&gt;path, array(&#39;absolute&#39; =&gt; TRUE)); The url() function in Drupal allows us to pass in a url with an array of options. Since we are working with a node template, Drupal already provides a loaded $node object for us, and one of its items is the path or url of the page. Since we need to use this on an outside website to link to, it needs to also contain the full domain for the URL to work. Passing the option &#39;absolute&#39; as TRUE will make the url() function return a full website url (i.e. http://www.inclind.com/journal/index.htm) - this also helps if you are working on multiple development sites for testing purposes because you will always have the domain returned correctly as opposed to hard coding it into the file. Once the URL is returned, we then clean it up with urlencode which makes our content URL friendly and linkable. Now our image is wrapped in a working anchor tag for both Facebook and Twitter. They link to pages on both sites that understand how to read the URL and title that was passed in, and allow you to share or retweet what page you are on. It&#39;s that simple! You can add however many social links you want provided they supply an API to use to facliitate the above examples. With it, there is no limit to what you can do if you&#39;re looking to have a custom / more unique appearance for your social media sharing bars.