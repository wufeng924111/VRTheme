//
//  VRThemeButton.h
//  VRThemeKit
//
//  Created by veer on 26/06/2017.
//  Copyright © 2017 veer. All rights reserved.
//

#import "VRThemeView.h"
VRThemeBlockDeclare(VRThemeButton)
VRTheme2DStateBlockDeclare(VRThemeButton)

@interface VRThemeButton : VRThemeView
// UIView
- (VRThemeButtonBlock)backgroundColor;
- (VRThemeButtonBlock)alpha;
- (VRThemeButtonBlock)tintColor;

// UIButton
- (VRThemeButton2DStateBlock)titleColor;//setTitleColor:forState:
- (VRThemeButton2DStateBlock)image;//setImage:forState:
- (VRThemeButton2DStateBlock)backgroundImage;//setBackgroundImage:forState:

@end

VRThemeCategoryDeclare(UIButton, VRThemeButton)
