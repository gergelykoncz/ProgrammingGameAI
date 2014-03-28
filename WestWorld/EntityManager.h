//
//  EntityManager.h
//  WestWorld
//
//  Created by Gergely Koncz on 28/03/2014.
//  Copyright (c) 2014 Gergely Koncz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseGameEntity.h"

@interface EntityManager : NSObject{
    NSMutableDictionary* store;
}

+(EntityManager*)sharedInstance;
-(void)registerEntity:(BaseGameEntity*)entity;
-(void)removeEntity:(BaseGameEntity*)entity;
-(BaseGameEntity*)retrieveEntity:(int)entityId;

@end
