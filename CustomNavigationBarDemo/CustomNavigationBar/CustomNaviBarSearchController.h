//
//  CustomNaviBarSearchController.h
//  CustomNavigationBarDemo
//
//  Created by jimple on 14-1-6.
//  Copyright (c) 2014年 Jimple Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CustomViewController;
@class CustomNaviBarSearchController;
@protocol CustomNaviBarSearchControllerDelegate <NSObject>

- (void)naviBarSearchCtrl:(CustomNaviBarSearchController *)ctrl searchKeyword:(NSString *)strKeyword;
- (void)naviBarSearchCtrlCancel:(CustomNaviBarSearchController *)ctrl;

@optional
- (void)naviBarSearchCtrlClearKeywordRecord:(CustomNaviBarSearchController *)ctrl;

@end


@interface CustomNaviBarSearchController : NSObject

@property (unsafe_unretained) id<CustomNaviBarSearchControllerDelegate> delegate;

- (id)initWithParentViewCtrl:(CustomViewController *)viewCtrl;
- (void)resetPlaceHolder:(NSString *)strMsg;
- (void)showTempSearchCtrl;
- (void)showFixationSearchCtrl;
- (void)showFixationSearchCtrlOnTitleView;
- (void)startSearch;
- (void)removeSearchCtrl;

- (void)setRecentKeyword:(NSArray *)arrRecentKeyword;
- (void)setKeyword:(NSString *)strKeyword;


@end
