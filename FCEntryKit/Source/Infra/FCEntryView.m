//
//  FCEntryView.m
//  FCEntryKit
//
//  Created by 突突兔 on 2019/4/25.
//  Copyright © 2019 突突兔. All rights reserved.
//

#import "FCEntryView.h"
#import "FCBackgroundView.h"
#import "FCAttributes.h"
#import "UIView+DropShadow.h"

@interface FCEntryView ()

@property (nonatomic, strong) FCBackgroundView *backgroundView;
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) FCStyleView *contentContainerView;

@end

@implementation FCEntryView

- (instancetype)initWithNewEntry:(Content *)content
{
    self = [super initWithFrame:[UIScreen mainScreen].bounds];
    if (self) {
        self.content = content;
        
    }
    return self;
}

- (void)transformToView:(UIView *)view {
    UIView *previousView = self.content.view;
    self.content.view = view;
    [view layoutIfNeeded];
    
    NSLayoutConstraint *previousHeight = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:self.bounds.size.height];
    previousHeight.priority = UILayoutPriorityRequired;
    self.translatesAutoresizingMaskIntoConstraints = false;
    [self addConstraint:previousHeight];
    
    NSLayoutConstraint *nextHeight = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:view.bounds.size.height];
    self.translatesAutoresizingMaskIntoConstraints = false;
    nextHeight.priority = UILayoutPriorityDefaultLow;
    [self addConstraint:nextHeight];
    
    // TODO: FCWindow layout
    
    [UIView animateWithDuration:0.36 delay:0 usingSpringWithDamping:1 initialSpringVelocity:0 options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionLayoutSubviews  animations:^{
        previousHeight.priority = UILayoutPriorityDefaultLow;
        nextHeight.priority = UILayoutPriorityRequired;
        previousView.alpha = 0;
        
        // TODO: FCWindow layout
        
    } completion:^(BOOL finished) {
        view.alpha = 0;
        [previousView removeFromSuperview];
        [self removeConstraints:@[previousHeight, nextHeight]];
        [self setupContentView];
        [UIView animateWithDuration:0.36 delay:0 usingSpringWithDamping:1 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            view.alpha = 1;
        } completion:nil];
    }];
    
}

- (void)setupContentView {
    [self.contentView addSubview:self.content.view];
    self.content.view.frame = self.contentView.bounds;
    
    [self addSubview:self.contentContainerView];
    [self.contentContainerView addSubview:self.contentView];
    self.contentView.frame = self.contentContainerView.bounds;
}

- (void)applyDropShadow {
    ShadowValue *value = self.attributes.shadow.value;
    [self applyDropShadowWithOffset:value.offset opacity:value.opacity radius:value.radius color:value.color];
}

- (void)applyBackgroundToContentView {
    FCAttributes *attributes = self.attributes;
    FCBackgroundView *backgroudView = [[FCBackgroundView alloc] init];
    backgroudView.background = attributes.entryBackground;
    [self.contentView insertSubview:backgroudView atIndex:0];
    self.backgroundView = backgroudView;
}

- (void)applyFrameStyle {
    [self.backgroundView applyFrameStyle:self.attributes.roundCorners];
}

- (void)adjustInnerContentAppearanceIfNeeded {
    
}




- (FCStyleView *)contentContainerView {
    if (!_contentContainerView) {
        _contentContainerView = [[FCStyleView alloc] init];
        _contentContainerView.frame = self.bounds;
        _contentContainerView.clipsToBounds = YES;
    }
    return _contentContainerView;
}

- (UIView *)contentView {
    if (!_contentView) {
        _contentView = [UIView new];
    }
    return _contentView;
}

- (FCAttributes *)attributes {
    return self.content.attributes;
}

@end


@implementation Content

- (instancetype)initWithView:(UIView *)view
                  attributes:(FCAttributes *)attributes
{
    self = [super init];
    if (self) {
        self.view = view;
        self.attributes = attributes;
    }
    return self;
}

- (instancetype)initWithViewController:(UIViewController *)viewController
                            attributes:(FCAttributes *)attributes
{
    self = [super init];
    if (self) {
        self.viewController = viewController;
        self.attributes = attributes;
    }
    return self;
}


@end
