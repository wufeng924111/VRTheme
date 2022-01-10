//
//  VRThemeButton.m
//  VRThemeKit
//
//  Created by veer on 26/06/2017.
//  Copyright © 2017 veer. All rights reserved.
//

#import "VRThemeButton.h"

@implementation VRThemeButton

#pragma mark - UIView

- (VRThemeButtonBlock)backgroundColor {
    return (VRThemeButtonBlock)[super backgroundColor];
}

- (VRThemeButtonBlock)alpha {
    return (VRThemeButtonBlock)[super alpha];
}

- (VRThemeButtonBlock)tintColor {
    return (VRThemeButtonBlock)[super tintColor];
}

#pragma mark - UIButton

- (VRThemeButton2DStateBlock)titleColor {
    return (VRThemeButton2DStateBlock)[super tx_sakuraTitleColorForStateBlockWithName:NSStringFromSelector(_cmd)];
}

- (VRThemeButton2DStateBlock)image {
    return (VRThemeButton2DStateBlock)[super tx_sakuraImageForStateBlockWithName:NSStringFromSelector(_cmd)];
}

- (VRThemeButton2DStateBlock)backgroundImage {
    return (VRThemeButton2DStateBlock)[super tx_sakuraImageForStateBlockWithName:NSStringFromSelector(_cmd)];
}

@end

VRThemeCategoryImplementation(UIButton, VRThemeButton)
