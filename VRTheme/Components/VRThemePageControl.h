//
//  VRThemePageControl.h
//  VRThemeKit
//
//  Created by veer on 29/06/2017.
//  Copyright © 2017 veer. All rights reserved.
//

#import "VRThemeView.h"

VRThemeBlockDeclare(VRThemePageControl)

@interface VRThemePageControl : VRThemeView
// UIView
- (VRThemePageControlBlock)backgroundColor;
- (VRThemePageControlBlock)alpha;
- (VRThemePageControlBlock)tintColor;

// UIPageControl
- (VRThemePageControlBlock)pageIndicatorTintColor;
- (VRThemePageControlBlock)currentPageIndicatorTintColor;


@end

VRThemeCategoryDeclare(UIPageControl, VRThemePageControl)
