//
//  VRThemeBarItem.m
//  VRThemeKit
//
//  Created by veer on 28/06/2017.
//  Copyright © 2017 veer. All rights reserved.
//

#import "VRThemeBarItem.h"

@implementation VRThemeBarItem

#pragma mark - UITabBar

- (VRThemeBarItem2DStateBlock)titleTextAttributes {
    return (VRThemeBarItem2DStateBlock)[super tx_sakuraTitleTextAttributesForStateBlockWithName:NSStringFromSelector(_cmd)];
}

- (VRThemeBarItemBlock)selectedImage {
    return (VRThemeBarItemBlock)[super tx_sakuraImageBlockWithName:NSStringFromSelector(_cmd)];
}

#pragma mark - UIBarItem


- (VRThemeBarItemBlock)image {
    return (VRThemeBarItemBlock)[super tx_sakuraImageBlockWithName:NSStringFromSelector(_cmd)];
}

- (VRThemeBarItemBlock)title {
    return (VRThemeBarItemBlock)[super tx_sakuraTitleBlockWithName:NSStringFromSelector(_cmd)];
}

@end

VRThemeCategoryImplementation(UIBarItem, VRThemeBarItem)
