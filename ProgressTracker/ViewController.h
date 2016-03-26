//
//  PageViewController.h
//  ProgressTracker
//
//  Created by Gilbert Fu on 3/18/16.
//  Copyright © 2016 Gilbert Fu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PageContentViewController.h"
#import "ProgressItems.h"

@interface ViewController : UIViewController <UIPageViewControllerDataSource>
@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (strong, nonatomic) NSArray *pageTitles;
@property (strong, nonatomic) ProgressItems *progressItems;
@end
