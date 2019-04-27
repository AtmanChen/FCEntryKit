//
//  FCPlainCellModel.h
//  FCEntryKit
//
//  Created by 突突兔 on 2019/4/26.
//  Copyright © 2019 突突兔. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSInteger, FCPlainCellAccessType) {
    None = 0,
    DisclosureIndicator,
    Switch
};

typedef NS_ENUM(NSInteger, FCPlainSwitchCellState) {
    Off = 0,
    On
};

@class FCPlainCellStyle;
@interface FCPlainCellModel : NSObject

@property (nonatomic, copy, readonly, nonnull) NSString *key;
@property (nonatomic, copy, nonnull) NSString *imageName;
@property (nonatomic, copy, nonnull) NSString *titleText;
@property (nonatomic, copy, nullable) NSString *detailText;
@property (nonatomic, readonly, strong, nonnull) FCPlainCellStyle *cellStyle;
@property (nonatomic, assign) FCPlainCellAccessType accessType;
@property (nonatomic, assign) FCPlainSwitchCellState switchState;


- (instancetype)init NS_UNAVAILABLE;

- (instancetype)initWithKey:(NSString * __nonnull)key
                  imageName:(NSString * __nonnull)imageName
                  titleText:(NSString * __nonnull)titleText
                 detailText:(NSString * __nonnull)detailText
                  cellStyle:(FCPlainCellStyle * __nonnull)cellStyle
                 accessType:(FCPlainCellAccessType)accessType
                switchState:(FCPlainSwitchCellState)switchState;

- (FCPlainCellModel *)toggle;
@end

