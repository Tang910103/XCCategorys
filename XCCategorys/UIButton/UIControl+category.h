//
//  UIControl+category.h
//  CommonCategory
//
//  Created by Tang杰 on 2018/12/29.
//  Copyright © 2018年 Tang杰. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ControlEventBlock)(UIControl *sender);


@interface UIControl (category)

- (void)addTouchDownBlock:(ControlEventBlock)block;
- (void)removeTouchDownBlock:(ControlEventBlock)block;

- (void)addTouchDragExitBlock:(ControlEventBlock)block;
- (void)removeTouchDragExitBlock:(ControlEventBlock)block;

- (void)addTouchUpInsideBlock:(ControlEventBlock)block;
- (void)removeTouchUpInsideBlock:(ControlEventBlock)block;

- (void)addTouchCancelBlock:(ControlEventBlock)block;
- (void)removeTouchCancelBlock:(ControlEventBlock)block;

- (void)addValueChangedBlock:(ControlEventBlock)block;
- (void)removeValueChangedBlock:(ControlEventBlock)block;

- (void)addEditingDidBeginBlock:(ControlEventBlock)block;
- (void)removeEditingDidBeginBlock:(ControlEventBlock)block;

- (void)addEditingChangedBlock:(ControlEventBlock)block;
- (void)removeEditingChangedBlock:(ControlEventBlock)block;

- (void)addEditingDidEndBlock:(ControlEventBlock)block;
- (void)removeEditingDidEndBlock:(ControlEventBlock)block;

- (void)addEditingDidEndOnExitBlock:(ControlEventBlock)block;
- (void)removeEditingDidEndOnExitBlock:(ControlEventBlock)block;
@end

