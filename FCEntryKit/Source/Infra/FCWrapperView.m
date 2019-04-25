//
//  FCWrapperView.m
//  FCEntryKit
//
//  Created by 突突兔 on 2019/4/25.
//  Copyright © 2019 突突兔. All rights reserved.
//

#import "FCWrapperView.h"

@implementation FCWrapperView


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.isAbleToReceiveTouches = NO;
    }
    return self;
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    if (_isAbleToReceiveTouches) {
        return [super hitTest:point withEvent:event];
    }
    UIView *v = [super hitTest:point withEvent:event];
    if (v && v != self) {
        return v;
    }
    return nil;
}

@end
