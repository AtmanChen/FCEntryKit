//
//  ButtonContent.m
//  FCEntryKit
//
//  Created by 突突兔 on 2019/4/25.
//  Copyright © 2019 突突兔. All rights reserved.
//

#import "ButtonContent.h"

@implementation ButtonContent


- (instancetype)initWithLabel:(LabelContent *)label
              backgroundColor:(UIColor *)backgroundColor
            hightLightedColor:(UIColor *)highLightedColor
             contentEdgeInset:(CGFloat)contentEdgeInset
                       action:(Action)action
{
    self = [super init];
    if (self) {
        self.label = label;
        self.backgroundColor = backgroundColor;
        self.hightLightedColor = highLightedColor;
        self.contentEdgeInset = contentEdgeInset;
        self.action = action;
    }
    return self;
}

@end
