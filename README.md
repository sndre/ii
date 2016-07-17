# Pre-work - *ii%*

**ii%** is a tip calculator application for iOS.

Submitted by: **sndre**

Time spent: **5** hours spent in total

## User Stories

The following **required** functionality is complete:

* [x] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [x] Settings page to change the default tip percentage.

The following **optional** features are implemented:
* [x] UI animations
* [x] Remembering the bill amount across app restarts (if <10mins)
* [x] Using locale-specific currency and currency thousands separators.
* [x] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

- [x] Use banking style number input - type numbers only, the last two digits typed represent cents
- [x] Listen to NSCurrentLocaleDidChangeNotification event to automatically reformat currency field using new locale
- [x] Listen to UIContentSizeCategoryDidChangeNotification event to automatically adjust dynamic fonts

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='https://imgur.com/M4svlHf' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

Auto-layout was a little bit tricky to do right.
UIContentSizeCategoryDidChangeNotification doesn’t work in the emulator so had to test on the device.

## License

    Copyright [2016] [sndre]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.