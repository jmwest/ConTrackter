//
//  CTShiftModel.m
//  ConTrackter
//
//  Created by John West on 5/17/13.
//  Copyright (c) 2013 John West. All rights reserved.
//

#import "CTShiftModel.h"

@implementation CTShiftModel

@synthesize hoursForTheDate = _hoursForTheDate;
@synthesize notesForTheDate = _notesForTheDate;
@synthesize currentDate = _currentDate;

- (id)initWithHours:(NSString *)hoursForTheDay andDate:(NSDate *)dateForTheDay andNotes:(NSString *)notesForTheDay
{
    self = [super init];
    if (self) {
        self.hoursForTheDate = hoursForTheDay;
        self.notesForTheDate = notesForTheDay;
        self.currentDate = dateForTheDay;
    }
    return self;
}

@end
