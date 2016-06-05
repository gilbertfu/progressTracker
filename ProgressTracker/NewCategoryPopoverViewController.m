//
//  NewCategoryPopoverViewController.m
//  ProgressTracker
//
//  Created by Gilbert Fu on 5/30/16.
//  Copyright © 2016 Gilbert Fu. All rights reserved.
//

#import "NewCategoryPopoverViewController.h"

@implementation NewCategoryPopoverViewController
@synthesize myDelegate;
- (IBAction)createCategory:(id)sender {
    if ([self.categoryName.text length] != 0) {
        [self.myDelegate newCategoryPopoverControllerSaved:self.categoryName.text];
        [[self presentingViewController] dismissViewControllerAnimated:YES completion:nil];
    }
}

@end
