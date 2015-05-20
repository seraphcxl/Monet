//
//  BubbleTransitionModalViewController.h
//  Monet
//
//  Created by Derek Chen on 5/20/15.
//  Copyright (c) 2015 seraphcxl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BubbleTransitionModalViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *closeButton;

- (IBAction)closeAction:(id)sender;

@end
