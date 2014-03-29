//
//  Miner.m
//  WestWorld
//
//  Created by Gergely Koncz on 28/03/2014.
//  Copyright (c) 2014 Gergely Koncz. All rights reserved.
//

#import "Miner.h"
#import "State.h"
#import "StateMachine.h"
#import "GoHomeAndSleepTilRested.h"
#import "Wife.h"

@implementation Miner
@synthesize fatigue, goldCarried, identifier, location, moneyInBank, thirst, wife;

-(id)init{
    self = [super init];
    if(self){
        stateMachine = [[StateMachine alloc] initWithEntity:self
                                           withCurrentState:[GoHomeAndSleepTilRested new]
                                           andPreviousState:nil
                                             andGlobalState:nil];
    }
    return self;
}

-(void)addToGoldCarried{
    self.goldCarried+=10;
}

-(void)increaseFatigue{
    self.fatigue++;
}

-(BOOL)arePocketsFull{
    return self.goldCarried >= 100;
}

-(BOOL)isThirsty{
    return self.thirst >= 100;
}

-(void)update{
    thirst++;
    [stateMachine update];
}

-(NSString*)getName{
    return @"Miner Bob";
}

@end
