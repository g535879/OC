//
//  Manage.h
//  homework09_19
//
//  Created by 古玉彬 on 15/9/19.
//  Copyright (c) 2015年 guyubin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LRC.h"
@interface Manage : NSString

@property (nonatomic,strong)LRC *lrc;
- (void) readLrcFromFile;
- (void) findLrcByTime:(int)m andM:(int)m andMs:(int)ms;
- (void) listAllLrc;
@end
