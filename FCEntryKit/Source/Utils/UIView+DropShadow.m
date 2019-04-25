//
//  UIView+DropShadow.m
//  FCEntryKit
//
//  Created by 突突兔 on 2019/4/25.
//  Copyright © 2019 突突兔. All rights reserved.
//

#import "UIView+DropShadow.h"
#import "CALayer+DropShadow.h"

@implementation UIView (DropShadow)


- (void)applyDropShadowWithOffset:(CGSize)offset
                          opacity:(float)opacity
                           radius:(CGFloat)radius
                            color:(UIColor *)color {
    [self.layer applyDropShadowWithOffset:offset opacity:opacity radius:radius color:color];
}

- (void)removeDropShadow {
    [self.layer removeDropShadow];
}

@end
