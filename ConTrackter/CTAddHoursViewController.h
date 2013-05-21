//
//  CTAddHoursViewController.h
//  ConTrackter
//
//  Created by John West on 5/20/13.
//  Copyright (c) 2013 John West. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CTAddHoursView.h"
#import "CTShiftModel.h"

@class CTAddHoursViewController;

@protocol CTAddHoursViewDelegate <NSObject>

- (void) passBackDataMethod:(CTAddHoursViewController *) controller andShiftClass:(CTShiftModel *) shift;

@end

@interface CTAddHoursViewController : UIViewController <UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource>

@property (strong, nonatomic) CTAddHoursView *view;
@property (weak, nonatomic) id <CTAddHoursViewDelegate> delegate;

- (void)saveAndSendDataToTable;
@end
