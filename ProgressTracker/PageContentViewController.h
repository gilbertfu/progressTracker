//
//  PageContentViewController.h
//  ProgressTracker
//
//  Created by Gilbert Fu on 3/17/16.
//  Copyright © 2016 Gilbert Fu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemVersion.h"

@interface PageContentViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property NSUInteger pageIndex;
@property NSString *titleText;
@property NSString *descriptionText;
@property ItemVersion *itemVersion;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITextView *descriptionBox;
@end
