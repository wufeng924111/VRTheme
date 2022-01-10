//
//  VRThemeView.h
//  VRThemeKit
//
//  Created by veer on 23/06/2017.
//  Copyright © 2017 veer. All rights reserved.
//

#import "VRTheme.h"

VRThemeBlockDeclare(VRThemeView)
//typedef VRThemeView *(^VRThemeViewBlock)(NSString *);


//VRThemeBlockCustomDeclare(VRThemeView);
//// Custom
//- (VRThemeViewCustomBlock)custom;
@interface VRThemeView : VRTheme
- (VRThemeViewBlock)backgroundColor;
- (VRThemeViewBlock)alpha;
- (VRThemeViewBlock)tintColor;
@end

VRThemeCategoryDeclare(UIView, VRThemeView)

