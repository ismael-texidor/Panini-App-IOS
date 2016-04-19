//
//  EditViewController.h
//  PaniniApp
//
//  Created by Texidor-Rodriguez, Ismael on 3/30/16.
//  Copyright © 2016 Texidor-Rodriguez, Ismael. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;

@property (weak, nonatomic) IBOutlet UITextField *indTextField;

@property (weak, nonatomic) IBOutlet UITextField *directionTextField;

@property (weak, nonatomic) IBOutlet UITextField *timeTextField;


//Global Properties
@property (nonatomic, strong) NSMutableArray *paniniArray;
@property (nonatomic, strong) NSMutableArray *ingredientsArray;
@property (nonatomic, strong) NSMutableArray *timeArray;
@property (nonatomic, strong) NSMutableArray *directionsArray;

@property NSInteger currentIndex;

- (IBAction)viewImage:(id)sender;

@end
