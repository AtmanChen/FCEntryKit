//
//  CALayer+DropShadow.h
//  FCEntryKit
//
//  Created by 突突兔 on 2019/4/25.
//  Copyright © 2019 突突兔. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CALayer (DropShadow)

- (void)applyDropShadowWithOffset:(CGSize)offset
                          opacity:(float)opacity
                           radius:(CGFloat)radius
                            color:(UIColor *)color;

- (void)removeDropShadow;


@end

NS_ASSUME_NONNULL_END
