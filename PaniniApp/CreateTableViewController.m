//
//  CreateTableViewController.m
//  PaniniApp
//
//  Created by Texidor-Rodriguez, Ismael on 3/30/16.
//  Copyright © 2016 Texidor-Rodriguez, Ismael. All rights reserved.
//

#import "CreateTableViewController.h"

@interface CreateTableViewController ()

@end

@implementation CreateTableViewController

@synthesize name, ind, direction, time;
@synthesize paniniArray, ingredientsArray, timeArray, directionsArray;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)done:(id)sender
{
    if (name.text.length > 0)
    {
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *documentsDirectory = [path objectAtIndex:0];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"nameList.plist"];
    paniniArray = [[NSMutableArray alloc] initWithContentsOfFile:filePath];
    [paniniArray addObject:name.text];
    [paniniArray writeToFile:filePath atomically:YES];
    
    filePath = [documentsDirectory stringByAppendingPathComponent:@"indList.plist"];
    ingredientsArray = [[NSMutableArray alloc] initWithContentsOfFile:filePath];
    [ingredientsArray addObject:ind.text];
    [ingredientsArray writeToFile:filePath atomically:YES];
    
    filePath = [documentsDirectory stringByAppendingPathComponent:@"directionList.plist"];
    directionsArray = [[NSMutableArray alloc] initWithContentsOfFile:filePath];
    [directionsArray addObject:direction.text];
    [directionsArray writeToFile:filePath atomically:YES];
    
    filePath = [documentsDirectory stringByAppendingPathComponent:@"timeList.plist"];
    timeArray = [[NSMutableArray alloc] initWithContentsOfFile:filePath];
    [timeArray addObject:time.text];
    [timeArray writeToFile:filePath atomically:YES];
    }
    
    UINavigationController *navigationController = self.navigationController;
    [navigationController popViewControllerAnimated:YES];

}
@end
