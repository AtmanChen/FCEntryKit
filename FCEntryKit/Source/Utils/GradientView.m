//
//  GradientView.m
//  FCEntryKit
//
//  Created by 突突兔 on 2019/4/25.
//  Copyright © 2019 突突兔. All rights reserved.
//

#import "GradientView.h"
#import "FCAttributes.h"

@interface GradientView ()

@property (nonatomic, strong) CAGradientLayer *gradientLayer;


@end

@implementation GradientView

- (instancetype)init
{
    self = [super initWithFrame:CGRectZero];
    if (self) {
        self.gradientLayer = [CAGradientLayer layer];
        [self.layer addSublayer:self.gradientLayer];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.gradientLayer.frame = self.bounds;
}

- (void)setGradient:(Gradient *)gradient {
    _gradient = gradient;
    NSUInteger colorsCount = _gradient.colors.count;
    NSMutableArray *cgColors = [NSMutableArray arrayWithCapacity:colorsCount];
    for (int i = 0; i < colorsCount; i++) {
        CGColorRef cg = _gradient.colors[i].CGColor;
        [cgColors addObject:(__bridge id)(cg)];
    }
    self.gradientLayer.colors = [NSArray arrayWithArray:cgColors];
    self.gradientLayer.startPoint = _gradient.startPoint;
    self.gradientLayer.endPoint = _gradient.endPoint;
}

@end
