//
//  CTAddWorkerViewController.m
//  ConTrackter
//
//  Created by John West on 5/19/13.
//  Copyright (c) 2013 John West. All rights reserved.
//

#import "CTAddWorkerViewController.h"

@interface CTAddWorkerViewController ()

@end

@implementation CTAddWorkerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view = [[CTAddWorkerView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    UIBarButtonItem *barButtonSave = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveAndSendWorkerNameToTable)];
    self.navigationItem.rightBarButtonItem = barButtonSave;
    [self.navigationItem setTitle:@"Add Worker"];
    
    [self.view.addWorkerNameTextField setDelegate:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) saveAndSendWorkerNameToTable
{
    if ([self.view.addWorkerNameTextField.text isEqualToString:@""])
    {
        
    }
    else
    {
        NSString *additionalWorkerNameString = self.view.addWorkerNameTextField.text;
        [self.delegate returnWorkerNameMethod:self workerNameToPassBack:additionalWorkerNameString];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.view.addWorkerNameTextField resignFirstResponder];
    return NO;
}

@end
