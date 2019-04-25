//
//  FCBackgroundView.m
//  FCEntryKit
//
//  Created by 突突兔 on 2019/4/25.
//  Copyright © 2019 突突兔. All rights reserved.
//

#import "FCBackgroundView.h"
#import "GradientView.h"
#import "FCAttributes.h"

@interface FCBackgroundView ()

@property (nonatomic, strong) UIVisualEffectView *visualEffectView;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) GradientView *gradientView;

@end

@implementation FCBackgroundView

- (instancetype)init
{
    self = [super initWithFrame:[UIScreen mainScreen].bounds];
    if (self) {
        self.imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        self.visualEffectView = [[UIVisualEffectView alloc] initWithEffect:nil];
        self.gradientView = [[GradientView alloc] init];
        
        [self addSubview:self.imageView];
        self.imageView.contentMode = UIViewContentModeScaleToFill;
        
        [self addSubview:self.visualEffectView];
        self.visualEffectView.frame = self.bounds;
        
        [self addSubview:self.gradientView];
        self.gradientView.frame = self.bounds;
        
    }
    return self;
}

- (void)setBackground:(BackgroundStyle *)background {
    _background = background;
    Gradient *gradient;
    UIBlurEffect *backgroundEffect;
    UIColor *backgroundColor = [UIColor clearColor];
    UIImage *backgroundImage;
    
    if (_background.color) {
        backgroundColor = _background.color;
    }
    if (_background.gradient) {
        gradient = _background.gradient;
    }
    if (_background.image) {
        backgroundImage = _background.image;
    }
    if (_background.visualEffect) {
        backgroundEffect = [UIBlurEffect effectWithStyle:_background.visualEffect];
    }
    
    self.gradientView.gradient = gradient;
    self.visualEffectView.effect = backgroundEffect;
    self.layer.backgroundColor = backgroundColor.CGColor;
    self.imageView.image = backgroundImage;
}

@end
