//
//  UILabel+FCLabelStyle.h
//  FCEntryKit
//
//  Created by 突突兔 on 2019/4/25.
//  Copyright © 2019 突突兔. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LabelContent, LabelStyle;
NS_ASSUME_NONNULL_BEGIN

@interface UILabel (FCLabelStyle)

@property (nonatomic, strong) LabelContent *content;
@property (nonatomic, strong) LabelStyle *style;

@end

NS_ASSUME_NONNULL_END
