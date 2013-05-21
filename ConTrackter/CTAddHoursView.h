//
//  CTAddHoursView.h
//  ConTrackter
//
//  Created by John West on 5/20/13.
//  Copyright (c) 2013 John West. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CTAddHoursView : UIView

@property (strong, nonatomic) UILabel *workerNameLabel;
@property (strong, nonatomic) UITextView *workerNameTextLocked;
@property (strong, nonatomic) UILabel *dateLabel;
@property (strong, nonatomic) UIDatePicker *dateWorkedPickerBox;
@property (strong, nonatomic) UILabel *hoursLabel;
@property (strong, nonatomic) UITextField *addHoursTextField;
@property (strong, nonatomic) UILabel *notesLabel;
@property (strong, nonatomic) UITextField *notesTextField;

@end
