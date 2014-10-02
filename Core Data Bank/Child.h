//
//  Child.h
//  Core Data Bank
//
//  Created by Joshua Howland on 10/2/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Parent;

@interface Child : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) Parent *parent;

@end
