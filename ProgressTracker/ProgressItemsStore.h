//
//  ProgressItemsStore.h
//  ProgressTracker
//
//  Created by Gilbert Fu on 3/13/16.
//  Copyright © 2016 Gilbert Fu. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ProgressItems;

@interface ProgressItemsStore : NSObject

@property (nonatomic) NSMutableArray *progressItemsArray;

- (NSArray *) allProgressItems;
- (ProgressItems *) createProgressItems;
-(void)removeProgressItems:(ProgressItems *)progressItems;
- (void)moveProgressItemsAtIndex:(NSInteger)source
                    toIndex:(NSInteger)destination;
@end
