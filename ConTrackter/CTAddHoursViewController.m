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
    self.view = [[CTAddHoursView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
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
    if ([self.view.addHoursTextField.text length] != 0) {
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"yyyy/MM/dd"];
        
        NSDate *today = [[NSDate alloc] init];
                
        CTShiftModel *acquiredDataForDate = [[CTShiftModel alloc] initWithHours:self.view.addHoursTextField.text andDate: today andNotes:self.view.notesTextField.text];
        [self.delegate passBackDataMethod:self andShiftClass:acquiredDataForDate];
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.view.notesTextField resignFirstResponder];
    [self.view.addHoursTextField resignFirstResponder];
    return NO;
}

@end
