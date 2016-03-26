//
//  CategoriesViewController.h
//  ProgressTracker
//
//  Created by Gilbert Fu on 2/27/16.
//  Copyright © 2016 Gilbert Fu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CategoryStore;

@interface CategoriesViewController : UITableViewController

@property (nonatomic) CategoryStore *categoryStore;
@property (nonatomic) IBOutlet UIView *headerView;
//- (instancetype)initWithCategoryStore:(CategoryStore *)store;

@end
