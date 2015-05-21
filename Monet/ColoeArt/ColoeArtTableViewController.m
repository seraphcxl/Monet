//
//  ColoeArtTableViewController.m
//  Monet
//
//  Created by Derek Chen on 5/21/15.
//  Copyright (c) 2015 seraphcxl. All rights reserved.
//

#import "ColoeArtTableViewController.h"
#import "DCHLinearGradientView.h"
#import "UIImage+DCHColorArt.h"
#import <Tourbillon/DCHTourbillon.h>
#import "ColorArtTableViewCell.h"

const NSUInteger kColoeArtTableViewController_CellSize = 256;

@interface ColoeArtTableViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSDictionary *picDic;
@property (nonatomic, strong) NSMutableDictionary *colorDic;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ColoeArtTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.picDic = @{@"Angelababy": @"Angelababy"
                          , @"AudreyHepburn": @"Audrey Hepburn"
                          , @"ChenYiYun": @"Chen YiYun"
                          , @"EmmaWatson": @"Emma Watson"
                          , @"EvaGreen": @"Eva Green"
                          , @"GaoYuanYuan": @"Gao YuanYuan"
                          , @"LiuShiShi": @"Liu ShiShi"
                          , @"SongHuiQiao": @"Song HuiQiao"
                          , @"TaylorSwift": @"Taylor Swift"
                          };
    
    self.colorDic = [NSMutableDictionary dictionary];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView registerClass:[ColorArtTableViewCell class] forCellReuseIdentifier:@"ColorArtTableViewCell"];
    [self.view addSubview:self.tableView];
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
    return self.picDic.allKeys.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ColorArtTableViewCell *cell = (ColorArtTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"ColorArtTableViewCell" forIndexPath:indexPath];
    
    // Configure the cell...
    UIImage *image = [UIImage imageNamed:self.picDic.allKeys[indexPath.row]];
    UIColor *clr = [self.colorDic objectForKey:@(indexPath.row)];
    NSString *title = self.picDic.allValues[indexPath.row];
    
    if (indexPath.row % 2) {
        if (!clr) {
            clr = [image findEdgeColorWithType:DCHColorArt_EdgeType_Left countOfLine:1 alphaEnable:NO];
            [self.colorDic DCH_safe_setObject:clr forKey:@(indexPath.row)];
        }
    } else {
        if (!clr) {
            clr = [image findEdgeColorWithType:DCHColorArt_EdgeType_Right countOfLine:1 alphaEnable:NO];
            [self.colorDic DCH_safe_setObject:clr forKey:@(indexPath.row)];
        }
    }
    
    [cell setImage:image color:clr title:title andIndex:indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kColorArtTableViewCell_CellSize;
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

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
