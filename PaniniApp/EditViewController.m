//
//  EditViewController.m
//  PaniniApp
//
//  Created by Texidor-Rodriguez, Ismael on 3/30/16.
//  Copyright © 2016 Texidor-Rodriguez, Ismael. All rights reserved.
//

#import "EditViewController.h"
#import "ImageViewController.h"

@interface EditViewController ()

@end

@implementation EditViewController

@synthesize nameTextField, indTextField, directionTextField, timeTextField;
@synthesize paniniArray, ingredientsArray, timeArray, directionsArray, currentIndex;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *documentsDirectory = [path objectAtIndex:0];
    NSString *namePath = [documentsDirectory stringByAppendingPathComponent:@"nameList.plist"];
    paniniArray = [[NSMutableArray alloc] initWithContentsOfFile:namePath];
    
    namePath = [documentsDirectory stringByAppendingPathComponent:@"indList.plist"];
    ingredientsArray = [[NSMutableArray alloc] initWithContentsOfFile:namePath];
    
    namePath = [documentsDirectory stringByAppendingPathComponent:@"directionList.plist"];
    directionsArray = [[NSMutableArray alloc] initWithContentsOfFile:namePath];
    
    namePath = [documentsDirectory stringByAppendingPathComponent:@"timeList.plist"];
    timeArray = [[NSMutableArray alloc] initWithContentsOfFile:namePath];
    
    //Set the text fields.
    NSString *paniniName;
    paniniName = [paniniArray objectAtIndex:currentIndex]; //Harcoded index to 0.
    [nameTextField setText: paniniName];
    
    NSString *ingredientsValue;
    ingredientsValue = [ingredientsArray objectAtIndex:currentIndex]; //Harcoded index to 0.
    [indTextField setText: ingredientsValue];
    
    NSString *timeValue;
    timeValue = [timeArray objectAtIndex:currentIndex]; //Harcoded index to 0.
    [timeTextField setText: timeValue];
    
    NSString *directionsValue;
    directionsValue = [directionsArray objectAtIndex:currentIndex]; //Harcoded index to 0.
    [directionTextField setText: directionsValue];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"imageSegue"])
    {
        ImageViewController *vc = segue.destinationViewController;
        
        if (currentIndex == 0)
        {
            vc.image = [UIImage imageNamed:@"0"];
        }
        else if (currentIndex == 1)
        {
            vc.image = [UIImage imageNamed:@"1"];
        }
        else if (currentIndex == 2)
        {
            vc.image = [UIImage imageNamed:@"2"];
        }
        else if (currentIndex == 3)
        {
            vc.image = [UIImage imageNamed:@"3"];
        }
        else if (currentIndex == 4)
        {
            vc.image = [UIImage imageNamed:@"4"];
        }
        else if (currentIndex == 5)
        {
            vc.image = [UIImage imageNamed:@"5"];
        }
        else
        {
            vc.image = [UIImage imageNamed:@"6"];
        }
    }
}

- (IBAction)viewImage:(id)sender
{
    [self performSegueWithIdentifier:@"imageSegue" sender:self];
}
@end
