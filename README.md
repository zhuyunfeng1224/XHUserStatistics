# XHUserStatistics

[![CI Status](http://img.shields.io/travis/echo/XHUserStatistics.svg?style=flat)](https://travis-ci.org/echo/XHUserStatistics)
[![Version](https://img.shields.io/cocoapods/v/XHUserStatistics.svg?style=flat)](http://cocoapods.org/pods/XHUserStatistics)
[![License](https://img.shields.io/cocoapods/l/XHUserStatistics.svg?style=flat)](http://cocoapods.org/pods/XHUserStatistics)
[![Platform](https://img.shields.io/cocoapods/p/XHUserStatistics.svg?style=flat)](http://cocoapods.org/pods/XHUserStatistics)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

XHUserStatistics is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:
### install 
```ruby
pod "XHUserStatistics", '~> 1.0.1'
```

### create plist file
* create a file named `UserStatistics.plist` 

* add nodes to plist that named `pageEvents` and `actionEvents`
pageEvent is use to statistics page events
and actionEvents is use to statistics user-defined events
 the structure of plist file like this:

```
<dict>
<key>pageEvents</key>
<dict>
<key>XHViewController</key>
<dict>
<key>pageName</key>
<string>mainPage</string>
<key>appear</key>
<true/>
<key>disAppear</key>
<true/>
</dict>
</dict>
<key>actionEvents</key>
<dict>
<key>buttonClicked:</key>
<dict>
<key>XHViewController</key>
<dict>
<key>eventId</key>
<string>clickButton</string>
</dict>
</dict>
</dict>
</dict>
```

* Add initialize statements Into AppDelegate

```
[XHUserStastisticsManager manager].actionEventBlock = ^(XHActionEvent *actionEvent) {
NSLog(@"there is a action Event: %@", actionEvent.eventId);
};

[XHUserStastisticsManager manager].appearPageEventBlock = ^(XHPageEvent *pageEvent) {
NSLog(@"there is a appear event of page: %@", pageEvent.pageName);
};

[XHUserStastisticsManager manager].disappearPageEventBlock = ^(XHPageEvent *pageEvent) {
NSLog(@"there is a disappear event of page: %@", pageEvent.pageName);
};
```

## Author

xihe, leitianshi2009@163.com

## License

XHUserStatistics is available under the MIT license. See the LICENSE file for more info.
