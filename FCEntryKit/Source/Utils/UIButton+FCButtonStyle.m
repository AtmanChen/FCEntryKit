//
//  UIButton+FCButtonStyle.m
//  FCEntryKit
//
//  Created by 突突兔 on 2019/4/25.
//  Copyright © 2019 突突兔. All rights reserved.
//

#import "UIButton+FCButtonStyle.h"
#import "ButtonContent.h"
#import "LabelContent.h"
#import "LabelStyle.h"
#import <objc/runtime.h>

static NSString *kButtonContentKey = @"ButtonContentKey";
@implementation UIButton (FCButtonStyle)

@dynamic buttonContent;


- (void)setButtonContent:(ButtonContent *)buttonContent {
    objc_setAssociatedObject(self, &kButtonContentKey, buttonContent, OBJC_ASSOCIATION_RETAIN);
    [self setTitle:buttonContent.label.text forState:UIControlStateNormal];
    [self setTitleColor:buttonContent.label.style.color forState:UIControlStateNormal];
    self.titleLabel.font = buttonContent.label.style.font;
    self.backgroundColor = buttonContent.backgroundColor;
}

- (ButtonContent *)buttonContent {
    return objc_getAssociatedObject(self, &kButtonContentKey);
}

@end
