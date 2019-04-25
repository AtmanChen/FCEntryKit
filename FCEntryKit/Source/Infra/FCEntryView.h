//
//  FCEntryView.h
//  FCEntryKit
//
//  Created by 突突兔 on 2019/4/25.
//  Copyright © 2019 突突兔. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FCStyleView.h"

@class Content, FCAttributes;
@interface FCEntryView : FCStyleView

@property (nonatomic, strong) Content *content;
@property (nonatomic, strong) FCAttributes *attributes;

- (instancetype)initWithNewEntry:(Content *)content;

@end


@class FCAttributes;
@interface Content : NSObject

@property (nonatomic, strong) UIViewController *viewController;
@property (nonatomic, strong) UIView *view;
@property (nonatomic, strong) FCAttributes *attributes;


- (instancetype)initWithViewController:(UIViewController *)viewController
                            attributes:(FCAttributes *)attributes;

- (instancetype)initWithView:(UIView *)view
                  attributes:(FCAttributes *)attributes;

@end
