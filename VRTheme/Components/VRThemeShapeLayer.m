//
//  VRThemeShapeLayer.m
//  SakuraDemo_OC
//
//  Created by veer on 21/08/2017.
//  Copyright © 2017 veer. All rights reserved.
//

#import "VRThemeShapeLayer.h"

@implementation VRThemeShapeLayer

#pragma mark - Override

- (VRThemeShapeLayerBlock)backgroundColor {
    return (VRThemeShapeLayerBlock)[super backgroundColor];
}

- (VRThemeShapeLayerBlock)borderColor {
    return (VRThemeShapeLayerBlock)[super borderColor];
}

- (VRThemeShapeLayerBlock)shadowColor {
    return (VRThemeShapeLayerBlock)[super shadowColor];
}

- (VRThemeShapeLayerBlock)borderWidth {
    return (VRThemeShapeLayerBlock)[super borderWidth];
}

#pragma mark - Owner

- (VRThemeShapeLayerBlock)fillColor {
    return (VRThemeShapeLayerBlock)[super tx_sakuraCGColorBlockWithName:NSStringFromSelector(_cmd)];
}

- (VRThemeShapeLayerBlock)strokeColor {
    return (VRThemeShapeLayerBlock)[super tx_sakuraCGColorBlockWithName:NSStringFromSelector(_cmd)];
}

- (VRThemeShapeLayerBlock)lineWidth {
    return (VRThemeShapeLayerBlock)[super tx_sakuraFloatBlockWithName:NSStringFromSelector(_cmd)];
}

@end


VRThemeCategoryImplementation(CAShapeLayer, VRThemeShapeLayer)
