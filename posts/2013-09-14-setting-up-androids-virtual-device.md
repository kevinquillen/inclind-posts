---
layout: journal
title: Setting Up Android's Virtual Device
tags: 
- development
- testing
- android
- mobile testing
show_chat: true
show_contacts: false
---

After installing Android's SDK Emulator several times on OSX, I decided it was time to document it and make it really easy for anybody else at the office to get setup. If you're wondering how to get your work station setup and running Android emulations, here are some easy to follow instructions for you to use.  Android SDK allows us to test Android devices on our computers. Depending on what is being accomplished, it may suffice to simply switch your browser’s User Agent to simulate an Android device. I recommend using User Agent Switcher for Chrome. ( <a href="https://chrome.google.com/webstore/detail/user-agent-switcher-for-c/djflhoibgkdhkhhcedjiklpkjnoahfmg?hl=en-US"> https://chrome.google.com/webstore/detail/user-agent-switcher-for-c/djflhoibgkdhkhhcedjiklpkjnoahfmg?hl=en-US</a> ) <ol>
<li>Download the SDK ADT Bundle for Mac. <a href="http://developer.android.com/sdk/index.html"> http://developer.android.com/sdk/index.html</a>
</li>
<li>Extract the ZIP File into the Applications folder of your computer.</li>
<li>Rename the extracted folder to SDK or something that will be easy for you to remember.</li>
<li>Navigate to the following item inside the SDK Directory..    SDK &gt; sdk &gt; tools &gt; android .</li>
<li>Double click to open [you may have to right click to open depending on your comptuer’s security settings.</li>
<li>Viewing the Android SDK Manager Window, you will now need to install a few packages to get your emulators started. Download the the most recent 3 or 4 Android Packages, and make sure to install Intel x86 Emulator Accelrator (HAXM). This will make your emulator faster.</li>
</ol>    You should have all the packages which are checked off in this screenshot. <ol>
<li>Make sure you accept all the license agreements and start the download. It will take a while to download all of the packages, be patient.</li>
<li>In order to get the HAXM Emulator Excelerator to work, you must install the following driver from Intel. <a href="http://software.intel.com/en-us/articles/intel-hardware-accelerated-execution-manager"> http://software.intel.com/en-us/articles/intel-hardware-accelerated-execution-manager</a>. Just download and follow the installation instructions, simple enough.</li>
<li>Almost finished! Once your packages are finished installing, we simply have to create a new emulator to use. In the toolbar, go to Tools &gt; Manage AVDs.</li>
<li>Click New... to create a new Android Virtual Device. It may be wise to name it after the device you use to create it. For example, you could name it Nexus 7, Galaxy Nexus, or 4.0” WVGA. This will help if you have multiple later and you need them organized.</li>
<li>Choose any device to get started, and make sure you can choose Intel Atom under the CPU drop down window. This Intel Atom setting will make your emulator run at a speed that isn’t super slow. Click OK when you’re ready.</li>
<li>Click on your new emulator device and click Start. You should be good to go now.!</li>
</ol>