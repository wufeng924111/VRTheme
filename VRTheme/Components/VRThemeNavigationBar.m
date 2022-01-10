//
//  VRThemeNavigationBar.m
//  VRThemeKit
//
//  Created by veer on 26/06/2017.
//  Copyright © 2017 veer. All rights reserved.
//

#import "VRThemeNavigationBar.h"

@implementation VRThemeNavigationBar

- (VRThemeNavigationBarBlock)barTintColor {
    return (VRThemeNavigationBarBlock)[super tx_sakuraColorBlockWithName:NSStringFromSelector(_cmd)];
}

- (VRThemeNavigationBarBlock)tintColor {
    return (VRThemeNavigationBarBlock)[super tx_sakuraColorBlockWithName:NSStringFromSelector(_cmd)];
}

- (VRThemeNavigationBarBlock)titleTextAttributes {
    return (VRThemeNavigationBarBlock)[super tx_sakuraTitleTextAttributesBlockWithName:NSStringFromSelector(_cmd)];
}

@end

VRThemeCategoryImplementation(UINavigationBar, VRThemeNavigationBar)
