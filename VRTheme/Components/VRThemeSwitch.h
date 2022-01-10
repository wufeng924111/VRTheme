//
//  VRThemeSwitch.h
//  VRThemeKit
//
//  Created by veer on 29/06/2017.
//  Copyright © 2017 veer. All rights reserved.
//

#import "VRThemeView.h"

VRThemeBlockDeclare(VRThemeSwitch)

@interface VRThemeSwitch : VRThemeView
// UIView
- (VRThemeSwitchBlock)backgroundColor;
- (VRThemeSwitchBlock)alpha;
- (VRThemeSwitchBlock)tintColor;

// UISwitch
- (VRThemeSwitchBlock)onTintColor;
- (VRThemeSwitchBlock)thumbTintColor;

@end

VRThemeCategoryDeclare(UISwitch, VRThemeSwitch)
