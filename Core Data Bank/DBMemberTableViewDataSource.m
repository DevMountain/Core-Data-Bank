//
//  DBMemberTableViewDataSource.m
//  Core Data Bank
//
//  Created by Joshua Howland on 6/12/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "DBMemberTableViewDataSource.h"

#import "MemberController.h"

static NSString * const MemberCellIdentifier = @"MemberCell";

@interface DBMemberTableViewDataSource () <UITableViewDataSource, NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) NSFetchedResultsController *resultsController;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation DBMemberTableViewDataSource

- (void)registerTableView:(UITableView *)tableView {
    self.tableView = tableView;
    
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:MemberCellIdentifier];
}

- (void)setMember:(Member *)member {
    _member = member;
    
    self.resultsController = member.childrenFetchedResultsController;
    self.resultsController.delegate = self;
    [self.resultsController performFetch:NULL];

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.resultsController.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    id<NSFetchedResultsSectionInfo> sectionInfo = self.resultsController.sections[section];
    return sectionInfo.numberOfObjects;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MemberCellIdentifier forIndexPath:indexPath];
    Member *member = [self.resultsController objectAtIndexPath:indexPath];
    
    cell.textLabel.text = member.title;
    return cell;
}

- (Member *)childAtIndex:(NSIndexPath *)indexPath {

    Member *member = [self.resultsController objectAtIndexPath:indexPath];
    return member;
}

- (void)controller:(NSFetchedResultsController*)controller
   didChangeObject:(id)anObject
       atIndexPath:(NSIndexPath*)indexPath
     forChangeType:(NSFetchedResultsChangeType)type
      newIndexPath:(NSIndexPath*)newIndexPath
{
    if (type == NSFetchedResultsChangeInsert) {
        [self.tableView insertRowsAtIndexPaths:@[newIndexPath]
                              withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}


- (void)controllerWillChangeContent:(NSFetchedResultsController*)controller
{
    [self.tableView beginUpdates];
}

- (void)controllerDidChangeContent:(NSFetchedResultsController*)controller
{
    [self.tableView endUpdates];
}

@end
