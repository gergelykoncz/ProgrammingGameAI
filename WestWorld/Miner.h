//
//  Miner.h
//  WestWorld
//
//  Created by Gergely Koncz on 28/03/2014.
//  Copyright (c) 2014 Gergely Koncz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseGameEntity.h"
@class State;

@interface Miner : BaseGameEntity

-(void)addToGoldCarried;
-(void)increaseFatigue;
-(BOOL)arePocketsFull;
-(BOOL)isThirsty;

@property(nonatomic, assign) int goldCarried;
@property(nonatomic, assign) int moneyInBank;
@property(nonatomic, assign) int thirst;
@property(nonatomic, assign) int fatigue;
@property(nonatomic, assign) locationType location;

@end
