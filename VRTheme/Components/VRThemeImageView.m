//
//  VRThemeImageView.m
//  VRThemeKit
//
//  Created by veer on 26/06/2017.
//  Copyright © 2017 veer. All rights reserved.
//

#import "VRThemeImageView.h"

@implementation VRThemeImageView

#pragma mark - UIView

- (VRThemeImageViewBlock)backgroundColor {
    return (VRThemeImageViewBlock)[super backgroundColor];
}

- (VRThemeImageViewBlock)alpha {
    return (VRThemeImageViewBlock)[super alpha];
}

- (VRThemeImageViewBlock)tintColor {
    return (VRThemeImageViewBlock)[super tintColor];
}

#pragma mark - UIImageView

- (VRThemeImageViewBlock)highlighted {
    return (VRThemeImageViewBlock)[super tx_sakuraBoolBlockWithName:NSStringFromSelector(_cmd)];
}

- (VRThemeImageViewBlock)image {
    return (VRThemeImageViewBlock)[super tx_sakuraImageBlockWithName:NSStringFromSelector(_cmd)];
}
- (VRThemeImageViewBlock)highlightedImage {
    return (VRThemeImageViewBlock)[super tx_sakuraImageBlockWithName:NSStringFromSelector(_cmd)];
}


@end

VRThemeCategoryImplementation(UIImageView, VRThemeImageView)
