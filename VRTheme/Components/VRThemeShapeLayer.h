//
//  VRThemeShapeLayer.h
//  SakuraDemo_OC
//
//  Created by veer on 21/08/2017.
//  Copyright © 2017 veer. All rights reserved.
//

#import "VRThemeLayer.h"

VRThemeBlockDeclare(VRThemeShapeLayer)

@interface VRThemeShapeLayer : VRThemeLayer

#pragma mark - Override
- (VRThemeShapeLayerBlock)backgroundColor;
- (VRThemeShapeLayerBlock)borderColor;
- (VRThemeShapeLayerBlock)shadowColor;
- (VRThemeShapeLayerBlock)borderWidth;

#pragma mark - Owner
- (VRThemeShapeLayerBlock)fillColor;
- (VRThemeShapeLayerBlock)strokeColor;
- (VRThemeShapeLayerBlock)lineWidth;

@end

VRThemeCategoryDeclare(CAShapeLayer, VRThemeShapeLayer)
