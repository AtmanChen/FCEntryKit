//
//  UILabel+FCLabelStyle.m
//  FCEntryKit
//
//  Created by 突突兔 on 2019/4/25.
//  Copyright © 2019 突突兔. All rights reserved.
//

#import "UILabel+FCLabelStyle.h"
#import "LabelContent.h"
#import "LabelStyle.h"
#import <objc/runtime.h>

static NSString *kContentKey = @"LabelContentKey";
static NSString *kStyleKey = @"LabelStyleKey";

@implementation UILabel (FCLabelStyle)

@dynamic content;
@dynamic style;


- (void)setContent:(LabelContent *)content {
    objc_setAssociatedObject(self, &kContentKey, content, OBJC_ASSOCIATION_RETAIN);
    self.text = content.text;
    self.style = content.style;
}

- (LabelContent *)content {
    return objc_getAssociatedObject(self, &kContentKey);
}

- (void)setStyle:(LabelStyle *)style {
    objc_setAssociatedObject(self, &kStyleKey, style, OBJC_ASSOCIATION_RETAIN);
    self.font = style.font;
    self.textColor = style.color;
    self.textAlignment = style.alignment;
    self.numberOfLines = style.numberOfLines;
}

- (LabelStyle *)style {
    return objc_getAssociatedObject(self, &kStyleKey);
}

@end
