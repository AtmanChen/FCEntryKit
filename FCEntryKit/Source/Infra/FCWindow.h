//
//  FCWindow.h
//  FCEntryKit
//
//  Created by 突突兔 on 2019/4/25.
//  Copyright © 2019 突突兔. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FCWindow : UIWindow

@property (nonatomic, assign) BOOL isAbleToReceiveTouches;

- (instancetype)initWithRootVC:(UIViewController *)rootVc;

@end

NS_ASSUME_NONNULL_END
