//
//  ListViewController.m
//  Core Data Bank
//
//  Created by Joshua Howland on 6/12/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "ListViewController.h"
#import "ParentTableViewDataSource.h"
#import "ChildTableViewDataSource.h"

#import "DetailViewController.h"

#import "Parent.h"

@interface ListViewController () <UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) ParentTableViewDataSource *parentDataSource;
@property (nonatomic, strong) ChildTableViewDataSource *childDataSource;

@end

@implementation ListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.parentDataSource = [ParentTableViewDataSource new];
        self.childDataSource = [ChildTableViewDataSource new];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    
    if (self.parent) {

        [self.childDataSource registerTableView:self.tableView];
        self.childDataSource.parent = self.parent;

        self.tableView.dataSource = self.childDataSource;
        
    } else {

        [self.parentDataSource registerTableView:self.tableView];
        self.tableView.dataSource = self.parentDataSource;

    }
    

    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(add:)];
    self.navigationItem.rightBarButtonItem = addButton;
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    [self.parent.managedObjectContext refreshObject:self.parent mergeChanges:YES];
    [self.tableView reloadData];
}

- (void)add:(id)sender {
    
    DetailViewController *detailViewController = [DetailViewController new];
    
    if (self.parent) {
        detailViewController.parent = self.parent;
    }
    
    [self.navigationController pushViewController:detailViewController animated:YES];

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    if (self.parent) {

        DetailViewController *detailViewController = [DetailViewController new];
        detailViewController.child = [self.childDataSource childAtIndex:indexPath];
        [self.navigationController pushViewController:detailViewController animated:YES];
        
    } else {
        
        ListViewController *listViewController = [ListViewController new];
        listViewController.parent = [self.parentDataSource parentAtIndex:indexPath];
        [self.navigationController pushViewController:listViewController animated:YES];
    
    }
    
}

@end
