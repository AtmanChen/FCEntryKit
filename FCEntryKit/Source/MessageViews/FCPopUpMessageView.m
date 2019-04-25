//
//  FCPopUpMessageView.m
//  FCEntryKit
//
//  Created by 突突兔 on 2019/4/25.
//  Copyright © 2019 突突兔. All rights reserved.
//

#import "FCPopUpMessageView.h"
#import "FCPopUpMessage.h"
#import "ImageContent.h"
#import "UILabel+FCLabelStyle.h"
#import "UIButton+FCButtonStyle.h"
#import "LabelContent.h"
#import "ButtonContent.h"
#import "LabelStyle.h"

@interface FCPopUpMessageView ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *descriptionLabel;
@property (nonatomic, strong) UIButton *actionButton;
@property (nonatomic, strong) FCPopUpMessage *message;

@end

@implementation FCPopUpMessageView


- (instancetype)initWithMessage:(FCPopUpMessage *)message
{
    self = [super initWithFrame:[UIScreen mainScreen].bounds];
    if (self) {
        self.message = message;
        [self setupImageView];
        [self setupTitleLabel];
        [self setupDescriptionLabel];
        [self setupActionButton];
    }
    return self;
}

- (void)setupImageView {
    self.imageView = [[UIImageView alloc] init];
    [self addSubview:self.imageView];
    [NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1 constant:0].active = YES;
    switch (self.message.themeImage.postion) {
        case TopToTop:
            [NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:self.message.themeImage.offset].active = YES;
            break;
            
        case CenterToTop:
            [NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:self.message.themeImage.offset].active = YES;
            break;
    }
    self.imageView.image = self.message.themeImage.image.images.firstObject;
}

- (void)setupTitleLabel {
    self.titleLabel = [UILabel new];
    [self addSubview:self.titleLabel];
    self.titleLabel.content = self.message.title;
    [NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:30].active = YES;
    [NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1 constant:-30].active = YES;
    if (self.imageView.image == nil) {
        [NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:20].active = YES;
    } else {
        [NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.imageView attribute:NSLayoutAttributeBottom multiplier:1 constant:20].active = YES;
    }
    
}

- (void)setupDescriptionLabel {
    self.descriptionLabel = [UILabel new];
    self.descriptionLabel.content = self.message.des;
    [NSLayoutConstraint constraintWithItem:self.descriptionLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:30].active = YES;
    [NSLayoutConstraint constraintWithItem:self.descriptionLabel attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1 constant:-30].active = YES;
    [NSLayoutConstraint constraintWithItem:self.descriptionLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.titleLabel attribute:NSLayoutAttributeBottom multiplier:1 constant:30].active = YES;
}

- (void)setupActionButton {
    self.actionButton = [UIButton new];
    CGFloat height = 45;
    [NSLayoutConstraint constraintWithItem:self.actionButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:kNilOptions multiplier:1 constant:height].active = YES;
    [NSLayoutConstraint constraintWithItem:self.actionButton attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.descriptionLabel attribute:NSLayoutAttributeBottom multiplier:1.0 constant:30].active = YES;
    [NSLayoutConstraint constraintWithItem:self.actionButton attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-30].active = YES;
    [NSLayoutConstraint constraintWithItem:self.actionButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0].active = YES;
    
    ButtonContent *buttonAttributes = self.message.button;
    self.actionButton.buttonContent = buttonAttributes;
    self.actionButton.contentEdgeInsets = UIEdgeInsetsMake(0, 30, 0, 30);
    self.actionButton.layer.cornerRadius = height * 0.5;
    [self.actionButton addTarget:self action:@selector(actionButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    UIColor *tapColor = [buttonAttributes.label.style.color colorWithAlphaComponent:0.8];
    [self.actionButton setTitleColor:tapColor forState:UIControlStateHighlighted];
    [self.actionButton setTitleColor:tapColor forState:UIControlStateSelected];
}

- (void)actionButtonPressed:(UIButton *) __unused sender {
    self.message.action();
}

@end
