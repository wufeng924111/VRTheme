//
//  VRThemeBar.m
//  VRThemeKit
//
//  Created by veer on 27/06/2017.
//  Copyright © 2017 veer. All rights reserved.
//

#import "VRThemeBar.h"

@implementation VRThemeBar

#pragma mark - UIView

- (VRThemeBarBlock)backgroundColor {
    return (VRThemeBarBlock)[super tx_sakuraColorBlockWithName:NSStringFromSelector(_cmd)];
}

#pragma mark - UITabBar

- (VRThemeBarBlock)unselectedItemTintColor {
    return (VRThemeBarBlock)[super tx_sakuraColorBlockWithName:NSStringFromSelector(_cmd)];
}

#pragma mark - UIToolBar

- (VRThemeBarBlock)barStyle {
    return (VRThemeBarBlock)[super tx_sakuraBarStyleBlockWithName:NSStringFromSelector(_cmd)];
}

- (VRThemeBarBlock)backgroundImage {
    return (VRThemeBarBlock)[super tx_sakuraImageBlockWithName:NSStringFromSelector(_cmd)];
}

- (VRThemeBarBlock)tintColor {
    return (VRThemeBarBlock)[super tx_sakuraColorBlockWithName:NSStringFromSelector(_cmd)];
}

- (VRThemeBarBlock)barTintColor {
    return (VRThemeBarBlock)[super tx_sakuraColorBlockWithName:NSStringFromSelector(_cmd)];
}

#pragma mark - UISearchBar

- (VRThemeBarBlock)keyboardAppearance {
    return (VRThemeBarBlock)[super tx_sakuraKeyboardAppearanceBlockWithName:NSStringFromSelector(_cmd)];
}

@end

VRThemeCategoryImplementation(UITabBar, VRThemeBar)
VRThemeCategoryImplementation(UIToolbar, VRThemeBar)
VRThemeCategoryImplementation(UISearchBar, VRThemeBar)
