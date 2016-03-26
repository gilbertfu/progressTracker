//
//  CategoriesViewController.m
//  ProgressTracker
//
//  Created by Gilbert Fu on 2/27/16.
//  Copyright © 2016 Gilbert Fu. All rights reserved.
//

#import "CategoriesViewController.h"
#import "CategoryStore.h"
#import "PTCategory.h"
#import "CategoryCell.h"
#import "ProgressItemsViewController.h"

@implementation CategoriesViewController

/*- (instancetype)initWithCategoryStore:(CategoryStore *)store {
    self = [super initWithStyle:UITableViewStylePlain]; // call super's designated init
    if (self) {
        _categoryStore = store;
        
        for (int i = 0; i < 5; i++) {
            [_categoryStore createCategory];
        }
    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewStyle)style { // override super's designated init
    [NSException raise:@"Wrong Initializer"
                 format:@"Use initWithItemStore: instead of initWithStyle:!"];
     
     return nil;
}*/

- (id)initWithCoder:(NSCoder *)decoder {
    self = [super initWithCoder:decoder];
    _categoryStore = [[CategoryStore alloc] init];;
    
    for (int i = 0; i < 5; i++) {
        [_categoryStore createCategory];
    }
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
    return self.categoryStore.allCategories.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // Get a new or recycled cell
    UITableViewCell *cell =
    [self.tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"
                                         forIndexPath:indexPath];
    // Set the text on the cell with the description of an item at
    //  the nth index of the items array, where n = this cell's row number
    PTCategory *category = self.categoryStore.allCategories[indexPath.row];
    cell.textLabel.text = category.description;
    return cell;
}

- (IBAction)addNewItem:(id)sender {
    // Create a new item and add it to the store
    PTCategory *newCategory = [self.categoryStore createCategory];
    // Figure out the item's index in the items array
    NSInteger index = [self.categoryStore.allCategories indexOfObjectIdenticalTo:newCategory];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
    // Insert a row at this indexpath in the table
    [self.tableView insertRowsAtIndexPaths:@[indexPath]
                          withRowAnimation:UITableViewRowAnimationTop];
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

//- performSegueWithIdentifier:sender:
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"showCategoriesProgressItems" sender:self];
}
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id) sender {
    UIViewController *destVC = segue.destinationViewController;
    if ([segue.identifier isEqualToString:@"showCategoriesProgressItems"]) {
        NSInteger row = [self.tableView indexPathForSelectedRow].row;
        PTCategory *category = self.categoryStore.allCategories[row];
        ProgressItemsViewController *pvc = (ProgressItemsViewController *)destVC;
        //ProgressItemsViewController *pvc = (ProgressItemsViewController *)nc.v
        pvc.categoryName = category.name;
        [pvc.Title setText: category.name];
    }
    
}

- (void)tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath {
    // If the table is asking to commit a delete operation...
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Find the item to delete and remove it from the ItemStore
        PTCategory *category = self.categoryStore.allCategories[indexPath.row];
        [self.categoryStore removeCategory:category];
        // Also, remove the deleted row from the table
        [self.tableView deleteRowsAtIndexPaths:@[indexPath]
                              withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (void)tableView:(UITableView *)tableView
moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath
      toIndexPath:(NSIndexPath *)destinationIndexPath {
    // Update the array
    [self.categoryStore moveCategoryAtIndex:sourceIndexPath.row
                            toIndex:destinationIndexPath.row];
}

@end
