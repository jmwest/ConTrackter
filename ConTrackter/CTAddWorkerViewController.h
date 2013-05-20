//
//  CTAddWorkerViewController.h
//  ConTrackter
//
//  Created by John West on 5/19/13.
//  Copyright (c) 2013 John West. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CTAddWorkerView.h"
#import "CTWorkerModel.h"

@class CTAddWorkerViewController;

@protocol CTAddWorkerViewControlDelegate <NSObject>

- (void)returnWorkerNameMethod:(CTAddWorkerViewController *) controller andWorkerInformationClass:(CTWorkerModel *) workerNameAndGradYear;

@end

@interface CTAddWorkerViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) CTAddWorkerView *view;
@property (weak, nonatomic) id <CTAddWorkerViewControlDelegate> delegate;
- (void) saveAndSendWorkerNameToTable;

@end
