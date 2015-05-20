//
//  MMTAnimationTableViewController.h
//  Monet
//
//  Created by Derek Chen on 5/4/15.
//  Copyright (c) 2015 seraphcxl. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, MMTAnimationType) {
    MMTAnimationType_BubbleTransition,
    MMTAnimationType_Shimmer,
    MMTAnimationType_ColorArt,
};

@interface MMTAnimationTableViewController : UITableViewController

@end
