//
//  ZRScrollableTabBar.h
//  ZRScrollableTabBar
//
//  Created by Abdullah Md. Zubair on 2/2/15.
//  Copyright (c) 2015 Abdullah Md. Zubair. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ZRScrollableTabBarDelegate;

@interface ZRScrollableTabBar : UIView <UIScrollViewDelegate, UITabBarDelegate> {
    __unsafe_unretained id <ZRScrollableTabBarDelegate> scrollableTabBarDelegate;
    NSMutableArray *tabBars;
    UIButton *nextButton;
    UIButton *previousButton;
    __strong UIScrollView *tabScrollView;
}

@property (nonatomic, assign) __unsafe_unretained id scrollableTabBarDelegate;
@property (nonatomic, retain) NSMutableArray *tabBars;
@property (nonatomic, retain) UIButton *nextButton;
@property (nonatomic, retain) UIButton *previousButton;
@property (nonatomic, strong) __strong UIScrollView *tabScrollView;

- (id)initWithItems:(NSArray *)items;
- (void)setItems:(NSArray *)items animated:(BOOL)animated;
- (int)currentTabBarTag;
- (int)selectedItemTag;
- (BOOL)scrollToTabBarWithTag:(int)tag animated:(BOOL)animated;
- (BOOL)selectItemWithTag:(int)tag;

-(void)goToNextTabBar;
-(void)goToPreviousTabBar;


@end

@protocol ZRScrollableTabBarDelegate <NSObject>
- (void)scrollableTabBar:(ZRScrollableTabBar *)tabBar didSelectItemWithTag:(int)tag;
@end
