//
//  FCRootViewController.h
//  FCEntryKit
//
//  Created by 突突兔 on 2019/4/25.
//  Copyright © 2019 突突兔. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EntryPresentDelegate <NSObject>

@required
- (void)displayPendingEntryIfNeeded;

@end

NS_ASSUME_NONNULL_BEGIN

@interface FCRootViewController : UIViewController

- (instancetype)initWithDelegate:(id<EntryPresentDelegate>)delegate;

@end

NS_ASSUME_NONNULL_END
