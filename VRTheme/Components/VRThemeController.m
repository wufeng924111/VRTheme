//
//  VRThemeController.m
//  SakuraDemo_OC
//
//  Created by veer on 01/08/2017.
//  Copyright © 2017 veer. All rights reserved.
//

#import "VRThemeController.h"

@implementation VRThemeController

- (VRThemeControllerBlock)title {
    return (VRThemeControllerBlock)[super tx_sakuraTitleBlockWithName:NSStringFromSelector(_cmd)];
}

@end

VRThemeCategoryImplementation(UIViewController, VRThemeController)
