//
//  LabelStyle.m
//  FCEntryKit
//
//  Created by 突突兔 on 2019/4/25.
//  Copyright © 2019 突突兔. All rights reserved.
//

#import "LabelStyle.h"

@implementation LabelStyle


- (instancetype)initWithFont:(UIFont *)font
                       color:(UIColor *)color
                   alignment:(NSTextAlignment)alignment
               numberOfLines:(NSUInteger)numberOflines
{
    self = [super init];
    if (self) {
        self.font = font;
        self.color = color;
        self.alignment = alignment;
        self.numberOfLines = numberOflines;
    }
    return self;
}

@end
