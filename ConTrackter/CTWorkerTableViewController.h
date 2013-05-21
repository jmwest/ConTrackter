//
//  CTWorkerTableViewController.h
//  ConTrackter
//
//  Created by John West on 5/17/13.
//  Copyright (c) 2013 John West. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CTAddWorkerViewController.h"
#import "CTHoursTableViewController.h"

@interface CTWorkerTableViewController : UITableViewController <CTAddWorkerViewControlDelegate, CTHoursTableDelegate>

@property (strong, nonatomic) NSMutableArray *workerInfoArray;
@property (strong, nonatomic) NSString *workerNameToAddString;
- (void)addWorkerNameToArrayControllerMethod;

@end
