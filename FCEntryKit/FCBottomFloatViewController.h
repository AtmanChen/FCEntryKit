//
//  FCBottomFloatViewController.h
//  FCEntryKit
//
//  Created by 突突兔 on 2019/4/27.
//  Copyright © 2019 突突兔. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FCPlainCellModel;
@interface FCBottomFloatViewController : UIViewController

+ (instancetype)ShowSingleButtonWith:(NSString *)titleText
                     buttonImageName:(NSString *)buttonImageName
                         buttonTitle:(NSString *)buttonTitle
                              shadow:(BOOL)shadow;

+ (instancetype)ShowDoubleButtonWith:(NSString *)titleText
                    buttonImageNames:(NSArray<NSString *> *)buttonImageNames
                        buttonTitles:(NSArray<NSString *> *)buttonTitles
                              shadow:(BOOL)shadow;

+ (instancetype)ShowTripleButtonWith:(NSString *)titleText
                    buttonImageNames:(NSArray<NSString *> *)buttonImageNames
                        buttonTitles:(NSArray<NSString *> *)buttonTitles
                              shadow:(BOOL)shadow;

+ (instancetype)ShowTableViewWith:(NSString *)titleText
                           models:(NSArray<FCPlainCellModel *> *)models
                           cancel:(BOOL)cancel
                           shadow:(BOOL)shadow;

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil NS_UNAVAILABLE;
- (instancetype)initWithCoder:(NSCoder *)aDecoder NS_UNAVAILABLE;


@end


