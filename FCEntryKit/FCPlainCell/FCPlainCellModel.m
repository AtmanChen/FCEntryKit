//
//  FCPlainCellModel.m
//  FCEntryKit
//
//  Created by 突突兔 on 2019/4/26.
//  Copyright © 2019 突突兔. All rights reserved.
//

#import "FCPlainCellModel.h"

@interface FCPlainCellModel ()

@property (nonatomic, copy, nonnull) NSString *key;
@property (nonatomic, strong, nonnull) FCPlainCellStyle *cellStyle;

@end

@implementation FCPlainCellModel

- (instancetype)initWithKey:(NSString *)key
                  imageName:(NSString *)imageName
                  titleText:(NSString *)titleText
                 detailText:(NSString *)detailText
                  cellStyle:(FCPlainCellStyle *)cellStyle
                 accessType:(FCPlainCellAccessType)accessType
                switchState:(FCPlainSwitchCellState)switchState
{
    self = [super init];
    if (self) {
        self.key = key;
        self.imageName = imageName;
        self.titleText = titleText;
        self.cellStyle = cellStyle;
        self.detailText = detailText;
        self.accessType = accessType;
        self.switchState = switchState;
    }
    return self;
}

- (FCPlainCellModel *)toggle {
    if (self.accessType != Switch) {
        return nil;
    }
    return [[FCPlainCellModel alloc] initWithKey:self.key imageName:self.imageName titleText:self.titleText detailText:self.detailText cellStyle:self.cellStyle accessType:self.accessType switchState:!self.switchState];
}


@end
