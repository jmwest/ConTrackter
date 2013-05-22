//
//  CTAddHoursViewController.m
//  ConTrackter
//
//  Created by John West on 5/20/13.
//  Copyright (c) 2013 John West. All rights reserved.
//

#import "CTAddHoursViewController.h"

@implementation CTAddHoursViewController

@synthesize pickerIsShowing = _pickerIsShowing;
@synthesize nameToDisplay = _nameToDisplay;
@synthesize dateToDisplay = _dateToDisplay;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //[self.gestureRecognizer setDelegate:self];
   // self.gestureRecognizer = [[UIGestureRecognizer alloc] initWithTarget:self action:@selector(screenWasTapped)];
    
    self.view = [[CTAddHoursView alloc] initWithNameFromController: self.nameToDisplay];
    
    UIBarButtonItem *barButtonSave = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveAndSendDataToTable)];
    self.navigationItem.rightBarButtonItem = barButtonSave;
    [self.navigationItem setTitle:@"Add Worker"];
    
    [self.view.showDatePickerBox addTarget:self action:@selector(popUpDatePickerBox:) forControlEvents:UIControlEventTouchUpInside];
    
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
    return 0;
}

- (NSInteger)pickerView:(UIPickerView *)dateWorkedPickerBox numberOfRowsInComponent:(NSInteger)component
{
    return 0;
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
        [dateFormat setDateFormat:@"MM/dd/YYYY"];
        
        self.dateToDisplay = self.view.dateWorkedPickerBox.date;
        
        CTShiftModel *acquiredDataForDate = [[CTShiftModel alloc] initWithHours:self.view.addHoursTextField.text andDate: self.dateToDisplay andNotes:self.view.notesTextField.text];

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

- (IBAction)popUpDatePickerBox:(id)sender
{
    if (self.pickerIsShowing == 0) {
        [self.view.hoursLabel removeFromSuperview];
        [self.view.addHoursTextField removeFromSuperview];
        [self.view.notesLabel removeFromSuperview];
        [self.view.notesTextField removeFromSuperview];
        [self.view insertSubview:self.view.dateWorkedPickerBox atIndex:0];
        
        self.pickerIsShowing = 1;
    }
    else
    {
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"MM/dd/YYYY"];
        
        self.dateToDisplay = self.view.dateWorkedPickerBox.date;
        
        [self.view addSubview:self.view.hoursLabel];
        [self.view addSubview:self.view.addHoursTextField];
        [self.view addSubview:self.view.notesLabel];
        [self.view addSubview:self.view.notesTextField];
        
        [self.view.dateWorkedPickerBox removeFromSuperview];
        
        self.pickerIsShowing = 0;
    }
}


/*
- (void)screenWasTapped
{
    CGPoint gesturePoint = [self.gestureRecognizer locationInView:self.view];
    if ( (gesturePoint.y < 180) || (gesturePoint.y > 398) ) {
        [self.view.dateWorkedPickerBox removeFromSuperview];
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    CGPoint gesturePoint = [self.gestureRecognizer locationInView:self.view];
    if ( (gesturePoint.y < 180) || (gesturePoint.y > 398) ) {
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"MM/dd/YYYY"];
        
        self.dateToDisplay = self.view.dateWorkedPickerBox.date;
        
        [self.view addSubview:self.view.hoursLabel];
        [self.view addSubview:self.view.addHoursTextField];
        [self.view addSubview:self.view.notesLabel];
        [self.view addSubview:self.view.notesTextField];
        
        [self.view.dateWorkedPickerBox removeFromSuperview];
    }
}
*/


@end
