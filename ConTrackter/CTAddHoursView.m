//
//  CTAddHoursView.m
//  ConTrackter
//
//  Created by John West on 5/20/13.
//  Copyright (c) 2013 John West. All rights reserved.
//

#import "CTAddHoursView.h"
#import <QuartzCore/QuartzCore.h>
#define leftBound 40
#define labelWidth 100
#define labelHeight 24
#define textFieldWidth 260
#define workerNameLabelTopBound 20
#define workerNameTextLockedTopBound 50
#define dateLabelTopBound 100
#define datePickerTopBound 130
#define hoursLabelTopBound 180
#define hoursTextBoxTopBound 210
#define notesLabelTopBound 260
#define notesTextTopBound 290
#define notesFieldHeight 106

@implementation CTAddHoursView

@synthesize workerNameLabel = _workerNameLabel;
@synthesize workerNameTextLocked = _workerNameTextLocked;
@synthesize dateLabel = _dateLabel;
@synthesize dateWorkedPickerBox = _dateWorkedPickerBox;
@synthesize hoursLabel = _hoursLabel;
@synthesize addHoursTextField = _addHoursTextField;
@synthesize notesLabel = _notesLabel;
@synthesize notesTextField = _notesTextField;

@synthesize name = _name;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor magentaColor]];
        
        self.workerNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(leftBound, workerNameLabelTopBound, labelWidth, labelHeight)];
        [self.workerNameLabel setBackgroundColor:[UIColor whiteColor]];
        [self.workerNameLabel setText:@"Worker:"];
        [self.workerNameLabel setTextAlignment:NSTextAlignmentCenter];
        self.workerNameLabel.layer.borderColor = [UIColor blackColor].CGColor;
        self.workerNameLabel.layer.borderWidth = 1.0f;
        [self addSubview:self.workerNameLabel];
        
        self.workerNameTextLocked = [[UILabel alloc] initWithFrame:CGRectMake(leftBound, workerNameTextLockedTopBound, textFieldWidth, labelHeight)];
        [self.workerNameTextLocked setBackgroundColor:[UIColor whiteColor]];
        [self.workerNameTextLocked setTextAlignment:NSTextAlignmentCenter];

        self.workerNameTextLocked.layer.borderColor = [UIColor blackColor].CGColor;
        self.workerNameTextLocked.layer.borderWidth = 1.0f;
        [self addSubview:self.workerNameTextLocked];
        
        self.dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(leftBound, dateLabelTopBound, labelWidth, labelHeight)];
        [self.dateLabel setBackgroundColor:[UIColor whiteColor]];
        [self.dateLabel setText:@"Date:"];
        [self.dateLabel setTextAlignment:NSTextAlignmentCenter];
        self.dateLabel.layer.borderColor = [UIColor blackColor].CGColor;
        self.dateLabel.layer.borderWidth = 1.0f;
        [self addSubview:self.dateLabel];
        
        self.dateWorkedPickerBox = [[UIDatePicker alloc] initWithFrame:CGRectMake(leftBound, datePickerTopBound, labelWidth, labelHeight)];
        [self.dateWorkedPickerBox setBackgroundColor:[UIColor whiteColor]];
        self.dateWorkedPickerBox.layer.borderColor = [UIColor blackColor].CGColor;
        self.dateWorkedPickerBox.layer.borderWidth = 1.0f;
        //[self addSubview:self.dateWorkedPickerBox];
        
        self.hoursLabel = [[UILabel alloc] initWithFrame:CGRectMake(leftBound, hoursLabelTopBound, labelWidth, labelHeight)];
        [self.hoursLabel setBackgroundColor:[UIColor whiteColor]];
        [self.hoursLabel setText:@"Hours:"];
        [self.hoursLabel setTextAlignment:NSTextAlignmentCenter];
        self.hoursLabel.layer.borderColor = [UIColor blackColor].CGColor;
        self.hoursLabel.layer.borderWidth = 1.0f;
        [self addSubview:self.hoursLabel];
        
        self.addHoursTextField = [[UITextField alloc] initWithFrame:CGRectMake(leftBound, hoursTextBoxTopBound, labelWidth, labelHeight)];
        [self.addHoursTextField setBackgroundColor:[UIColor whiteColor]];
        [self.addHoursTextField setTextAlignment:NSTextAlignmentCenter];
        [self.addHoursTextField setBorderStyle:UITextBorderStyleRoundedRect];
        [self addSubview:self.addHoursTextField];
        
        self.notesLabel = [[UILabel alloc] initWithFrame:CGRectMake(leftBound, notesLabelTopBound, labelWidth, labelHeight)];
        [self.notesLabel setBackgroundColor:[UIColor whiteColor]];
        [self.notesLabel setText:@"Notes:"];
        [self.notesLabel setTextAlignment:NSTextAlignmentCenter];
        self.notesLabel.layer.borderColor = [UIColor blackColor].CGColor;
        self.notesLabel.layer.borderWidth = 1.0f;
        [self addSubview:self.notesLabel];
        
        self.notesTextField = [[UITextField alloc] initWithFrame:CGRectMake(leftBound, notesTextTopBound, textFieldWidth, notesFieldHeight)];
        [self.notesTextField setBackgroundColor:[UIColor whiteColor]];
        [self.notesTextField setTextAlignment:NSTextAlignmentLeft];
        [self.notesTextField setBorderStyle:UITextBorderStyleRoundedRect];
        [self addSubview:self.notesTextField];
    }
    return self;
}

- (id)initWithNameFromController:(NSString *)nameFromController
{
    self = [super init];
    if (self)
    {
        self.name = nameFromController;
        [self.workerNameTextLocked setText:self.name];
    }
    
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
