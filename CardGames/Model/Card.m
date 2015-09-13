//
//  Card.m
//  CardGames
//
//  Created by 古玉彬 on 15/9/10.
//  Copyright (c) 2015年 guyubin. All rights reserved.
//

#import "Card.h"

@implementation Card
- (int)match:(NSArray *)otherCards
{
    int scorce = 0;
    if([otherCards count] == 1){
        Card *card = [otherCards firstObject];
        if([self.contants isEqualToString: card.contants]){
            scorce = 1;
        }
    }
    
    return scorce;
}
@end
