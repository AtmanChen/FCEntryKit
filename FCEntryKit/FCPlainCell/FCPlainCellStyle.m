//
//  FCPlainCellStyle.m
//  FCEntryKit
//
//  Created by 突突兔 on 2019/4/26.
//  Copyright © 2019 突突兔. All rights reserved.
//

#import "FCPlainCellStyle.h"

@interface FCPlainCellStyle ()

@property (nonatomic, assign) FCPlainCellStyleType styleType;

- (instancetype)initWithStyleType:(FCPlainCellStyleType)styleType;

@end

static CGFloat DefaultStyleTitleFontSize = 18;
static CGFloat BottomPresentStyltTItleFontSize = 16;
static CGFloat DetailFontSize = 14;
static NSString *SemiboldFontName = @"PingFangSC-Semibold";
static NSString *MediemFontName = @"PingFangSC-Medium";

@implementation FCPlainCellStyle

- (instancetype)initWithStyleType:(FCPlainCellStyleType)styleType
{
    self = [super init];
    if (self) {
        self.styleType = styleType;
    }
    return self;
}

+ (instancetype)DefaultStyle {
    return [[self alloc] initWithStyleType:Default];
}
+ (instancetype)BottomPresentStyle {
    return [[self alloc] initWithStyleType:BottomPresent];
}
+ (instancetype)DestructiveStyle {
    return [[self alloc] initWithStyleType:Destructive];
}

- (UIFont *)titleFont {
    switch (self.styleType) {
        case BottomPresent: return [UIFont fontWithName:MediemFontName size:BottomPresentStyltTItleFontSize];
        default: return [UIFont fontWithName:SemiboldFontName size:DefaultStyleTitleFontSize];
    }
}

- (UIColor *)titleColor {
    switch (self.styleType) {
        case Default: return [UIColor blackColor];
        case BottomPresent: return [UIColor blackColor];
        case Destructive: return [UIColor colorWithRed:1 green:0.36 blue:0.44 alpha:1];
    }
}

- (UIColor *)detailColor {
    return [UIColor lightGrayColor];
}
- (UIFont *)detailFont {
    return [UIFont fontWithName:MediemFontName size:DetailFontSize];
}

- (UIColor *)tintColor {
    return [UIColor colorWithRed:0.09 green:0.56 blue:1 alpha:1];
}

@end
