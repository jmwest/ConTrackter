//
//  CTShiftViewController.h
//  ConTrackter
//
//  Created by John West on 5/20/13.
//  Copyright (c) 2013 John West. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CTShiftView.h"

@class CTShiftModel;

@interface CTShiftViewController : UIViewController

@property (strong, nonatomic) CTShiftView *view;

@property (strong, nonatomic) CTShiftModel *myWorkerShift;
@property (strong, nonatomic) NSString *dateString;

- (id)initWithAllWorkerInfo:(CTShiftModel *) workerShift andDateAsString:(NSString *) dateString;

@end
