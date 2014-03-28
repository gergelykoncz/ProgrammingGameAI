//
//  VisitBankAndDepositGold.m
//  WestWorld
//
//  Created by Gergely Koncz on 28/03/2014.
//  Copyright (c) 2014 Gergely Koncz. All rights reserved.
//

#import "VisitBankAndDepositGold.h"
#import "Miner.h"
#import "EnterMineAndDigForNugget.h"
#import "GoHomeAndSleepTilRested.h"

@implementation VisitBankAndDepositGold

-(void)enter:(BaseGameEntity *)entity{
    Miner* miner = (Miner*)entity;
    if(miner.location != kBank){
        miner.location = kBank;
        NSLog(@"%@: Moving to the bank.", [miner getName]);
    }
}

-(void)execute:(BaseGameEntity *)entity{
    Miner* miner = (Miner*)entity;
    miner.moneyInBank += miner.goldCarried;
    miner.goldCarried = 0;
    NSLog(@"%@: Deposited all money.", [miner getName]);
    
    if(miner.moneyInBank > 500){
        [miner changeState:[GoHomeAndSleepTilRested new]];
        NSLog(@"%@: Going home to sleep.", [miner getName]);
    }
    else{
        [miner changeState:[EnterMineAndDigForNugget new]];
        NSLog(@"%@: Returning to the mine.", [miner getName]);
    }
}

-(void)exit:(BaseGameEntity *)entity{
    Miner* miner = (Miner*)entity;
    NSLog(@"%@: Leaving the bank.", [miner getName]);
}

@end
