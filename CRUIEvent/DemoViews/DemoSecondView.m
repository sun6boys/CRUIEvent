//
//  DemoSecondView.m
//  CRUIEvent
//
//  Created by chuxiaolong on 2018/8/9.
//  Copyright © 2018年 Charon. All rights reserved.
//

#import "DemoSecondView.h"
#import "DemoThirdView.h"

@interface DemoSecondView ()

@property (nonatomic, strong) DemoThirdView *thirdView;
@end

@implementation DemoSecondView

#pragma mark - life cycls
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor yellowColor];
        [self addSubview:self.thirdView];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.thirdView.frame = CGRectMake(30, 50, self.frame.size.width - 60, self.frame.size.height - 100);
}

#pragma mark - getters
- (DemoThirdView *)thirdView
{
    if (_thirdView == nil) {
        _thirdView = [[[NSBundle mainBundle] loadNibNamed:@"DemoThirdView" owner:nil options:nil] lastObject];
    }
    return _thirdView;
}
@end
