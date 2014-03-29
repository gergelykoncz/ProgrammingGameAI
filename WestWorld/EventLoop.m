//
//  EventLoop.m
//  WestWorld
//
//  Created by Gergely Koncz on 29/03/2014.
//  Copyright (c) 2014 Gergely Koncz. All rights reserved.
//

#import "EventLoop.h"
#import "EntityManager.h"
#import "MessageDispatcher.h"

@implementation EventLoop

-(void)startLoop{
    miner = [Miner new];
    wife = [Wife new];
    wife.miner = miner;
    miner.wife = wife;
    
    [[EntityManager sharedInstance] registerEntity:miner];
    [[EntityManager sharedInstance] registerEntity:wife];
   
}

-(void)loop{
    
    [miner update];
    [wife update];
    [[MessageDispatcher sharedInstance] dispatchDelayedMessages];
}

@end
