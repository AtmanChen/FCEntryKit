//
//  FCBottomFloatViewController.m
//  FCEntryKit
//
//  Created by 突突兔 on 2019/4/27.
//  Copyright © 2019 突突兔. All rights reserved.
//

#import "FCBottomFloatViewController.h"
#import "FCPlainCell/FCPlainCellModel.h"
#import "FCPlainCell/FCPlainCellStyle.h"
#import "FCPlainCell/FCPlainTableViewCell.h"


typedef NS_ENUM(NSInteger, FCBottomFloatType) {
    FCBottomFloatTypeSingleButton,
    FCBottomFloatTypeDoubleButton,
    FCBottomFloatTypeTripleButton,
    FCBottomFloatTypeTableViewWithoutCancel,
    FCBottomFloatTypeTableViewWithCancel
};

@interface FCBottomFloatViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIWindow *window;
@property (nonatomic, strong) UIView *shadow;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UITapGestureRecognizer *tap;
@property (nonatomic, assign) FCBottomFloatType type;
@property (nonatomic, assign) BOOL showShadow;
@property (nonatomic, copy) NSArray<FCPlainCellModel *> *models;

@end

@interface FCBottomFloatViewController ()

@property (nonatomic, assign) CGFloat plainStyleHeight;
@property (nonatomic, assign) CGFloat tableViewHeight;

@end

static CGFloat TitleLabelHeight = 50.f;
static CGFloat EmptyTitleLabelHeight = 30.f;
static NSTimeInterval AnimationDuration = .36;

@implementation FCBottomFloatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.window makeKeyAndVisible];
}

- (void)loadView {
    [super loadView];
    
}

#pragma mark - UITableViewDelegate, UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.models.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FCPlainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[FCPlainTableViewCell CellId] forIndexPath:indexPath];
    cell.model = self.models[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - seletor

- (void)dismissSelf {
    if (self.showShadow) {
        
    } else {
        
    }
}

#pragma mark - setters & getters

- (UIView *)shadow {
    if (!_shadow) {
        _shadow = [UIView new];
        _shadow.backgroundColor = [UIColor colorWithWhite:0 alpha:0.6];
        _shadow.alpha = 0;
    }
    return _shadow;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        FCPlainCellStyle *style = [FCPlainCellStyle DefaultStyle];
        _titleLabel.font = style.titleFont;
        _titleLabel.textColor = style.titleColor;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

- (UIWindow *)window {
    if (!_window) {
        _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _window.backgroundColor = [UIColor clearColor];
        _window.rootViewController = self;
    }
    return _window;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}

- (CGFloat)plainStyleHeight {
    return [UIScreen mainScreen].bounds.size.height / 3;
}

- (UITapGestureRecognizer *)tap {
    if (!_tap) {
        _tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissSelf)];
    }
    return _tap;
}

@end
