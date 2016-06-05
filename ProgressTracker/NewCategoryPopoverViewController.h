//
//  NewCategoryPopoverViewController.h
//  ProgressTracker
//
//  Created by Gilbert Fu on 5/30/16.
//  Copyright © 2016 Gilbert Fu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol saveNewCategoryDelegate <NSObject>
-(void) newCategoryPopoverControllerSaved:(NSString *)stringForFirst;
@end

@interface NewCategoryPopoverViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *categoryName;
@property (nonatomic, assign) id<saveNewCategoryDelegate>    myDelegate;
@end
