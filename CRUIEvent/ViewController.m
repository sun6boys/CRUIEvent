//
//  ViewController.m
//  CRUIEvent
//
//  Created by chuxiaolong on 2018/8/9.
//  Copyright © 2018年 Charon. All rights reserved.
//

#import "ViewController.h"
#import "DemoFirstView.h"
#import "UIResponder+CREvent.h"

extern NSString * const kDemoThirdViewEvent;
extern NSString * const kDemoFirstViewEvent;


@interface ViewController ()

@property (nonatomic, strong) DemoFirstView *firstView;
@end

@implementation ViewController

#pragma mark - life cycles
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.firstView];
    
    [self registEventHandlers];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    self.firstView.frame = CGRectMake(30, 50, self.view.frame.size.width - 60, self.view.frame.size.height - 100);
}

#pragma mark - private methods
- (void)registEventHandlers
{
    __weak typeof(self) _self = self;
    [self registerEventName:kDemoFirstViewEvent toHandler:^(CRUIEvent *event, CREventForwardCallBack forwardCallBack) {
        
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"知道了" style:UIAlertActionStyleDefault handler:nil];
        UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:nil message:@"来自第一个View的点击事件" preferredStyle:UIAlertControllerStyleAlert];
        [alertVC addAction:action];
        
        [_self presentViewController:alertVC animated:YES completion:nil];
    }];

    [self registerEventName:kDemoThirdViewEvent toHandler:^(CRUIEvent *event, CREventForwardCallBack forwardCallBack) {
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"知道了" style:UIAlertActionStyleDefault handler:nil];
        UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:nil message:@"来自第三个View的点击事件" preferredStyle:UIAlertControllerStyleAlert];
        [alertVC addAction:action];
        
        [_self presentViewController:alertVC animated:YES completion:nil];
    }];

}

#pragma mark - getters
- (DemoFirstView *)firstView
{
    if (_firstView == nil) {
        _firstView = [[DemoFirstView alloc] init];
    }
    return _firstView;
}

@end
