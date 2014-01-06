//
//  UtilityFunc.m
//  CustomNavigationBarDemo
//
//  Created by jimple on 14-1-6.
//  Copyright (c) 2014年 Jimple Chen. All rights reserved.
//

#import "UtilityFunc.h"
#import "GlobalDefine.h"

@implementation UtilityFunc



// 是否4英寸屏幕
+ (BOOL)is4InchScreen
{
    static BOOL bIs4Inch = NO;
    static BOOL bIsGetValue = NO;
    
    if (!bIsGetValue)
    {
        CGRect rcAppFrame = [UIScreen mainScreen].bounds;
        bIs4Inch = (rcAppFrame.size.height == 568.0f);
        
        bIsGetValue = YES;
    }else{}
    
    return bIs4Inch;
}

// label设置最小字体大小
+ (void)label:(UILabel *)label setMiniFontSize:(CGFloat)fMiniSize forNumberOfLines:(NSInteger)iLines
{
    if (label)
    {
        label.adjustsFontSizeToFitWidth = YES;
        label.minimumScaleFactor = fMiniSize/label.font.pointSize;
        if ((iLines != 1) && (IOSVersion < 7.0f))
        {
            label.adjustsLetterSpacingToFitWidth = YES;
        }else{}
    }else{}
}

// 清除PerformRequests和notification
+ (void)cancelPerformRequestAndNotification:(UIViewController *)viewCtrl
{
    if (viewCtrl)
    {
        [[viewCtrl class] cancelPreviousPerformRequestsWithTarget:viewCtrl];
        [[NSNotificationCenter defaultCenter] removeObserver:viewCtrl];
    }else{}
}

// 重设scroll view的内容区域和滚动条区域
+ (void)resetScrlView:(UIScrollView *)sclView contentInsetWithNaviBar:(BOOL)bHasNaviBar tabBar:(BOOL)bHasTabBar
{
    [[self class] resetScrlView:sclView contentInsetWithNaviBar:bHasNaviBar tabBar:bHasTabBar iOS7ContentInsetStatusBarHeight:0 inidcatorInsetStatusBarHeight:0];
}
+ (void)resetScrlView:(UIScrollView *)sclView contentInsetWithNaviBar:(BOOL)bHasNaviBar tabBar:(BOOL)bHasTabBar iOS7ContentInsetStatusBarHeight:(NSInteger)iContentMulti inidcatorInsetStatusBarHeight:(NSInteger)iIndicatorMulti
{
    if (sclView)
    {
        UIEdgeInsets inset = sclView.contentInset;
        UIEdgeInsets insetIndicator = sclView.scrollIndicatorInsets;
        CGPoint ptContentOffset = sclView.contentOffset;
        CGFloat fTopInset = bHasNaviBar ? NaviBarHeight : 0.0f;
        CGFloat fTopIndicatorInset = bHasNaviBar ? NaviBarHeight : 0.0f;
        CGFloat fBottomInset = bHasTabBar ? TabBarHeight : 0.0f;
        
        fTopInset += StatusBarHeight;
        fTopIndicatorInset += StatusBarHeight;
        
        if (IsiOS7Later)
        {
            fTopInset += iContentMulti * StatusBarHeight;
            fTopIndicatorInset += iIndicatorMulti * StatusBarHeight;
        }else{}
        
        inset.top += fTopInset;
        inset.bottom += fBottomInset;
        [sclView setContentInset:inset];
        
        insetIndicator.top += fTopIndicatorInset;
        insetIndicator.bottom += fBottomInset;
        [sclView setScrollIndicatorInsets:insetIndicator];
        
        ptContentOffset.y -= fTopInset;
        [sclView setContentOffset:ptContentOffset];
    }else{}
}





@end
