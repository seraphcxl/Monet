//
//  MMTAnimationTableViewController.m
//  Monet
//
//  Created by Derek Chen on 5/4/15.
//  Copyright (c) 2015 seraphcxl. All rights reserved.
//

#import "MMTAnimationTableViewController.h"
#import <Tourbillon/DCHTourbillon.h>
#import "BubbleTransitionViewController.h"

NSString * const kMMTSpringTableViewCellReuseIdentifier = @"MMTTableViewCell";

@interface MMTAnimationTableViewController ()

@property (nonatomic, strong) NSDictionary *animationDic;
@property (nonatomic, strong) NSArray *colorAry;

- (UIColor *)colorForIndex:(NSInteger)index;

- (NSInteger)cellTagFromIndex:(NSIndexPath *)indexPath;
- (NSIndexPath *)indexPathFromCellTag:(NSInteger)cellTag;

@end

@implementation MMTAnimationTableViewController

- (void)dealloc {
    do {
        self.animationDic = nil;
    } while (NO);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.colorAry = [UIColor DCH_colorfulArray];
    
    self.animationDic = @{@(MMTAnimationType_BubbleTransition): @"BubbleTransition"
                          , @(MMTAnimationType_Shimmer): @"Shimmer"
                          , @(MMTAnimationType_ColorArt): @"ColorArt"
                          };
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return MAX(self.colorAry.count, self.animationDic.allKeys.count);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kMMTSpringTableViewCellReuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
//    cell.textLabel.text = [self.animationDic.allKeys objectAtIndex:indexPath.row];
    
    cell.backgroundColor = [self colorForIndex:(indexPath.row % (MAX(self.colorAry.count, self.animationDic.allKeys.count)))];
    cell.tag = [self cellTagFromIndex:indexPath];
    if (indexPath.row < self.animationDic.allKeys.count) {
        cell.textLabel.text = self.animationDic.allValues[indexPath.row];
    } else {
        cell.textLabel.text = [UIColor DCH_colorName:cell.backgroundColor];
    }
//    [cell customizeUI];
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    do {
        ;
    } while (NO);
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    do {
        switch (indexPath.section) {
            case 0:
            {
                switch (indexPath.row) {
                    case MMTAnimationType_BubbleTransition:
                    {
                        BubbleTransitionViewController *vc = [[BubbleTransitionViewController alloc] initWithNibName:nil bundle:nil];
                        [self.navigationController pushViewController:vc animated:YES];
                    }
                        break;
                    case MMTAnimationType_Shimmer:
                    {
                        int i = 0;
                    }
                        break;
                    case MMTAnimationType_ColorArt:
                    {
                        int i = 0;
                    }
                        break;
                    default:
                        break;
                }
            }
                break;
                
            default:
                break;
        }
    } while (NO);
}

#pragma mark - Private
- (UIColor *)colorForIndex:(NSInteger)index {
    UIColor *color = nil;
    do {
        color = [self.colorAry objectAtIndex:index];
    } while (NO);
    return color;
//    NSUInteger itemCount = self.animationDic.allKeys.count - 1;
//    float factor = ((float)index / (float)itemCount);
//    float val = factor * 0.75f;
//    return [UIColor colorWithRed:(1.0f - val) green:val * (1.0f - factor) blue:val alpha:1.0f];
}

- (NSInteger)cellTagFromIndex:(NSIndexPath *)indexPath {
    return indexPath.section * 10000 + indexPath.row;
}

- (NSIndexPath *)indexPathFromCellTag:(NSInteger)cellTag {
    return [NSIndexPath indexPathForRow:(cellTag / 10000) inSection:(cellTag % 10000)];
}

@end
