//
//  BubbleTransitionViewController.h
//  Monet
//
//  Created by Derek Chen on 5/20/15.
//  Copyright (c) 2015 seraphcxl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BubbleTransitionViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *transitionButton;

- (IBAction)transitionAction:(id)sender;

@end
