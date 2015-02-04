//
//  UIViewController+EstimatedHeightCache.h
//  WhatsNewInTableViewsHiesterman
//
//  Created by Glen Tregoning on 2/4/15.
//  Copyright (c) 2015 Indiegogo. All rights reserved.
//

#import <UIKit/UIKit.h>

// Based on post http://stackoverflow.com/a/26371697/40444
@interface UIViewController (EstimatedHeightCache)

// put height to cache
- (void) ehc_setEstimatedCellHeightToCache:(NSIndexPath *) indexPath height:(CGFloat) height;

// get height from cache
- (CGFloat) ehc_getEstimatedCellHeightFromCache:(NSIndexPath *) indexPath defaultHeight:(CGFloat) defaultHeight;

// check if height is on cache
- (BOOL) ehc_isEstimatedRowHeightInCache:(NSIndexPath *) indexPath;

-(void) ehc_clearAllEstimatedRowCache;

@end
