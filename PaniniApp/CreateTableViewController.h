//
//  CreateTableViewController.h
//  PaniniApp
//
//  Created by Texidor-Rodriguez, Ismael on 3/30/16.
//  Copyright © 2016 Texidor-Rodriguez, Ismael. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreateTableViewController : UITableViewController


@property (nonatomic, strong) NSMutableArray *paniniArray;
@property (nonatomic, strong) NSMutableArray *ingredientsArray;
@property (nonatomic, strong) NSMutableArray *timeArray;
@property (nonatomic, strong) NSMutableArray *directionsArray;

//Text Fields
@property (weak, nonatomic) IBOutlet UITextField *name;

@property (weak, nonatomic) IBOutlet UITextField *ind;

@property (weak, nonatomic) IBOutlet UITextField *direction;

@property (weak, nonatomic) IBOutlet UITextField *time;

//Buttons
- (IBAction)done:(id)sender;
@end
