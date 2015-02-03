# ZRScrollableTabBar

[![CI Status](http://img.shields.io/travis/raihan/ZRScrollableTabBar.svg?style=flat)](https://travis-ci.org/raihan/ZRScrollableTabBar)
[![Version](https://img.shields.io/cocoapods/v/ZRScrollableTabBar.svg?style=flat)](http://cocoadocs.org/docsets/ZRScrollableTabBar)
[![License](https://img.shields.io/cocoapods/l/ZRScrollableTabBar.svg?style=flat)](http://cocoadocs.org/docsets/ZRScrollableTabBar)
[![Platform](https://img.shields.io/cocoapods/p/ZRScrollableTabBar.svg?style=flat)](http://cocoadocs.org/docsets/ZRScrollableTabBar)

Normally tabbar shows more tab if there is more then 5 tab in a tab bar controller. To overcome this problem you can use ZRScrollableTabBar which will allow you to put as many tab as you want and they are scrollable

**Sample screenshots**

<img src="https://github.com/raihan/ZRScrollableTabBar/blob/master/Example/ZRScrollableTabBar/Screenshot1.png" width="200" />
<img src="https://github.com/raihan/ZRScrollableTabBar/blob/master/Example/ZRScrollableTabBar/Screenshot2.png" width="200" />
<img src="https://github.com/raihan/ZRScrollableTabBar/blob/master/Example/ZRScrollableTabBar/Screenshot3.png" width="200" />
## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

**Usage sample**

```
-(void)initScrollableTabbar
{
// Tab bar
UITabBarItem *item1 = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemBookmarks tag:1];
UITabBarItem *item2 = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemContacts tag:2];
UITabBarItem *item3 = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemDownloads tag:3];
UITabBarItem *item4 = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFeatured tag:4];
UITabBarItem *item5 = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemRecents tag:5];
UITabBarItem *item6 = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemTopRated tag:6];
UITabBarItem *item7 = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemRecents tag:7];
UITabBarItem *item8 = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemContacts tag:8];
UITabBarItem *item9 = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemBookmarks tag:9];

ZRScrollableTabBar *tabBar = [[ZRScrollableTabBar alloc] initWithItems:[NSArray arrayWithObjects: item1, item2, item3, item4, item5, item6, item7, item8, item9, nil]];
tabBar.scrollableTabBarDelegate = self;

[self.view addSubview:tabBar];
}

```

You will get the tabbar with selected index on delegate method

```
- (void)scrollableTabBar:(ZRScrollableTabBar *)tabBar didSelectItemWithTag:(int)tag
{
....
}
````
## Requirements

iOS 7+, Compitable on both iPhone and iPad

## Installation

ZRScrollableTabBar is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod "ZRScrollableTabBar"

## Author

Abdullah Md. Zubair, raihan.zbr@gmail.com

## License
(The MIT License)

Copyright (c) 2015 Abdullah Md. Zubair <raihan.zbr@gmail.com>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the 'Software'), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
