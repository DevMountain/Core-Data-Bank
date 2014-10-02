//
//  ParentTableViewDataSource.m
//  Core Data Bank
//
//  Created by Joshua Howland on 6/12/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "ParentTableViewDataSource.h"
#import "ParentController.h"

@interface ParentTableViewDataSource () <UITableViewDataSource, NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end



@implementation ParentTableViewDataSource

- (void)registerTableView:(UITableView *)tableView {
    self.tableView = tableView;
    
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [ParentController sharedInstance].parents.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    Parent *parent = [ParentController sharedInstance].parents[indexPath.row];
    cell.textLabel.text = parent.title;
    return cell;
    
}

- (Parent *)parentAtIndex:(NSIndexPath *)indexPath {
    Parent *parent = [ParentController sharedInstance].parents[indexPath.row];
    return parent;
}

@end
