//
//  DBMemberDetailViewController.m
//  Core Data Bank
//
//  Created by Joshua Howland on 6/12/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "DBMemberAddViewController.h"

#import "MemberController.h"

@interface DBMemberAddViewController ()

@property (nonatomic, strong) IBOutlet UITextField *titleLabel;

@end

@implementation DBMemberAddViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"Add Member";
    
    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(save:)];
    
    self.navigationItem.rightBarButtonItem = saveButton;

    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel:)];
    
    self.navigationItem.leftBarButtonItem = cancelButton;

}

- (void)save:(id)sender {
    
    [MemberController insertMemberWithTitle:self.titleLabel.text parent:self.parentMember inManagedObjectContext:self.parentMember.managedObjectContext];
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)cancel:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
