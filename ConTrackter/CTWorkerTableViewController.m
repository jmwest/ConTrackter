//
//  CTWorkerTableViewController.m
//  ConTrackter
//
//  Created by John West on 5/17/13.
//  Copyright (c) 2013 John West. All rights reserved.
//

#import "CTWorkerTableViewController.h"
#import "CTWorkerModel.h"

@interface CTWorkerTableViewController ()
@property CTAddWorkerViewController *cTAddWorkerViewController;

@end

@implementation CTWorkerTableViewController

@synthesize workerInfoArray = _workerInfoArray;
@synthesize cTAddWorkerViewController = _cTAddWorkerViewController;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
     //   [self.tableView setSectionHeaderHeight:50];
     //   [self.navigationItem initWithTitle:@"Workers"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    UIBarButtonItem *barButtonAdd = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addWorkerNameToArrayControllerMethod)];
    self.navigationItem.rightBarButtonItem = barButtonAdd;
    [self.navigationItem setTitle:@"Workers"];

    self.workerInfoArray = [[NSMutableArray alloc] init];
    
    //CTWorkerModel *myWorker = [[CTWorkerModel alloc] initWithName:@"Test" andYear:(NSInteger *) 2015];
    //[self.workerInfoArray addObject:myWorker];
    //NSLog(@"%d", [self.workerInfoArray count]);
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
    NSLog(@"%d", [self.workerInfoArray count]);
    return [self.workerInfoArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    // Configure the cell...
    CTWorkerModel *myWorker = [self.workerInfoArray objectAtIndex:indexPath.row];
    cell.textLabel.text = myWorker.workerNameString;
    
    
    //self.workerNameToAddString = [self.workerInfoArray objectAtIndex:indexPath.row];
    //cell.textLabel.text = self.workerNameToAddString;
    //[self.cTWorkerModelHandle.workerNameArray addObject:@"Test"];
    //cell.textLabel.text = self.workerNameToAddString;
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

- (void)addWorkerNameToArrayControllerMethod
{
    CTAddWorkerViewController *aWVC = [[CTAddWorkerViewController alloc] init];
    [aWVC setDelegate:self];
    [self.navigationController pushViewController:aWVC animated:YES];
}

- (void)returnWorkerNameMethod:(CTAddWorkerViewController *)controller andWorkerInformationClass:(CTWorkerModel *)workerNameAndGradYear
{
    [self.workerInfoArray addObject:workerNameAndGradYear];
    NSLog(@"%d", [self.workerInfoArray count]);
    [self displayNewWorkerNameInTable];
}

- (void)displayNewWorkerNameInTable
{
   // self.workerNameToAddString = [self.cTWorkerModelHandle.workerNameArray lastObject];
    
}

- (void)viewWillAppear:(BOOL) animated
{
    [super viewWillAppear:animated];
    
    [[self tableView] reloadData];
}

@end
