//
//  CRUIEvent.m
//  CRUIEvent
//
//  Created by chuxiaolong on 2018/8/9.
//  Copyright © 2018年 Charon. All rights reserved.
//

#import "CRUIEvent.h"
#import "UIResponder+CREvent.h"

@interface CRUIEvent ()

@property (nonatomic, copy, readwrite) NSString *name;
@end

@implementation CRUIEvent

- (instancetype)initWithName:(NSString *)name
{
    self = [super init];
    if (self) {
        _name = name;
    }
    return self;
}

#pragma mark - public methods
+ (CRUIEvent *)eventWithName:(NSString *)name
{
    return [[CRUIEvent alloc] initWithName:name];
}

- (void)sendFrom:(UIResponder *)source
{
    [source sendEvent:self];
}

- (void)sendFrom:(UIResponder *)source afterDelay:(NSTimeInterval)delay
{
    [source performSelector:@selector(sendEvent:) withObject:self afterDelay:delay];
}

@end
