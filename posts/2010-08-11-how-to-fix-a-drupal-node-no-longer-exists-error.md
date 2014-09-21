---
layout: journal
title: How to fix a Drupal \"Node no longer exists\" Error
tags: 
- drupal
- drupal development
- drupal cache error
- drupal node not found
- delaware web developer
show_chat: true
show_contacts: false
---

When working with Drupal and XML/SOAP data, you might be coding right along and run into this error: <blockquote> Warning: unserialize() [function.unserialize]: Node no longer exists</blockquote> What happened?! Well, if you are working with XML/SOAP data and try to save it with variable_set() or watchdog(), both of these Drupal functions serialize the data before they are saved to the database, a common method of saving and logging changes in Drupal. However, if you are parsing XML with SimpleXML, you may think you are working with a string, but in fact are working with a object. What happens then is when variable_set(), watchdog() or functions like it are called, the data passed in is run through serialize and later read with unserialize. The problem with that is SimpleXML can create objects with invisible properties, and when Drupal tries to serialize your data, its expecting a string and not an object. The quick way around this is to typecast the value you want to save: <strong>Before:</strong> <code>if ($xml_response) { watchdog(&#39;mymodule&#39;, &#39;User @user saved, key @key&#39;, array(&#39;@user&#39; =&gt; $user-&gt;name, &#39;@key&#39; =&gt; $xml_response-&gt;MyResponseObject-&gt;unique_key_value), WATCHDOG_NOTICE); } </code> <strong>After:</strong> <code>if ($xml_response) { $key = (string)$xml_response-&gt;MyResponseObject-&gt;unique_key_value; watchdog(&#39;mymodule&#39;, &#39;User @user saved, key @key&#39;, array(&#39;@user&#39; =&gt; $user-&gt;name, &#39;@key&#39; =&gt; $key), WATCHDOG_NOTICE); } </code> But wait, you changed your code, and you still see the error at the top of your page? No problem. Now the issue is that you have data in the database that you need to get rid of, because Drupal is trying to read the borked entries back with unserialize(). In my example above, all I needed to do was the following in MySQL: <code>TRUNCATE watchdog; </code> This clears out the watchdog table, getting rid of my bad logs. If you saved a variable the same way I was trying to save a response above, you will either need to go in with MySQL and delete the variable, or you can do variable_del(&#39;variable_name&#39;); in the code with the same effect. Hope this helps!