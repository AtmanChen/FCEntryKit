//
//  FCPopUpMessage.h
//  FCEntryKit
//
//  Created by 突突兔 on 2019/4/25.
//  Copyright © 2019 突突兔. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^FCPopUpMessageAction)(void);

@class LabelContent, ButtonContent, ThemeImage;
@interface FCPopUpMessage : NSObject

@property (nonatomic, strong, nullable) ThemeImage *themeImage;
@property (nonatomic, strong, nonnull) LabelContent *title;
@property (nonatomic, strong, nonnull) LabelContent *des;
@property (nonatomic, strong, nonnull) ButtonContent *button;
@property (nonatomic, copy, nullable) FCPopUpMessageAction action;


- (instancetype)initWithThemeImage:(ThemeImage *)themeImage
                             title:(LabelContent *)title
                               des:(LabelContent *)des
                            button:(ButtonContent *)button
                            action:(FCPopUpMessageAction)action;


@end




typedef NS_ENUM(NSInteger, ThemeImagePosition) {
    TopToTop = 0,
    CenterToTop
};

@class ImageContent;
@interface ThemeImage : NSObject

@property (nonatomic, assign) ThemeImagePosition postion;
@property (nonatomic, assign) CGFloat offset;
@property (nonatomic, strong) ImageContent *image;

- (instancetype)initWithPosition:(ThemeImagePosition)position
                          offset:(CGFloat)offset
                           image:(ImageContent *)image;

@end
