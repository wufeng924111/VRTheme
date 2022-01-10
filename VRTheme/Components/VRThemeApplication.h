//
//  VRThemeApplication.h
//  VRThemeKit
//
//  Created by veer on 27/06/2017.
//  Copyright © 2017 veer. All rights reserved.
//

#import "VRTheme.h"
@class VRThemeApplication;

VRTheme2DBoolBlockDeclare(VRThemeApplication);

@interface VRThemeApplication : VRTheme

- (VRThemeApplication2DBoolBlock)statusBarStyle;

@end

VRThemeCategoryDeclare(UIApplication, VRThemeApplication)

