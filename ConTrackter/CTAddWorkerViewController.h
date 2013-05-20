//
//  CTAddWorkerViewController.h
//  ConTrackter
//
//  Created by John West on 5/19/13.
//  Copyright (c) 2013 John West. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CTAddWorkerView.h"

@class CTAddWorkerViewController;

@protocol returnWorkerNameToTableDelegate <NSObject>

- (void)returnWorkerNameMethod:(CTAddWorkerViewController *) controller workerNameToPassBack:(NSString *) workerNameString;

@end

@interface CTAddWorkerViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) CTAddWorkerView *view;
@property (weak, nonatomic) id <returnWorkerNameToTableDelegate> delegate;
- (void) saveAndSendWorkerNameToTable;

@end
