//
//  ImageViewController.h
//  PaniniApp
//
//  Created by Texidor-Rodriguez, Ismael on 3/30/16.
//  Copyright © 2016 Texidor-Rodriguez, Ismael. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageViewController : UIViewController

@property UIImage* image;

@property (weak, nonatomic) IBOutlet UIImageView *paniniImage;
@end
