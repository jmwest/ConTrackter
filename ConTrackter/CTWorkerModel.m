//
//  CTWorkerModel.m
//  ConTrackter
//
//  Created by John West on 5/17/13.
//  Copyright (c) 2013 John West. All rights reserved.
//

#import "CTWorkerModel.h"

@implementation CTWorkerModel

@synthesize workerNameString = _workerNameString;
@synthesize workerGradYear = _workerGradYear;
@synthesize workerHoursArray = _workerHoursArray;

- (id) initWithName:(NSString *)nameString andYear:(NSInteger *)inGradYear
{
    self = [super init];
    if (self) {
        self.workerNameString = nameString;
        self.workerGradYear = inGradYear;
        self.workerHoursArray = [[NSMutableArray alloc] init];
    }
    return self;
}

@end
