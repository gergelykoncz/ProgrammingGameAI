//
//  StateMachine.m
//  WestWorld
//
//  Created by Gergely Koncz on 28/03/2014.
//  Copyright (c) 2014 Gergely Koncz. All rights reserved.
//

#import "StateMachine.h"

@implementation StateMachine
@synthesize currentState, globalState, previousState;

-(id)initWithEntity:(BaseGameEntity *)ownerEntity withCurrentState:(State *)ownerCurrentState andPreviousState:(State *)ownerPreviousState andGlobalState:(State *)ownerGlobalState{
    self = [super init];
    if(self){
        owner = ownerEntity;
        self.currentState = ownerCurrentState;
        self.globalState = ownerGlobalState;
        self.previousState = ownerPreviousState;
    }
    return self;
}

-(void)update{
    if(self.globalState){
        [self.globalState execute:owner];
    }
    if(self.currentState){
        [self.currentState execute:owner];
    }
}

-(void)revertToPreviousState{
    [self changeState:previousState];
}

-(void)changeState:(State *)newState{
    if(!newState){
        [NSException raise:@"newState must not be nil!" format:nil];
    }
    self.previousState = self.currentState;
    [currentState exit:owner];
    self.currentState = newState;
    [currentState enter:owner];
}

-(BOOL)isInState:(State *)state{
    return self.currentState == state;
}

@end
