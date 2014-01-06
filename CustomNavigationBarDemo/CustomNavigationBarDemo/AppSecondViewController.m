//
//  AppSecondViewController.m
//  CustomNavigationBarDemo
//
//  Created by jimple on 14-1-6.
//  Copyright (c) 2014年 Jimple Chen. All rights reserved.
//

#import "AppSecondViewController.h"
#import "CustomNaviBarView.h"
#import "CustomNaviBarSearchController.h"

@interface AppSecondViewController ()
<
    CustomNaviBarSearchControllerDelegate
>

@property (nonatomic, readonly) UIButton *m_btnNaviRightSearch;
@property (nonatomic, readonly) CustomNaviBarSearchController *m_ctrlSearchBar;

@property (nonatomic, strong) IBOutlet UILabel *m_labelKeyword;

@end

@implementation AppSecondViewController
@synthesize m_ctrlSearchBar = _ctrlSearchBar;
@synthesize m_btnNaviRightSearch = _btnNaviRightSearch;
@synthesize m_labelKeyword = _labelKeyword;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self initUI];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - CustomNaviBar UI
- (void)initUI
{
    [self setNaviBarTitle:@"Search"];
    
    _btnNaviRightSearch = [CustomNaviBarView createImgNaviBarBtnByImgNormal:@"NaviBtn_Search" imgHighlight:@"NaviBtn_Search_H"  target:self action:@selector(btnSearch:)];
    [self setNaviBarRightBtn:_btnNaviRightSearch];
}

- (void)btnSearch:(id)sender
{
    if (!_ctrlSearchBar)
    {
        _ctrlSearchBar = [[CustomNaviBarSearchController alloc] initWithParentViewCtrl:self];
        _ctrlSearchBar.delegate = self;
    }else{}
    [_ctrlSearchBar showTempSearchCtrl];
}

#pragma mark - CustomNaviBarSearchControllerDelegate
- (void)naviBarSearchCtrl:(CustomNaviBarSearchController *)ctrl searchKeyword:(NSString *)strKeyword
{
    [_ctrlSearchBar removeSearchCtrl];
    if (strKeyword && strKeyword.length > 0)
    {
        _labelKeyword.text = strKeyword;
    }
    else
    {
        _labelKeyword.text = @"";
    }
}

- (void)naviBarSearchCtrlCancel:(CustomNaviBarSearchController *)ctrl
{
    [_ctrlSearchBar removeSearchCtrl];
    _labelKeyword.text = @"";
}




@end
