//
//  ItemVersion.m
//  ProgressTracker
//
//  Created by Gilbert Fu on 4/4/16.
//  Copyright © 2016 Gilbert Fu. All rights reserved.
//

#import "ItemVersion.h"

@implementation ItemVersion
-(instancetype)initWithVersionNumber:(NSInteger *)version
{
    self = [super init];
    // Did the superclass's designated initializer succeed?
    if (self) {
        // Give the instance variables initial values
        _thingsToWorkOn = [[NSMutableArray alloc] init];
        _thingsThatWentWell = [[NSMutableArray alloc] init];
        _dateCreated = [[NSDate alloc] init];
        _versionNumber = version;
    }
    // Return the address of the newly initialized object
    return self;
}

-(instancetype)init
{
    return [self initWithVersionNumber:0];
}
@end
