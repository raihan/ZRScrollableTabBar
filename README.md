# ZRScrollableTabBar

[![CI Status](http://img.shields.io/travis/raihan/ZRScrollableTabBar.svg?style=flat)](https://travis-ci.org/raihan/ZRScrollableTabBar)
[![Version](https://img.shields.io/cocoapods/v/ZRScrollableTabBar.svg?style=flat)](http://cocoadocs.org/docsets/ZRScrollableTabBar)
[![License](https://img.shields.io/cocoapods/l/ZRScrollableTabBar.svg?style=flat)](http://cocoadocs.org/docsets/ZRScrollableTabBar)
[![Platform](https://img.shields.io/cocoapods/p/ZRScrollableTabBar.svg?style=flat)](http://cocoadocs.org/docsets/ZRScrollableTabBar)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

**Usage sample**

```
- (void) initializeTabView
{
TestViewController *test1 = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"testViewController"];

TestViewController *test2 = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"testViewController"];
[test2.view setBackgroundColor:[UIColor lightGrayColor]];

TestViewController *test3 = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"testViewController"];
[test3.view setBackgroundColor:[UIColor orangeColor]];

ZRTabView *tabView = [[ZRTabView alloc] initWithPoint:CGPointMake(0, 0) withViews:[NSMutableArray arrayWithObjects:test1, test2, test3, nil] viewsNameArray:[NSMutableArray arrayWithObjects:@"ANYTHING", @"ANYTHING MORE", @"ANY WISH YOU WANT TO WRITE", nil] initialSelection:0];
tabView.delegate = self;

[self.view addSubview:tabView];
}

```

You will get the selected index on delegate method

```
-(void)didSelectTabBarWidgetIndex:(int)index
{
...
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
