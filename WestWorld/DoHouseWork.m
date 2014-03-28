//
//  DoHouseWork.m
//  WestWorld
//
//  Created by Gergely Koncz on 28/03/2014.
//  Copyright (c) 2014 Gergely Koncz. All rights reserved.
//

#import "DoHouseWork.h"
#import "Wife.h"
#import "VisitBathroom.h"

@implementation DoHouseWork

-(void)enter:(BaseGameEntity *)entity{
    Wife* wife = (Wife*)entity;
    if(wife.location != kLivingRoom){
        wife.location = kLivingRoom;
        NSLog(@"%@: Heading for the living room.", [wife getName]);
    }
}

-(void)execute:(BaseGameEntity *)entity{
    Wife* wife = (Wife*)entity;
    int random = arc4random_uniform(10);
    NSLog(@"%@: Mopping stuff.", [wife getName]);
    if(random == 3){
        [wife changeState:[VisitBathroom new]];
        NSLog(@"%@: Gotta go to the bathroom.", [wife getName]);
    }
}

-(void)exit:(BaseGameEntity *)entity{
    Wife* wife = (Wife*)entity;
    NSLog(@"%@: Leaving the living room.", [wife getName]);
}

@end
