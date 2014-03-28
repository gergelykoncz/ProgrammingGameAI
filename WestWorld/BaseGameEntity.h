//
//  BaseGameEntity.h
//  WestWorld
//
//  Created by Gergely Koncz on 28/03/2014.
//  Copyright (c) 2014 Gergely Koncz. All rights reserved.
//

#import <Foundation/Foundation.h>
@class StateMachine;
@class State;
@class Message;

typedef enum {
    kGoldMine,
    kBank,
    kHome,
    kSaloon,
    kBathroom,
    kLivingRoom
}locationType;

@interface BaseGameEntity : NSObject{
    StateMachine* stateMachine;
}

@property(nonatomic, assign) int identifier;

-(void)update;
-(void)changeState:(State*)newState;
-(void)revertToPreviousState;
-(NSString*)getName;

-(BOOL)handleMessage:(Message*)message;


@end
