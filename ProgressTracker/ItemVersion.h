//
//  ItemVersion.h
//  ProgressTracker
//
//  Created by Gilbert Fu on 4/4/16.
//  Copyright © 2016 Gilbert Fu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItemVersion : NSObject
@property (nonatomic, strong) NSMutableArray *thingsToWorkOn;
@property (nonatomic, strong) NSMutableArray *thingsThatWentWell;
@property (nonatomic, copy) NSString *itemDescription;
@property (nonatomic) NSInteger *versionNumber;
@property (nonatomic, readonly, strong) NSDate *dateCreated;
@property (nonatomic) UIImage *picture;

- (instancetype)initWithVersionNumber:(NSInteger *)version NS_DESIGNATED_INITIALIZER;
@end
