//
//  DemoFirstView.m
//  CRUIEvent
//
//  Created by chuxiaolong on 2018/8/9.
//  Copyright © 2018年 Charon. All rights reserved.
//

#import "DemoFirstView.h"
#import "DemoSecondView.h"
#import "UIResponder+CREvent.h"

NSString * const kDemoFirstViewEvent = @"kDemoFirstViewEvent";

extern NSString * const kDemoThirdViewEvent;

@interface DemoFirstView ()

@property (nonatomic, strong) DemoSecondView *secondView;
@property (nonatomic, strong) UIButton *firstButton;
@property (nonatomic, strong) UILabel *tipsLabel;
@end

@implementation DemoFirstView

#pragma mark - life cycles
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor darkGrayColor];
        
        [self addSubview:self.secondView];
        [self addSubview:self.firstButton];
        [self addSubview:self.tipsLabel];
        
        __weak typeof(self) _self = self;
        [self registerEventName:kDemoThirdViewEvent toHandler:^(CRUIEvent *event, CREventForwardCallBack forwardCallBack) {
            _self.tipsLabel.text = event.object;
            forwardCallBack ? forwardCallBack(YES, self) : nil;
        }];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    
    self.secondView.frame = CGRectMake(15, 15, width - 30, height - 150);
    
    self.firstButton.frame = CGRectMake(15, self.secondView.frame.size.height + 30, width / 3, 45);
    self.tipsLabel.frame = CGRectMake(self.firstButton.frame.origin.x + self.firstButton.frame.size.width + 15, self.secondView.frame.size.height + 30, width / 2, 45);
}

#pragma mark - event response
- (void)didTappedFirstButton:(UIButton *)btn
{
    CRUIEvent *event = [CRUIEvent eventWithName:kDemoFirstViewEvent];
    event.source = self;
    [event sendForm:self];
}

#pragma mark - getters
- (DemoSecondView *)secondView
{
    if (_secondView == nil) {
        _secondView = [[DemoSecondView alloc] init];
    }
    return _secondView;
}

- (UIButton *)firstButton
{
    if (_firstButton == nil) {
        _firstButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_firstButton setBackgroundColor:[UIColor whiteColor]];
        [_firstButton setTitle:@"Button" forState:UIControlStateNormal];
        [_firstButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_firstButton addTarget:self action:@selector(didTappedFirstButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _firstButton;
}

- (UILabel *)tipsLabel
{
    if (_tipsLabel == nil) {
        _tipsLabel = [[UILabel alloc] init];
        _tipsLabel.font = [UIFont systemFontOfSize:15];
        _tipsLabel.textColor = [UIColor whiteColor];
    }
    return _tipsLabel;
}
@end
