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

### 安装 

```ruby
pod "XHUserStatistics", '~> 1.0.1'
```

### 创建plist文件

* 首先创建一个名为UserStatistics的plist文件 `UserStatistics.plist` 

### 创建plist文件

* 在plist根节点下面添加两个节点分别为：`pageEvents` 和 `actionEvents`

pageEvent用来添加页面事件
actionEvents用来添加自定义事件，但是只能添加controller内的方法
plist的结构如下:

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

* 在AppDelegate中添加初始化语句
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


## 注意:
  自定义事件所有的方法参数类型一定要是OC对象，不可以是基本类型，如：NSInteger要使用NSNumber类型
  
## Author

xihe, leitianshi2009@163.com

## License

XHUserStatistics is available under the MIT license. See the LICENSE file for more info.
