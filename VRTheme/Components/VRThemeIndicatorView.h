//
//  VRThemeIndicatorView.h
//  VRThemeKit
//
//  Created by veer on 29/06/2017.
//  Copyright © 2017 veer. All rights reserved.
//

#import "VRTheme.h"

VRThemeBlockDeclare(VRThemeIndicatorView)

@interface VRThemeIndicatorView : VRTheme

- (VRThemeIndicatorViewBlock)activityIndicatorViewStyle;
- (VRThemeIndicatorViewBlock)color;

@end

VRThemeCategoryDeclare(UIActivityIndicatorView, VRThemeIndicatorView)
