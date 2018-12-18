//
//  UIResponder+Event.m
//  CRUIEvent
//
//  Created by chuxiaolong on 2018/8/9.
//  Copyright © 2018年 Charon. All rights reserved.
//

#import "UIResponder+CREvent.h"
#import <objc/runtime.h>

static void * kUIResponder_Event_HandlerStorageKey = &kUIResponder_Event_HandlerStorageKey;

@implementation UIResponder (CREvent)

- (void)sendEvent:(CRUIEvent *)event
{
    if(event.name.length == 0)
        return;
    
    if([self hasRegisterEventHandlerForEventName:event.name] == NO){
        [[self nextResponder] sendEvent:event];
        return;
    }
    
    CREventForwardCallBack callBackHandler = ^(BOOL forward, UIResponder *source){
        if(forward){
            [[self nextResponder] sendEvent:event];
        }
    };
    
    CREventHandler eventHandler = [self eventHandlerForEventName:event.name];
    eventHandler ? eventHandler(event,callBackHandler) : nil;
}

- (void)registerEventName:(NSString *)eventName toHandler:(CREventHandler)handler;
{
    NSMutableDictionary *eventHandlerStorage = objc_getAssociatedObject(self, kUIResponder_Event_HandlerStorageKey);
    if(eventHandlerStorage == nil){
        eventHandlerStorage = [[NSMutableDictionary alloc] init];
        objc_setAssociatedObject(self, kUIResponder_Event_HandlerStorageKey, eventHandlerStorage, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    eventHandlerStorage[eventName] = handler;
}

- (void)unRegisterEventHandlerForEventName:(NSString *)eventName
{
    NSMutableDictionary *eventHandlerStorage = objc_getAssociatedObject(self, kUIResponder_Event_HandlerStorageKey);
    eventHandlerStorage[eventName] = nil;
}

- (BOOL)hasRegisterEventHandlerForEventName:(NSString *)eventName;
{
    NSMutableDictionary *eventHandlerStorage = objc_getAssociatedObject(self, kUIResponder_Event_HandlerStorageKey);
    if(eventHandlerStorage == nil)
        return NO;
    
    CREventHandler handler = eventHandlerStorage[eventName];
    return handler ? YES : NO;
}

- (CREventHandler)eventHandlerForEventName:(NSString *)eventName
{
    NSMutableDictionary *eventHandlerStorage = objc_getAssociatedObject(self, kUIResponder_Event_HandlerStorageKey);
    return eventHandlerStorage[eventName];
}
@end
