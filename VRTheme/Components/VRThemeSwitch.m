//
//  VRThemeSwitch.m
//  VRThemeKit
//
//  Created by veer on 29/06/2017.
//  Copyright © 2017 veer. All rights reserved.
//

#import "VRThemeSwitch.h"

@implementation VRThemeSwitch

#pragma mark - UIView

- (VRThemeSwitchBlock)backgroundColor {
    return (VRThemeSwitchBlock)[super backgroundColor];
}

- (VRThemeSwitchBlock)alpha {
    return (VRThemeSwitchBlock)[super alpha];
}

- (VRThemeSwitchBlock)tintColor {
    return (VRThemeSwitchBlock)[super tintColor];
}

#pragma mark - UISwitch

- (VRThemeSwitchBlock)onTintColor {
    return (VRThemeSwitchBlock)[super tx_sakuraColorBlockWithName:NSStringFromSelector(_cmd)];
}

- (VRThemeSwitchBlock)thumbTintColor {
    return (VRThemeSwitchBlock)[super tx_sakuraColorBlockWithName:NSStringFromSelector(_cmd)];
}

@end

VRThemeCategoryImplementation(UISwitch, VRThemeSwitch)
