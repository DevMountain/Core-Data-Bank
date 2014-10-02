//
//  DetailViewController.m
//  Core Data Bank
//
//  Created by Joshua Howland on 6/12/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "DetailViewController.h"
#import "ParentController.h"
#import "Parent.h"

@interface DetailViewController ()

@property (nonatomic, strong) IBOutlet UITextField *titleField;

@end

@implementation DetailViewController

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

    if (self.parent) {
        self.title = @"Add Child";
        self.titleField.placeholder = @"Set Child Title";
    } else {
        self.title = @"Add Parent";
        self.titleField.placeholder = @"Set Parent Title";
    }
    
    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(save:)];
    self.navigationItem.rightBarButtonItem = saveButton;

    
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel:)];
    self.navigationItem.leftBarButtonItem = cancelButton;

}

- (void)save:(id)sender {
    
    if (self.titleField.text.length > 0) {
        if (self.parent) {
            [[ParentController sharedInstance] insertChildWithTitle:self.titleField.text parent:self.parent inManagedObjectContext:self.parent.managedObjectContext];
            [self.parent.managedObjectContext save:NULL];
        } else {
            [[ParentController sharedInstance] addParentWithTitle:self.titleField.text];
            [[DBStack sharedInstance].managedObjectContext save:NULL];
        }
        
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)cancel:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
