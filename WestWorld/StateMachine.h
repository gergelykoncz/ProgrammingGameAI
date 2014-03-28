//
//  StateMachine.h
//  WestWorld
//
//  Created by Gergely Koncz on 28/03/2014.
//  Copyright (c) 2014 Gergely Koncz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseGameEntity.h"
#import "State.h"

@class Message;

@interface StateMachine : NSObject{
    BaseGameEntity* owner;
}

@property(nonatomic, strong) State* currentState;
@property(nonatomic, strong) State* previousState;
@property(nonatomic, strong) State* globalState;

-(id)initWithEntity:(BaseGameEntity*)ownerEntity
   withCurrentState:(State*)ownerCurrentState
   andPreviousState:(State*)ownerPreviousState
     andGlobalState:(State*)ownerGlobalState;

-(void)update;
-(void)changeState:(State*)newState;
-(void)revertToPreviousState;
-(BOOL)isInState:(State*)state;

-(BOOL)handleMessage:(Message*)msg;
@end
