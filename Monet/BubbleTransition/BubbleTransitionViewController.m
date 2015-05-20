//
//  BubbleTransitionViewController.m
//  Monet
//
//  Created by Derek Chen on 5/20/15.
//  Copyright (c) 2015 seraphcxl. All rights reserved.
//

#import "BubbleTransitionViewController.h"
#import "DCHBubbleAnimatedTransitioning.h"
#import "BubbleTransitionModalViewController.h"

@interface BubbleTransitionViewController () <UIViewControllerTransitioningDelegate>

@property (nonatomic, strong) DCHBubbleAnimatedTransitioning *transition;

@end

@implementation BubbleTransitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.transition = [[DCHBubbleAnimatedTransitioning alloc] init];
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

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    id <UIViewControllerAnimatedTransitioning> result = nil;
    do {
        self.transition.transitionMode = DCHBubbleAnimatedTransitioning_Mode_Present;
        self.transition.startingPoint = self.transitionButton.center;
        self.transition.bubbleColor = self.transitionButton.backgroundColor;
        result = self.transition;
    } while (NO);
    return result;
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    id <UIViewControllerAnimatedTransitioning> result = nil;
    do {
        self.transition.transitionMode = DCHBubbleAnimatedTransitioning_Mode_Dismiss;
        self.transition.startingPoint = self.transitionButton.center;
        self.transition.bubbleColor = self.transitionButton.backgroundColor;
        result = self.transition;
    } while (NO);
    return result;
}

- (IBAction)transitionAction:(id)sender {
    do {
        BubbleTransitionModalViewController *modalVC = [[BubbleTransitionModalViewController alloc] initWithNibName:nil bundle:nil];

        modalVC.transitioningDelegate = self;
        modalVC.modalPresentationStyle = UIModalPresentationCustom;
        modalVC.view.frame = CGRectMake(0.0f, 0.0f, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        
        [self presentViewController:modalVC animated:YES completion:^{
            do {
                ;
            } while (NO);
        }];
    } while (NO);
}

@end
