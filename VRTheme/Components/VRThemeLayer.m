//
//  VRThemeLayer.m
//  SakuraDemo_OC
//
//  Created by veer on 21/08/2017.
//  Copyright © 2017 veer. All rights reserved.
//

#import "VRThemeLayer.h"

@implementation VRThemeLayer

- (VRThemeLayerBlock)backgroundColor {
    return (VRThemeLayerBlock)[super tx_sakuraCGColorBlockWithName:NSStringFromSelector(_cmd)];
}

- (VRThemeLayerBlock)borderColor {
    return (VRThemeLayerBlock)[super tx_sakuraCGColorBlockWithName:NSStringFromSelector(_cmd)];
}

- (VRThemeLayerBlock)shadowColor {
    return (VRThemeLayerBlock)[super tx_sakuraCGColorBlockWithName:NSStringFromSelector(_cmd)];
}

- (VRThemeLayerBlock)borderWidth {
    return (VRThemeLayerBlock)[super tx_sakuraFloatBlockWithName:NSStringFromSelector(_cmd)];
}

@end

VRThemeCategoryImplementation(CALayer, VRThemeLayer)
