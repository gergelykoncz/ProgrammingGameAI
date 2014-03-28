//
//  Message.h
//  WestWorld
//
//  Created by Gergely Koncz on 28/03/2014.
//  Copyright (c) 2014 Gergely Koncz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Message : NSObject

@property(nonatomic, assign) int sender;
@property(nonatomic, assign) int receiver;
@property(nonatomic, assign) int msg;
@property(nonatomic, assign) double delay;

-(id)initWithSender:(int)aSender
        andReceiver:(int)aReceivuer
         andMessage:(int)aMsg
          withDelay:(double)aDelay;

@end
