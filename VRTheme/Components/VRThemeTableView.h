//
//  VRThemeTableView.h
//  VRThemeKit
//
//  Created by veer on 28/06/2017.
//  Copyright © 2017 veer. All rights reserved.
//

#import "VRThemeView.h"

VRThemeBlockDeclare(VRThemeTableView)

@interface VRThemeTableView : VRThemeView

// UIView
- (VRThemeTableViewBlock)backgroundColor;
- (VRThemeTableViewBlock)alpha;
- (VRThemeTableViewBlock)tintColor;

// UITableView
- (VRThemeTableViewBlock)separatorColor;

@end

VRThemeCategoryDeclare(UITableView, VRThemeTableView)
