//
//  MessageDispatcher.m
//  WestWorld
//
//  Created by Gergely Koncz on 28/03/2014.
//  Copyright (c) 2014 Gergely Koncz. All rights reserved.
//

#import "MessageDispatcher.h"
#import "Message.h"
#import "BaseGameEntity.h"
#import "EntityManager.h"

@implementation MessageDispatcher

+(MessageDispatcher*)sharedInstance{
    static dispatch_once_t once;
    static MessageDispatcher* instance;
    dispatch_once(&once, ^{
        instance = [MessageDispatcher new];
    });
    return instance;
}

-(id)init{
    self = [super init];
    if(self){
        queue = [NSMutableArray new];
    }
    return self;
}

-(void)dispatchDelayedMessages{
    for(Message* message in queue){
        NSDate* now = [NSDate new];
        NSDate* fireDate = [message.startDate dateByAddingTimeInterval:(NSTimeInterval)message.delay];
        if([now compare:fireDate] == NSOrderedDescending){
            NSLog(@"Dispatching a delayed message.");
            BaseGameEntity* receiver = [[EntityManager sharedInstance] retrieveEntity:message.receiver];
            [self discharge:receiver ofMessage:message];
            [queue removeObject:message];
        }
    }
}

-(void)dispatchMessage:(Message *)message{
    if(message.delay == 0){
        BaseGameEntity* receiver = [[EntityManager sharedInstance] retrieveEntity:message.receiver];
        [self discharge:receiver ofMessage:message];
    }
    else{
        [queue addObject:message];
    }
}

-(void)discharge:(BaseGameEntity*)receiver ofMessage:(Message*)msg{
    [receiver handleMessage:msg];
}

@end
