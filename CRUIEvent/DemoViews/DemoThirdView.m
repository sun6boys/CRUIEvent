//
//  DemoThirdView.m
//  CRUIEvent
//
//  Created by chuxiaolong on 2018/8/9.
//  Copyright © 2018年 Charon. All rights reserved.
//

#import "DemoThirdView.h"
#import "UIResponder+CREvent.h"

NSString * const kDemoThirdViewEvent = @"kDemoThirdViewEvent";

@interface DemoThirdView ()

@end

@implementation DemoThirdView

- (IBAction)didTappedThirdButton:(id)sender
{
    CRUIEvent *event = [CRUIEvent eventWithName:kDemoThirdViewEvent];
    event.object = @"Click ThirdButton";
    
    [self sendEvent:event];
}

@end
