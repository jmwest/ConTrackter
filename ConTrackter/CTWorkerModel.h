//
//  CTWorkerModel.h
//  ConTrackter
//
//  Created by John West on 5/17/13.
//  Copyright (c) 2013 John West. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CTWorkerModel : NSObject

- (id)initWithName:(NSString *)nameString andYear:(NSInteger *)inGradYear;

@property (strong, nonatomic) NSString *workerNameString;
@property (assign, nonatomic) NSInteger *workerGradYear;
@property (strong, nonatomic) NSMutableArray *workerHoursArray;

@end
