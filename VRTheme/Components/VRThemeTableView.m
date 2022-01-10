//
//  VRThemeTableView.m
//  VRThemeKit
//
//  Created by veer on 28/06/2017.
//  Copyright © 2017 veer. All rights reserved.
//

#import "VRThemeTableView.h"

@implementation VRThemeTableView

#pragma mark - UIView

- (VRThemeTableViewBlock)backgroundColor {
    return (VRThemeTableViewBlock)[super backgroundColor];
}

- (VRThemeTableViewBlock)alpha {
    return (VRThemeTableViewBlock)[super alpha];
}

- (VRThemeTableViewBlock)tintColor {
    return (VRThemeTableViewBlock)[super tintColor];
}

#pragma mark - UITableView

- (VRThemeTableViewBlock)separatorColor {
    return (VRThemeTableViewBlock)[super tx_sakuraColorBlockWithName:NSStringFromSelector(_cmd)];
}

@end

VRThemeCategoryImplementation(UITableView, VRThemeTableView)

