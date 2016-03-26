//
//  ProgressItemsStore.m
//  ProgressTracker
//
//  Created by Gilbert Fu on 3/13/16.
//  Copyright © 2016 Gilbert Fu. All rights reserved.
//

#import "ProgressItemsStore.h"
#import "ProgressItems.h"

@implementation ProgressItemsStore

- (instancetype)init {
    self = [super init];
    if (self) {
        _progressItemsArray = [NSMutableArray array];
    }
    return self;
}

- (NSArray *)allProgressItems {
    return [self.progressItemsArray copy];
}
- (ProgressItems *)createProgressItems {
    ProgressItems *newProgressItems = [[ProgressItems alloc] initWithName:@"Something I track"];
    [self.progressItemsArray addObject:newProgressItems];
    return newProgressItems;
}

- (void)removeProgressItems:(ProgressItems *)progressItems {
    [self.progressItemsArray removeObjectIdenticalTo:progressItems];
}

- (void)moveProgressItemsAtIndex:(NSInteger)source
                    toIndex:(NSInteger)destination {
    if (source == destination) {
        return; }
    // Get a pointer to the object being removed so you can re-insert it
    id movedCategory = self.progressItemsArray[source];
    // Remove the item from the array
    [self.progressItemsArray removeObjectIdenticalTo:movedCategory];
    // Insert the item at its new location
    [self.progressItemsArray insertObject:movedCategory atIndex:destination];
}
@end
