//
//  PlayingCardDesk.m
//  CardGames
//
//  Created by 古玉彬 on 15/9/11.
//  Copyright (c) 2015年 guyubin. All rights reserved.
//

#import "PlayingCardDesk.h"
#include "PlayingCard.h"
@implementation PlayingCardDesk
- (instancetype) init
{
    self = [super init];
    if(self){
        for(int rank = 1; rank <= [PlayingCard maxRank]; rank++){
            for(NSUInteger suit = 0; suit < [[PlayingCard vaildSuits] count]; suit++){
                PlayingCard *card = [[PlayingCard alloc]init];
                card.rank = rank;
                card.suit = [PlayingCard vaildSuits][suit];
                [self addCard:card];
            }
        }
    }
    return self;
}
@end
