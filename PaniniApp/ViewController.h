//
//  ViewController.h
//  PaniniApp
//
//  Created by Texidor-Rodriguez, Ismael on 3/30/16.
//  Copyright © 2016 Texidor-Rodriguez, Ismael. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *paniniArray, *ingredientsArray, *directionsArray, *timeArray;

@property NSInteger currentIndex;

- (IBAction)edit:(id)sender;

@end

