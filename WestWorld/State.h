//
//  State.h
//  WestWorld
//
//  Created by Gergely Koncz on 28/03/2014.
//  Copyright (c) 2014 Gergely Koncz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseGameEntity.h"
@class Message;

@interface State : NSObject

-(void)execute:(BaseGameEntity*)entity;
-(void)enter:(BaseGameEntity*)entity;
-(void)exit:(BaseGameEntity*)entity;

-(BOOL)onMessage:(Message*)msg;

@end
