//
//  LabelContent.m
//  FCEntryKit
//
//  Created by 突突兔 on 2019/4/25.
//  Copyright © 2019 突突兔. All rights reserved.
//

#import "LabelContent.h"

@implementation LabelContent

- (instancetype)initWithText:(NSString *)text
                       style:(LabelStyle *)style
{
    self = [super init];
    if (self) {
        self.text = text;
        self.style = style;
    }
    return self;
}

@end
