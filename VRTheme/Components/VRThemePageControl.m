//
//  VRThemePageControl.m
//  VRThemeKit
//
//  Created by veer on 29/06/2017.
//  Copyright © 2017 veer. All rights reserved.
//

#import "VRThemePageControl.h"

@implementation VRThemePageControl

#pragma mark - UIView

- (VRThemePageControlBlock)backgroundColor {
    return (VRThemePageControlBlock)[super backgroundColor];
}

- (VRThemePageControlBlock)alpha {
    return (VRThemePageControlBlock)[super alpha];
}

- (VRThemePageControlBlock)tintColor {
    return (VRThemePageControlBlock)[super tintColor];
}

#pragma mark - UIPageControl

- (VRThemePageControlBlock)pageIndicatorTintColor {
    return (VRThemePageControlBlock)[super tx_sakuraColorBlockWithName:NSStringFromSelector(_cmd)];
}

- (VRThemePageControlBlock)currentPageIndicatorTintColor {
    return (VRThemePageControlBlock)[super tx_sakuraColorBlockWithName:NSStringFromSelector(_cmd)];
}

@end

VRThemeCategoryImplementation(UIPageControl, VRThemePageControl)
