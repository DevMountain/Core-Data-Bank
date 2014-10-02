//
//  ChildTableViewDataSource.h
//  Core Data Bank
//
//  Created by Joshua Howland on 6/12/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Parent, Child;

@interface ChildTableViewDataSource : NSObject <UITableViewDataSource>

@property (nonatomic, strong) Parent *parent;

- (void)registerTableView:(UITableView *)tableView;
- (Child *)childAtIndex:(NSIndexPath *)indexPath;

@end

