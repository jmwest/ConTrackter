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
    self.view = [[CTShiftView alloc] initWithWorkerInformation:self.myWorkerShift];
    [self.navigationController setTitle:@"Shift"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (id)initWIthAllWorkerInfo:(CTShiftModel *)workerShift
{
    self = [super init];
    if (self) {
        self.myWorkerShift = workerShift;
    }
    return self;
}

@end
