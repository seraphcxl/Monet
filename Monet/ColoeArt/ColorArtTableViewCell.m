//
//  ColorArtTableViewCell.m
//  Monet
//
//  Created by Derek Chen on 5/21/15.
//  Copyright (c) 2015 seraphcxl. All rights reserved.
//

#import "ColorArtTableViewCell.h"
#import "UIImage+DCHColorArt.h"
#import "DCHLinearGradientView.h"
#import <Tourbillon/DCHTourbillon.h>

const NSUInteger kColorArtTableViewCell_CellSize = 256;

@interface ColorArtTableViewCell ()

@property (nonatomic, strong) UIImageView *imgView;
@property (nonatomic, strong) DCHLinearGradientView *gradientView;
@property (nonatomic, strong) UIView *bgdView;
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation ColorArtTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setImage:(UIImage *)image color:(UIColor *)clr title:(NSString *)title andIndex:(NSUInteger)idx {
    do {
        if (!self.imgView) {
            self.imgView = [[UIImageView alloc] initWithFrame:CGRectZero];
            [self.contentView addSubview:self.imgView];
        }
        
        if (!self.gradientView) {
            self.gradientView = [[DCHLinearGradientView alloc] init];
            [self.contentView addSubview:self.gradientView];
        }
        
        if (!self.bgdView) {
            self.bgdView = [[UIView alloc] init];
            [self.contentView addSubview:self.bgdView];
        }
        
        if (!self.titleLabel) {
            self.titleLabel = [[UILabel alloc] init];
            [self.contentView addSubview:self.titleLabel];
        }
        
        self.imgView.contentMode = UIViewContentModeScaleAspectFill;
        self.imgView.image = image;
        self.imgView.clipsToBounds = YES;
        
        self.gradientView.gradientSize = 0.8f;
        
        self.titleLabel.backgroundColor = [UIColor clearColor];
        self.titleLabel.text = title;
        self.titleLabel.font = [UIFont fontWithName:@"AvenirNext-Medium" size:24.0f];
        self.titleLabel.textColor = [UIColor salmonColor];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.numberOfLines = 3;
        
        if (idx % 2) {
            self.imgView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - kColorArtTableViewCell_CellSize, 0.0f, kColorArtTableViewCell_CellSize, kColorArtTableViewCell_CellSize);
            
            self.gradientView.color = clr;
            self.gradientView.orientation = DCHLinearGradientView_Orientation_Left2Right;
            self.gradientView.frame = self.imgView.frame;
            
            self.bgdView.frame = CGRectMake(0.0f, 0.0f, [UIScreen mainScreen].bounds.size.width - kColorArtTableViewCell_CellSize, kColorArtTableViewCell_CellSize);
            self.bgdView.backgroundColor = clr;
            
            self.titleLabel.frame = self.bgdView.frame;
        } else {
            self.imgView.frame = CGRectMake(0.0f, 0.0f, kColorArtTableViewCell_CellSize, kColorArtTableViewCell_CellSize);
            
            self.gradientView.color = clr;
            self.gradientView.orientation = DCHLinearGradientView_Orientation_Right2Left;
            self.gradientView.frame = self.imgView.frame;
            
            self.bgdView.frame = CGRectMake(kColorArtTableViewCell_CellSize, 0.0f, [UIScreen mainScreen].bounds.size.width - kColorArtTableViewCell_CellSize, kColorArtTableViewCell_CellSize);
            self.bgdView.backgroundColor = clr;
            
            self.titleLabel.frame = self.bgdView.frame;
        }
        [self.gradientView setNeedsDisplay];
    } while (NO);
}

@end
