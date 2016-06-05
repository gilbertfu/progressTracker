//
//  ProgressItemsDetailsViewController.m
//  ProgressTracker
//
//  Created by Gilbert Fu on 3/26/16.
//  Copyright © 2016 Gilbert Fu. All rights reserved.
//

#import "ProgressItemsDetailsViewController.h"
#import "ItemVersion.h"
#import "ProgressItems.h"

@implementation ProgressItemsDetailsViewController
- (IBAction)didPressCameraButton:(id)sender {
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


- (IBAction)cancel:(id)sender
{
    NSLog(@"gilbert pressed cancel");
    [self.delegate progressItemsDetailsViewControllerDidCancel:self];
}
- (IBAction)done:(id)sender
{
    ProgressItems *progressItems = [[ProgressItems alloc] initWithName: self.nameTextField.text];
    ItemVersion *itemVersion = [[ItemVersion alloc] initWithVersionNumber:0];
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
    if (self.needToImprove1.text && self.needToImprove1.text.length > 0) {
        [itemVersion.thingsToWorkOn addObject:self.needToImprove1.text];
    }
    if (self.needToImprove2.text && self.needToImprove2.text.length > 0) {
        [itemVersion.thingsToWorkOn addObject:self.needToImprove2.text];
    }
    if (self.needToImprove3.text && self.needToImprove3.text.length > 0) {
        [itemVersion.thingsToWorkOn addObject:self.needToImprove3.text];
    }
    if (self.imageView.image) {
        itemVersion.picture = self.imageView.image;
    }
    
    [progressItems.allItemVersions addObject:itemVersion];
    [self.delegate progressItemsDetailsViewControllerDidSave:self didAddItem:progressItems];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        [self.nameTextField becomeFirstResponder];
    }
}
@end
