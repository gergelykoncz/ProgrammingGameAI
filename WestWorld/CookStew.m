//
//  CookStew.m
//  WestWorld
//
//  Created by Gergely Koncz on 29/03/2014.
//  Copyright (c) 2014 Gergely Koncz. All rights reserved.
//

#import "CookStew.h"
#import "Wife.h"
#import "MessageDispatcher.h"
#import "Message.h"
#import "EntityManager.h"
#import "Miner.h"
#import "DoHouseWork.h"

@implementation CookStew

-(void)enter:(BaseGameEntity *)entity{
    Wife* wife = (Wife*)entity;
    if([wife isCooking] == NO){
        NSLog(@"%@: Putting the stew into the oven.", [wife getName]);
        Message* cookMessage = [[Message alloc] initWithSender:wife.identifier
                                                   andReceiver:wife.identifier
                                                    andMessage:kMessageStartCookingStew
                                                     withDelay:1.5];
        [[MessageDispatcher sharedInstance] dispatchMessage:cookMessage];
        wife.isCooking = YES;
    }
}

-(void)execute:(BaseGameEntity *)entity{
    NSLog(@"%@: Cooking stew.", [entity getName]);
    [entity changeState:[DoHouseWork new]];
}

@end
