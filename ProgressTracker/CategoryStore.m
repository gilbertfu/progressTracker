//
//  CategoryStore.m
//  ProgressTracker
//
//  Created by Gilbert Fu on 2/25/16.
//  Copyright © 2016 Gilbert Fu. All rights reserved.
//

#import "CategoryStore.h"
#import "PTCategory.h"

@implementation CategoryStore

- (instancetype)init {
    self = [super init];
    if (self) {
        _categories = [NSMutableArray array];
    }
    return self;
}

- (NSArray *)allCategories {
    return [self.categories copy];
}
- (PTCategory *)createCategory {
    PTCategory *newCategory = [PTCategory randomCategory];
    [self.categories addObject:newCategory];
    return newCategory;
}

- (void)removeCategory:(PTCategory *)category {
    [self.categories removeObjectIdenticalTo:category];
}

- (void)moveCategoryAtIndex:(NSInteger)source
                toIndex:(NSInteger)destination {
    if (source == destination) {
        return; }
    // Get a pointer to the object being removed so you can re-insert it
    id movedCategory = self.categories[source];
    // Remove the item from the array
    [self.categories removeObjectIdenticalTo:movedCategory];
    // Insert the item at its new location
    [self.categories insertObject:movedCategory atIndex:destination];
}
@end
