//
//  PlayingCard.m
//  CardGames
//
//  Created by 古玉彬 on 15/9/11.
//  Copyright (c) 2015年 guyubin. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard
@synthesize suit = _suit;
- (NSString *) contants
{
    return [[[PlayingCard rankString] objectAtIndex:self.rank] stringByAppendingString:self.suit];
}

- (void) setSuit:(NSString *)suit
{
    if([[PlayingCard vaildSuits] containsObject:suit]){
        _suit = suit;
    }
}
- (NSString *) suit
{
    return _suit;
}

+ (NSArray *) rankString
{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+ (NSArray *) vaildSuits
{
    return @[@"♠︎",@"♣︎",@"♥︎",@"♦︎"];
}

+ (NSUInteger) maxRank
{
    return [[PlayingCard rankString] count]-1;
}

- (int)match:(NSArray *)otherCards
{
    int score = 0;
    if([otherCards count] == 1){
        id card = [otherCards firstObject];
        if([card isKindOfClass:[PlayingCard class]]){
            PlayingCard *otherCard = (PlayingCard *)card;
            if([self.suit isEqualToString:otherCard.suit]){
                score = 1;
            }
            else if(self.rank == otherCard.rank){
                score = 3;
            }
        }
        
    }
    return score;
}
@end
