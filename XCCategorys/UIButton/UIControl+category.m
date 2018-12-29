//
//  UIControl+category.m
//  CommonCategory
//
//  Created by Tang杰 on 2018/12/29.
//  Copyright © 2018年 Tang杰. All rights reserved.
//

#import "UIControl+category.h"
#import <objc/runtime.h>

@implementation UIControl (category)

- (void)addTouchDownBlock:(ControlEventBlock)block
{
    SEL sel = @selector(tuchDownEvent:);
    [self addTarget:self action:sel forControlEvents:UIControlEventTouchDown];
    [self addBlockToEventArrary:sel block:block];
}
- (void)tuchDownEvent:(UIControl *)sender {
    SEL sel = @selector(tuchDownEvent:);
    [self responseBlockWithSEL:sel];
}
- (void)removeTouchDownBlock:(ControlEventBlock)block
{
    SEL sel = @selector(tuchDownEvent:);
    [self removeEventBlockWithSEL:sel block:block];
}

- (void)addTouchDragExitBlock:(ControlEventBlock)block
{
    SEL sel = @selector(tuchDragExitEvent:);
    [self addTarget:self action:sel forControlEvents:UIControlEventTouchDragExit];
    [self addBlockToEventArrary:sel block:block];
}
- (void)tuchDragExitEvent:(UIControl *)sender {
    SEL sel = @selector(tuchDragExitEvent:);
    [self responseBlockWithSEL:sel];
}
- (void)removeTouchDragExitBlock:(ControlEventBlock)block
{
    SEL sel = @selector(tuchDragExitEvent:);
    [self removeEventBlockWithSEL:sel block:block];
}

- (void)addTouchCancelBlock:(ControlEventBlock)block
{
    SEL sel = @selector(tuchCancelEvent:);
    [self addTarget:self action:sel forControlEvents:UIControlEventTouchCancel];
    [self addBlockToEventArrary:sel block:block];
}
- (void)tuchCancelEvent:(UIControl *)sender {
    SEL sel = @selector(tuchCancelEvent:);
    [self responseBlockWithSEL:sel];
}
- (void)removeTouchCancelBlock:(ControlEventBlock)block
{
    SEL sel = @selector(tuchCancelEvent:);
    [self removeEventBlockWithSEL:sel block:block];
}

- (void)addTouchUpInsideBlock:(ControlEventBlock)block
{
    SEL sel = @selector(tuchUpInsidEvent:);
    [self addTarget:self action:sel forControlEvents:UIControlEventTouchUpInside];
    [self addBlockToEventArrary:sel block:block];
}
- (void)tuchUpInsidEvent:(UIControl *)sender {
    SEL sel = @selector(tuchUpInsidEvent:);
    [self responseBlockWithSEL:sel];
}
- (void)removeTouchUpInsideBlock:(ControlEventBlock)block
{
    SEL sel = @selector(tuchUpInsidEvent:);
    [self removeEventBlockWithSEL:sel block:block];
}

- (void)addValueChangedBlock:(ControlEventBlock)block
{
    SEL sel = @selector(valueChangedEvent:);
    [self addTarget:self action:sel forControlEvents:UIControlEventValueChanged];
    [self addBlockToEventArrary:sel block:block];
}
- (void)valueChangedEvent:(UIControl *)sender {
    SEL sel = @selector(valueChangedEvent:);
    [self responseBlockWithSEL:sel];
}
- (void)removeValueChangedBlock:(ControlEventBlock)block
{
    SEL sel = @selector(valueChangedEvent:);
    [self removeEventBlockWithSEL:sel block:block];
}

- (void)addEditingDidBeginBlock:(ControlEventBlock)block
{
    SEL sel = @selector(editingDidBeginEvent:);
    [self addTarget:self action:sel forControlEvents:UIControlEventEditingDidBegin];
    [self addBlockToEventArrary:sel block:block];
}
- (void)editingDidBeginEvent:(UIControl *)sender {
    SEL sel = @selector(editingDidBeginEvent:);
    [self responseBlockWithSEL:sel];
}
- (void)removeEditingDidBeginBlock:(ControlEventBlock)block
{
    SEL sel = @selector(editingDidBeginEvent:);
    [self removeEventBlockWithSEL:sel block:block];
}


- (void)addEditingChangedBlock:(ControlEventBlock)block
{
    SEL sel = @selector(editingChangedEvent:);
    [self addTarget:self action:sel forControlEvents:UIControlEventEditingChanged];
    [self addBlockToEventArrary:sel block:block];
}
- (void)editingChangedEvent:(UIControl *)sender {
    SEL sel = @selector(editingChangedEvent:);
    [self responseBlockWithSEL:sel];
}
- (void)removeEditingChangedBlock:(ControlEventBlock)block
{
    SEL sel = @selector(editingChangedEvent:);
    [self removeEventBlockWithSEL:sel block:block];
}
- (void)addEditingDidEndBlock:(ControlEventBlock)block
{
    SEL sel = @selector(editingDidEndEvent:);
    [self addTarget:self action:sel forControlEvents:UIControlEventEditingDidEnd];
    [self addBlockToEventArrary:sel block:block];
}
- (void)editingDidEndEvent:(UIControl *)sender {
    SEL sel = @selector(editingDidEndEvent:);
    [self responseBlockWithSEL:sel];
}
- (void)removeEditingDidEndBlock:(ControlEventBlock)block
{
    SEL sel = @selector(editingDidEndEvent:);
    [self removeEventBlockWithSEL:sel block:block];
}
- (void)addEditingDidEndOnExitBlock:(ControlEventBlock)block
{
    SEL sel = @selector(editingDidEndOnExitEvent:);
    [self addTarget:self action:sel forControlEvents:UIControlEventEditingDidEndOnExit];
    [self addBlockToEventArrary:sel block:block];
}
- (void)editingDidEndOnExitEvent:(UIControl *)sender {
    SEL sel = @selector(editingDidEndOnExitEvent:);
    [self responseBlockWithSEL:sel];
}
- (void)removeEditingDidEndOnExitBlock:(ControlEventBlock)block
{
    SEL sel = @selector(editingDidEndOnExitEvent:);
    [self removeEventBlockWithSEL:sel block:block];
}


- (void)addBlockToEventArrary:(SEL)sel block:(ControlEventBlock)block {
    NSMutableArray *ar = objc_getAssociatedObject(self, sel);
    if (!ar || ![ar isKindOfClass:[NSMutableArray class]]) {
        ar = [NSMutableArray arrayWithArray:ar];
    }
    [ar addObject:block];
    objc_setAssociatedObject(self, sel, ar, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (void)removeEventBlockWithSEL:(SEL)sel block:(ControlEventBlock)block {
    NSMutableArray *ar = objc_getAssociatedObject(self, sel);
    if (!ar || ![ar isKindOfClass:[NSMutableArray class]]) {
        ar = [NSMutableArray arrayWithArray:ar];
    }
    if (ar.count) {
        [ar removeObject:block];
    }
}
- (void)responseBlockWithSEL:(SEL)sel {
    NSMutableArray *ar = objc_getAssociatedObject(self, sel);
    [ar enumerateObjectsUsingBlock:^(ControlEventBlock obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj(self);
    }];
}



@end
