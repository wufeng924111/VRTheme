//
//  VRThemeSlider.m
//  VRThemeKit
//
//  Created by veer on 29/06/2017.
//  Copyright © 2017 veer. All rights reserved.
//

#import "VRThemeSlider.h"

@implementation VRThemeSlider

#pragma mark - UIView

- (VRThemeSliderBlock)backgroundColor {
    return (VRThemeSliderBlock)[super backgroundColor];
}

- (VRThemeSliderBlock)alpha {
    return (VRThemeSliderBlock)[super alpha];
}

- (VRThemeSliderBlock)tintColor {
    return (VRThemeSliderBlock)[super tintColor];
}

#pragma mark - UISlider

- (VRThemeSliderBlock)thumbTintColor {
    return (VRThemeSliderBlock)[super tx_sakuraColorBlockWithName:NSStringFromSelector(_cmd)];
}

- (VRThemeSliderBlock)minimumTrackTintColor {
    return (VRThemeSliderBlock)[super tx_sakuraColorBlockWithName:NSStringFromSelector(_cmd)];
}

- (VRThemeSliderBlock)maximumTrackTintColor {
    return (VRThemeSliderBlock)[super tx_sakuraColorBlockWithName:NSStringFromSelector(_cmd)];
}

@end

VRThemeCategoryImplementation(UISlider, VRThemeSlider)
