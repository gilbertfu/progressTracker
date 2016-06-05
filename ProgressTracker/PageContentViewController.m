//
//  PageContentViewController.m
//  ProgressTracker
//
//  Created by Gilbert Fu on 3/17/16.
//  Copyright © 2016 Gilbert Fu. All rights reserved.
//

#import "PageContentViewController.h"
#import "DetailListViewController.h"

@implementation PageContentViewController


- (void)viewDidLoad
{
    [super viewDidLoad];

    self.titleLabel.text = self.titleText;
    self.descriptionBox.text = self.itemVersion.itemDescription;
    self.imageView.image = self.itemVersion.picture;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id) sender {
    UIViewController *destVC = segue.destinationViewController;
    if ([segue.identifier isEqualToString:@"thingsWentWellSegue"]) {
        NSMutableArray *thingsThatWentWell = self.itemVersion.thingsThatWentWell;
        DetailListViewController *dlvc = (DetailListViewController *) destVC;
        dlvc.itemDetails = thingsThatWentWell;
    }
    
    if ([segue.identifier isEqualToString:@"thingsToImproveOnSegue"]) {
        NSMutableArray *thingsToWorkOn = self.itemVersion.thingsToWorkOn;
        DetailListViewController *dlvc = (DetailListViewController *) destVC;
        dlvc.itemDetails = thingsToWorkOn;
    }
    
}
@end
