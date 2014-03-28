//
//  EntityManager.m
//  WestWorld
//
//  Created by Gergely Koncz on 28/03/2014.
//  Copyright (c) 2014 Gergely Koncz. All rights reserved.
//

#import "EntityManager.h"

@implementation EntityManager

-(id)init{
    self = [super init];
    if(self){
        store = [NSMutableDictionary new];
    }
    return self;
}

+(EntityManager*)sharedInstance{
    static dispatch_once_t once;
    static EntityManager* instance;
    dispatch_once(&once, ^{
        instance = [EntityManager new];
    });
    return instance;
}

-(void)registerEntity:(BaseGameEntity *)entity{
    if(entity.identifier == 0){
        entity.identifier = [self getNextIdentifier];
        [store setObject:entity forKey:[NSString stringWithFormat:@"%i", entity.identifier]];
        NSLog(@"Registered entity with id: %i", entity.identifier);
    }
}

-(void)removeEntity:(BaseGameEntity *)entity{
    if(entity.identifier == 0){
        [store removeObjectForKey:[NSString stringWithFormat:@"%i", entity.identifier]];
    }
}

-(BaseGameEntity*)retrieveEntity:(int)entityId{
    BaseGameEntity* entity = [store objectForKey:[NSString stringWithFormat:@"%i", entityId]];
    return entity;
}

-(unsigned long)getNextIdentifier{
    return [store count] + 1;
}

@end
