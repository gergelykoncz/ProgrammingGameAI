//
//  MessageDispatcher.h
//  WestWorld
//
//  Created by Gergely Koncz on 28/03/2014.
//  Copyright (c) 2014 Gergely Koncz. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Message;

@interface MessageDispatcher : NSObject

+(MessageDispatcher*)sharedInstance;

-(void)dispatchMessage:(Message*)message;
-(void)dispatchDelayedMessages;

@end
