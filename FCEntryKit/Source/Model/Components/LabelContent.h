//
//  LabelContent.h
//  FCEntryKit
//
//  Created by 突突兔 on 2019/4/25.
//  Copyright © 2019 突突兔. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LabelStyle;
NS_ASSUME_NONNULL_BEGIN

@interface LabelContent : NSObject

@property (nonatomic, copy) NSString *text;
@property (nonatomic, strong) LabelStyle *style;

- (instancetype)initWithText:(NSString *)text
                       style:(LabelStyle *)style;

@end

NS_ASSUME_NONNULL_END
