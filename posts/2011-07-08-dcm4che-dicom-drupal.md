---
layout: journal
title: DCM4CHE? DICOM? Drupal?
tags: 
- integration
- drupal module development
- pacs
- dcm4che
- dicom
- extranet
show_chat: true
show_contacts: false
---

You know those cool MRI images that you get after something not so cool happens? Well we just put the finishing touches on a extranet for our friends over at <a href="http://www.onisite.com" target="_blank">ONI</a> that allows your doc to access them really fast. We used Drupal to build out the extranet framework. The neato part is that a custom Drupal module was developed to synchronize the patient &amp; study data with another open source system called <a href="http://www.dcm4che.org/" target="_blank">DCM4CHE</a>. <ul> <li>So it kinda goes like this: You get hurt (let's say you tweaked a knee playing intramural lacrosse).</li> <li>You go to the doc and he send you to ONI for an MRI.</li> <li>You sit in a cool machine at ONI and a friendly technician takes cool picture of the inside of your knee.</li> <li>The machine feeds that DICOM image data into DCM4CHE (witchcraft I know).</li> <li>Our cool Drupal module talks with DCM4CHE and within an hour your doctor can peruse the inside of your knee (with a little help from ONI's technical report).</li> </ul> Is that some cool voodoo magic or what? The critical element to this recipe is a web-based image viewer called Weasis. It takes on the job of consuming the DICOM image data and presenting it on a Windows or MAC computer. On top of all that cool web developer stuff, we threw in some <a href="http://www.inclind.com/content/web-design/index.htm">Delaware web design</a> magic to provide a simple but effective user interface. The experience is a bit different depending on security cleareance but you get the idea from <a href="http://www.inclind.com/our-work/oni-orthopedic-neuro-imaging/detail.htm">look at our portfolio screenshots</a>.  If you happen to be on the lookout for a custom <a href="http://en.wikipedia.org/wiki/Picture_archiving_and_communication_system" target="_blank">PACS</a> database integration or some other cool way to make your business more efficient...<strong><a href="/contact-us.htm">DROP US A LINE</a></strong>.