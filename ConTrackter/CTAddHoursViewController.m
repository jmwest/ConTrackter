//
//  CTAddHoursViewController.m
//  ConTrackter
//
//  Created by John West on 5/20/13.
//  Copyright (c) 2013 John West. All rights reserved.
//

#import "CTAddHoursViewController.h"

@implementation CTAddHoursViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view = [[CTAddHoursView alloc] initWithNameFromController: self.nameToDisplay];
    UIBarButtonItem *barButtonSave = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveAndSendDataToTable)];
    self.navigationItem.rightBarButtonItem = barButtonSave;
    [self.navigationItem setTitle:@"Add Worker"];

    [self.view.addHoursTextField setDelegate:self];
    [self.view.notesTextField setDelegate:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger) numberOfComponentsInPickerView:(UIPickerView *)dateWorkedPickerBox
{
    
}

- (NSInteger)pickerView:(UIPickerView *)dateWorkedPickerBox numberOfRowsInComponent:(NSInteger)component
{
    
}

- (void)saveAndSendDataToTable
{
    if ([self.view.addHoursTextField.text integerValue] == 0) {
        UIAlertView *incorrectHoursAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Invalid Entry For Shift Hours. Please Enter Valid Number Of Hours." delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles: nil];
        [self.view.addHoursTextField setBackgroundColor:[UIColor yellowColor]];
        [incorrectHoursAlert show];
    }
    else if ([self.view.addHoursTextField.text length] != 0) {
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"yyyy/MM/dd"];
        
        NSDate *today = [[NSDate alloc] init];
        
        
                
        CTShiftModel *acquiredDataForDate = [[CTShiftModel alloc] initWithHours:self.view.addHoursTextField.text andDate: today andNotes:self.view.notesTextField.text];
        [self.delegate passBackDataFromAddHoursMethod:self andShiftClass:acquiredDataForDate];
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.view.notesTextField resignFirstResponder];
    [self.view.addHoursTextField resignFirstResponder];
    return NO;
}

- (id)initWithWorkerName:(NSString *)name
{
    self = [super init];
    if (self)
    {
        self.nameToDisplay = name;
    }
    return self;
}

@end
