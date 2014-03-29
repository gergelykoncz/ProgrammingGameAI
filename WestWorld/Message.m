//
//  Message.m
//  WestWorld
//
//  Created by Gergely Koncz on 28/03/2014.
//  Copyright (c) 2014 Gergely Koncz. All rights reserved.
//

#import "Message.h"

@implementation Message
@synthesize delay, sender, receiver, msg, startDate;

-(id)initWithSender:(int)aSender andReceiver:(int)aReceiver andMessage:(int)aMsg withDelay:(double)aDelay{
    self = [super init];
    if(self){
        self.sender = aSender;
        self.receiver = aReceiver;
        self.msg = aMsg;
        self.delay = aDelay;
        self.startDate = [NSDate new];
    }
    return self;
}

@end
