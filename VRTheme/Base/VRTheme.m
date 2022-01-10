//
//  VRTheme.m
//  VRThemeKit
//
//  Created by veer on 23/06/2017.
//  Copyright © 2017 veer. All rights reserved.
//


#import "VRTheme.h"
#import <objc/message.h>
#import "VRThemeManager.h"
#import "VRThemeTrash.h"

#pragma mark - FORMAT OF SEL

char *const kVRThemeSELHeader = "set";
char *const kVRThemeSELCon = ":";
NSString *const kVRTheme2DStateSELTail = @"forState:";
NSString *const kVRTheme2DAnimatedSELTail = @"animated:";

#pragma mark - Config TYPE OF ARG

NSString *const kVRThemeArgCustomInt = @"com.veer.sakura.arg.custom.int";

#pragma mark - Config TYPE OF ARG

NSString *const kVRThemeArgBool = @"com.veer.sakura.arg.bool";
NSString *const kVRThemeArgFloat = @"com.veer.sakura.arg.float";
NSString *const kVRThemeArgInt = @"com.veer.sakura.arg.int";
NSString *const kVRThemeArgColor = @"com.veer.sakura.arg.color";
NSString *const kVRThemeArgCGColor = @"com.veer.sakura.arg.cgColor";
NSString *const kVRThemeArgFont = @"com.veer.sakura.arg.font";
NSString *const kVRThemeArgImage = @"com.veer.sakura.arg.image";
NSString *const kVRThemeArgTextAttributes = @"com.veer.sakura.arg.textAttributes";
NSString *const kVRThemeArgStatusBarStyle = @"com.veer.sakura.arg.statusBarStyle";
NSString *const kVRThemeArgBarStyle = @"com.veer.sakura.arg.barStyle";
NSString *const kVRThemeArgTitle = @"com.veer.sakura.arg.title";
NSString *const kVRThemeArgKeyboardAppearance = @"com.veer.sakura.arg.keyboardAppearance";
NSString *const kVRThemeActivityIndicatorViewStyle = @"com.veer.sakura.arg.activityIndicatorViewStyle";


#pragma mark - FUNC VAR

NSString *const VRThemeSkinChangeNotification = @"com.veer.sakura.notification.skinChange";
NSTimeInterval const VRThemeSkinChangeDuration = 0.25;

@interface VRTheme ()

@property (assign, nonatomic) UIImageRenderingMode imageRenderingMode;
// single arg
@property (strong, nonatomic) NSDictionary *innerSkins1D;
// double args
@property (strong, nonatomic) NSDictionary *innerSkins2D;

@end

@implementation VRTheme

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:VRThemeSkinChangeNotification object:nil];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Please use +sakuraWithOwner: method instead." userInfo:nil];
}

- (NSDictionary *)innerSkins1D {
    if (_innerSkins1D) return _innerSkins1D;
    return _innerSkins1D = [NSMutableDictionary dictionary];
}

- (NSDictionary *)innerSkins2D {
    if (_innerSkins2D) return _innerSkins2D;
    return _innerSkins2D = [NSMutableDictionary dictionary];
}

- (NSMutableDictionary *)getSkins1D {
    return (NSMutableDictionary *)self.innerSkins1D;
}

- (NSMutableDictionary *)getSkins2D {
    return (NSMutableDictionary *)self.innerSkins2D;
}

- (NSDictionary *)skins1D {
    return [NSDictionary dictionaryWithDictionary:self.innerSkins1D];
}

- (NSDictionary *)skins2D {
    return [NSDictionary dictionaryWithDictionary:self.innerSkins2D];
}

- (instancetype)initWithOwner:(id)owner {
    if (self = [super init]) {
        _owner = owner;
        _imageRenderingMode = UIImageRenderingModeAlwaysOriginal;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateSakuraSkins) name:VRThemeSkinChangeNotification object:nil];
    }
    return self;
}

+ (instancetype)sakuraWithOwner:(id)owner {
    return [[self alloc] initWithOwner:owner];
}

- (void)setImageRenderingMode:(UIImageRenderingMode)renderingMode {
    _imageRenderingMode = renderingMode;
    
}

/** Update skins */
- (void)updateSakuraSkins {
    // 一维参数
    [self updateSakuraWith1DSkins:self.skins1D];
    // 二维参数
    [self updateSakuraWith2DSkins:self.skins2D];
    
}

#pragma mark - Test Refactor

- (id)getObjVectorWithSakuraArgType:(NSString *)argType path:(NSString *)path exist:(BOOL *)flag {
    NSString *selStr = [[VRThemeManager tx_getObjVectorOperationKV] objectForKey:argType];
    if (selStr.length && path.length) {
        *flag = YES;
        SEL sel = NSSelectorFromString(selStr);
        id(*msg)(id, SEL, id) = (id(*)(id, SEL, id))objc_msgSend;
        id vector = msg(VRThemeManager.class, sel, path);
        if ([vector isKindOfClass:[UIImage class]]) {
            vector = [(UIImage *)vector imageWithRenderingMode:_imageRenderingMode];
        }
        return vector;
    }
    *flag = NO;
    return nil;
}

- (NSInteger)getIntVectorWithSakuraArgType:(NSString *)argType path:(NSString *)path exist:(BOOL *)flag {
    
    NSString *selStr = [[VRThemeManager tx_getIntVectorOperationKV] objectForKey:argType];
    if (selStr.length && path.length) {
        *flag = YES;
        SEL sel = NSSelectorFromString(selStr);
        NSInteger(*msg)(id, SEL, id) = (NSInteger(*)(id, SEL, id))objc_msgSend;
        NSInteger vector = msg(VRThemeManager.class, sel, path);
        return vector;
    }
    *flag = NO;
    return 0;
}

- (CGFloat)getFloatVectorWithSakuraArgType:(NSString *)argType path:(NSString *)path exist:(BOOL *)flag {
    
    NSString *selStr = [[VRThemeManager tx_getFloatVectorOperationKV] objectForKey:argType];
    if (selStr.length && path.length) {
        *flag = YES;
        SEL sel = NSSelectorFromString(selStr);
        CGFloat(*msg)(id, SEL, id) = (CGFloat(*)(id, SEL, id))objc_msgSend;
        CGFloat vector = msg(VRThemeManager.class, sel, path);
        return vector;
    }
    *flag = NO;
    return 0;
}

#pragma mark - 1D Update Methods

- (void)updateSakuraWith1DSkins:(NSDictionary *)sakuraSkins1D {

    [sakuraSkins1D enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        
        SEL sel = NSSelectorFromString((NSString *)key);
        if (![obj isKindOfClass:[NSDictionary class]]) return;
        NSDictionary *valueDict = (NSDictionary *)obj;
        NSArray *allKeys = valueDict.allKeys;
        
        NSString *skinKey = allKeys.firstObject;
        NSString *skinValue = valueDict[skinKey];
        
        BOOL flag = false;
        
        id firstObject = [self getObjVectorWithSakuraArgType:skinKey path:skinValue exist:&flag];
        
        if (flag) {
            [self send1DMsgWithSEL:sel objValue:firstObject];
            return;
        }
        
        NSInteger intValue = [self getIntVectorWithSakuraArgType:skinKey path:skinValue exist:&flag];
        if (flag) {
            [self send1DMsgWithSEL:sel intValue:intValue];
            return;
        }
        
        CGFloat floatValue = [self getFloatVectorWithSakuraArgType:skinKey path:skinValue exist:&flag];
        if (flag) {
            [self send1DMsgWithSEL:sel floatValue:floatValue];
            return;
        }
    }];
}

#pragma mark - 2D Update Methods

- (void)updateSakuraWith2DSkins:(NSDictionary *)sakuraSkins2D {

    [sakuraSkins2D enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        
        SEL sel = NSSelectorFromString((NSString *)key);
        if (![obj isKindOfClass:[NSDictionary class]]) return;
        NSDictionary *valueDict = (NSDictionary *)obj;
        
        NSNumber *numValue = valueDict[kVRThemeArgCustomInt];
        NSMutableDictionary *tempValueDict = [NSMutableDictionary dictionaryWithDictionary:valueDict];
        [tempValueDict removeObjectForKey:kVRThemeArgCustomInt];
        
        NSString *skinKey = tempValueDict.allKeys.firstObject;
        NSString *skinValue = tempValueDict[skinKey];
        
        BOOL flag = false;
        id firstObject = [self getObjVectorWithSakuraArgType:skinKey path:skinValue exist:&flag];
        if (flag) {
            [self enumObjectTypeMsg2DSendWithSEL:sel object:firstObject numValue:numValue];
            return;
        }
        
        NSInteger intValue = [self getIntVectorWithSakuraArgType:skinKey path:skinValue exist:&flag];
        if (flag) {
            [self enumValueTypeMsg2DSendWithSEL:sel intValue:intValue numValue:numValue];
            return;
        }
    }];
}

// obj + number
- (void)enumObjectTypeMsg2DSendWithSEL:(SEL)sel
                                object:(NSObject *)object
                              numValue:(NSNumber *)numValue {
    if (object) {//状态
        NSInteger value = [numValue integerValue];
        NSString *selStr = NSStringFromSelector(sel);
        NSString *occurrencesStr = [NSString stringWithFormat:@"%ld",(long)value];
        selStr = [selStr stringByReplacingOccurrencesOfString:occurrencesStr withString:@""];
        SEL realSel = NSSelectorFromString(selStr);
        [self send2DMsgWithSEL:realSel object:object intValue:value];
    }
}

// int + number
- (void)enumValueTypeMsg2DSendWithSEL:(SEL)sel
                             intValue:(NSInteger)intValue
                             numValue:(NSNumber *)numValue {
    NSInteger value = [numValue integerValue];
    NSString *selStr = NSStringFromSelector(sel);
    NSString *occurrencesStr = [NSString stringWithFormat:@"%ld",(long)value];
    selStr = [selStr stringByReplacingOccurrencesOfString:occurrencesStr withString:@""];
    SEL realSel = NSSelectorFromString(selStr);
    [self send2DMsgWithSEL:realSel intValue:intValue intValue:value];
}

#pragma mark - Message Methods


#pragma mark - 1D

- (instancetype)send1DMsgEnumWithName:(NSString *)name
                              keyPath:(NSString *)keyPath
                                  arg:(NSString *)arg
                           valueBlock:(NSInteger (^)(NSString *))valueBlock {
    return [self send1DMsgIntWithName:name keyPath:keyPath arg:arg valueBlock:valueBlock];
}

- (instancetype)send1DMsgObjectWithName:(NSString *)name
                                keyPath:(NSString *)keyPath
                                    arg:(NSString *)arg
                             valueBlock:(id(^)(NSString *))valueBlock {
    // Cache
    SEL sel = [self prepareForSkin1DWithName:name keyPath:keyPath argKey:arg];
    
    // MsgSend
    if (!valueBlock) return [VRThemeTrash sakuraWithOwner:self];
    NSObject *obj = valueBlock(keyPath);
    //    valueBlock = nil;
    [self send1DMsgWithSEL:sel objValue:obj];
    return self;
}

- (instancetype)send1DMsgStructWithName:(NSString *)name
                                keyPath:(NSString *)keyPath
                                    arg:(NSString *)arg
                             valueBlock:(id (^)(NSString *))valueBlock {
    // Cache
    SEL sel = [self prepareForSkin1DWithName:name keyPath:keyPath argKey:arg];
    
    // MsgSend
    if (!valueBlock) return [VRThemeTrash sakuraWithOwner:self];
    id obj = valueBlock(keyPath);
    //    valueBlock = nil;
    [self send1DMsgWithSEL:sel structValue:obj];
    return self;
}

- (instancetype)send1DMsgIntWithName:(NSString *)name
                             keyPath:(NSString *)keyPath
                                 arg:(NSString *)arg
                          valueBlock:(NSInteger (^)(NSString *))valueBlock {
    // Cache
    SEL sel = [self prepareForSkin1DWithName:name keyPath:keyPath argKey:arg];
    
    // MsgSend
    if (!valueBlock) return [VRThemeTrash sakuraWithOwner:self];
    NSInteger value = valueBlock(keyPath);
    //    valueBlock = nil;
    [self send1DMsgWithSEL:sel intValue:value];
    return self;
}

- (instancetype)send1DMsgFloatWithName:(NSString *)name
                               keyPath:(NSString *)keyPath
                                   arg:(NSString *)arg
                            valueBlock:(CGFloat (^)(NSString *))valueBlock {// Cache
    SEL sel = [self prepareForSkin1DWithName:name keyPath:keyPath argKey:arg];
    
    // MsgSend
    if (!valueBlock) return [VRThemeTrash sakuraWithOwner:self];
    CGFloat value = valueBlock(keyPath);
    //    valueBlock = nil;
    [self send1DMsgWithSEL:sel floatValue:value];
    return self;
}

- (SEL)prepareForSkin1DWithName:(NSString *)name
                        keyPath:(NSString *)keyPath
                         argKey:(NSString *)argKey {
    const char *charName = name.UTF8String;
    SEL sel = getSelectorWithPattern(kVRThemeSELHeader, charName, kVRThemeSELCon);
    
    NSMutableDictionary *attrDict = [NSMutableDictionary dictionary];
    [attrDict setObject:keyPath forKey:argKey];
    [[self getSkins1D] setObject:attrDict forKey:NSStringFromSelector(sel)];
    return sel;
}

#pragma mark - 1D MsgSend

// 浮点
- (void)send1DMsgWithSEL:(SEL)sel
              floatValue:(CGFloat)value {
    if ([self.owner respondsToSelector:sel]) {
        void(*msg)(id, SEL, CGFloat) = (void(*)(id, SEL, CGFloat))objc_msgSend;
        msg(self.owner, sel, value);
    }
}

- (BOOL)send1DMsgWithSEL:(SEL)sel
             structValue:(id)obj {
    if (!obj ||
        ![self.owner respondsToSelector:sel]) return NO;
    void(*msg)(id, SEL, id) = (void(*)(id, SEL, id))objc_msgSend;
    if ([obj isKindOfClass:[UIColor class]]) {
        [UIView animateWithDuration:VRThemeSkinChangeDuration animations:^{
            msg(self.owner, sel, obj);
        }];
    }else {
        msg(self.owner, sel, obj);
    }
    return YES;
}

// 对象
- (BOOL)send1DMsgWithSEL:(SEL)sel
                objValue:(id)obj {
    if (!obj ||
        ![self.owner respondsToSelector:sel]) return NO;
    void(*msg)(id, SEL, id) = (void(*)(id, SEL, id))objc_msgSend;
    if ([obj isKindOfClass:[UIColor class]]) {
        [UIView animateWithDuration:VRThemeSkinChangeDuration animations:^{
            msg(self.owner, sel, obj);
        }];
    }else {
        msg(self.owner, sel, obj);
    }
    return YES;
}

// 整型
- (void)send1DMsgWithSEL:(SEL)sel
                intValue:(NSInteger)value {
    if ([self.owner respondsToSelector:sel]) {
        void(*msg)(id, SEL, NSInteger) = (void(*)(id, SEL, NSInteger))objc_msgSend;
        msg(self.owner, sel, value);
    }
}

#pragma mark - 2

- (instancetype)send2DMsgIntAndIntWithName:(NSString *)name
                                   keyPath:(NSString *)keyPath
                                     integ:(NSInteger)integ
                                   selTail:(NSString *)selTail
                                   argType:(NSString *)arg
                                valueBlock:(NSInteger (^)(NSString *))valueBlock {
    
    SEL sel = [self prepareForSkin2DWithName:name keyPath:keyPath integ:integ argType:arg selTail:selTail];
    // MsgSend
    if (!valueBlock) return [VRThemeTrash sakuraWithOwner:self];
    NSInteger value = valueBlock(keyPath);
    //    valueBlock = nil;
    [self send2DMsgWithSEL:sel intValue:value intValue:integ];
    return self;
}

- (instancetype)send2DMsgObjectAndIntWithName:(NSString *)name
                                      keyPath:(NSString *)keyPath
                                        integ:(NSInteger)integ
                                      selTail:(NSString *)selTail
                                      argType:(NSString *)arg
                                   valueBlock:(NSObject *(^)(NSString *))valueBlock {
    
    SEL sel = [self prepareForSkin2DWithName:name keyPath:keyPath integ:integ argType:arg selTail:selTail];
    // MsgSend
    if (!valueBlock) return [VRThemeTrash sakuraWithOwner:self];
    NSObject *obj = valueBlock(keyPath);
    //    valueBlock = nil;
    [self send2DMsgWithSEL:sel object:obj intValue:integ];
    return self;
}

- (SEL)prepareForSkin2DWithName:(NSString *)name
                        keyPath:(NSString *)keyPath
                          integ:(NSInteger)integ
                        argType:(NSString *)argKey
                        selTail:(NSString *)selTail {
    const char *charName = name.UTF8String;
    SEL sel = getSelectorWithPattern(kVRThemeSELHeader, charName, kVRThemeSELCon);
    
    NSString *selStr = [NSStringFromSelector(sel) stringByAppendingString:selTail];
    NSString *selStrAppend = [selStr stringByAppendingString:[NSString stringWithFormat:@"%ld", (long)integ]];
    NSMutableDictionary *attrDict = [NSMutableDictionary dictionary];
    [attrDict setObject:keyPath forKey:argKey];
    [attrDict setObject:@(integ) forKey:kVRThemeArgCustomInt];
    [[self getSkins2D] setObject:attrDict forKey:selStrAppend];
    return NSSelectorFromString(selStr);
}

#pragma mark - 2 MsgSend

- (void)send2DMsgWithSEL:(SEL)sel
                  object:(NSObject *)obj
                intValue:(NSInteger)value {
    if (obj && [self.owner respondsToSelector:sel]) {
        void(*msg)(id, SEL, id, NSInteger) = (void(*)(id, SEL, id, NSInteger))objc_msgSend;
        msg(self.owner, sel, obj, value);
    }
}

- (void)send2DMsgWithSEL:(SEL)sel
                intValue:(NSInteger)value1
                intValue:(NSInteger)value2 {
    if ([self.owner respondsToSelector:sel]) {
        void(*msg)(id, SEL, NSInteger, NSInteger) = (void(*)(id, SEL, NSInteger, NSInteger))objc_msgSend;
        msg(self.owner, sel, value1, value2);
    }
}


@end

@implementation VRTheme(TXBlocker)

#pragma mark - 1D Block

- (VRThemeBlock)tx_sakuraFloatBlockWithName:(NSString *)name {
    return ^VRTheme *(NSString *path){
        return [self send1DMsgFloatWithName:name keyPath:path arg:kVRThemeArgFloat valueBlock:^CGFloat(NSString *keyPath) {
            return [VRThemeManager tx_floatWithPath:keyPath];
        }];
    };
}

- (VRThemeBlock)tx_sakuraColorBlockWithName:(NSString *)name {
    return ^VRTheme *(NSString *path){
        return [self send1DMsgObjectWithName:name keyPath:path arg:kVRThemeArgColor valueBlock:^NSObject *(NSString *keyPath) {
            return [VRThemeManager tx_colorWithPath:keyPath];
        }];
    };
}

- (VRThemeBlock)tx_sakuraCGColorBlockWithName:(NSString *)name {
    return ^VRTheme *(NSString *path){
        return [self send1DMsgStructWithName:name keyPath:path arg:kVRThemeArgCGColor valueBlock:^id (NSString *keyPath) {
            return (id)[VRThemeManager tx_cgColorWithPath:keyPath];
        }];
    };
}

- (VRThemeBlock)tx_sakuraTitleBlockWithName:(NSString *)name {
    return ^VRTheme *(NSString *path){
        return [self send1DMsgObjectWithName:name keyPath:path arg:kVRThemeArgTitle valueBlock:^NSObject *(NSString *kayPath) {
            return [VRThemeManager tx_stringWithPath:kayPath];
        }];
    };
}

- (VRThemeBlock)tx_sakuraFontBlockWithName:(NSString *)name {
    return ^VRTheme *(NSString *path){
        return [self send1DMsgObjectWithName:name keyPath:path arg:kVRThemeArgFont valueBlock:^NSObject *(NSString *keyPath) {
            return [VRThemeManager tx_fontWithPath:keyPath];
        }];
    };
}

- (VRThemeBlock)tx_sakuraKeyboardAppearanceBlockWithName:(NSString *)name {
    return ^VRTheme *(NSString *path){
        return [self send1DMsgEnumWithName:name keyPath:path arg:kVRThemeArgKeyboardAppearance valueBlock:^NSInteger(NSString *keyPath) {
            return [VRThemeManager tx_keyboardAppearanceWithPath:keyPath];
        }];
    };
}

- (VRThemeBlock)tx_sakuraTitleTextAttributesBlockWithName:(NSString *)name {
    return ^VRTheme *(NSString *path){
        return [self send1DMsgObjectWithName:name keyPath:path arg:kVRThemeArgTextAttributes valueBlock:^NSObject *(NSString *keyPath) {
            return [VRThemeManager tx_titleTextAttributesDictionaryWithPath:keyPath];
        }];
    };
}

- (VRThemeBlock)tx_sakuraBoolBlockWithName:(NSString *)name {
    return ^VRTheme *(NSString *path){
        return [self send1DMsgIntWithName:name keyPath:path arg:kVRThemeArgBool valueBlock:^NSInteger(NSString *keyPath) {
            return [VRThemeManager tx_boolWithPath:keyPath];
        }];
    };
}

- (VRThemeBlock)tx_sakuraImageBlockWithName:(NSString *)name {
    return ^VRTheme *(NSString *path){
        return [self send1DMsgObjectWithName:name keyPath:path arg:kVRThemeArgImage valueBlock:^NSObject *(NSString *keyPath) {
            return [VRThemeManager tx_imageWithPath:keyPath];
        }];
    };
}

- (VRThemeBlock)tx_sakuraIndicatorViewStyleBlockWithName:(NSString *)name {
    return ^VRTheme *(NSString *path){
        return [self send1DMsgEnumWithName:name keyPath:path arg:kVRThemeActivityIndicatorViewStyle valueBlock:^NSInteger(NSString *keyPath) {
            return [VRThemeManager tx_activityIndicatorStyleWithPath:keyPath];
        }];
    };
}

- (VRThemeBlock)tx_sakuraBarStyleBlockWithName:(NSString *)name {
    return ^VRTheme *(NSString *path){
        return [self send1DMsgEnumWithName:name keyPath:path arg:kVRThemeArgBarStyle valueBlock:^NSInteger(NSString *keyPath) {
            return [VRThemeManager tx_barStyleWithPath:keyPath];
        }];
    };
}

#pragma mark - 2D Block

- (VRTheme2DUIntBlock)tx_sakuraTitleColorForStateBlockWithName:(NSString *)name {
    return ^VRTheme *(NSString *path, UIControlState state){
        return [self send2DMsgObjectAndIntWithName:name keyPath:path integ:state selTail:kVRTheme2DStateSELTail argType:kVRThemeArgColor valueBlock:^NSObject *(NSString *keyPath) {
            return [VRThemeManager tx_colorWithPath:keyPath];
        }];
    };
}

- (VRTheme2DUIntBlock)tx_sakuraImageForStateBlockWithName:(NSString *)name {
    return ^VRTheme *(NSString *path, UIControlState state){
        return [self send2DMsgObjectAndIntWithName:name keyPath:path integ:state selTail:kVRTheme2DStateSELTail argType:kVRThemeArgImage valueBlock:^NSObject *(NSString *keyPath) {
            return [VRThemeManager tx_imageWithPath:keyPath];
        }];
    };
}

- (VRTheme2DUIntBlock)tx_sakuraTitleTextAttributesForStateBlockWithName:(NSString *)name {
    return ^VRTheme *(NSString *path, UIControlState state){
        return [self send2DMsgObjectAndIntWithName:name keyPath:path integ:state selTail:kVRTheme2DStateSELTail argType:kVRThemeArgTextAttributes valueBlock:^NSObject *(NSString *keyPath) {
            return [VRThemeManager tx_titleTextAttributesDictionaryWithPath:keyPath];
        }];
    };
}

- (VRTheme2DBoolBlock)tx_sakuraApplicationForStyleBlockWithName:(NSString *)name {
    return ^VRTheme *(NSString *path, BOOL animated){
        return [self send2DMsgIntAndIntWithName:name keyPath:path integ:animated selTail:kVRTheme2DAnimatedSELTail argType:kVRThemeArgStatusBarStyle valueBlock:^NSInteger(NSString *keyPath) {
            return [VRThemeManager tx_statusBarStyleWithPath:path];
        }];
    };
}

@end

#pragma mark - NSObject + TX

void const *kVRThemeKey = &kVRThemeKey;

@implementation NSObject(TX)

@dynamic sakura;

- (VRTheme *)sakura {
//    if ([self isKindOfClass:NSClassFromString(@"_UIAppearance")]) {
//#ifdef DEBUG
//        NSLog(@"VRThemeKit do not support for UIAppearance in Objective-C now!");
//#endif
//        return [VRThemeTrash sakuraWithOwner:self];
//    }
    VRTheme *obj = objc_getAssociatedObject(self, kVRThemeKey);
    if (!obj) {
        obj = [VRTheme sakuraWithOwner:self];
        objc_setAssociatedObject(self, kVRThemeKey, obj, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return obj;
}
@end

