//
//  BaseGameEntity.m
//  WestWorld
//
//  Created by Gergely Koncz on 28/03/2014.
//  Copyright (c) 2014 Gergely Koncz. All rights reserved.
//

#import "BaseGameEntity.h"
#import "StateMachine.h"
#import "State.h"

@implementation BaseGameEntity
@synthesize identifier;

+(int)nextValidId{
    return 0;
}

-(void)revertToPreviousState{
    [stateMachine revertToPreviousState];
}

-(void)changeState:(State *)newState{
    [stateMachine changeState:newState];
}

-(void)update{
    
}

-(NSString*)getName{
    return @"";
}

@end
