//
//  VRThemeBarItem.h
//  VRThemeKit
//
//  Created by veer on 28/06/2017.
//  Copyright © 2017 veer. All rights reserved.
//

#import "VRTheme.h"

VRThemeBlockDeclare(VRThemeBarItem)
VRTheme2DStateBlockDeclare(VRThemeBarItem)

@interface VRThemeBarItem : VRTheme
// UITabBarItem

- (VRThemeBarItem2DStateBlock)titleTextAttributes;
- (VRThemeBarItemBlock)selectedImage;

// UIBarItem
- (VRThemeBarItemBlock)image;
- (VRThemeBarItemBlock)title;

@end

VRThemeCategoryDeclare(UIBarItem, VRThemeBarItem)
