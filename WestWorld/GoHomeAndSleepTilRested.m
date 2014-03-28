//
//  GoHomeAndSleepTilRested.m
//  WestWorld
//
//  Created by Gergely Koncz on 28/03/2014.
//  Copyright (c) 2014 Gergely Koncz. All rights reserved.
//

#import "GoHomeAndSleepTilRested.h"
#import "Miner.h"
#import "EnterMineAndDigForNugget.h"

@implementation GoHomeAndSleepTilRested

-(void)enter:(BaseGameEntity *)entity{
    Miner* miner = (Miner*)entity;
    if(miner.location != kHome){
        miner.location = kHome;
        NSLog(@"%@: Heading for home.", [miner getName]);
    }
}

-(void)execute:(BaseGameEntity *)entity{
    Miner* miner = (Miner*)entity;
    miner.fatigue = 0;
    NSLog(@"%@: Slept a lot.", [miner getName]);
    [miner changeState:[EnterMineAndDigForNugget new]];
}

-(void)exit:(BaseGameEntity *)entity{
    Miner* miner = (Miner*)entity;
    NSLog(@"%@: Leaving home.", [miner getName]);
}

@end
