//
//  VRThemeTrash.m
//  VRThemeKit
//
//  Created by veer on 28/06/2017.
//  Copyright © 2017 veer. All rights reserved.
//

#define VRThemeTrashReturn return [self trashBlock];

#import "VRThemeTrash.h"

@implementation VRThemeTrash

- (VRThemeTrashBlock)trashBlock {
    return ^(id obj) { };
}

- (VRThemeTrashBlock)barTintColor {
    VRThemeTrashReturn
}

- (VRThemeTrashBlock)tintColor {
    VRThemeTrashReturn
}

- (VRThemeTrashBlock)titleTextAttributes {
    VRThemeTrashReturn
}

@end
