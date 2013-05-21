//
//  CTHoursTableViewController.h
//  ConTrackter
//
//  Created by John West on 5/17/13.
//  Copyright (c) 2013 John West. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CTAddHoursViewController.h"

@class CTHoursTableViewController;
@class CTWorkerModel;

@protocol CTHoursTableDelegate <NSObject>

- (void) passBackToWorkerTable:(CTHoursTableViewController *) controller theData:(CTWorkerModel *) workerModel;

@end

@interface CTHoursTableViewController : UITableViewController <CTAddHoursViewDelegate>

@property (weak, nonatomic) id<CTHoursTableDelegate> delegate;
@property (strong, nonatomic) CTWorkerModel *hoursWorkerModel;
@property (assign, nonatomic) CGFloat totalHoursWorked;

- (id)initWithWorker:(CTWorkerModel *)worker;
- (void)addHoursToCurrentWorker;
- (void)backToWorkerTable;

@end
