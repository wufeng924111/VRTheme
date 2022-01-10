//
//  VRThemeBar.h
//  VRThemeKit
//
//  Created by veer on 27/06/2017.
//  Copyright © 2017 veer. All rights reserved.
//

#import "VRTheme.h"

VRThemeBlockDeclare(VRThemeBar)

@interface VRThemeBar : VRTheme
// UIView
- (VRThemeBarBlock)backgroundColor;

// UITabBar
/** Unselected items in this tab bar will be tinted with this color. Setting this value to nil indicates that UITabBar should use its default value instead. */
- (VRThemeBarBlock)unselectedItemTintColor NS_AVAILABLE_IOS(10_0);

// UIToolBar
- (VRThemeBarBlock)barStyle;
- (VRThemeBarBlock)tintColor;
- (VRThemeBarBlock)barTintColor;
- (VRThemeBarBlock)backgroundImage;

// UISearchBar
- (VRThemeBarBlock)keyboardAppearance;
@end

VRThemeCategoryDeclare(UITabBar, VRThemeBar)
VRThemeCategoryDeclare(UIToolbar, VRThemeBar)
VRThemeCategoryDeclare(UISearchBar, VRThemeBar)
