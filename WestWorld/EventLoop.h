//
//  EventLoop.h
//  WestWorld
//
//  Created by Gergely Koncz on 29/03/2014.
//  Copyright (c) 2014 Gergely Koncz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Miner.h"
#import "Wife.h"

@interface EventLoop : NSObject{
    Miner* miner;
    Wife* wife;
}

-(void)startLoop;
-(void)loop;

@end
