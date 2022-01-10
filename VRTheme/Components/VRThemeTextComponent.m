//
//  VRThemeTextComponent.m
//  VRThemeKit
//
//  Created by veer on 28/06/2017.
//  Copyright © 2017 veer. All rights reserved.
//

#import "VRThemeTextComponent.h"

@implementation VRThemeTextComponent

#pragma mark - UIView

- (VRThemeTextComponentBlock)backgroundColor {
    return (VRThemeTextComponentBlock)[super backgroundColor];
}

- (VRThemeTextComponentBlock)alpha {
    return (VRThemeTextComponentBlock)[super alpha];
}

- (VRThemeTextComponentBlock)tintColor {
    return (VRThemeTextComponentBlock)[super tintColor];
}

#pragma mark - UITextField + UITextView

- (VRThemeTextComponentBlock)font {
    return (VRThemeTextComponentBlock)[super tx_sakuraFontBlockWithName:NSStringFromSelector(_cmd)];
}

- (VRThemeTextComponentBlock)keyboardAppearance {
    return (VRThemeTextComponentBlock)[super tx_sakuraKeyboardAppearanceBlockWithName:NSStringFromSelector(_cmd)];
}

- (VRThemeTextComponentBlock)textColor {
    return (VRThemeTextComponentBlock)[super tx_sakuraColorBlockWithName:NSStringFromSelector(_cmd)];
}

@end

VRThemeCategoryImplementation(UITextField, VRThemeTextComponent)
VRThemeCategoryImplementation(UITextView, VRThemeTextComponent)
