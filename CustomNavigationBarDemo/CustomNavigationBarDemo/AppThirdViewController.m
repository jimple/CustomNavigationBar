//
//  AppThirdViewController.m
//  CustomNavigationBarDemo
//
//  Created by jimple on 14-1-6.
//  Copyright (c) 2014年 Jimple Chen. All rights reserved.
//

#import "AppThirdViewController.h"
#import "CustomNaviBarView.h"
#import "CustomNaviBarSearchController.h"

@interface AppThirdViewController ()
<
    CustomNaviBarSearchControllerDelegate
>

@property (nonatomic, readonly) CustomNaviBarSearchController *m_ctrlSearchBar;
@property (nonatomic, strong) IBOutlet UILabel *m_labelKeyword;

- (IBAction)btnBack:(id)sender;

@end

@implementation AppThirdViewController
@synthesize m_ctrlSearchBar = _ctrlSearchBar;
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

- (IBAction)btnBack:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - CustomNaviBar UI
- (void)initUI
{
    [self setNaviBarTitle:@""];
    
    _ctrlSearchBar = [[CustomNaviBarSearchController alloc] initWithParentViewCtrl:self];
    _ctrlSearchBar.delegate = self;
    [_ctrlSearchBar resetPlaceHolder:@"请输入关键字"];
    [_ctrlSearchBar showFixationSearchCtrl];

    [_ctrlSearchBar setRecentKeyword:@[@"keyword 1", @"keyword 2", @"keyword 3"]];
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
    _labelKeyword.text = @"";
}

- (void)naviBarSearchCtrlClearKeywordRecord:(CustomNaviBarSearchController *)ctrl
{
    [_ctrlSearchBar setRecentKeyword:nil];
}





@end
