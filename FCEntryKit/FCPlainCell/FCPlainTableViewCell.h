//
//  FCPlainTableViewCell.h
//  FCEntryKit
//
//  Created by 突突兔 on 2019/4/26.
//  Copyright © 2019 突突兔. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FCPlainCellModel, FCPlainTableViewCell;

@protocol FCPlainCellSwitchToggled <NSObject>

@optional
- (void)switchToggled:(FCPlainTableViewCell *)cell;

@end

@interface FCPlainTableViewCell : UITableViewCell

@property (nonatomic, strong) FCPlainCellModel *model;
@property (nonatomic, weak) id<FCPlainCellSwitchToggled> delegate;


+ (NSString *)CellId;

@end

