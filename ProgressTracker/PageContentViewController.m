//
//  PageContentViewController.m
//  ProgressTracker
//
//  Created by Gilbert Fu on 3/17/16.
//  Copyright © 2016 Gilbert Fu. All rights reserved.
//

#import "PageContentViewController.h"

@implementation PageContentViewController


- (void)viewDidLoad
{
    [super viewDidLoad];

    NSLog(@"in page content view controller");
    self.titleLabel.text = self.titleText;
}
@end
