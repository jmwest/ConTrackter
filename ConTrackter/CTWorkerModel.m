//
//  CTWorkerModel.m
//  ConTrackter
//
//  Created by John West on 5/17/13.
//  Copyright (c) 2013 John West. All rights reserved.
//

#import "CTWorkerModel.h"

@implementation CTWorkerModel

@synthesize workerNameArray = _workerNameArray;
@synthesize additionalWorkerNameString = _additionalWorkerNameString;

-(void)addWorkerNameToArray
{
    [self.workerNameArray addObject:self.additionalWorkerNameString];
}

@end
