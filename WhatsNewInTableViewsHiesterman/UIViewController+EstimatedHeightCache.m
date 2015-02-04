//
//  UIViewController+EstimatedHeightCache.m
//  WhatsNewInTableViewsHiesterman
//
//  Created by Glen Tregoning on 2/4/15.
//  Copyright (c) 2015 Indiegogo. All rights reserved.
//

#import "UIViewController+EstimatedHeightCache.h"
#import <objc/runtime.h>

@implementation UIViewController (EstimatedHeightCache)

#pragma mark - Properties

- (NSMutableDictionary *) estimatedRowHeightCache {
    
    NSMutableDictionary *cache = objc_getAssociatedObject(self, @selector(estimatedRowHeightCache));
    if (cache == nil) {
        cache = [NSMutableDictionary new];
        objc_setAssociatedObject(self, @selector(estimatedRowHeightCache), cache, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return cache;
}

#pragma mark -

#pragma mark - estimated height cache methods
// From http://stackoverflow.com/a/26371697/40444
// put height to cache
- (void) ehc_setEstimatedCellHeightToCache:(NSIndexPath *) indexPath height:(CGFloat) height {
    [self.estimatedRowHeightCache setValue:[[NSNumber alloc] initWithFloat:height] forKey:[NSString stringWithFormat:@"%ld", indexPath.row]];
}

// get height from cache
- (CGFloat) ehc_getEstimatedCellHeightFromCache:(NSIndexPath *) indexPath defaultHeight:(CGFloat) defaultHeight {
    NSNumber *estimatedHeight = [self.estimatedRowHeightCache valueForKey:[NSString stringWithFormat:@"%ld", indexPath.row]];
    if (estimatedHeight != nil) {
        //NSLog(@"cached: %f", [estimatedHeight floatValue]);
        return [estimatedHeight floatValue];
    }
    //NSLog(@"not cached: %f", defaultHeight);
    return defaultHeight;
}

// check if height is on cache
- (BOOL) ehc_isEstimatedRowHeightInCache:(NSIndexPath *) indexPath {
    if ([self ehc_getEstimatedCellHeightFromCache:indexPath defaultHeight:0] > 0) {
        return YES;
    }
    return NO;
}

- (void) ehc_clearAllEstimatedRowCache {
    [self.estimatedRowHeightCache removeAllObjects];
}

@end
