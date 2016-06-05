//
//  PageViewController.m
//  ProgressTracker
//
//  Created by Gilbert Fu on 3/18/16.
//  Copyright © 2016 Gilbert Fu. All rights reserved.
//

#import "ViewController.h"
#import "ItemVersion.h"
#import "ItemViewsDetailsViewController.h"

@implementation ViewController

-(void) viewDidLoad
{
    [super viewDidLoad];
    
    _pageTitles = @[@"Over 200 Tips and Tricks",
                    @"Discover Hidden Features",
                    @"Bookmark Favorite Tip",
                    @"Free Regular Update"];
    // Create page view controller
    self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
    self.pageViewController.dataSource = self;
    PageContentViewController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    // Change the size of page view controller
    self.pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 30);
    
    [self addChildViewController:_pageViewController];
    [self.view addSubview:_pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
    self.navigationController.navigationItem.title= self.progressItems.name;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = ((PageContentViewController*) viewController).pageIndex;
    
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = ((PageContentViewController*) viewController).pageIndex;
    
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.progressItems.allItemVersions count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}

- (PageContentViewController *)viewControllerAtIndex:(NSUInteger)index
{
    if (([self.progressItems.allItemVersions count] == 0) || (index >= [self.progressItems.allItemVersions count])) {
        return nil;
    }
    
    // Create a new view controller and pass suitable data.
    PageContentViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageContentViewController"];
    pageContentViewController.titleText = self.progressItems.name;//self.pageTitles[index];
    ItemVersion *iv = self.progressItems.allItemVersions[index];
    pageContentViewController.descriptionText = iv.itemDescription;
    pageContentViewController.itemVersion = iv;
    pageContentViewController.pageIndex = index;
    
    return pageContentViewController;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id) sender {
    UIViewController *destVC = segue.destinationViewController;
    if ([segue.identifier isEqualToString:@"createNewItemVersion"]) {
        ItemVersion *latestItemVersion = self.progressItems.allItemVersions[[self.progressItems.allItemVersions count]-1];
        UINavigationController *navigationController = (UINavigationController *) destVC;
        ItemViewsDetailsViewController *vc = [navigationController viewControllers][0];
        NSMutableArray *wentWell = latestItemVersion.thingsThatWentWell;
        vc.wentWellString1 = [wentWell count] >= 1 ? wentWell[0] : @"";
        vc.wentWellString2 = [wentWell count] >= 2 ? wentWell[1] : @"";
        vc.wentWellString3 = [wentWell count] >= 3 ? wentWell[2] : @"";
        NSMutableArray *improveOn = latestItemVersion.thingsToWorkOn;
        vc.toImproveString1 = [improveOn count] >= 1 ? improveOn[0] : @"";
        vc.toImproveString2 = [improveOn count] >= 2 ? improveOn[1] : @"";
        vc.toImproveString3 = [improveOn count] >= 3 ? improveOn[2] : @"";
        vc.descriptionString = latestItemVersion.itemDescription;
        vc.numOfItemVersions = [self.progressItems.allItemVersions count];
        vc.picture = latestItemVersion.picture;
        vc.delegate = self;
        //pvc.Title setText: category.name];
    }
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return [self.progressItems.allItemVersions count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}

#pragma mark - ItemViewsDetailsViewControllerDelegate

- (void)itemViewsDetailsViewControllerDidCancel:(ItemViewsDetailsViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)itemViewsDetailsViewControllerDidSave:(ItemViewsDetailsViewController *)controller
                                       didAddItem:(ItemVersion *)item
{
    [[self.progressItems allItemVersions] addObject:item];
    [self dismissViewControllerAnimated:YES completion:nil];
    [self viewDidLoad];
}

@end
