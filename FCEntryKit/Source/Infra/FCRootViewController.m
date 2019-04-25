//
//  FCRootViewController.m
//  FCEntryKit
//
//  Created by 突突兔 on 2019/4/25.
//  Copyright © 2019 突突兔. All rights reserved.
//

#import "FCRootViewController.h"
#import "FCAttributes.h"
#import "FCBackgroundView.h"
#import "FCWrapperView.h"
#import "FCContentView.h"

@interface FCRootViewController ()

@property (nonatomic, weak) id<EntryPresentDelegate> delegate;
@property (nonatomic, strong) FCAttributes *lastAttributes;
@property (nonatomic, strong) FCBackgroundView *backgroundView;
@property (nonatomic, strong) FCWrapperView *wrapperView;
@property (nonatomic, strong) FCContentView *lastEntry;
@property (nonatomic, assign) NSInteger displayingEntryCount;
@property (nonatomic, assign) BOOL isDisplaying;

@end

@implementation FCRootViewController

- (instancetype)initWithDelegate:(id<EntryPresentDelegate>)delegate
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        self.delegate = delegate;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)loadView {
    [super loadView];
    self.view = self.wrapperView;
    [self.view insertSubview:self.backgroundView atIndex:0];
    self.backgroundView.userInteractionEnabled = NO;
    self.backgroundView.frame = self.view.bounds;
}

- (void)configureEntryView:(FCEntryView *)entryView {
    if (entryView.content.viewController != nil) {
        [self addChildViewController:entryView.content.viewController];
    }
    
    FCAttributes *attributes = entryView.attributes;
    FCAttributes *previousAttributes = self.lastAttributes;
    
    
    
}

- (void)removeLastEntry:(FCAttributes *)lastAttributes
             keepWindow:(BOOL)keepWindow {
    if (lastAttributes == nil) {
        return;
    }
    [self popLastEntry];
}

- (void)popLastEntry {
    
}

- (FCWrapperView *)wrapperView {
    if (!_wrapperView) {
        _wrapperView = [[FCWrapperView alloc] init];
    }
    return _wrapperView;
}

- (FCBackgroundView *)backgroundView {
    if (!_backgroundView) {
        _backgroundView = [[FCBackgroundView alloc] init];
    }
    return _backgroundView;
}

- (FCContentView *)lastEntry {
    return (FCContentView *)self.view.subviews.lastObject;
}

- (NSInteger)displayingEntryCount {
    return self.view.subviews.count - 1;
}

- (BOOL)isIsDisplaying {
    return self.lastEntry = nil;
}

@end
