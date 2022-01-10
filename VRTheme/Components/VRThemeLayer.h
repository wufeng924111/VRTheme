//
//  VRThemeLayer.h
//  SakuraDemo_OC
//
//  Created by veer on 21/08/2017.
//  Copyright © 2017 veer. All rights reserved.
//

#import "VRTheme.h"

VRThemeBlockDeclare(VRThemeLayer)

@interface VRThemeLayer : VRTheme

- (VRThemeLayerBlock)backgroundColor;
- (VRThemeLayerBlock)borderColor;
- (VRThemeLayerBlock)shadowColor;
- (VRThemeLayerBlock)borderWidth;

@end

VRThemeCategoryDeclare(CALayer, VRThemeLayer)
