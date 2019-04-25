//
//  FCAttributes.m
//  FCEntryKit
//
//  Created by 突突兔 on 2019/4/25.
//  Copyright © 2019 突突兔. All rights reserved.
//

#import "FCAttributes.h"

@implementation FCAttributes

- (UserInteraction *)entryInteraction {
    return [UserInteraction Dismiss];
}

- (UserInteraction *)screenInteraction {
    return [UserInteraction Forward];
}

- (RoundCorners *)roundCorners {
    return [RoundCorners TopWithRadius:10];
}

- (Shadow *)shadow {
    return [Shadow ActiveWith:[[ShadowValue alloc] initWithColor:[UIColor blackColor] opacity:0.6 radius:0 offset:CGSizeMake(0, 0)]];
}

@end



@implementation UserInteraction

- (instancetype)initWithDefaultAction:(FCEntryUserInteraction)defaultAction
                        customActions:(NSArray<Action> *)customActions
                                delay:(NSTimeInterval)delay
{
    self = [super init];
    if (self) {
        self.defaultAction = defaultAction;
        self.customActions = customActions;
        self.delay = delay;
    }
    return self;
}


+ (instancetype)Dismiss {
    return [[self alloc] initWithDefaultAction:DismissEntry customActions:@[] delay:0];
}

+ (instancetype)DelayExit {
    return [[self alloc] initWithDefaultAction:DelayExit customActions:@[] delay:4];
}

+ (instancetype)Forward {
    return [[self alloc] initWithDefaultAction:Forward customActions:@[] delay:0];
}

@end


@implementation BackgroundStyle

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithColor:(UIColor *)color
{
    self = [super init];
    if (self) {
        self.color = color;
    }
    return self;
}

- (instancetype)initWithImage:(UIImage *)image
{
    self = [super init];
    if (self) {
        self.image = image;
    }
    return self;
}

- (instancetype)initWithGradient:(Gradient *)gradient
{
    self = [super init];
    if (self) {
        self.gradient = gradient;
    }
    return self;
}

- (instancetype)initWithBlurStyle:(UIBlurEffectStyle)style
{
    self = [super init];
    if (self) {
        self.visualEffect = style;
    }
    return self;
}

+ (instancetype)BlurStyleWith:(UIBlurEffectStyle)style {
    return [[BackgroundStyle alloc] initWithBlurStyle:style];
}

+ (instancetype)GradientStyleWith:(Gradient *)gradient {
    return [[BackgroundStyle alloc] initWithGradient:gradient];
}

+ (instancetype)ColorStyleWith:(UIColor *)color {
    return [[BackgroundStyle alloc] initWithColor:color];
}

+ (instancetype)ImageStyleWith:(UIImage *)image {
    return [[BackgroundStyle alloc] initWithImage:image];
}

+ (instancetype)Clear {
    return [[BackgroundStyle alloc] init];
}

@end

@implementation Gradient

- (instancetype)initWithColors:(NSArray<UIColor *> *)colors
                    startPoint:(CGPoint)startPoint
                      endPoint:(CGPoint)endPoint
{
    self = [super init];
    if (self) {
        self.colors = colors;
        self.startPoint = startPoint;
        self.endPoint = endPoint;
    }
    return self;
}

@end


@implementation Shadow

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithShadowValue:(ShadowValue *)value
{
    self = [super init];
    if (self) {
        self.value = value;
    }
    return self;
}

+ (instancetype)None {
    return [[Shadow alloc] init];
}

+ (instancetype)ActiveWith:(ShadowValue *)value {
    return [[Shadow alloc] initWithShadowValue:value];
}

@end


@implementation ShadowValue

- (instancetype)initWithColor:(UIColor *)color
                      opacity:(float)opacity
                       radius:(CGFloat)radius
                       offset:(CGSize)offset
{
    self = [super init];
    if (self) {
        self.color = color;
        self.opacity = opacity;
        self.radius = radius;
        self.offset = offset;
    }
    return self;
}

@end

@interface RoundCorners ()

@property (nonatomic, assign) RoundCornersType type;
@property (nonatomic, assign) UIRectCorner value;

@end

@implementation RoundCorners

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}


- (instancetype)initWithRadius:(CGFloat)radius
{
    self = [super init];
    if (self) {
        self.radius = radius;
    }
    return self;
}

+ (instancetype)None {
    RoundCorners *r = [[RoundCorners alloc] init];;
    r.type = RoundCornersTypeNone;
    return r;
}

+ (instancetype)TopWithRadius:(CGFloat)radius {
    RoundCorners *r = [[RoundCorners alloc] initWithRadius:radius];
    r.type = RoundCornersTypeTop;
    return r;
}

+ (instancetype)BottomWithRadius:(CGFloat)radius {
    RoundCorners *r = [[RoundCorners alloc] initWithRadius:radius];
    r.type = RoundCornersTypeBottom;
    return r;
}

+ (instancetype)AllWithRadius:(CGFloat)radius {
    RoundCorners *r = [[RoundCorners alloc] initWithRadius:radius];
    r.type = RoundCornersTypeAll;
    return r;
}

- (UIRectCorner)value {
    return UIRectCornerTopLeft | UIRectCornerTopRight;
}

@end

@implementation AnimationTranslate

- (instancetype)initWithDuration:(NSTimeInterval)duration
                           delay:(NSTimeInterval)delay
                  anchorPosition:(AnchorPosition)anchorPosition
{
    self = [super init];
    if (self) {
        self.duration = duration;
        self.delay = delay;
        self.anchorPosition = anchorPosition;
    }
    return self;
}

@end

@implementation Animation

- (instancetype)initWithTranslate:(AnimationTranslate *)translate
{
    self = [super init];
    if (self) {
        self.translate = translate;
    }
    return self;
}

@end

@implementation PopBehavior

- (instancetype)initWithTranslate:(AnimationTranslate *)translate
{
    self = [super init];
    if (self) {
        self.animation = [[Animation alloc] initWithTranslate:translate];
    }
    return self;
}


+ (instancetype)AnimationTranslate:(AnimationTranslate *)translate {
    return [[PopBehavior alloc] initWithTranslate:translate];
}

@end


