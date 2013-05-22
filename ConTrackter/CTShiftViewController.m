//
//  CTShiftViewController.m
//  ConTrackter
//
//  Created by John West on 5/20/13.
//  Copyright (c) 2013 John West. All rights reserved.
//

#import "CTShiftViewController.h"
#import "CTShiftModel.h"

@interface CTShiftViewController ()

@end

@implementation CTShiftViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view = [[CTShiftView alloc] initWithWorkerInformation:self.myWorkerShift andADateString:self.dateString];
    [self.navigationController setTitle:@"Shift"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (id)initWithAllWorkerInfo:(CTShiftModel *)workerShift andDateAsString:(NSString *)dateString
{
    self = [super init];
    if (self) {
        self.myWorkerShift = workerShift;
        self.dateString = dateString;
    }
    return self;
}

@end
