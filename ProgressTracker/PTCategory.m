//
//  PTCategory.m
//  ProgressTracker
//
//  Created by Gilbert Fu on 2/14/16.
//  Copyright © 2016 Gilbert Fu. All rights reserved.
//

#import "PTCategory.h"
#import "ProgressItems.h"

@implementation PTCategory
- (instancetype)initWithName:(NSString *)name
{
    // Call the superclass's designated initializer
    self = [super init];
    // Did the superclass's designated initializer succeed?
    if (self) {
        // Give the instance variables initial values
        _name = name;
        // Set _dateCreated to the current date and time
        _dateCreated = [[NSDate alloc] init];
    }
    // Return the address of the newly initialized object
    return self;
}
-(instancetype)init
{
    return [self initWithName:@""];
}

- (void)setContainedPTCategory:(PTCategory *)containedPTCategory
{
    _containedPTCategory = containedPTCategory;
    self.containedPTCategory.container = self;
}

- (NSString *)description
{
    NSString *descriptionString =
    [[NSString alloc] initWithFormat:@"%@ ",
     self.name];
    return descriptionString;
}

+ (instancetype)randomCategory
{
    // Create an immutable array of three adjectives
    NSArray *randomAdjectiveList = @[@"Fun", @"New", @"Experimental"];
    // Create an immutable array of three nouns
    NSArray *randomNounList = @[@"Restaurants", @"Recipes", @"Hobbies"];
    // Get the index of a random adjective/noun from the lists
    unsigned int adjectiveIndex =
    arc4random_uniform((unsigned int)[randomAdjectiveList count]);
    unsigned int nounIndex =
    arc4random_uniform((unsigned int)[randomNounList count]);
    // Note that NSInteger is not an object, but a type definition for "long"
    NSString *randomName = [NSString stringWithFormat:@"%@ %@",
                            [randomAdjectiveList objectAtIndex:adjectiveIndex],
                            [randomNounList objectAtIndex:nounIndex]];
    // Instantiate the new item with the random values
    PTCategory *newItem = [[self alloc] initWithName:randomName];
    return newItem;
}

- (NSArray *)allProgressItemsForCategory {
    return [self.progressItemsForCategory copy];
}
- (void)addNewProgressItem: (ProgressItems *) newProgressItems {
    [self.progressItemsForCategory addObject:newProgressItems];
}

- (void)removeProgressItem:(ProgressItems *) progressItem {
    [self.progressItemsForCategory removeObjectIdenticalTo:progressItem];
}

/*- (void)moveCategoryAtIndex:(NSInteger)source
                    toIndex:(NSInteger)destination {
    if (source == destination) {
        return; }
    // Get a pointer to the object being removed so you can re-insert it
    id movedCategory = self.progressItemsForCategory[source];
    // Remove the item from the array
    [self.progressItemsForCategory removeObjectIdenticalTo:movedCategory];
    // Insert the item at its new location
    [self.progressItemsForCategory insertObject:movedCategory atIndex:destination];
}*/

@end
