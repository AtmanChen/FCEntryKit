//
//  ButtonContent.h
//  FCEntryKit
//
//  Created by 突突兔 on 2019/4/25.
//  Copyright © 2019 突突兔. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


typedef void(^Action)(void);

@class LabelContent;
@interface ButtonContent : NSObject

@property (nonatomic, strong) LabelContent *label;
@property (nonatomic, strong) UIColor *backgroundColor;
@property (nonatomic, strong) UIColor *hightLightedColor;
@property (nonatomic, assign) CGFloat contentEdgeInset;
@property (nonatomic, copy) Action action;

- (instancetype)initWithLabel:(LabelContent *)label
              backgroundColor:(UIColor *)backgroundColor
            hightLightedColor:(UIColor *)highLightedColor
             contentEdgeInset:(CGFloat)contentEdgeInset
                       action:(Action __nullable)action;

@end
