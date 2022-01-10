//
//  VRThemeLabel.h
//  VRThemeKit
//
//  Created by veer on 23/06/2017.
//  Copyright © 2017 veer. All rights reserved.
//

#import "VRThemeView.h"

VRThemeBlockDeclare(VRThemeLabel)

@interface VRThemeLabel : VRThemeView
// UIView
- (VRThemeLabelBlock)backgroundColor;
- (VRThemeLabelBlock)alpha;
- (VRThemeLabelBlock)tintColor;
// UILabel
- (VRThemeLabelBlock)highlighted;
- (VRThemeLabelBlock)highlightedTextColor;
- (VRThemeLabelBlock)shadowColor;
- (VRThemeLabelBlock)textColor;
- (VRThemeLabelBlock)font;
@end

VRThemeCategoryDeclare(UILabel, VRThemeLabel)
