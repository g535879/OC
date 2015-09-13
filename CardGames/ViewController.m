//
//  ViewController.m
//  CardGames
//
//  Created by 古玉彬 on 15/9/10.
//  Copyright (c) 2015年 guyubin. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDesk.h"
#import "CardMatchingGame.h"

@interface ViewController ()
//@property (strong,nonatomic) Desk *desk;
//@property (nonatomic) int fipsCount;
@property (strong,nonatomic) CardMatchingGame *games;
@property (strong,nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@end

@implementation ViewController

- (CardMatchingGame *)games
{
    if(!_games){
        _games = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDesk:[self createDesk]];
    }
    return _games;
}
//- (Desk *)desk
//{
//    if(!_desk){
//        _desk = [self createDesk];
//    }
//    return _desk;
//}
-(Desk *)createDesk
{
    return [[PlayingCardDesk alloc] init];
}

//-(void) setFipsCount:(int)fipsCount
//{
//    
//    _fipsCount = fipsCount;
//
//        self.flipLabel.text = [NSString stringWithFormat:@"flips:%d",self.fipsCount];
//
//}

- (IBAction)touchCardButton:(UIButton *)sender {


//    if([sender.currentTitle length]){
//        [sender setBackgroundImage:[UIImage imageNamed:@"card_white_back"]
//                          forState:UIControlStateNormal];
//        [sender setTitle:@"" forState:UIControlStateNormal];
//        self.fipsCount++;
//    }else{
//        Card *card = [self.desk drawRandomCard];
//        if(card){
//            [sender setBackgroundImage:[UIImage imageNamed:@"front"]
//                              forState:UIControlStateNormal];
//            [sender setTitle:card.contants forState:UIControlStateNormal];
//            self.fipsCount++;      //先调用getter方法获取值，再通过setter方法赋值
//        }
//        
//    }
    NSUInteger chosenButtonIndex = [self.cardButtons indexOfObject:sender]; //获取点击卡牌的在cardButtons的index
    NSLog(@"%d",(int)chosenButtonIndex);
    [self.games chooseCardAtIndex:chosenButtonIndex];
    [self updataUI];
//    self.fipsCount++;

    
}

- (void)updataUI{
    for(UIButton *cardButton in self.cardButtons){
        NSUInteger cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.games cardAtIndex:cardButtonIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
        self.scoreLabel.text = [NSString stringWithFormat:@"Score:%d",(int)self.games.score];
    }

   }

- (NSString *)titleForCard:(Card *)card
{
    return card.isChosen ? card.contants : @"";
}

-(UIImage *)backgroundForCard:(Card *)card
{
    return [UIImage imageNamed:card.isChosen ? @"front" : @"card_white_back"];
}
@end
