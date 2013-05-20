//
//  CTWorkerTableViewController.m
//  ConTrackter
//
//  Created by John West on 5/17/13.
//  Copyright (c) 2013 John West. All rights reserved.
//

#import "CTWorkerTableViewController.h"
#import "CTWorkerModel.h"
#import "CTAddWorkerViewController.h"

@interface CTWorkerTableViewController ()
@property CTWorkerModel *cTWorkerModelHandle;
@property CTAddWorkerViewController *cTAddWorkerViewController;

@end

@implementation CTWorkerTableViewController

@synthesize cTWorkerModelHandle = _cTWorkerModelHandle;

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
    //self.navigationItem.rightBarButtonItem = self.editButtonItem;
    UIBarButtonItem *barButtonAdd = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addWorkerNameToArrayControllerMethod)];
    self.navigationItem.rightBarButtonItem = barButtonAdd;
    [self.navigationItem setTitle:@"Workers"];
    
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
    return [self.cTWorkerModelHandle.workerNameArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
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
    CTAddWorkerViewController *_CTAddWorkerViewController = [[CTAddWorkerViewController alloc] init];
    [self.navigationController pushViewController:_CTAddWorkerViewController animated:YES];
}

- (void)returnWorkerNameMethod:(CTAddWorkerViewController *)controller workerNameToPassBack:(NSString *)workerNameString
{
    
}

@end
