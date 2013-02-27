//
//  SetCardGame.m
//  Carder
//
//  Created by Michael Schack on 11.02.13.
//  Copyright (c) 2013 Michael Schack. All rights reserved.
//

#import "SetCardGame.h"

@interface SetCardGame()
@property (strong, nonatomic) NSMutableArray *cards;
@property (strong, nonatomic) NSMutableArray *otherCards;
@property (nonatomic) int score;

@end

@implementation SetCardGame

- (int) checkIfGameIsOver:(SetCardGame *) gameSet;
{
    int possibilitiesLeft=0;
    
    /*
    for (Card *firstCard in self.cards) {
        for (Card *secondCard in self.cards) {
            for (Card *thirdCard in self.cards) {
                if (!(firstCard ))
            }
        }
        
        }

    */
    
    
    if (possibilitiesLeft>0)return possibilitiesLeft; else return FALSE;
}

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

-(NSMutableArray *)recentlyPlayedCards
{
    if (!_recentlyPlayedCards) {
        _recentlyPlayedCards = [[NSMutableArray alloc] init];
        
    }
    return _recentlyPlayedCards;
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
            [self.recentlyPlayedCards addObject:card];
            if ([self.recentlyPlayedCards count]>3) [self.recentlyPlayedCards removeObjectAtIndex:0];
            
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
            
        } else [self.recentlyPlayedCards removeLastObject];
        card.faceUp = !card.isFaceUp;
        NSLog(@"------card flipped------- %@",card.contents);
        NSLog(@"recently played (%d): ",self.recentlyPlayedCards.count);
        
        for (Card *rcard in self.recentlyPlayedCards) NSLog(@" %@ ",rcard.contents);
        
        if ([self checkIfGameIsOver:self]) NSLog(@"Game over");
        
    }
}


@end
