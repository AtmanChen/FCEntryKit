//
//  FCPlainCellStyle.h
//  FCEntryKit
//
//  Created by 突突兔 on 2019/4/26.
//  Copyright © 2019 突突兔. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger, FCPlainCellStyleType) {
    Default = 0,
    BottomPresent,
    Destructive
};

@interface FCPlainCellStyle : NSObject

@property (nonatomic, assign, readonly) FCPlainCellStyleType styleType;
@property (nonatomic, readonly, strong) UIFont *titleFont;
@property (nonatomic, readonly, strong) UIFont *detailFont;
@property (nonatomic, readonly, strong) UIColor *titleColor;
@property (nonatomic, readonly, strong) UIColor *detailColor;
@property (nonatomic, readonly, strong) UIColor *tintColor;
@property (nonatomic, assign) UITableViewCellAccessoryType accessType;

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)DefaultStyle;
+ (instancetype)BottomPresentStyle;
+ (instancetype)DestructiveStyle;




@end

