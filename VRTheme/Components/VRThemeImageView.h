//
//  VRThemeImageView.h
//  VRThemeKit
//
//  Created by veer on 26/06/2017.
//  Copyright © 2017 veer. All rights reserved.
//

#import "VRThemeView.h"
VRThemeBlockDeclare(VRThemeImageView)

@interface VRThemeImageView : VRThemeView
//UIView
- (VRThemeImageViewBlock)backgroundColor;
- (VRThemeImageViewBlock)alpha;
- (VRThemeImageViewBlock)tintColor;

// UIImageView
- (VRThemeImageViewBlock)highlighted;
- (VRThemeImageViewBlock)image;
- (VRThemeImageViewBlock)highlightedImage;

@end

VRThemeCategoryDeclare(UIImageView, VRThemeImageView)
