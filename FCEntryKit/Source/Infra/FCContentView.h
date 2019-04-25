//
//  FCContentView.h
//  FCEntryKit
//
//  Created by 突突兔 on 2019/4/25.
//  Copyright © 2019 突突兔. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FCEntryView.h"

NS_ASSUME_NONNULL_BEGIN

@class FCAttributes, FCEntryView;

typedef NS_ENUM(NSInteger, OuTranslation) {
    Exit = 0,
    Pop,
    SwipDown,
    SwipUp
};

typedef NS_ENUM(NSInteger, KeyboardState) {
    Visible = 0,
    Hidden
};

@protocol EntryContentViewDelegate <NSObject>

@required
- (void)changeToActiveWithAttributes:(FCAttributes *)attributes;
- (void)changeToInactiveWithAttributes:(FCAttributes *)attributes pushOut:(BOOL)pushOut;
- (void)didFinishDisplayingWithEntry:(FCEntryView *)entry keepWindowActive:(BOOL)keepWindowActive;

@end

@interface FCContentView : UIView

@property (nonatomic, strong) NSLayoutConstraint *entranceOutConstraint;
@property (nonatomic, strong) NSLayoutConstraint *exitOutConstraint;
@property (nonatomic, strong) NSLayoutConstraint *swipDownOutConstraint;
@property (nonatomic, strong) NSLayoutConstraint *swipUpOutConstraint;
@property (nonatomic, strong) NSLayoutConstraint *popOutConstraint;
@property (nonatomic, strong) NSLayoutConstraint *inConstraint;
@property (nonatomic, strong) NSLayoutConstraint *resistanceConstraint;
@property (nonatomic, strong) NSLayoutConstraint *inKeyboardConstraint;

@property (nonatomic, assign) CGFloat inOffset;
@property (nonatomic, assign) CGFloat totalTranslation;
@property (nonatomic, assign) CGFloat verticalLimit;
@property (nonatomic, assign) CGFloat swipMinVelocity;
@property (nonatomic, assign) KeyboardState keyboardState;


- (instancetype)initWithEntryDelegate:(id<EntryContentViewDelegate>)delegate;
- (void)setupContentView:(FCEntryView *)contentView;

@end

NS_ASSUME_NONNULL_END


@interface OutTranslationAnchor : NSObject

@property (nonatomic, assign) NSLayoutAttribute messageOut;
@property (nonatomic, assign) NSLayoutAttribute screenOut;

- (instancetype)initWithMessageOut:(NSLayoutAttribute)messageOut
                         screenOut:(NSLayoutAttribute)screenOut;

@end
