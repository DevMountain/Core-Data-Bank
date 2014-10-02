//
//  Parent.m
//  Core Data Bank
//
//  Created by Joshua Howland on 10/2/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "Parent.h"
#import "Child.h"


@implementation Parent

@dynamic title;
@dynamic children;

- (NSArray *)sortedChildren {
    
    NSSortDescriptor *alphabetical = [[NSSortDescriptor alloc] initWithKey:@"title" ascending:YES];
    NSArray *sortedChildren = [self.children sortedArrayUsingDescriptors:@[ alphabetical ]];
    
    return sortedChildren;
    
}


@end
