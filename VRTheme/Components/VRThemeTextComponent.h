//
//  VRThemeTextComponent.h
//  VRThemeKit
//
//  Created by veer on 28/06/2017.
//  Copyright © 2017 veer. All rights reserved.
//

#import "VRThemeView.h"

VRThemeBlockDeclare(VRThemeTextComponent)

@interface VRThemeTextComponent : VRThemeView

// UIView
- (VRThemeTextComponentBlock)backgroundColor;
- (VRThemeTextComponentBlock)alpha;
- (VRThemeTextComponentBlock)tintColor;

// UITextField + UITextView
- (VRThemeTextComponentBlock)font;
- (VRThemeTextComponentBlock)keyboardAppearance;
- (VRThemeTextComponentBlock)textColor;

@end

VRThemeCategoryDeclare(UITextField, VRThemeTextComponent)
VRThemeCategoryDeclare(UITextView, VRThemeTextComponent)
