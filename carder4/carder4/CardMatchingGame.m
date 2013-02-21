//
//  CardMatchingGame.m
//  Carder
//
//  Created by Michael Schack on 01.02.13.
//  Copyright (c) 2013 Michael Schack. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (strong, nonatomic) NSMutableArray *cards;
@property (strong, nonatomic) NSMutableArray *otherCards;
@property (nonatomic) int score;


@end

@implementation CardMatchingGame

-(NSMutableArray *)cards
{
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
        
    }
    return _cards;
}

-(NSMutableArray *)otherCards
{
    if (!_otherCards) {
        _otherCards = [[NSMutableArray alloc] init];
        
    }
    return _otherCards;
}

-(id)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck
{
    self = [super init];
    if (self) {
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if (!card) {
                self = nil;
            } else {
                self.cards[i] = card;
            }
        }
        
    }
    return self;
}

- (Card *)cardAtIndex:(NSUInteger)index
{
    return (index < self.cards.count) ? self.cards[index] : nil;
}

#define MISMATCH_PENALTY 2
#define MATCH_BONUS 4
#define FLIP_COST 1

-(void)flipCardAtIndex:(NSUInteger)index
{
    
    Card *card = [self cardAtIndex:index];
    int otherCardCount = 0;
    
    if (!card.isUnplayable) {
        if (!card.isFaceUp) {
            self.score -= FLIP_COST;
            self.resultOfLastFlip = [NSString stringWithFormat:@"%@ flipped @ cost of %d", card.contents, FLIP_COST];
            for (Card *otherCard in self.cards) {
                if (otherCard.isFaceUp && !otherCard.isUnplayable) {
                    self.otherCards[otherCardCount] = otherCard;
                    otherCardCount++;
                }
            }
            NSLog(@"gameMode: %d, otherCardCount: %d",self.gameMode,otherCardCount);
            if ((self.gameMode==0 && otherCardCount==1) | (otherCardCount>1) )
            {
                NSLog(@"Match called");
                int matchScore = [card match:self.otherCards];
                NSLog(@"matchscore: %d",matchScore);
                if (matchScore)
                {
                    NSLog(@"scored");
                    card.unplayable=YES;
                    for (Card *sampleCard in self.otherCards)
                    {
                        sampleCard.unplayable = YES;
                    }
                    self.score += matchScore * MATCH_BONUS;
                    self.resultOfLastFlip = [NSString stringWithFormat:@"scored %d!", matchScore * MATCH_BONUS];
                } else
                {
                    for (Card *sampleCard in self.otherCards)
                    {
                        sampleCard.faceUp = NO;
                    }
                    self.score -= MISMATCH_PENALTY;
                    self.resultOfLastFlip = [NSString stringWithFormat:@"Penalty %d", MISMATCH_PENALTY];
                }
            }

        }
        card.faceUp = !card.isFaceUp;
        NSLog(@"------card flipped------- %@",card.contents);
    }
}

@end