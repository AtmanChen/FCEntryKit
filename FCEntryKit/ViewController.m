//
//  ViewController.m
//  FCEntryKit
//
//  Created by 突突兔 on 2019/4/25.
//  Copyright © 2019 突突兔. All rights reserved.
//

#import "ViewController.h"
#import "FCPlainCell/FCPlainCellModel.h"
#import "FCPlainCell/FCPlainCellStyle.h"
#import "FCPlainCell/Sources/FBLFunctional/include/FBLFunctional.h"
#import "FCPlainCell/FCPlainTableViewCell.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate, FCPlainCellSwitchToggled, UITextFieldDelegate>

@property (nonatomic, strong) UIRefreshControl *refresh;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSource;

@property (nonatomic, copy) NSArray<NSString *> *imageNames;
@property (nonatomic, copy) NSArray<NSString *> *titles;
@property (nonatomic, copy) NSArray<NSString *> *details;
@property (nonatomic, copy) NSArray<NSNumber *> *accessTypes;
@property (nonatomic, copy) NSArray<NSNumber *> *states;


@property (nonatomic, strong) UITextField *tf;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSource = [NSMutableArray array];
   
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.rowHeight = 50.f;
    self.tableView.refreshControl = [[UIRefreshControl alloc] init];
    [self.tableView.refreshControl addTarget:self action:@selector(loadCellData:) forControlEvents:UIControlEventValueChanged];
    [self.tableView registerClass:[FCPlainTableViewCell class] forCellReuseIdentifier:@"Cell"];
    
    self.tf = [[UITextField alloc] init];
    self.tf.center = self.view.center;
    self.tf.bounds = CGRectMake(0, 0, 100, 30);
    [self.view addSubview:self.tf];
    [self.tf addTarget:self action:@selector(inputChanged:) forControlEvents:UIControlEventEditingChanged];
    self.tf.delegate = self;
    [self.view bringSubviewToFront:self.tf];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSLog(@"%s: %@", __func__, textField.text);
    return YES;
}

- (void)inputChanged:(UITextField *)sender {
    NSLog(@"%s: %@", __func__, sender.text);
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    [self.refresh beginRefreshing];
    [self loadCellData:self.tableView.refreshControl];
}


- (void)loadCellData:(id)sender {
    
    [self.imageNames enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *title = self.titles[idx];
        NSString *detail = self.details[idx];
        NSNumber *accessType = self.accessTypes[idx];
        NSNumber *state = self.states[idx];
        FCPlainCellStyle *style;
        if (idx == 3) {
            style = [FCPlainCellStyle DestructiveStyle];
        } else if (idx % 2 == 0) {
            style = [FCPlainCellStyle BottomPresentStyle];
        } else {
            style = [FCPlainCellStyle DefaultStyle];
        }
        FCPlainCellModel *model = [[FCPlainCellModel alloc] initWithKey:@"" imageName:obj titleText:title detailText:detail cellStyle:style accessType:accessType.integerValue switchState:state.integerValue];
        [self.dataSource addObject:model];
    }];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
        [self.tableView.refreshControl endRefreshing];
    });
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FCPlainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    FCPlainCellModel *model = self.dataSource[indexPath.row];
    cell.delegate = self;
    cell.model = model;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (void)switchToggled:(FCPlainTableViewCell *)cell {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        cell.model = [cell.model toggle];
        
    });
}

- (NSArray<NSString *> *)imageNames {
    return @[@"audio", @"camera", @"sex", @"stop", @"safe", @"priority"];
}

- (NSArray<NSString *> *)titles {
    return @[@"音乐", @"相机", @"性别", @"删除", @"安全", @"权限"];
}

- (NSArray<NSString *> *)details {
    return @[@"", @"", @"点击更换头像", @"", @"", @""];
}

- (NSArray<NSNumber *> *)accessTypes {
    return @[@0, @1, @0, @1, @2, @2];
}

- (NSArray<NSNumber *> *)states {
    return @[@YES, @NO, @YES, @NO, @YES, @NO];
}

@end
