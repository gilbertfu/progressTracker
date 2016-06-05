//
//  ProgressItemsViewController.h
//  ProgressTracker
//
//  Created by Gilbert Fu on 3/13/16.
//  Copyright © 2016 Gilbert Fu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProgressItemsDetailsViewController.h"
@class ProgressItemsStore;

@interface ProgressItemsViewController : UITableViewController <ProgressItemsDetailsViewControllerDelegate>
@property (nonatomic) ProgressItemsStore *progressItemsStore;
@property (nonatomic) IBOutlet UIView *headerView;
@property (weak, nonatomic) IBOutlet UILabel *Title;
@property (nonatomic) NSString *categoryName;
@end
