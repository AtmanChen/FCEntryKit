//
//  FCPopUpMessage.m
//  FCEntryKit
//
//  Created by 突突兔 on 2019/4/25.
//  Copyright © 2019 突突兔. All rights reserved.
//

#import "FCPopUpMessage.h"

@implementation FCPopUpMessage


- (instancetype)initWithThemeImage:(ThemeImage *)themeImage
                             title:(LabelContent *)title
                               des:(LabelContent *)des
                            button:(ButtonContent *)button
                            action:(FCPopUpMessageAction)action
{
    self = [super init];
    if (self) {
        self.themeImage = themeImage;
        self.title = title;
        self.des = des;
        self.button = button;
        self.action = [action copy];
    }
    return self;
}

@end




@implementation ThemeImage

- (instancetype)initWithPosition:(ThemeImagePosition)position
                          offset:(CGFloat)offset
                           image:(ImageContent *)image
{
    self = [super init];
    if (self) {
        self.postion = position;
        self.offset = offset?:40;
        self.image = image;
    }
    return self;
}

@end
