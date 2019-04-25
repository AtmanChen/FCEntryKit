//
//  ImageContent.m
//  FCEntryKit
//
//  Created by 突突兔 on 2019/4/25.
//  Copyright © 2019 突突兔. All rights reserved.
//

#import "ImageContent.h"

@implementation ImageContent

- (instancetype)initWithImages:(NSArray<UIImage *> *)images
                          size:(CGSize)size
                   contentMode:(UIViewContentMode)contentMode
                    makesRound:(BOOL)makesRound
{
    self = [super init];
    if (self) {
        self.images = images;
        self.size = size;
        self.contentMode = contentMode;
        self.makesRound = makesRound;
    }
    return self;
}

@end
