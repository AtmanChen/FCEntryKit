//
//  FCBackgroundView.h
//  FCEntryKit
//
//  Created by 突突兔 on 2019/4/25.
//  Copyright © 2019 突突兔. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FCStyleView.h"

@class BackgroundStyle;
NS_ASSUME_NONNULL_BEGIN

@interface FCBackgroundView : FCStyleView

@property (nonatomic, strong) BackgroundStyle *background;

@end

NS_ASSUME_NONNULL_END
