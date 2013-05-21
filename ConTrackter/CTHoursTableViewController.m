//
//  CTHoursTableViewController.m
//  ConTrackter
//
//  Created by John West on 5/17/13.
//  Copyright (c) 2013 John West. All rights reserved.
//

#import "CTHoursTableViewController.h"
#import "CTShiftViewController.h"
#import "CTWorkerModel.h"
#import "CTShiftModel.h"

@interface CTHoursTableViewController ()

@end

@implementation CTHoursTableViewController

@synthesize hoursWorkerModel = _hoursWorkerModel;
@synthesize totalHoursWorked = _totalHoursWorked;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
    }
    return self;
}

- (id)initWithWorker:(CTWorkerModel *)worker
{
    self = [super init];
    if (self)
    {
        self.totalHoursWorked = 0.0;
        self.hoursWorkerModel = worker;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    UIBarButtonItem *barButtonAdd = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addHoursToCurrentWorker)];
    [self.navigationItem.backBarButtonItem setAction:@selector(backToWorkerTable)];
    self.navigationItem.rightBarButtonItem = barButtonAdd;
    
    [self.navigationItem setTitle:@"Hours"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.hoursWorkerModel.workerDataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy/MM/dd"];
    
    CTShiftModel *thisShift = [self.hoursWorkerModel.workerDataArray objectAtIndex:indexPath.row];
    NSString *thisShiftHours = thisShift.hoursForTheDate;
    NSString *thisShiftDate = [dateFormat stringFromDate:thisShift.currentDate];
    NSString *thisShiftDateSubstring = [thisShiftDate substringFromIndex:5];

    if ([[thisShiftDateSubstring substringToIndex:1] isEqualToString:@"0"]) {
        thisShiftDateSubstring = [thisShiftDateSubstring substringFromIndex:1];
    }

    NSString *firstTempShiftString = [thisShiftDateSubstring stringByAppendingString:@"\t\t"];
    NSString *secondTempShiftString = [firstTempShiftString stringByAppendingString:thisShiftHours];
    NSString *shiftString = [secondTempShiftString stringByAppendingString:@" Hours"];
    
    cell.textLabel.text = shiftString;
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CTShiftViewController * sVC = [[CTShiftViewController alloc] initWIthAllWorkerInfo:[self.hoursWorkerModel.workerDataArray objectAtIndex:indexPath.row]];
    [self.navigationController pushViewController:sVC animated:YES];
}

- (void)addHoursToCurrentWorker
{
    CTAddHoursViewController * aHVC = [[CTAddHoursViewController alloc] initWithWorkerName:self.hoursWorkerModel.workerNameString];
    [aHVC setDelegate:self];
    [self.navigationController pushViewController:aHVC animated:YES];
}

- (void)passBackDataFromAddHoursMethod:(CTAddHoursViewController *)controller andShiftClass:(CTShiftModel *)shift
{
    [self.hoursWorkerModel.workerDataArray addObject:shift];
    double hoursWorkedThisShift = [shift.hoursForTheDate doubleValue];
    self.hoursWorkerModel.totalHoursWorked = self.hoursWorkerModel.totalHoursWorked + hoursWorkedThisShift;
}

- (void)backToWorkerTable
{
    [self.delegate passBackToWorkerTable:self theData:self.hoursWorkerModel];
}

- (void)viewWillAppear:(BOOL) animated
{
    [super viewWillAppear:animated];
    
    [[self tableView] reloadData];
}

@end
