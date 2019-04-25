//
//  LabelStyle.h
//  FCEntryKit
//
//  Created by 突突兔 on 2019/4/25.
//  Copyright © 2019 突突兔. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LabelStyle : NSObject

@property (nonatomic, strong) UIFont *font;
@property (nonatomic, strong) UIColor *color;
@property (nonatomic, assign) NSTextAlignment alignment;
@property (nonatomic, assign) NSUInteger numberOfLines;

- (instancetype)initWithFont:(UIFont *)font
                       color:(UIColor *)color
                   alignment:(NSTextAlignment)alignment
               numberOfLines:(NSUInteger)numberOflines;

@end

NS_ASSUME_NONNULL_END
