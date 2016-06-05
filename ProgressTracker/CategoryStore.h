//
//  CategoryStore.h
//  ProgressTracker
//
//  Created by Gilbert Fu on 2/25/16.
//  Copyright © 2016 Gilbert Fu. All rights reserved.
//

#import <Foundation/Foundation.h>
@class PTCategory;

@interface CategoryStore : NSObject

@property (nonatomic) NSMutableArray *categories;

- (NSArray *) allCategories;
- (PTCategory *) createCategory;
- (PTCategory *) createCategoryWithName:(NSString *)name;
-(void)removeCategory:(PTCategory *)category;
- (void)moveCategoryAtIndex:(NSInteger)source
                toIndex:(NSInteger)destination;
@end
