//
//  CTWorkerModel.h
//  ConTrackter
//
//  Created by John West on 5/17/13.
//  Copyright (c) 2013 John West. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CTWorkerModel : NSObject

@property (strong, nonatomic) NSMutableArray *workerNameArray;
@property (strong, nonatomic) NSString *additionalWorkerNameString;

-(void)addWorkerNameToArray;

@end
