//
//  EnterMineAndDigForNugget.m
//  WestWorld
//
//  Created by Gergely Koncz on 28/03/2014.
//  Copyright (c) 2014 Gergely Koncz. All rights reserved.
//

#import "EnterMineAndDigForNugget.h"
#import "Miner.h"
#import "VisitBankAndDepositGold.h"
#import "QuenchThirst.h"

@implementation EnterMineAndDigForNugget

-(void)enter:(BaseGameEntity *)entity{
    Miner* miner = (Miner*)entity;
    
    if(miner.location != kGoldMine){
        NSLog(@"%@: Walking to the gold mine.", [miner getName]);
        miner.location = kGoldMine;
    }
}

-(void)execute:(BaseGameEntity *)entity{
    Miner* miner = (Miner*)entity;
    
    [miner addToGoldCarried];
    [miner increaseFatigue];
    NSLog(@"%@: Picking up a nugget.", [miner getName]);
    
    if([miner arePocketsFull]){
        [miner changeState:[VisitBankAndDepositGold new]];
    }
    
    if([miner isThirsty]){
        [miner changeState:[QuenchThirst new]];
    }
}

-(void)exit:(BaseGameEntity *)entity{
    Miner* miner = (Miner*)entity;
    
    NSLog(@"%@: Leaving the gold mine.", [miner getName]);
}

@end
