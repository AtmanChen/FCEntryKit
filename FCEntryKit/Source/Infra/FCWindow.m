//
//  FCWindow.m
//  FCEntryKit
//
//  Created by 突突兔 on 2019/4/25.
//  Copyright © 2019 突突兔. All rights reserved.
//

#import "FCWindow.h"

@implementation FCWindow


- (instancetype)initWithRootVC:(UIViewController *)rootVc
{
    self = [super initWithFrame:[UIScreen mainScreen].bounds];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.rootViewController = rootVc;
        self.isAbleToReceiveTouches = NO;
    }
    return self;
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event  {
    if (self.isAbleToReceiveTouches) {
        return [super hitTest:point withEvent:event];
    }
    
    UIView *view = [super hitTest:point withEvent:event];
    if (view != nil && view != self) {
        return view;
    }
    return nil;
}




@end
