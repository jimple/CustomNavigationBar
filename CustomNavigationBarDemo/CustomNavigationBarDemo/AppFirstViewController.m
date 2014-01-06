//
//  AppFirstViewController.m
//  CustomNavigationBarDemo
//
//  Created by jimple on 14-1-6.
//  Copyright (c) 2014年 Jimple Chen. All rights reserved.
//

#import "AppFirstViewController.h"
#import "CustomNaviBarView.h"

@interface AppFirstViewController ()
<
    UITableViewDataSource,
    UITableViewDelegate
>


@property (nonatomic, readonly) UIButton *m_btnNaviRight;
@property (nonatomic, strong) IBOutlet UITableView *m_tableView;

@end

@implementation AppFirstViewController
@synthesize m_btnNaviRight = _btnNaviRight;
@synthesize m_tableView = _tableView;

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
    
    // table view
    [UtilityFunc resetScrlView:_tableView contentInsetWithNaviBar:YES tabBar:NO iOS7ContentInsetStatusBarHeight:-1 inidcatorInsetStatusBarHeight:-1];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - CustomNaviBar UI
- (void)initUI
{
    [self setNaviBarTitle:@"Title"];
    [self setNaviBarLeftBtn:nil];
    _btnNaviRight = [CustomNaviBarView createNormalNaviBarBtnByTitle:@"Next" target:self action:@selector(btnNext:)];
    [self setNaviBarRightBtn:_btnNaviRight];
}

- (void)btnNext:(id)sender
{
    [self performSegueWithIdentifier:@"SegueSecondPage" sender:nil];
}


#pragma mark - Table view delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return  50.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"AppTableCell";
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    
    cell.contentView.backgroundColor = (indexPath.row%2 == 0) ? RGBA(246.0f, 102.0f, 59.0f, 0.5f) : RGB_AppWhite;
    cell.textLabel.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = RGB_TextDarkGray;
    cell.textLabel.font = [UIFont systemFontOfSize:SIZE_TextLarge];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.textLabel.text = [NSString stringWithFormat:@"  Cell   %d", indexPath.row];
    
    return cell;
}







@end
