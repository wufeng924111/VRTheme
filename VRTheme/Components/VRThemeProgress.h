//
//  VRThemeProgress.h
//  VRThemeKit
//
//  Created by veer on 29/06/2017.
//  Copyright © 2017 veer. All rights reserved.
//

#import "VRThemeView.h"

VRThemeBlockDeclare(VRThemeProgress)

@interface VRThemeProgress : VRThemeView
// UIView
- (VRThemeProgressBlock)backgroundColor;
- (VRThemeProgressBlock)alpha;
- (VRThemeProgressBlock)tintColor;

// UIProgressView
- (VRThemeProgressBlock)trackTintColor;
- (VRThemeProgressBlock)progressTintColor;



@end

VRThemeCategoryDeclare(UIProgressView, VRThemeProgress)

