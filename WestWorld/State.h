//
//  State.h
//  WestWorld
//
//  Created by Gergely Koncz on 28/03/2014.
//  Copyright (c) 2014 Gergely Koncz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseGameEntity.h"

@interface State : NSObject

-(void)execute:(BaseGameEntity*)entity;
-(void)enter:(BaseGameEntity*)entity;
-(void)exit:(BaseGameEntity*)entity;

@end
