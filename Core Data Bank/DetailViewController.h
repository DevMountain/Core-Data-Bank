//
//  DetailViewController.h
//  Core Data Bank
//
//  Created by Joshua Howland on 6/12/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Parent, Child;

@interface DetailViewController : UIViewController

@property (nonatomic, strong) Parent *parent;
@property (nonatomic, strong) Child *child;

@end

