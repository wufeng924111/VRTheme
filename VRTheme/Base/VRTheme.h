//
//  VRTheme.h
//  VRThemeKit
//
//  Created by veer on 23/06/2017.
//  Copyright © 2017 veer. All rights reserved.
//
/** Category declare */
#define VRThemeCategoryDeclare(ClassName, PropertyClassName)\
@interface ClassName (TX)\
@property (readonly, strong, nonatomic) PropertyClassName *sakura;\
@end

#define VRThemeCategoryImplementation(ClassName, PropertyClassName)\
extern void *kVRThemeKey;\
@implementation ClassName(TX)\
@dynamic sakura;\
- (PropertyClassName *)sakura {\
    PropertyClassName *obj = objc_getAssociatedObject(self, kVRThemeKey);\
    if (!obj) {\
        obj = [PropertyClassName sakuraWithOwner:self];\
        objc_setAssociatedObject(self, kVRThemeKey, obj, OBJC_ASSOCIATION_RETAIN_NONATOMIC);\
    }\
    return obj;\
}\
@end

/** Sakura Block declare */
#define VRThemeBlockDeclare(Class)\
@class Class;\
typedef Class *(^Class##Block)(NSString *);

#define VRTheme2DStateBlockDeclare(Class)\
typedef Class *(^Class##2DStateBlock)(NSString *, UIControlState);

#define VRTheme2DBoolBlockDeclare(Class)\
typedef Class *(^Class##2DBoolBlock)(NSString *, BOOL);

#define VRTheme2DUIntBlockDeclare(Class)\
typedef Class *(^Class##2DUIntBlock)(NSString *, NSUInteger);

#define VRThemeBlockCustomDeclare(Class)\
typedef Class *(^Class##CustomBlock)(NSString *propertyName, NSString *keyPath);


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <objc/runtime.h>

VRThemeBlockDeclare(VRTheme)
VRTheme2DUIntBlockDeclare(VRTheme)
VRTheme2DBoolBlockDeclare(VRTheme)

UIKIT_EXTERN NSString *const VRThemeSkinChangeNotification;

@interface VRTheme : NSObject

/** Just get all 1D skin objs which under sakura control. */
@property (strong, nonatomic, readonly) NSDictionary *skins1D;

/** Just get all 2D skin objs which under sakura control. */
@property (strong, nonatomic, readonly) NSDictionary *skins2D;

/** Get ower of current sakura. */
@property (weak, nonatomic, readonly) id owner;

+ (instancetype)sakuraWithOwner:(id)owner;

- (instancetype)initWithOwner:(id)owner;

/** Set rendering mode of UIImage.(UIImageRenderingModeAlwaysOriginal default.) */
- (void)setImageRenderingMode:(UIImageRenderingMode)renderingMode;

@end

@interface VRTheme(TXBlocker)

#pragma mark - 1D Block

/** Change and Cache skin to sakura. */
- (VRThemeBlock)tx_sakuraFloatBlockWithName:(NSString *)name;

- (VRThemeBlock)tx_sakuraColorBlockWithName:(NSString *)name;

- (VRThemeBlock)tx_sakuraCGColorBlockWithName:(NSString *)name;

- (VRThemeBlock)tx_sakuraTitleBlockWithName:(NSString *)name;

- (VRThemeBlock)tx_sakuraFontBlockWithName:(NSString *)name;

- (VRThemeBlock)tx_sakuraKeyboardAppearanceBlockWithName:(NSString *)name;

- (VRThemeBlock)tx_sakuraTitleTextAttributesBlockWithName:(NSString *)name;

- (VRThemeBlock)tx_sakuraBoolBlockWithName:(NSString *)name;

- (VRThemeBlock)tx_sakuraImageBlockWithName:(NSString *)name;

- (VRThemeBlock)tx_sakuraIndicatorViewStyleBlockWithName:(NSString *)name;

- (VRThemeBlock)tx_sakuraBarStyleBlockWithName:(NSString *)name;

#pragma mark - 2D Block

- (VRTheme2DUIntBlock)tx_sakuraTitleColorForStateBlockWithName:(NSString *)name;

- (VRTheme2DUIntBlock)tx_sakuraImageForStateBlockWithName:(NSString *)name;

- (VRTheme2DUIntBlock)tx_sakuraTitleTextAttributesForStateBlockWithName:(NSString *)name;

- (VRTheme2DBoolBlock)tx_sakuraApplicationForStyleBlockWithName:(NSString *)name;

@end

VRThemeCategoryDeclare(NSObject, VRTheme)

