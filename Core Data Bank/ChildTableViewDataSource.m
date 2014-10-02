//
//  ParentTableViewDataSource.m
//  Core Data Bank
//
//  Created by Joshua Howland on 6/12/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "ChildTableViewDataSource.h"
#import "ParentController.h"

@interface ChildTableViewDataSource () <UITableViewDataSource, NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ChildTableViewDataSource

- (void)registerTableView:(UITableView *)tableView {
    self.tableView = tableView;
    
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSSet *children = self.parent.children;
    return self.parent.children.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    Child *child = self.parent.sortedChildren[indexPath.row];
    cell.textLabel.text = child.title;
    return cell;
    
}

- (Child *)childAtIndex:(NSIndexPath *)indexPath {
    Child *child = self.parent.sortedChildren[indexPath.row];
    return child;
}

@end
