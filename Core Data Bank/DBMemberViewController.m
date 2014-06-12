//
//  DBMemberViewController.m
//  Core Data Bank
//
//  Created by Joshua Howland on 6/12/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "DBMemberViewController.h"
#import "DBMemberTableViewDataSource.h"
#import "DBMemberAddViewController.h"

@interface DBMemberViewController () <UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) DBMemberTableViewDataSource *datasource;

@end

@implementation DBMemberViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.datasource = [DBMemberTableViewDataSource new];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [self.datasource registerTableView:self.tableView];
    [self.view addSubview:self.tableView];
    
    self.tableView.dataSource = self.datasource;
    self.tableView.delegate = self;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(add:)];
    
    self.navigationItem.rightBarButtonItem = addButton;
    
}

- (void)add:(id)sender {
    
    DBMemberAddViewController *addMemberViewController = [DBMemberAddViewController new];
    addMemberViewController.parentMember = self.member;

    [self.navigationController pushViewController:addMemberViewController animated:YES];

}

- (void)setMember:(Member *)member {
    _member = member;
    
    self.datasource.member = member;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    DBMemberViewController *memberViewController = [DBMemberViewController new];
    memberViewController.member = [self.datasource childAtIndex:indexPath];
    
    [self.navigationController pushViewController:memberViewController animated:YES];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

@end
