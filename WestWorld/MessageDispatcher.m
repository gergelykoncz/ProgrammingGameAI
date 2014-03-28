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

-(void)dispatchDelayedMessages{
    
}

-(void)dispatchMessage:(Message *)message{
    BaseGameEntity* receiver = [[EntityManager sharedInstance] retrieveEntity:message.receiver];
    [self discharge:receiver ofMessage:message];
}

-(void)discharge:(BaseGameEntity*)receiver ofMessage:(Message*)msg{
    [receiver handleMessage:msg];
}

@end
