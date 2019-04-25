//
//  FCContentView.m
//  FCEntryKit
//
//  Created by 突突兔 on 2019/4/25.
//  Copyright © 2019 突突兔. All rights reserved.
//

#import "FCContentView.h"
#import "FCEntryView.h"
#import "FCAttributes.h"

@interface FCContentView ()

@property (nonatomic, weak) id<EntryContentViewDelegate> delgate;
@property (nonatomic, strong) FCEntryView *contentView;
@property (nonatomic, strong) FCAttributes *attributes;

@end

@implementation FCContentView

- (instancetype)initWithEntryDelegate:(id<EntryContentViewDelegate>)delegate
{
    self = [super initWithFrame:CGRectZero];
    if (self) {
        self.delgate = delegate;
    }
    return self;
}

- (void)setupContentView:(FCEntryView *)contentView {
    self.contentView = contentView;
    
}

- (void)setupInitialPosition {
    NSLayoutAttribute messageInAnchor;
    self.inOffset = 0;
    CGFloat totalEntryHeight = 0;
    
    UIView *spacerView;
    if (self.attributes.position != Center) {
        spacerView = [UIView new];
        [self addSubview:spacerView];
        [NSLayoutConstraint constraintWithItem:spacerView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:[self insets].top].active = YES;
        [NSLayoutConstraint constraintWithItem:spacerView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:1 constant:0].active = YES;
        [NSLayoutConstraint constraintWithItem:spacerView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1 constant:0].active = YES;
        
        totalEntryHeight += [self insets].top;
    }
    
    messageInAnchor = NSLayoutAttributeBottom;
    [NSLayoutConstraint constraintWithItem:spacerView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1 constant:0].active = YES;
    
    
}


- (FCAttributes *)attributes {
    return self.contentView.attributes;
}

- (UIEdgeInsets)insets {
    CGFloat maxY = CGRectGetMaxY([UIApplication sharedApplication].statusBarFrame);
    return UIEdgeInsetsMake(maxY, 0, 10, 0);
}

@end


@implementation OutTranslationAnchor

- (instancetype)initWithMessageOut:(NSLayoutAttribute)messageOut
                         screenOut:(NSLayoutAttribute)screenOut
{
    self = [super init];
    if (self) {
        self.messageOut = messageOut;
        self.screenOut = screenOut;
    }
    return self;
}

@end
