//
//  main.m
//  homework09_19
//
//  Created by 古玉彬 on 15/9/19.
//  Copyright (c) 2015年 guyubin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Manage.h"
#import "LRC.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
//        NSLog(@"%f",time);
        Manage *m = [[Manage alloc] init];
        [m readLrcFromFile];
        [m findLrcByTime:0 andM:16 andMs:8];
        [m listAllLrc];
    }
    return 0;
}
