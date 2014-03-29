//
//  Wife.m
//  WestWorld
//
//  Created by Gergely Koncz on 28/03/2014.
//  Copyright (c) 2014 Gergely Koncz. All rights reserved.
//

#import "Wife.h"
#import "StateMachine.h"
#import "DoHouseWork.h"
#import "Miner.h"
#import "WifeGlobalState.h"

@implementation Wife
@synthesize location, miner, isCooking;

-(NSString*)getName{
    return @"Elza";
}

-(id)init{
    self = [super init];
    if(self){
        stateMachine = [[StateMachine alloc] initWithEntity:self
                                           withCurrentState:[DoHouseWork new]
                                           andPreviousState:nil
                                             andGlobalState:[WifeGlobalState new]];
    }
    return self;
}

-(void)update{
    [stateMachine update];
}

@end
