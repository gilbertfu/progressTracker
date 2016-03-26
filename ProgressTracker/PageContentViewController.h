//
//  PageContentViewController.h
//  ProgressTracker
//
//  Created by Gilbert Fu on 3/17/16.
//  Copyright © 2016 Gilbert Fu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageContentViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property NSUInteger pageIndex;
@property NSString *titleText;
@end
