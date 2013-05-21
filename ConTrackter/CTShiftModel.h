//
//  CTShiftModel.h
//  ConTrackter
//
//  Created by John West on 5/17/13.
//  Copyright (c) 2013 John West. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CTShiftModel : NSObject

- (id)initWithHours:(NSString *) hoursForTheDay andDate:(NSDate *) dateForTheDay andNotes:(NSString *) notesForTheDay;

@property (strong, nonatomic) NSString *hoursForTheDate;
@property (strong, nonatomic) NSString *notesForTheDate;
@property (strong, nonatomic) NSDate *currentDate;

@end
