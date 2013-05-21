//
//  CTShiftView.m
//  ConTrackter
//
//  Created by John West on 5/20/13.
//  Copyright (c) 2013 John West. All rights reserved.
//

#import "CTShiftView.h"
#import "CTShiftModel.h"
#import <QuartzCore/QuartzCore.h>
#define leftBound 120
#define labelWidth 100
#define labelHeight 24
#define notesLabelLeftBound 40
#define notesLabelWidth 240
#define notesLabelHeight 246
#define shiftDateLabelTopBound 20
#define shiftHoursLabelTopBound 50
#define shiftNotesLabelTopBound 120
#define shiftNotesDisplayLabelTopBound 150

@implementation CTShiftView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor magentaColor]];
        
        self.shiftDateLabel = [[UILabel alloc] initWithFrame:CGRectMake(leftBound, shiftDateLabelTopBound, labelWidth, labelHeight)];
        [self.shiftDateLabel setBackgroundColor:[UIColor magentaColor]];
        [self.shiftDateLabel setTextAlignment:NSTextAlignmentCenter];
        //self.shiftDateLabel.layer.borderColor = [UIColor blackColor].CGColor;
        //self.shiftDateLabel.layer.borderWidth = 1.0f;
        [self addSubview:self.shiftDateLabel];
        
        self.shiftHoursLabel = [[UILabel alloc] initWithFrame:CGRectMake(leftBound, shiftHoursLabelTopBound, labelWidth, labelHeight)];
        [self.shiftHoursLabel setBackgroundColor:[UIColor magentaColor]];
        [self.shiftHoursLabel setTextAlignment:NSTextAlignmentCenter];
        //self.shiftHoursLabel.layer.borderColor = [UIColor blackColor].CGColor;
        //self.shiftHoursLabel.layer.borderWidth = 1.0f;
        [self addSubview:self.shiftHoursLabel];
        
        self.shiftNotesLabel = [[UILabel alloc] initWithFrame:CGRectMake(leftBound, shiftNotesLabelTopBound, labelWidth, labelHeight)];
        [self.shiftNotesLabel setBackgroundColor:[UIColor magentaColor]];
        [self.shiftNotesLabel setTextAlignment:NSTextAlignmentCenter];
        [self.shiftNotesLabel setText:@"Notes:"];
        //self.shiftNotesLabel.layer.borderColor = [UIColor blackColor].CGColor;
        //self.shiftNotesLabel.layer.borderWidth = 1.0f;
        [self addSubview:self.shiftNotesLabel];
        
        self.shiftNotesDisplayLabel = [[UILabel alloc] initWithFrame:CGRectMake(notesLabelLeftBound, shiftNotesDisplayLabelTopBound, notesLabelWidth, notesLabelHeight)];
        self.shiftNotesDisplayLabel.numberOfLines = 0;
        //[self.shiftNotesDisplayLabel sizeToFit];
        [self.shiftNotesDisplayLabel setBackgroundColor:[UIColor magentaColor]];
        self.shiftNotesDisplayLabel.layer.borderColor = [UIColor blackColor].CGColor;
        self.shiftNotesDisplayLabel.layer.borderWidth = 1.0f;
        [self addSubview:self.shiftNotesDisplayLabel];
        
    }
    return self;
}

- (id)initWithWorkerInformation:(CTShiftModel *)worker
{
    self = [super init];
    if (self) {
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"yyyy/MM/dd"];
        NSString *dateString = [dateFormat stringFromDate:worker.currentDate];
        
        
        NSString *thisDateSubstring = [dateString substringFromIndex:5];
        
        if ([[thisDateSubstring substringToIndex:1] isEqualToString:@"0"]) {
            thisDateSubstring = [thisDateSubstring substringFromIndex:1];
        }
        
        NSString *theseHoursString = [worker.hoursForTheDate stringByAppendingString:@" Hours"];
        NSString *appendedNotesString =[@"  " stringByAppendingString:worker.notesForTheDate];

        [self.shiftDateLabel setText:thisDateSubstring];
        [self.shiftHoursLabel setText:theseHoursString];
        [self.shiftNotesDisplayLabel setText:appendedNotesString];
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
