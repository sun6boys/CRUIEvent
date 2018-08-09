//
//  UIResponder+Event.h
//  CRUIEvent
//
//  Created by chuxiaolong on 2018/8/9.
//  Copyright © 2018年 Charon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CRUIEvent.h"

typedef void (^CREventForwardCallBack)(BOOL forward, UIResponder *source);
typedef void (^CREventHandler)(CRUIEvent *event, CREventForwardCallBack forwardCallBack);

@interface UIResponder (CREvent)

- (void)sendEvent:(CRUIEvent *)event;

- (void)registerEventName:(NSString *)eventName toHandler:(CREventHandler)handler;
- (void)unRegisterEventHandlerForEventName:(NSString *)eventName;

- (BOOL)hasRegisterEventHandlerForEventName:(NSString *)eventName;
- (CREventHandler)eventHandlerForEventName:(NSString *)eventName;
@end
