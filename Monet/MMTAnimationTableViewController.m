//
//  MMTAnimationTableViewController.m
//  Monet
//
//  Created by Derek Chen on 5/4/15.
//  Copyright (c) 2015 seraphcxl. All rights reserved.
//

#import "MMTAnimationTableViewController.h"
#import <Tourbillon/DCHTourbillon.h>

NSString * const kMMTSpringTableViewCellReuseIdentifier = @"MMTSpringTableViewCell";

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
    
//    self.colorAry = @[[UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:1.0]
//                      , [UIColor colorWithRed:1.0 green:0.3 blue:0.0 alpha:1.0]
//                      , [UIColor colorWithRed:1.0 green:0.6 blue:0.0 alpha:1.0]
//                      , [UIColor colorWithRed:0.3 green:0.7 blue:0.0 alpha:1.0]
//                      , [UIColor colorWithRed:0.2 green:1.0 blue:0.2 alpha:1.0]
//                      , [UIColor colorWithRed:0.0 green:0.75 blue:0.5 alpha:1.0]
//                      , [UIColor colorWithRed:0.0 green:0.5 blue:0.75 alpha:1.0]
//                      , [UIColor colorWithRed:0.0 green:0.25 blue:1.0 alpha:1.0]
//                      , [UIColor colorWithRed:0.0 green:0.0 blue:1.0 alpha:1.0]
//                      ];
    
    self.colorAry = @[[UIColor aluminumColor]
                      , [UIColor aquaColor]
                      , [UIColor asparagusColor]
                      , [UIColor bananaColor]
                      , [UIColor blueberryColor]
                      , [UIColor bubblegumColor]
                      , [UIColor cantaloupeColor]
                      , [UIColor carnationColor]
                      , [UIColor cayenneColor]
                      , [UIColor cloverColor]
                      , [UIColor eggplantColor]
                      , [UIColor fernColor]
                      , [UIColor floraColor]
                      , [UIColor grapeColor]
                      , [UIColor honeydewColor]
                      , [UIColor iceColor]
                      , [UIColor ironColor]
                      , [UIColor lavenderColor]
                      , [UIColor leadColor]
                      , [UIColor lemonColor]
                      , [UIColor licoriceColor]
                      , [UIColor limeColor]
                      , [UIColor magnesiumColor]
                      , [UIColor maraschinoColor]
                      , [UIColor maroonColor]
                      , [UIColor midnightColor]
                      , [UIColor mochaColor]
                      , [UIColor mossColor]
                      , [UIColor murcuryColor]
                      , [UIColor nickelColor]
                      , [UIColor oceanColor]
                      , [UIColor orchidColor]
                      , [UIColor plumColor]
                      , [UIColor salmonColor]
                      , [UIColor seaFoamColor]
                      , [UIColor silverColor]
                      , [UIColor skyColor]
                      , [UIColor snowColor]
                      , [UIColor spindriftColor]
                      , [UIColor springColor]
                      , [UIColor steelColor]
                      , [UIColor strawberryColor]
                      , [UIColor tangerineColor]
                      , [UIColor tealColor]
                      , [UIColor tinColor]
                      , [UIColor tungstenColor]
                      , [UIColor turquoiseColor]
                      ];
    
    self.animationDic = @{@"Parallax": @"Parallax"
                          , @"Shimmer": @"Shimmer"
                          , @"Dropdown menu": @"Dropdown menu"
                          , @"Paper table view cell": @"Paper table view cell"
                          , @"Flower menu": @"Flower menu"
                          , @"UI dynamic": @"UI dynamic"
                          };
    
    NSMutableDictionary *tmpDic = [NSMutableDictionary dictionary];
    for (NSInteger i = 0; i < 100; ++i) {
        NSString *str = [NSString stringWithFormat:@"%ld", (long)i];
        [tmpDic setObject:str forKey:str];
    }
    self.animationDic = tmpDic;
    
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
    return self.colorAry.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kMMTSpringTableViewCellReuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
//    cell.textLabel.text = [self.animationDic.allKeys objectAtIndex:indexPath.row];
    
//    cell.textLabel.backgroundColor = [UIColor blackColor];
//    cell.detailTextLabel.text = [self.animationDic objectForKey:cell.textLabel.text];
//    cell.detailTextLabel.backgroundColor = [UIColor blackColor];
    cell.backgroundColor = [self colorForIndex:indexPath.row];
    cell.tag = [self cellTagFromIndex:indexPath];
    cell.textLabel.text = [UIColor DCH_colorName:cell.backgroundColor];
//    [cell customizeUI];
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    do {
//        UITableView *tableView = (UITableView *)scrollView;
//        [[tableView visibleCells] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
//            do {
//                MMTSpringTableViewCell *cell = (MMTSpringTableViewCell *)obj;
//                CGFloat scrollDelta = cell.bounds.origin.y - scrollView.bounds.origin.y;
//                CGPoint touchLocation = [scrollView.panGestureRecognizer locationInView:scrollView];
//                
//                for (UIAttachmentBehavior *spring in cell.dynamicAnimator.behaviors) {
//                    CGPoint anchorPoint = spring.anchorPoint;
//                    CGFloat distanceFromTouch = fabs(touchLocation.y - anchorPoint.y);
//                    CGFloat scrollResistance = distanceFromTouch / 500.0f; // higher the number, larger the bounce
//                    
//                    UICollectionViewLayoutAttributes *item = [spring.items firstObject];
//                    CGPoint center = item.center;
//                    center.y += scrollDelta * scrollResistance;
//                    item.center = center;
//                    
//                    [cell.dynamicAnimator updateItemUsingCurrentState:item];
//                }
//            } while (NO);
//        }];
        
    } while (NO);
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
        if (!sender || ![sender isKindOfClass:[UITableViewCell class]]) {
            break;
        }
        UITableViewCell *cell = (UITableViewCell *)sender;
        NSIndexPath *indexPath = [self indexPathFromCellTag:cell.tag];
        switch (indexPath.section) {
            case 0:
            {
                switch (indexPath.row) {
                    case 0:
                    {
//                        int i = 0;
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
//        NSInteger countOfColorAry = self.colorAry.count - 1;
//        NSInteger idx = labs(index % countOfColorAry - (index / countOfColorAry) % 2 * countOfColorAry);
//        color = [self.colorAry objectAtIndex:idx];
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
