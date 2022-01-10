//
//  VRThemeLabel.m
//  VRThemeKit
//
//  Created by veer on 23/06/2017.
//  Copyright © 2017 veer. All rights reserved.
//

#import "VRThemeLabel.h"

@interface VRThemeLabel()

@end

@implementation VRThemeLabel

#pragma mark - UIView

- (VRThemeLabelBlock)backgroundColor {
    return (VRThemeLabelBlock)[super backgroundColor];
}

- (VRThemeLabelBlock)alpha {
    return (VRThemeLabelBlock)[super alpha];
}

- (VRThemeLabelBlock)tintColor {
    return (VRThemeLabelBlock)[super tintColor];
}

#pragma mark - UILabel

- (VRThemeLabelBlock)highlighted {
    return (VRThemeLabelBlock)[super tx_sakuraBoolBlockWithName:NSStringFromSelector(_cmd)];
}

- (VRThemeLabelBlock)highlightedTextColor {
    return (VRThemeLabelBlock)[super tx_sakuraColorBlockWithName:NSStringFromSelector(_cmd)];
}

- (VRThemeLabelBlock)shadowColor {
    return (VRThemeLabelBlock)[super tx_sakuraColorBlockWithName:NSStringFromSelector(_cmd)];
}

- (VRThemeLabelBlock)textColor {
    return (VRThemeLabelBlock)[super tx_sakuraColorBlockWithName:NSStringFromSelector(_cmd)];
}

- (VRThemeLabelBlock)font {
    return (VRThemeLabelBlock)[super tx_sakuraFontBlockWithName:NSStringFromSelector(_cmd)];
}

@end

VRThemeCategoryImplementation(UILabel, VRThemeLabel)
