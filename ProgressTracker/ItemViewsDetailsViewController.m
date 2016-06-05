//
//  ItemViewsDetailsViewController.m
//  ProgressTracker
//
//  Created by Gilbert Fu on 4/17/16.
//  Copyright © 2016 Gilbert Fu. All rights reserved.
//

#import "ItemViewsDetailsViewController.h"

@implementation ItemViewsDetailsViewController
- (id)initWithCoder:(NSCoder *)decoder {
    self = [super initWithCoder:decoder];

    return self;
}
- (IBAction)didPressCamera:(id)sender {
    [self takePicture];
}
- (void)takePicture {
    UIImagePickerController *ipc = [[UIImagePickerController alloc] init];
    // If the device has a camera, take a picture.
    // Otherwise, pick from the library.
    if ([UIImagePickerController
         isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        ipc.sourceType = UIImagePickerControllerSourceTypeCamera;
    } else {
        ipc.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    
    ipc.delegate = self;
    // put the image picker on the screen
    [self presentViewController:ipc animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info {
    // Get the chosen image from the info dictionary
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    // Put the image into the image view
    self.imageView.image = image;
    // Dismiss the image picker
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)viewDidLoad
{
    [super viewDidLoad];

    self.wentWell1.text = self.wentWellString1;
    self.wentWell2.text = self.wentWellString2;
    self.wentWell3.text = self.wentWellString3;
    self.toImprove1.text = self.toImproveString1;
    self.toImprove2.text = self.toImproveString2;
    self.toImprove3.text = self.toImproveString3;
    self.descriptionText.text = self.descriptionString;
    [self.imageView setImage:_picture];
}
- (IBAction)cancel:(id)sender
{
    [self.delegate itemViewsDetailsViewControllerDidCancel:self];
}
- (IBAction)done:(id)sender
{
    NSInteger *newVersionNumber = (int) self.numOfItemVersions;
    ItemVersion *itemVersion = [[ItemVersion alloc] initWithVersionNumber:newVersionNumber];
    if (self.descriptionText.text && self.descriptionText.text.length > 0) {
        itemVersion.itemDescription = self.descriptionText.text;
    }
    if (self.wentWell1.text && self.wentWell1.text.length > 0) {
        [itemVersion.thingsThatWentWell addObject:self.wentWell1.text];
    }
    if (self.wentWell2.text && self.wentWell2.text.length > 0) {
        [itemVersion.thingsThatWentWell addObject:self.wentWell2.text];
    }
    if (self.wentWell3.text && self.wentWell3.text.length > 0) {
        [itemVersion.thingsThatWentWell addObject:self.wentWell3.text];
    }
    if (self.toImprove1.text && self.toImprove1.text.length > 0) {
        [itemVersion.thingsToWorkOn addObject:self.toImprove1.text];
    }
    if (self.toImprove2.text && self.toImprove2.text.length > 0) {
        [itemVersion.thingsToWorkOn addObject:self.toImprove2.text];
    }
    if (self.toImprove3.text && self.toImprove3.text.length > 0) {
        [itemVersion.thingsToWorkOn addObject:self.toImprove3.text];
    }
    if (self.imageView.image) {
        itemVersion.picture = self.imageView.image;
    }

    [self.delegate itemViewsDetailsViewControllerDidSave:self didAddItem:itemVersion];
}
@end
