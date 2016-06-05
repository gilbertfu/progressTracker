//
//  ItemViewsDetailsViewController.h
//  ProgressTracker
//
//  Created by Gilbert Fu on 4/17/16.
//  Copyright © 2016 Gilbert Fu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemVersion.h"
@class ItemViewsDetailsViewController;
@protocol ItemViewsDetailsViewControllerDelegate <NSObject>
- (void)itemViewsDetailsViewControllerDidCancel:(ItemViewsDetailsViewController *)controller;
- (void)itemViewsDetailsViewControllerDidSave:(ItemViewsDetailsViewController *)controller
                                       didAddItem:(ItemVersion *)itemVerson;
@end

@interface ItemViewsDetailsViewController : UITableViewController <UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *wentWell1;
@property (weak, nonatomic) IBOutlet UITextField *wentWell2;
@property (weak, nonatomic) IBOutlet UITextField *wentWell3;
@property (weak, nonatomic) IBOutlet UITextField *toImprove2;
@property (weak, nonatomic) IBOutlet UITextField *toImprove3;
@property (weak, nonatomic) IBOutlet UITextView *descriptionText;
@property (weak, nonatomic) IBOutlet UITextField *toImprove1;
@property (nonatomic) NSString *wentWellString1;
@property (nonatomic) NSString *wentWellString2;
@property (nonatomic) NSString *wentWellString3;
@property (nonatomic) NSString *toImproveString1;
@property (nonatomic) NSString *toImproveString2;
@property (nonatomic) NSString *toImproveString3;
@property (nonatomic) NSString *descriptionString;
@property (nonatomic) NSUInteger numOfItemVersions;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic) UIImage *picture;
@property (nonatomic, weak) id <ItemViewsDetailsViewControllerDelegate> delegate;

- (IBAction)cancel:(id)sender;
- (IBAction)done:(id)sender;

@end
