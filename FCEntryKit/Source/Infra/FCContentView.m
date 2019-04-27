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
    [self setupAttributes];
    [self setupInitialPosition];
    
}

- (void)setupAttributes {
    self.clipsToBounds = YES;
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(actionPanGesture:)];
    [self addGestureRecognizer:pan];
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
    
    [self addSubview:self.contentView];
    
    
    NSArray<NSLayoutConstraint *> *contentViewConstraints =
  @[
    [NSLayoutConstraint constraintWithItem:self.contentView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:0],
    [NSLayoutConstraint constraintWithItem:self.contentView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1 constant:0],
    [NSLayoutConstraint constraintWithItem:self.contentView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:0],
    [NSLayoutConstraint constraintWithItem:self.contentView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1 constant:0],
    [NSLayoutConstraint constraintWithItem:self.contentView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:1 constant:0],
    [NSLayoutConstraint constraintWithItem:self.contentView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:1 constant:0]
    ];
    [NSLayoutConstraint activateConstraints:contentViewConstraints];
    
    self.inConstraint = [NSLayoutConstraint constraintWithItem:self attribute:messageInAnchor relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:messageInAnchor multiplier:1 constant:self.inOffset];
    self.inConstraint.priority = UILayoutPriorityDefaultLow;
    [self setupOutConstraints:messageInAnchor];
    
    self.totalTranslation = self.inOffset;
    switch (self.attributes.position) {
        case Top:
            self.verticalLimit = self.inOffset;
            break;
        default:
            self.verticalLimit = [UIScreen mainScreen].bounds.size.height + self.inOffset;
            break;
    }
    
    // TODO: Keyboard
}

- (void)setupLayoutConstraints {
    [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeCenterX multiplier:1 constant:0].active = YES;
}

- (void)setupSize {
    
}

- (void)setupOutConstraints:(NSLayoutAttribute)messageAnchor {
    self.entranceOutConstraint = [self setupOutConstraint:self.attributes.entranceAnimation messageInAnchor:messageAnchor priority:UILayoutPriorityRequired];
    self.exitOutConstraint = [self setupOutConstraint:self.attributes.exitAnimation messageInAnchor:messageAnchor priority:UILayoutPriorityDefaultLow];
    self.swipDownOutConstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
    self.swipUpOutConstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
    [self.superview addConstraint:self.swipUpOutConstraint];
    [self.superview addConstraint:self.swipDownOutConstraint];
    
    Animation *popAnimation;
    if (self.attributes.popBehavior.animation != nil) {
        popAnimation = self.attributes.popBehavior.animation;
    }
    self.popOutConstraint = [self setupOutConstraint:popAnimation messageInAnchor:messageAnchor priority:UILayoutPriorityDefaultLow];
}

- (NSLayoutConstraint *)setupOutConstraint:(Animation *)animation messageInAnchor:(NSLayoutAttribute)messageInAnchor priority:(UILayoutPriority)priority {
    NSLayoutConstraint *constraint;
    if (animation.translate != nil) {
        OutTranslationAnchor *anchor;
        switch (animation.translate.anchorPosition) {
            case AnchorPositionTop:
                anchor = [[OutTranslationAnchor alloc] initWithMessageOut:NSLayoutAttributeBottom screenOut:NSLayoutAttributeTop];
                break;
            case AnchorPositionBottom:
                anchor = [[OutTranslationAnchor alloc] initWithMessageOut:NSLayoutAttributeTop screenOut:NSLayoutAttributeBottom];
                break;
            default:
                if (self.attributes.position == Top) {
                    anchor = [[OutTranslationAnchor alloc] initWithMessageOut:NSLayoutAttributeBottom screenOut:NSLayoutAttributeTop];
                } else {
                    anchor = [[OutTranslationAnchor alloc] initWithMessageOut:NSLayoutAttributeTop screenOut:NSLayoutAttributeBottom];
                }
                break;
        }
        constraint = [NSLayoutConstraint constraintWithItem:self attribute:anchor.messageOut relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:anchor.screenOut multiplier:1 constant:0];
    } else {
        constraint = [NSLayoutConstraint constraintWithItem:self attribute:messageInAnchor relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:messageInAnchor multiplier:1 constant:self.inOffset];
    }
    constraint.priority = priority;
    [self.superview addConstraint:constraint];
    return constraint;
}

- (void)animateIn {
    
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
