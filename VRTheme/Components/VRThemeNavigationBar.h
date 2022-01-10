//
//  VRThemeNavigationBar.h
//  VRThemeKit
//
//  Created by veer on 26/06/2017.
//  Copyright © 2017 veer. All rights reserved.
//

#import "VRTheme.h"
VRThemeBlockDeclare(VRThemeNavigationBar)

@interface VRThemeNavigationBar : VRTheme
- (VRThemeNavigationBarBlock)barTintColor;
- (VRThemeNavigationBarBlock)tintColor;
- (VRThemeNavigationBarBlock)titleTextAttributes;
@end

VRThemeCategoryDeclare(UINavigationBar, VRThemeNavigationBar)

