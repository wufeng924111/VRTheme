//
//  VRThemeView.m
//  VRThemeKit
//
//  Created by veer on 23/06/2017.
//  Copyright © 2017 veer. All rights reserved.
//

#import "VRThemeView.h"

@interface VRThemeView()

@end

@implementation VRThemeView

- (VRThemeViewBlock)backgroundColor {
    return (VRThemeViewBlock)[super tx_sakuraColorBlockWithName:NSStringFromSelector(_cmd)];
}

- (VRThemeViewBlock)alpha {
    return (VRThemeViewBlock)[super tx_sakuraFloatBlockWithName:NSStringFromSelector(_cmd)];
}

- (VRThemeViewBlock)tintColor {
    return (VRThemeViewBlock)[super tx_sakuraColorBlockWithName:NSStringFromSelector(_cmd)];
}

@end

VRThemeCategoryImplementation(UIView, VRThemeView)
