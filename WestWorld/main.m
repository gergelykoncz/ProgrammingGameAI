//
//  main.c
//  WestWorld
//
//  Created by Gergely Koncz on 28/03/2014.
//  Copyright (c) 2014 Gergely Koncz. All rights reserved.
//

#include <CoreFoundation/CoreFoundation.h>
#import "EventLoop.h"

const int NUM_SECONDS = 0.1;

int main(int argc, const char * argv[])
{
    
    EventLoop* eventLoop = [EventLoop new];
    [eventLoop startLoop];
    
    double time_counter = 0;
    
    clock_t this_time = clock();
    clock_t last_time = this_time;
    while (true) {
        this_time = clock();
        
        time_counter += (double)(this_time - last_time);
        
        last_time = this_time;
        
        if(time_counter > (double)(NUM_SECONDS * CLOCKS_PER_SEC))
        {
            time_counter -= (double)(NUM_SECONDS * CLOCKS_PER_SEC);
            [eventLoop loop];
        }
        
        
    }
    
    return 0;
}

