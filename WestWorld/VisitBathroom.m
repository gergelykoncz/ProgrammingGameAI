//
//  VisitBathroom.m
//  WestWorld
//
//  Created by Gergely Koncz on 28/03/2014.
//  Copyright (c) 2014 Gergely Koncz. All rights reserved.
//

#import "VisitBathroom.h"
#import "DoHouseWork.h"
#import "Wife.h"

@implementation VisitBathroom

-(void)enter:(BaseGameEntity *)entity{
    Wife* wife = (Wife*)entity;
    if(wife.location != kBathroom){
        wife.location = kBathroom;
        NSLog(@"%@: Heading for the bathroom.", [wife getName]);
    }
}

-(void)execute:(BaseGameEntity *)entity{
    Wife* wife = (Wife*)entity;
    NSLog(@"%@: Shittin", [wife getName]);
    NSLog(@"%@: Gotta go to the living froom.", [wife getName]);
    [wife changeState:[DoHouseWork new]];
}

-(void)exit:(BaseGameEntity *)entity{
    Wife* wife = (Wife*)entity;
    NSLog(@"%@: Leaving the bathroom.", [wife getName]);
}

@end
