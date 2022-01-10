//
//  VRThemeController.h
//  SakuraDemo_OC
//
//  Created by veer on 01/08/2017.
//  Copyright © 2017 veer. All rights reserved.
//

#import "VRTheme.h"

VRThemeBlockDeclare(VRThemeController)

@interface VRThemeController : VRTheme

- (VRThemeControllerBlock)title;

@end

VRThemeCategoryDeclare(UIViewController, VRThemeController)
