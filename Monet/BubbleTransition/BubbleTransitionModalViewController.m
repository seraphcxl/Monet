//
//  BubbleTransitionModalViewController.m
//  Monet
//
//  Created by Derek Chen on 5/20/15.
//  Copyright (c) 2015 seraphcxl. All rights reserved.
//

#import "BubbleTransitionModalViewController.h"

@interface BubbleTransitionModalViewController ()

@end

@implementation BubbleTransitionModalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.closeButton.transform = CGAffineTransformMakeRotation((CGFloat)M_PI_4);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)closeAction:(id)sender {
    do {
        [self dismissViewControllerAnimated:YES completion:^{
            do {
                ;
            } while (NO);
        }];
    } while (NO);
}

@end
