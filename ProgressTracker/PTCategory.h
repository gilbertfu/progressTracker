//
//  PTCategory.h
//  ProgressTracker
//
//  Created by Gilbert Fu on 2/14/16.
//  Copyright © 2016 Gilbert Fu. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ProgressItems;

@interface PTCategory : NSObject

@property (nonatomic, strong) PTCategory *containedPTCategory;
@property (nonatomic, weak) PTCategory *container;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, readonly, strong) NSDate *dateCreated;
@property (nonatomic, strong) NSMutableArray *progressItemsForCategory;

- (instancetype)initWithName:(NSString *)name NS_DESIGNATED_INITIALIZER;

+ (instancetype)randomCategory;
- (void) addNewProgressItem: (ProgressItems *) newProgressItems;
- (void) removeProgressItem: (ProgressItems *) progressItems;
- (NSArray *) allProgressItemsForCategory;
@end
