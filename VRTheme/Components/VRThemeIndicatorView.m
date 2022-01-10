//
//  VRThemeIndicatorView.m
//  VRThemeKit
//
//  Created by veer on 29/06/2017.
//  Copyright © 2017 veer. All rights reserved.
//

#import "VRThemeIndicatorView.h"

@implementation VRThemeIndicatorView

- (VRThemeIndicatorViewBlock)color {
    return (VRThemeIndicatorViewBlock)[super tx_sakuraColorBlockWithName:NSStringFromSelector(_cmd)];
}


- (VRThemeIndicatorViewBlock)activityIndicatorViewStyle {
    return (VRThemeIndicatorViewBlock)[super tx_sakuraIndicatorViewStyleBlockWithName:NSStringFromSelector(_cmd)];
}

@end

VRThemeCategoryImplementation(UIActivityIndicatorView, VRThemeIndicatorView)
