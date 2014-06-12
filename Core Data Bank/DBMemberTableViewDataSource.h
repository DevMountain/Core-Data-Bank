//
//  DBMemberTableViewDataSource.h
//  Core Data Bank
//
//  Created by Joshua Howland on 6/12/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Member;

@interface DBMemberTableViewDataSource : NSObject <UITableViewDataSource>

@property (nonatomic, strong) Member *member;

- (void)registerTableView:(UITableView *)tableView;

- (Member *)childAtIndex:(NSIndexPath *)indexPath;

@end

