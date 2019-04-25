//
//  CALayer+DropShadow.m
//  FCEntryKit
//
//  Created by 突突兔 on 2019/4/25.
//  Copyright © 2019 突突兔. All rights reserved.
//

#import "CALayer+DropShadow.h"

@implementation CALayer (DropShadow)

- (void)applyDropShadowWithOffset:(CGSize)offset
                          opacity:(float)opacity
                           radius:(CGFloat)radius
                            color:(UIColor *)color {
    self.shadowOffset = offset;
    self.shadowOpacity = opacity;
    self.shadowRadius = radius;
    self.shadowColor = color.CGColor;
    self.shouldRasterize = YES;
    self.rasterizationScale = [UIScreen mainScreen].scale;
}

- (void)removeDropShadow {
    self.shadowOffset = CGSizeZero;
    self.shadowOpacity = 0;
    self.shadowRadius = 0;
    self.shadowColor = [UIColor clearColor].CGColor;
    self.shouldRasterize = NO;
}

@end
