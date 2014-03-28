//
//  State.m
//  WestWorld
//
//  Created by Gergely Koncz on 28/03/2014.
//  Copyright (c) 2014 Gergely Koncz. All rights reserved.
//

#import "State.h"

@implementation State

-(void)execute:(BaseGameEntity *)entity{
    [NSException raise:@"Execute must be overridden in a child class!" format:nil];
}

-(void)enter:(BaseGameEntity *)entity{
    
}

-(void)exit:(BaseGameEntity *)entity{
    
}

@end
