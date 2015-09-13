//
//  PlayingCard.h
//  CardGames
//
//  Created by 古玉彬 on 15/9/11.
//  Copyright (c) 2015年 guyubin. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "Card.h"
@interface PlayingCard : Card
@property (strong,nonatomic)NSString *suit;
@property (nonatomic) NSUInteger rank;
+ (NSUInteger) maxRank;
+ (NSArray *) vaildSuits;
@end
