//
//  ProgressItemsViewController.m
//  ProgressTracker
//
//  Created by Gilbert Fu on 3/13/16.
//  Copyright © 2016 Gilbert Fu. All rights reserved.
//

#import "ProgressItemsViewController.h"
#import "ProgressItems.h"
#import "ProgressItemsStore.h"
#import "ItemVersion.h"
#import "ViewController.h"

@implementation ProgressItemsViewController
- (id)initWithCoder:(NSCoder *)decoder {
    self = [super initWithCoder:decoder];
    _progressItemsStore = [[ProgressItemsStore alloc] init];
    
    /*for (int i = 0; i < 5; i++) {
        [_progressItemsStore createProgressItems];
    }*/
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.Title setText: self.categoryName];

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
    return self.progressItemsStore.allProgressItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // Get a new or recycled cell
    UITableViewCell *cell =
    [self.tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"
                                         forIndexPath:indexPath];
    // Set the text on the cell with the description of an item at
    //  the nth index of the items array, where n = this cell's row number
    ProgressItems *progressItems = self.progressItemsStore.allProgressItems[indexPath.row];
    cell.textLabel.text = progressItems.description;
    return cell;
}

- (void)tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath {
    // If the table is asking to commit a delete operation...
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Find the item to delete and remove it from the ItemStore
        ProgressItems *progressItems = self.progressItemsStore.allProgressItems[indexPath.row];
        [self.progressItemsStore removeProgressItems:progressItems];
        // Also, remove the deleted row from the table
        [self.tableView deleteRowsAtIndexPaths:@[indexPath]
                              withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (void)tableView:(UITableView *)tableView
moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath
      toIndexPath:(NSIndexPath *)destinationIndexPath {
    // Update the array
    [self.progressItemsStore moveProgressItemsAtIndex:sourceIndexPath.row
                                    toIndex:destinationIndexPath.row];
}

- (IBAction)addNewItem:(id)sender {
    // Create a new item and add it to the store
    //prompt the user to enter name of new progress items to track
    /*ProgressItems *newProgressItems = [self.progressItemsStore createProgressItems];
    // Figure out the item's index in the items array
    NSInteger index = [self.progressItemsStore.allProgressItems indexOfObjectIdenticalTo:newProgressItems];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
    // Insert a row at this indexpath in the table
    [self.tableView insertRowsAtIndexPaths:@[indexPath]
                          withRowAnimation:UITableViewRowAnimationTop];*/
}


- (IBAction)toggleEditingMode:(id)sender {
    // If you are currently in editing mode...
    if (self.editing) {
        // ...change the text of the button to inform the user
        [sender setTitle:@"Edit" forState:UIControlStateNormal];
        // and exit editing mode
        [self setEditing:NO animated:YES];
    } else { // and if we're not in editing mode...
        // ...change the button text
        [sender setTitle:@"Done" forState:UIControlStateNormal];
        // and enter editing mode
        [self setEditing:YES animated:YES];
    }
}

- (IBAction)setProgressItemsViewName:(id)sender {
    [sender setTitle:self.categoryName];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"showProgressItems" sender:self];
}
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id) sender {
    UIViewController *destVC = segue.destinationViewController;
    if ([segue.identifier isEqualToString:@"showProgressItems"]) {
        NSInteger row = [self.tableView indexPathForSelectedRow].row;
        ProgressItems *progressItems = self.progressItemsStore.allProgressItems[row];
        ViewController *vc = (ViewController *)destVC;
        vc.progressItems = progressItems;
        //pvc.Title setText: category.name];
    }
    
    if ([segue.identifier isEqualToString:@"newProgressItemsDetails"]) {
        UINavigationController *navigationController = segue.destinationViewController;
        ProgressItemsDetailsViewController *progressItemsDetailsViewController = [navigationController viewControllers][0];
        progressItemsDetailsViewController.delegate = self;
    }
    
}

#pragma mark - PlayerDetailsViewControllerDelegate

- (void)progressItemsDetailsViewControllerDidCancel:(ProgressItemsDetailsViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)progressItemsDetailsViewControllerDidSave:(ProgressItemsDetailsViewController *)controller
                                       didAddItem:(ProgressItems *)item
{
    [self.progressItemsStore.progressItemsArray addObject:item];
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
