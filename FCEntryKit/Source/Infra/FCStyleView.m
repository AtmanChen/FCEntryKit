//
//  FCStyleView.m
//  FCEntryKit
//
//  Created by 突突兔 on 2019/4/25.
//  Copyright © 2019 突突兔. All rights reserved.
//

#import "FCStyleView.h"
#import "FCAttributes.h"

@interface FCStyleView ()

@property (nonatomic, strong) RoundCorners *roundCorners;
@property (nonatomic, strong) CAShapeLayer *borderLayer;

@end

@implementation FCStyleView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.appliedStyle = NO;
    }
    return self;
}

- (void)applyFrameStyle:(RoundCorners *)roundCorners {
    self.roundCorners = roundCorners;
    
    CGFloat cornerRadius = self.roundCorners.radius;
    UIRectCorner corner = UIRectCornerTopLeft | UIRectCornerTopRight;
    
    CGSize size = CGSizeMake(self.roundCorners.radius, self.roundCorners.radius);
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corner cornerRadii:size];
    if (cornerRadius > 0) {
        CAShapeLayer *mask = [CAShapeLayer layer];
        mask.path = path.CGPath;
        [mask addSublayer:mask];
    }
    
    self.appliedStyle = YES;
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self applyFrameStyle:[RoundCorners TopWithRadius:10]];
}

- (CAShapeLayer *)borderLayer {
    if (!_borderLayer) {
        _borderLayer = [CAShapeLayer layer];
    }
    return _borderLayer;
}

@end
