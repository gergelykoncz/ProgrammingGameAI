//
//  WifeGlobalState.m
//  WestWorld
//
//  Created by Gergely Koncz on 29/03/2014.
//  Copyright (c) 2014 Gergely Koncz. All rights reserved.
//

#import "WifeGlobalState.h"
#import "Message.h"
#import "Wife.h"
#import "EntityManager.h"
#import "CookStew.h"
#import "MessageDispatcher.h"
#import "Message.h"
#import "Miner.h"
#import "DoHouseWork.h"

@implementation WifeGlobalState

-(BOOL)onMessage:(Message *)msg{
    Wife* wife = (Wife*)[[EntityManager sharedInstance] retrieveEntity:msg.receiver];
    BaseGameEntity* sender = [[EntityManager sharedInstance] retrieveEntity:msg.sender];
    NSLog(@"%@: Received a message from %@.", [wife getName], [sender getName]);
    
    switch (msg.msg) {
        case kMessageMinerIsHome:
            NSLog(@"%@: Hi honey let me make you a stew.", [wife getName]);
            [wife changeState:[CookStew new]];
        return YES;
            break;
        case kMessageStartCookingStew:
        {
            NSLog(@"%@: Received a message from %@.", [wife getName], [sender getName]);
            NSLog(@"%@: Stew ready! Let's eat!", [wife getName]);
            
            Message* stewsReady = [[Message alloc] initWithSender:wife.identifier andReceiver:wife.miner.identifier andMessage:kMessageDinnerIsOnTable withDelay:0];
            [[MessageDispatcher sharedInstance] dispatchMessage:stewsReady];
            wife.isCooking = NO;
            [wife changeState:[DoHouseWork new]];
            return YES;
        }

        default:
            return NO;
            break;
    }
}

-(void)execute:(BaseGameEntity *)entity{
    
}

@end
