//
//  ProgressItems.m
//  ProgressTracker
//
//  Created by Gilbert Fu on 3/13/16.
//  Copyright © 2016 Gilbert Fu. All rights reserved.
//

#import "ProgressItems.h"

@implementation ProgressItems
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
        _allItemVersions = [[NSMutableArray alloc] init];
    }
    // Return the address of the newly initialized object
    return self;
}
-(instancetype)init
{
    return [self initWithName:@""];
}
- (NSString *)description
{
    NSString *descriptionString =
    [[NSString alloc] initWithFormat:@"%@ ",
     self.name];
    return descriptionString;
}
@end
