//
//  ProgressItemsDetailsViewController.h
//  ProgressTracker
//
//  Created by Gilbert Fu on 3/26/16.
//  Copyright © 2016 Gilbert Fu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProgressItems.h"
@class ProgressItemsDetailsViewController;

@protocol ProgressItemsDetailsViewControllerDelegate <NSObject>
- (void)progressItemsDetailsViewControllerDidCancel:(ProgressItemsDetailsViewController *)controller;
- (void)progressItemsDetailsViewControllerDidSave:(ProgressItemsDetailsViewController *)controller
                                       didAddItem:(ProgressItems *)item;
@end

@interface ProgressItemsDetailsViewController : UITableViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *wentWell1;
@property (weak, nonatomic) IBOutlet UITextField *wentWell2;
@property (weak, nonatomic) IBOutlet UITextField *wentWell3;
@property (weak, nonatomic) IBOutlet UITextField *needToImprove1;
@property (weak, nonatomic) IBOutlet UITextField *needToImprove2;
@property (weak, nonatomic) IBOutlet UITextField *needToImprove3;
@property (weak, nonatomic) IBOutlet UITextView *descriptionText;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic, weak) id <ProgressItemsDetailsViewControllerDelegate> delegate;


- (IBAction)cancel:(id)sender;
- (IBAction)done:(id)sender;

@end
