//
//  ViewController.m
//  PaniniApp
//
//  Created by Texidor-Rodriguez, Ismael on 3/30/16.
//  Copyright © 2016 Texidor-Rodriguez, Ismael. All rights reserved.
//

#import "ViewController.h"
#import "EditViewController.h"
#import "CreateTableViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize paniniArray, ingredientsArray, directionsArray, timeArray;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSError *error;
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *documentsDirectory = [path objectAtIndex:0];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"nameList.plist"];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:filePath])
    {
        NSString *bundle = [[NSBundle mainBundle] pathForResource:@"nameList" ofType:@"plist"];
        [[NSFileManager defaultManager]copyItemAtPath:bundle toPath:filePath error:&error];
    }
    
    filePath = [documentsDirectory stringByAppendingPathComponent:@"timeList.plist"];
    if (![[NSFileManager defaultManager] fileExistsAtPath:filePath])
    {
        NSString *bundle = [[NSBundle mainBundle] pathForResource:@"timeList" ofType:@"plist"];
        [[NSFileManager defaultManager]copyItemAtPath:bundle toPath:filePath error:&error];
    }
    
    filePath = [documentsDirectory stringByAppendingPathComponent:@"directionList.plist"];
    if (![[NSFileManager defaultManager] fileExistsAtPath:filePath])
    {
        NSString *bundle = [[NSBundle mainBundle] pathForResource:@"directionList" ofType:@"plist"];
        [[NSFileManager defaultManager]copyItemAtPath:bundle toPath:filePath error:&error];
    }
    
    filePath = [documentsDirectory stringByAppendingPathComponent:@"indList.plist"];
    if (![[NSFileManager defaultManager] fileExistsAtPath:filePath])
    {
        NSString *bundle = [[NSBundle mainBundle] pathForResource:@"indList" ofType:@"plist"];
        [[NSFileManager defaultManager]copyItemAtPath:bundle toPath:filePath error:&error];
    }
    
    // Build the array from the plist
    NSString *namePath = [documentsDirectory stringByAppendingPathComponent:@"nameList.plist"];
    paniniArray = [[NSMutableArray alloc] initWithContentsOfFile:namePath];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self startUp];
    [self.tableView reloadData];
}

- (void)startUp
{
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *documentsDirectory = [path objectAtIndex:0];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"nameList.plist"];
    paniniArray = [[NSMutableArray alloc] initWithContentsOfFile:filePath];

}

- (NSInteger)numberOfSectionsInTableView:(UITableView
                                          *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return [paniniArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleSubtitle
                reuseIdentifier:@"cell"];
    }
    
    NSString *paniniName;
    paniniName = [paniniArray objectAtIndex:indexPath.row];
    
    [[cell textLabel] setText:paniniName];
    
    return cell;
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.currentIndex = indexPath.row;
    [self performSegueWithIdentifier:@"editPanini" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"editPanini"])
    {
    EditViewController *vcToPushTo = segue.destinationViewController;
    vcToPushTo.currentIndex = self.currentIndex;
    }
    
    if ([segue.identifier isEqualToString:@"addPanini"])
    {
        CreateTableViewController *vcToPushTo = segue.destinationViewController;
    }
    
}

- (IBAction)edit:(id)sender
{
    [self.tableView setEditing:YES animated:YES];
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated
{ //Implement this method
    [super setEditing:editing animated:animated];
    [self.tableView setEditing:editing animated:animated];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath { //implement the delegate method
    
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
        NSString *documentsDirectory = [path objectAtIndex:0];
        NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"nameList.plist"];
        paniniArray = [[NSMutableArray alloc] initWithContentsOfFile:filePath];
        [paniniArray removeObjectAtIndex:indexPath.row];
        [paniniArray writeToFile:filePath atomically:YES];
        
        filePath = [documentsDirectory stringByAppendingPathComponent:@"indList.plist"];
        ingredientsArray = [[NSMutableArray alloc] initWithContentsOfFile:filePath];
        [ingredientsArray removeObjectAtIndex:indexPath.row];
        [ingredientsArray writeToFile:filePath atomically:YES];
        
        filePath = [documentsDirectory stringByAppendingPathComponent:@"directionList.plist"];
        directionsArray = [[NSMutableArray alloc] initWithContentsOfFile:filePath];
        [directionsArray removeObjectAtIndex:indexPath.row];
        [directionsArray writeToFile:filePath atomically:YES];
        
        filePath = [documentsDirectory stringByAppendingPathComponent:@"timeList.plist"];
        timeArray = [[NSMutableArray alloc] initWithContentsOfFile:filePath];
        [timeArray removeObjectAtIndex:indexPath.row];
        [timeArray writeToFile:filePath atomically:YES];
        
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [tableView setEditing:NO animated:YES];

    }
}
@end
