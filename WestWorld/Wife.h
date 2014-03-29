//
//  Wife.h
//  WestWorld
//
//  Created by Gergely Koncz on 28/03/2014.
//  Copyright (c) 2014 Gergely Koncz. All rights reserved.
//

#import "BaseGameEntity.h"
@class Miner;

@interface Wife : BaseGameEntity

@property(nonatomic, assign) locationType location;
@property(nonatomic, weak) Miner* miner;
@property(nonatomic, assign) BOOL isCooking;

@end
