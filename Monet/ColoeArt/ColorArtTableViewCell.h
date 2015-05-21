//
//  ColorArtTableViewCell.h
//  Monet
//
//  Created by Derek Chen on 5/21/15.
//  Copyright (c) 2015 seraphcxl. All rights reserved.
//

#import <UIKit/UIKit.h>

extern const NSUInteger kColorArtTableViewCell_CellSize;

@interface ColorArtTableViewCell : UITableViewCell

- (void)setImage:(UIImage *)image color:(UIColor *)clr title:(NSString *)title andIndex:(NSUInteger)idx;

@end
