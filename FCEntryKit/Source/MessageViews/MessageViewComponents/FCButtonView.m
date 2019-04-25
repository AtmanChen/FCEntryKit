//
//  FCButtonView.m
//  FCEntryKit
//
//  Created by 突突兔 on 2019/4/25.
//  Copyright © 2019 突突兔. All rights reserved.
//

#import "FCButtonView.h"
#import "ButtonContent.h"

@interface FCButtonView ()

@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) ButtonContent *content;

@end

@implementation FCButtonView


- (instancetype)initWithContent:(ButtonContent *)content
{
    self = [super initWithFrame:CGRectZero];
    if (self) {
        self.content = content;
        [self setupTitleLabel];
        [self setupButton];
    }
    return self;
}

- (void)setupTitleLabel {
    
}

- (void)setupButton {
    
}

- (UIButton *)button {
    if (!_button) {
        _button = [UIButton new];
    }
    return _button;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
    }
    return _titleLabel;
}

@end
