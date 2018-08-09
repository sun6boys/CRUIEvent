//
//  CRUIEvent.h
//  CRUIEvent
//
//  Created by chuxiaolong on 2018/8/9.
//  Copyright © 2018年 Charon. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UIResponder;
@interface CRUIEvent : NSObject

@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, strong) id object;

@property (nonatomic, weak) UIResponder *source;

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;

+ (CRUIEvent *)eventWithName:(NSString *)name;

- (void)sendForm:(UIResponder *)source;
- (void)sendForm:(UIResponder *)source afterDelay:(NSTimeInterval)delay;
@end
