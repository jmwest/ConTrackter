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

@synthesize dataToBeAddedToWorkerDataArray = _dataToBeAddedToWorkerDataArray;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    UIBarButtonItem *barButtonAdd = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addHoursToCurrentWorker)];
    self.navigationItem.rightBarButtonItem = barButtonAdd;
    
    [self.navigationItem setTitle:@"Hours"];
    
    self.dataToBeAddedToWorkerDataArray = [[NSMutableArray alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataToBeAddedToWorkerDataArray count];
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
    
    CTShiftModel *thisShift = [self.dataToBeAddedToWorkerDataArray objectAtIndex:indexPath.row];
    NSString *thisShiftHours = thisShift.hoursForTheDate;
    NSString *thisShiftDate = [dateFormat stringFromDate:thisShift.currentDate];
    NSString *thisShiftDateSubstring = [thisShiftDate substringFromIndex:5];

    if ([[thisShiftDateSubstring substringToIndex:1] isEqualToString:@"0"]) {
        thisShiftDateSubstring = [thisShiftDateSubstring substringFromIndex:1];
    }

    NSString *firstTempShiftString = [thisShiftDateSubstring stringByAppendingString:@"\t"];
    NSString *secondTempShiftString = [firstTempShiftString stringByAppendingString:thisShiftHours];
    NSString *shiftString = [secondTempShiftString stringByAppendingString:@" hours"];
    
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

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
      CTShiftViewController * sVC = [[CTShiftViewController alloc] init];
     [self.navigationController pushViewController:sVC animated:YES];
}

- (void)addHoursToCurrentWorker
{
    CTAddHoursViewController * aHVC = [[CTAddHoursViewController alloc] init];
    [aHVC setDelegate:self];
    [self.navigationController pushViewController:aHVC animated:YES];
}

- (void)passBackDataMethod:(CTAddHoursViewController *)controller andShiftClass:(CTShiftModel *)shift
{
    [self.dataToBeAddedToWorkerDataArray addObject:shift];
}

- (void)viewWillAppear:(BOOL) animated
{
    [super viewWillAppear:animated];
    
    [[self tableView] reloadData];
}

@end
