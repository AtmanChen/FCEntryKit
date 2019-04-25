//
//  FCAttributes.h
//  FCEntryKit
//
//  Created by 突突兔 on 2019/4/25.
//  Copyright © 2019 突突兔. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, FCWindowLevel) {
    Alerts = 0,
    StatusBar,
    Normal
};

typedef NS_ENUM(NSInteger, FCEntryPosition) {
    Top = 0,
    Bottom,
    Center
};


@class UserInteraction, BackgroundStyle, RoundCorners, Shadow;
NS_ASSUME_NONNULL_BEGIN

@interface FCAttributes : NSObject

@property (nonatomic, copy, nullable) NSString *name;
@property (nonatomic, assign) FCWindowLevel windowLevel;
@property (nonatomic, assign) FCEntryPosition position;
@property (nonatomic, assign) NSTimeInterval displayDuration;
@property (nonatomic, readonly, strong) UserInteraction *screenInteraction;
@property (nonatomic, readonly, strong) UserInteraction *entryInteraction;
@property (nonatomic, strong) BackgroundStyle *entryBackground;
@property (nonatomic, strong) BackgroundStyle *screenBackground;
@property (nonatomic, strong) RoundCorners *roundCorners;
@property (nonatomic, strong) Shadow *shadow;
@end


typedef void(^Action)(void);
typedef NS_ENUM(NSInteger, FCEntryUserInteraction) {
    DismissEntry = 0,
    DelayExit,
    Forward
};

@interface UserInteraction : NSObject

@property (nonatomic, assign) FCEntryUserInteraction defaultAction;
@property (nonatomic, assign) NSTimeInterval delay;
@property (nonatomic, copy) NSArray<Action> *customActions;

- (instancetype)initWithDefaultAction:(FCEntryUserInteraction)defaultAction
                        customActions:(NSArray<Action> *)customActions
                                delay:(NSTimeInterval)delay;

+ (instancetype)Dismiss;
+ (instancetype)DelayExit;
+ (instancetype)Forward;

@end


typedef NS_ENUM(NSInteger, BackgroundStyleType) {
    BackgroundStyleTypeClear = 0,
    BackgroundStyleTypeColor,
    BackgroundStyleTypeBlur,
    BackgroundStyleTypeVisualEffect,
    BackgroundStyleTypeImage
};

@class Gradient;
@interface BackgroundStyle : NSObject

@property (nonatomic, assign) UIBlurEffectStyle visualEffect;
@property (nonatomic, strong) UIColor *color;
@property (nonatomic, strong) Gradient *gradient;
@property (nonatomic, strong) UIImage *image;

+ (instancetype)BlurStyleWith:(UIBlurEffectStyle)style;
+ (instancetype)ColorStyleWith:(UIColor *)color;
+ (instancetype)GradientStyleWith:(Gradient *)gradient;
+ (instancetype)ImageStyleWith:(UIImage *)image;
+ (instancetype)Clear;

@end


@interface Gradient : NSObject

@property (nonatomic, copy) NSArray<UIColor *> *colors;
@property (nonatomic, assign) CGPoint startPoint;
@property (nonatomic, assign) CGPoint endPoint;

- (instancetype)initWithColors:(NSArray<UIColor *> *)colors
                    startPoint:(CGPoint)startPoint
                      endPoint:(CGPoint)endPoint;

@end

@class ShadowValue;
@interface Shadow : NSObject

@property (nonatomic, assign) ShadowValue *value;

+ (instancetype)None;
+ (instancetype)ActiveWith:(ShadowValue *)value;

@end
                        
@interface ShadowValue : NSObject

@property (nonatomic, assign) CGFloat radius;
@property (nonatomic, assign) float opacity;
@property (nonatomic, strong) UIColor *color;
@property (nonatomic, assign) CGSize offset;

- (instancetype)initWithColor:(UIColor *)color
                      opacity:(float)opacity
                       radius:(CGFloat)radius
                       offset:(CGSize)offset;

@end

typedef NS_ENUM(NSInteger, RoundCornersType) {
    RoundCornersTypeNone = 0,
    RoundCornersTypeAll,
    RoundCornersTypeTop,
    RoundCornersTypeBottom
};

@interface RoundCorners : NSObject

@property (nonatomic, assign) CGFloat radius;
@property (nonatomic, readonly, assign) RoundCornersType type;
@property (nonatomic, readonly, assign) UIRectCorner value;

+ (instancetype)None;
+ (instancetype)AllWithRadius:(CGFloat)radius;
+ (instancetype)TopWithRadius:(CGFloat)radius;
+ (instancetype)BottomWithRadius:(CGFloat)radius;

@end

@class AnimationTranslate;
@interface Animation : NSObject

@property (nonatomic, strong) AnimationTranslate *translate;

- (instancetype)initWithTranslate:(AnimationTranslate *)translate;

@end


typedef NS_ENUM(NSInteger, AnchorPosition) {
    AnchorPositionTop = 0,
    AnchorPositionBottom,
    AnchorPositionAutomatic
};

@interface AnimationTranslate : NSObject

@property (nonatomic, assign) NSTimeInterval duration;
@property (nonatomic, assign) NSTimeInterval delay;
@property (nonatomic, assign) AnchorPosition anchorPosition;


- (instancetype)initWithDuration:(NSTimeInterval)duration
                           delay:(NSTimeInterval)delay
                  anchorPosition:(AnchorPosition)anchorPosition;

@end

@interface PopBehavior : NSObject

@property (nonatomic, strong) Animation *animation;

+ (instancetype)AnimationTranslate:(AnimationTranslate *)translate;

@end

NS_ASSUME_NONNULL_END



