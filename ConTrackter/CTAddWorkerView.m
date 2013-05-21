//
//  CTAddWorkerView.m
//  ConTrackter
//
//  Created by John West on 5/20/13.
//  Copyright (c) 2013 John West. All rights reserved.
//

#import "CTAddWorkerView.h"
#import <QuartzCore/QuartzCore.h>
#define leftBound 40
#define labelWidth 80
#define labelHeight 24
#define textFieldWidth 260
#define textFieldTopBound 70
#define yearLabelTopBound 120
#define workerLabelTopBound 20

@implementation CTAddWorkerView

@synthesize addWorkerWindow = _addWorkerWindow;
@synthesize addWorkerNameLabel = _addWorkerNameLabel;
@synthesize addWorkerNameTextField = _addWorkerNameTextField;
@synthesize addWorkerYearLabel = _addWorkerYearLabel;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //self.addWorkerWindow = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        //self.addWorkerWindow.backgroundColor = [UIColor magentaColor];
        //self.addWorkerWindow.rootViewController = self.
        
        [self setBackgroundColor:[UIColor magentaColor]];
        
        self.addWorkerNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(leftBound, workerLabelTopBound, labelWidth, labelHeight)];
        [self.addWorkerNameLabel setText:@"Worker"];
        [self.addWorkerNameLabel setTextAlignment:NSTextAlignmentCenter];
        self.addWorkerNameLabel.layer.borderColor = [UIColor blackColor].CGColor;
        self.addWorkerNameLabel.layer.borderWidth = 1.0f;
        [self addSubview:self.addWorkerNameLabel];
        
        self.addWorkerNameTextField = [[UITextField alloc] initWithFrame:CGRectMake(leftBound, textFieldTopBound, textFieldWidth, labelHeight)];
        [self.addWorkerNameTextField setTextAlignment:NSTextAlignmentCenter];
        [self.addWorkerNameTextField setBackgroundColor:[UIColor whiteColor]];
        [self.addWorkerNameTextField setBorderStyle:UITextBorderStyleRoundedRect];
        [self addSubview:self.addWorkerNameTextField];
        
        self.addWorkerYearLabel = [[UILabel alloc] initWithFrame:CGRectMake(leftBound, yearLabelTopBound, labelWidth, labelHeight)];
        [self.addWorkerYearLabel setText:@"Year"];
        [self.addWorkerYearLabel setTextAlignment:NSTextAlignmentCenter];
        self.addWorkerYearLabel.layer.borderColor = [UIColor blackColor].CGColor;
        self.addWorkerYearLabel.layer.borderWidth = 1.0f;
        [self addSubview:self.addWorkerYearLabel];

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
