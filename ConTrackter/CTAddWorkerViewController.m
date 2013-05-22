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

@synthesize yearArray = _yearArray;

- (id)initWithYearArray:(NSArray *)array
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view = [[CTAddWorkerView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    UIBarButtonItem *barButtonSave = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveAndSendWorkerNameToTable)];
    self.navigationItem.rightBarButtonItem = barButtonSave;
    [self.navigationItem setTitle:@"Add Worker"];
    
    self.yearArray = [[NSArray alloc] initWithObjects:@"2011", @"2012", @"2013",@"2014",@"2015",@"2016", nil];
    
    [self.view.addWorkerYearPicker setShowsSelectionIndicator:YES];
    [self.view.addWorkerYearPicker setDelegate:self];
    [self.view.addWorkerNameTextField setDelegate:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) saveAndSendWorkerNameToTable
{
    if ([self.view.addWorkerNameTextField.text length] == 0)
    {
        UIAlertView *incorrectNameAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Invalid Entry For Worker Name. Please Enter Valid Worker Name." delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles: nil];
        [self.view.addWorkerNameTextField setBackgroundColor:[UIColor yellowColor]];
        [incorrectNameAlert show];
    }
    else
    {
        CTWorkerModel *acquiredNameAndYear = [[CTWorkerModel alloc] initWithName:self.view.addWorkerNameTextField.text andYear:self.selectedYear];
        [self.delegate returnWorkerNameMethod:self andWorkerInformationClass:acquiredNameAndYear];
        
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.view.addWorkerNameTextField resignFirstResponder];
    return NO;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.yearArray count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.yearArray objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.selectedYear = [[self.yearArray objectAtIndex:row] integerValue];
}

@end
