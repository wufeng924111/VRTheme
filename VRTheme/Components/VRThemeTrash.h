//
//  VRThemeTrash.h
//  VRThemeKit
//
//  Created by veer on 28/06/2017.
//  Copyright © 2017 veer. All rights reserved.
//  针对不支持的 Sakura 类型进行响应，如：UIAppearance 等类。

#import "VRTheme.h"

typedef void(^VRThemeTrashBlock)(id);

@interface VRThemeTrash : VRTheme
- (VRThemeTrashBlock)barTintColor;
- (VRThemeTrashBlock)tintColor;
- (VRThemeTrashBlock)titleTextAttributes;
@end
