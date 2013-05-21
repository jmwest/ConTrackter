//
//  CTAddWorkerView.h
//  ConTrackter
//
//  Created by John West on 5/20/13.
//  Copyright (c) 2013 John West. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CTAddWorkerView : UIView

@property (strong, nonatomic) UILabel *addWorkerNameLabel;
@property (strong, nonatomic) UILabel *addWorkerYearLabel;
@property (strong, nonatomic) UITextField *addWorkerNameTextField;
@property (strong, nonatomic) UIPickerView *addWorkerYearPicker;

@end
