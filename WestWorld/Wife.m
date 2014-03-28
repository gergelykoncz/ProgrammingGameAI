//
//  Wife.m
//  WestWorld
//
//  Created by Gergely Koncz on 28/03/2014.
//  Copyright (c) 2014 Gergely Koncz. All rights reserved.
//

#import "Wife.h"
#import "StateMachine.h"
#import "DoHouseWork.h"

@implementation Wife
@synthesize location;

-(NSString*)getName{
    return @"Elza";
}

-(id)init{
    self = [super init];
    if(self){
        stateMachine = [[StateMachine alloc] initWithEntity:self
                                           withCurrentState:[DoHouseWork new]
                                           andPreviousState:nil
                                             andGlobalState:nil];
    }
    return self;
}

-(void)update{
    [stateMachine update];
}

@end
