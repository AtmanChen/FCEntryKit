//
//  FCPlainTableViewCell.m
//  FCEntryKit
//
//  Created by 突突兔 on 2019/4/26.
//  Copyright © 2019 突突兔. All rights reserved.
//

#import "FCPlainTableViewCell.h"
#import "FCPlainCellModel.h"
#import "FCPlainCellStyle.h"

@interface FCPlainTableViewCell ()

@property (nonatomic, strong) UIImageView *headImageView;
@property (nonatomic, strong) UILabel *headLabel;
@property (nonatomic, strong) UILabel *tailLabel;
@property (nonatomic, strong) UISwitch *switchControl;

@end

static CGFloat HeadImageLeftEdge = 16.f;
static CGFloat HeadImageWidth = 30.f;
static CGFloat HeadLabelLeftEdge = 13.f;

@implementation FCPlainTableViewCell


+ (NSString *)CellId {
    return @"FCPlainTableViewCell";
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupSubViews];
    }
    return self;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubViews];
    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupSubViews];
    }
    return self;
}

- (void)setupSubViews {
    self.selectionStyle = UITableViewCellSelectionStyleDefault;
    self.headImageView = [[UIImageView alloc] init];
    self.headLabel = [[UILabel alloc] init];
    self.tailLabel = [[UILabel alloc] init];
    self.switchControl = [[UISwitch alloc] init];
    self.headLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.headImageView.translatesAutoresizingMaskIntoConstraints = NO;
    self.tailLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.switchControl addTarget:self action:@selector(switchToggled:) forControlEvents:UIControlEventValueChanged];
    [self.contentView addSubview:self.headImageView];
    [self.contentView addSubview:self.headLabel];
    [self.contentView addSubview:self.tailLabel];
    
    
    [NSLayoutConstraint constraintWithItem:self.headImageView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeft multiplier:1 constant:HeadImageLeftEdge].active = YES;

    [NSLayoutConstraint constraintWithItem:self.headImageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0 constant:HeadImageWidth].active = YES;

    [NSLayoutConstraint constraintWithItem:self.headImageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0 constant:HeadImageWidth].active = YES;

    [NSLayoutConstraint constraintWithItem:self.headImageView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0].active = YES;

    [NSLayoutConstraint constraintWithItem:self.headLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.headImageView attribute:NSLayoutAttributeRight multiplier:1 constant:HeadLabelLeftEdge].active = YES;

    [NSLayoutConstraint constraintWithItem:self.headLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0].active = YES;

    [NSLayoutConstraint constraintWithItem:self.tailLabel attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1 constant:-HeadImageWidth].active = YES;

    [NSLayoutConstraint constraintWithItem:self.tailLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0].active = YES;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
}

- (void)switchToggled:(UISwitch *)sender {
    if (_delegate && [_delegate respondsToSelector:@selector(switchToggled:)]) {
        [_delegate switchToggled:self];
    }
}

- (void)setModel:(FCPlainCellModel *)model {
    _model = model;
    self.headImageView.image = [UIImage imageNamed:_model.imageName];
    self.headLabel.text = _model.titleText;
    self.tailLabel.text = _model.detailText;
    self.headLabel.textColor = _model.cellStyle.titleColor;
    self.headLabel.font = _model.cellStyle.titleFont;
    self.tailLabel.textColor = _model.cellStyle.detailColor;
    self.tailLabel.font = _model.cellStyle.detailFont;
    switch (_model.accessType) {
        case None:
            self.accessoryType = UITableViewCellAccessoryNone;
            self.switchControl = nil;
            break;
        case DisclosureIndicator:
            self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            self.switchControl = nil;
            break;
        case Switch:
            self.accessoryView = self.switchControl;
            self.switchControl.onTintColor = _model.cellStyle.tintColor;
            self.accessoryType = UITableViewCellAccessoryNone;
            [self.switchControl setOn:_model.switchState];
            break;
    }
    [self layoutIfNeeded];
}

@end
