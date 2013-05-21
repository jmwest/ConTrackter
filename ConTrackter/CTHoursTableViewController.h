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

@protocol CTHoursTableDelegate <NSObject>

- (void) passBackToWorkerTable:(CTHoursTableViewController *) controller theData:(NSMutableArray *) array;

@end

@interface CTHoursTableViewController : UITableViewController <CTAddHoursViewDelegate>

@property (strong, nonatomic) id<CTAddHoursViewDelegate> delegate;
@property (strong, nonatomic) NSMutableArray *dataToBeAddedToWorkerDataArray;

- (void)addHoursToCurrentWorker;

@end
