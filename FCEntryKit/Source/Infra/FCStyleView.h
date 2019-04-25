//
//  FCStyleView.h
//  FCEntryKit
//
//  Created by 突突兔 on 2019/4/25.
//  Copyright © 2019 突突兔. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class RoundCorners;
@interface FCStyleView : UIView

@property (nonatomic, assign) BOOL appliedStyle;

- (void)applyFrameStyle:(RoundCorners *)roundCorners;

@end

NS_ASSUME_NONNULL_END
