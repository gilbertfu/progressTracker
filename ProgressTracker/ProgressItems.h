//
//  ProgressItems.h
//  ProgressTracker
//
//  Created by Gilbert Fu on 3/13/16.
//  Copyright © 2016 Gilbert Fu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProgressItems : NSObject
@property (nonatomic, strong) NSMutableArray *allItemVersions;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, readonly, strong) NSDate *dateCreated;

- (instancetype)initWithName:(NSString *)name NS_DESIGNATED_INITIALIZER;
@end
