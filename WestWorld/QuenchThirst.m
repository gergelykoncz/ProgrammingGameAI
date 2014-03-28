//
//  QuenchThirst.m
//  WestWorld
//
//  Created by Gergely Koncz on 28/03/2014.
//  Copyright (c) 2014 Gergely Koncz. All rights reserved.
//

#import "QuenchThirst.h"
#import "Miner.h"
#import "EnterMineAndDigForNugget.h"

@implementation QuenchThirst

-(void)enter:(BaseGameEntity *)entity{
    Miner* miner = (Miner*)entity;
    if(miner.location != kSaloon){
        miner.location = kSaloon;
        NSLog(@"%@: Heading for the saloon", [miner getName]);
    }
}

-(void)execute:(BaseGameEntity *)entity{
    Miner* miner = (Miner*)entity;
    miner.thirst-=30;
    NSLog(@"%@: Drank a lot", [miner getName]);
    [miner changeState:[EnterMineAndDigForNugget new]];
}

-(void)exit:(BaseGameEntity *)entity{
    Miner* miner = (Miner*)entity;
    NSLog(@"%@: Leaving the saloon", [miner getName]);
}

@end
