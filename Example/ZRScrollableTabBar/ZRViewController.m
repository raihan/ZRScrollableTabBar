//
//  ZRScrollableTabBar.m
//  ZRScrollableTabBar
//
//  Created by Abdullah Md. Zubair on 2/2/15.
//  Copyright (c) 2015 Abdullah Md. Zubair. All rights reserved.
//

#import "ZRScrollableTabBar.h"

#define ButtonNoPerTab 5.0
#define TabHeight 49.0
#define TabWidth [[UIScreen mainScreen] bounds].size.width-20

@interface ZRScrollableTabBar ()
{
    CGFloat screenWidth;
    CGFloat screenHeight;
}

@end

@implementation ZRScrollableTabBar

@synthesize scrollableTabBarDelegate;
@synthesize tabBars;
@synthesize nextButton;
@synthesize previousButton;
@synthesize tabScrollView;

- (id)initWithItems:(NSArray *)items {
    screenWidth = [[UIScreen mainScreen] bounds].size.width;
    screenHeight = [[UIScreen mainScreen] bounds].size.height;
    self = [super initWithFrame:CGRectMake(0.0, screenHeight-TabHeight, screenWidth, TabHeight)];
    if (self)
    {
        tabScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(10.0, 0.0, TabWidth, TabHeight)];
        previousButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [previousButton setFrame:CGRectMake(2, 14, 10, 21)];
        nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [nextButton setFrame:CGRectMake(TabWidth + 8, 14, 10, 21)];
        [nextButton addTarget:self action:@selector(goToNextTabBar) forControlEvents:UIControlEventTouchUpInside];
        [previousButton addTarget:self action:@selector(goToPreviousTabBar) forControlEvents:UIControlEventTouchUpInside];
        [previousButton setImage:nil forState:UIControlStateNormal];
        [nextButton setImage:[UIImage imageNamed:@"arrrow_right.png"] forState:UIControlStateNormal];
        [self setBackgroundColor:[UIColor colorWithRed:246.0/255 green:246.0/255 blue:246.0/255 alpha:1.0]];
        [nextButton setBackgroundColor:[UIColor colorWithRed:246.0/255 green:246.0/255 blue:246.0/255 alpha:1.0]];
        [previousButton setBackgroundColor:[UIColor colorWithRed:246.0/255 green:246.0/255 blue:246.0/255 alpha:1.0]];
        [self addSubview:nextButton];
        [self addSubview:previousButton];
        tabScrollView.pagingEnabled = YES;
        tabScrollView.delegate = self;
        tabScrollView.showsHorizontalScrollIndicator = NO;
        tabScrollView.bounces = NO;
        
        self.tabBars = [[NSMutableArray alloc] init];
        
        float x = 0.0;
        
        for (double d = 0; d < ceil(items.count / ButtonNoPerTab); d ++)
        {
            UITabBar *tabBar = [[UITabBar alloc] initWithFrame:CGRectMake(x, 0.0, TabWidth, TabHeight)];
            tabBar.delegate = self;
            int len = 0;
            
            for (int i = d * ButtonNoPerTab; i < d * ButtonNoPerTab + ButtonNoPerTab; i ++)
                if (i < items.count)
                    len ++;
            
            tabBar.items = [items objectsAtIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(d * ButtonNoPerTab, len)]];
            
            [self.tabScrollView addSubview:tabBar];
            
            [self.tabBars addObject:tabBar];
            [self addSubview:tabScrollView];
            
            x += TabWidth;
        }
        [self selectItemWithTag:(int)[(UITabBarItem *)[items firstObject] tag]];
        [self.tabScrollView setContentSize:CGSizeMake(x, TabHeight)];
        
    }
    
    return self;
}

-(void)goToNextTabBar
{
    CGFloat pageWidth = self.frame.size.width;
    int page = floor((tabScrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    [self scrollToPage:page+1 animation:YES];
}

-(void)goToPreviousTabBar
{
    CGFloat pageWidth = self.frame.size.width;
    int page = floor((tabScrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    [self scrollToPage:page-1 animation:YES];
}

- (void)setItems:(NSArray *)items animated:(BOOL)animated {
    for (UITabBar *tabBar in self.tabBars) {
        int len = 0;
        
        for (int i = [self.tabBars indexOfObject:tabBar] * ButtonNoPerTab; i < [self.tabBars indexOfObject:tabBar] * ButtonNoPerTab + ButtonNoPerTab; i ++)
            if (i < items.count)
                len ++;
        
        [tabBar setItems:[items objectsAtIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange([self.tabBars indexOfObject:tabBar] * ButtonNoPerTab, len)]] animated:animated];
    }
    
    tabScrollView.contentSize = CGSizeMake(ceil(items.count / ButtonNoPerTab) * screenWidth, TabHeight);
}

- (int)currentTabBarTag {
    return tabScrollView.contentOffset.x / screenWidth;
}

- (int)selectedItemTag {
    for (UITabBar *tabBar in self.tabBars)
        if (tabBar.selectedItem != nil)
            return (int)tabBar.selectedItem.tag;
    
    // No item selected
    return 0;
}

- (BOOL)scrollToTabBarWithTag:(int)tag animated:(BOOL)animated {
    
    for (UITabBar *tabBar in self.tabBars)
        for (UITabBarItem *item in tabBar.items)
            if (item.tag == tag) {
                tabBar.selectedItem = item;
                
                [tabScrollView scrollRectToVisible:tabBar.frame animated:animated];
                [self tabBar:tabBar didSelectItem:item];
                
                return YES;
            }
    
    return NO;
    
}

- (BOOL)selectItemWithTag:(int)tag {
    for (UITabBar *tabBar in self.tabBars)
        for (UITabBarItem *item in tabBar.items)
            if (item.tag == tag) {
                tabBar.selectedItem = item;
                
                [self tabBar:tabBar didSelectItem:item];
                
                return YES;
            }
    
    return NO;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat pageWidth = tabScrollView.frame.size.width;
    double maxPage = ceil(tabScrollView.contentSize.width / screenWidth) - 1;
    int page = floor((tabScrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    if (page == 0)
    {
        [previousButton setImage:nil forState:UIControlStateNormal];
        [nextButton setImage:[UIImage imageNamed:@"arrrow_right.png"] forState:UIControlStateNormal];
    }
    else if (page == maxPage)
    {
        [previousButton setImage:[UIImage imageNamed:@"arrrow_left.png"] forState:UIControlStateNormal];
        [nextButton setImage:nil forState:UIControlStateNormal];
    }
    else
    {
        [previousButton setImage:[UIImage imageNamed:@"arrrow_left.png"] forState:UIControlStateNormal];
        [nextButton setImage:[UIImage imageNamed:@"arrrow_right.png"] forState:UIControlStateNormal];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
}

-(void)scrollToPage:(int)page animation:(BOOL)animated
{
    CGRect frame = self.tabScrollView.frame;
    frame.origin.x = frame.size.width * page;
    frame.origin.y = 0;
    [tabScrollView scrollRectToVisible:frame animated:animated];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    [self scrollViewDidEndDecelerating:scrollView];
}

- (void)tabBar:(UITabBar *)cTabBar didSelectItem:(UITabBarItem *)item {
    // Act like a single tab bar
    for (UITabBar *tabBar in self.tabBars)
        if (tabBar != cTabBar)
            tabBar.selectedItem = nil;
    
    [self.scrollableTabBarDelegate scrollableTabBar:self didSelectItemWithTag:(int)item.tag];
}


- (void)dealloc {
}

@end