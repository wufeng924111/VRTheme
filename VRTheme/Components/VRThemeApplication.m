//
//  VRThemeApplication.m
//  VRThemeKit
//
//  Created by veer on 27/06/2017.
//  Copyright © 2017 veer. All rights reserved.
//

#import "VRThemeApplication.h"

@implementation VRThemeApplication

- (VRThemeApplication2DBoolBlock)statusBarStyle {
    return (VRThemeApplication2DBoolBlock)[super tx_sakuraApplicationForStyleBlockWithName:NSStringFromSelector(_cmd)];
}

@end

VRThemeCategoryImplementation(UIApplication, VRThemeApplication)
