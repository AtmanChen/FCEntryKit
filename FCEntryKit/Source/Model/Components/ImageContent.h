//
//  ImageContent.h
//  FCEntryKit
//
//  Created by 突突兔 on 2019/4/25.
//  Copyright © 2019 突突兔. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ImageContent : NSObject

@property (nonatomic, copy) NSArray<UIImage *> *images;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) UIViewContentMode contentMode;
@property (nonatomic, assign) BOOL makesRound;

// TODO: 添加animation

- (instancetype)initWithImages:(NSArray<UIImage *> *)images
                          size:(CGSize)size
                   contentMode:(UIViewContentMode)contentMode
                    makesRound:(BOOL)makesRound;

@end

NS_ASSUME_NONNULL_END
