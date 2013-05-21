//
//  CTShiftView.h
//  ConTrackter
//
//  Created by John West on 5/20/13.
//  Copyright (c) 2013 John West. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CTShiftModel;

@interface CTShiftView : UIView

@property (strong, nonatomic) UILabel *shiftDateLabel;
@property (strong, nonatomic) UILabel *shiftHoursLabel;
@property (strong, nonatomic) UILabel *shiftNotesLabel;
@property (strong, nonatomic) UILabel *shiftNotesDisplayLabel;

- (id)initWithWorkerInformation:(CTShiftModel *) worker;

@end
