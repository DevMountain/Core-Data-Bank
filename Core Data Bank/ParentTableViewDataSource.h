//
//  ParentTableViewDataSource.h
//  Core Data Bank
//
//  Created by Joshua Howland on 6/12/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Parent;

@interface ParentTableViewDataSource : NSObject <UITableViewDataSource>

- (void)registerTableView:(UITableView *)tableView;
- (Parent *)parentAtIndex:(NSIndexPath *)indexPath;

@end

