//
//  VRThemeProgress.m
//  VRThemeKit
//
//  Created by veer on 29/06/2017.
//  Copyright © 2017 veer. All rights reserved.
//

#import "VRThemeProgress.h"

@implementation VRThemeProgress

#pragma mark - UIView

- (VRThemeProgressBlock)backgroundColor {
    return (VRThemeProgressBlock)[super backgroundColor];
}

- (VRThemeProgressBlock)alpha {
    return (VRThemeProgressBlock)[super alpha];
}

- (VRThemeProgressBlock)tintColor {
    return (VRThemeProgressBlock)[super tintColor];
}

#pragma mark - UIProgressView

- (VRThemeProgressBlock)trackTintColor {
    return (VRThemeProgressBlock)[super tx_sakuraColorBlockWithName:NSStringFromSelector(_cmd)];
}

- (VRThemeProgressBlock)progressTintColor {
    return (VRThemeProgressBlock)[super tx_sakuraColorBlockWithName:NSStringFromSelector(_cmd)];
}

@end

VRThemeCategoryImplementation(UIProgressView, VRThemeProgress)
