//
//  VRThemeSlider.h
//  VRThemeKit
//
//  Created by veer on 29/06/2017.
//  Copyright © 2017 veer. All rights reserved.
//

#import "VRThemeView.h"

VRThemeBlockDeclare(VRThemeSlider)

@interface VRThemeSlider : VRThemeView

// UIView
- (VRThemeSliderBlock)backgroundColor;
- (VRThemeSliderBlock)alpha;
- (VRThemeSliderBlock)tintColor;

//UISlider
- (VRThemeSliderBlock)thumbTintColor;
- (VRThemeSliderBlock)maximumTrackTintColor;
- (VRThemeSliderBlock)minimumTrackTintColor;

@end

VRThemeCategoryDeclare(UISlider, VRThemeSlider)
