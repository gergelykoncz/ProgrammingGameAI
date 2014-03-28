//
//  main.c
//  WestWorld
//
//  Created by Gergely Koncz on 28/03/2014.
//  Copyright (c) 2014 Gergely Koncz. All rights reserved.
//

#include <CoreFoundation/CoreFoundation.h>
#include "Miner.h"
#import "Wife.h"
#import "EntityManager.h"

int main(int argc, const char * argv[])
{
    
    Miner* miner = [Miner new];
    Wife* wife = [Wife new];
    
    [[EntityManager sharedInstance] registerEntity:miner];
    [[EntityManager sharedInstance] registerEntity:wife];
    
    while(true){
        [miner update];
        [wife update];
    }
    return 0;
}

