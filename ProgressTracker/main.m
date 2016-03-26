//
//  main.m
//  ProgressTracker
//
//  Created by Gilbert Fu on 1/17/16.
//  Copyright © 2016 Gilbert Fu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "PTCategory.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        NSLog(@"gilbert main");
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
        /*NSMutableArray *categories = [[NSMutableArray alloc] init];
        
        for (int i = 0; i < 10; i++) {
            PTCategory *category = [PTCategory randomCategory];
            [categories addObject:category];
        }
        for (PTCategory *category in categories) {
            NSLog(@"%@", category);
        }
        
        categories = nil;*/
    }
    return 0;
}
