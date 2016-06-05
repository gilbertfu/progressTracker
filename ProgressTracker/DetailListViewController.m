//
//  DetailListViewController.m
//  ProgressTracker
//
//  Created by Gilbert Fu on 4/12/16.
//  Copyright © 2016 Gilbert Fu. All rights reserved.
//

#import "DetailListViewController.h"

@implementation DetailListViewController

- (id)initWithCoder:(NSCoder *)decoder {
    self = [super initWithCoder:decoder];
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:@"UITableViewCell"];
    
    // Load the header view
    //[[NSBundle mainBundle] loadNibNamed:@"HeaderView" owner:self options:nil];
    //self.tableView.tableHeaderView = self.headerView;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}


- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    return self.itemDetails.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // Get a new or recycled cell
    UITableViewCell *cell =
    [self.tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"
                                         forIndexPath:indexPath];
    // Set the text on the cell with the description of an item at
    //  the nth index of the items array, where n = this cell's row number
    NSString *detail = self.itemDetails[indexPath.row];
    cell.textLabel.text = detail;
    return cell;
}

/*- (void)tableView:(UITableView *)tableView
moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath
      toIndexPath:(NSIndexPath *)destinationIndexPath {
    // Update the array
    [self.categoryStore moveCategoryAtIndex:sourceIndexPath.row
                                    toIndex:destinationIndexPath.row];
}*/

@end
