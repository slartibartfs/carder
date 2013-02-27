//
//  SetCardGameDeck.m
//  Carder
//
//  Created by Michael Schack on 12.02.13.
//  Copyright (c) 2013 Michael Schack. All rights reserved.
//

#import "SetCardGameDeck.h"
#import "SetPlayingCard.h"

@implementation SetCardGameDeck

- (id)init
{
    self = [super init];
    if (self) {
        for (NSNumber *cardColor in [SetPlayingCard validCardColors]) {
            for (NSNumber *cardSymbol in [SetPlayingCard validCardSymbols]) {
                for (NSNumber *cardShading in [SetPlayingCard validCardShadings]) {
                    for (NSUInteger cardNumber=1; cardNumber <= [SetPlayingCard maxCardNumbers]; cardNumber++) {
                        SetPlayingCard *card = [[SetPlayingCard alloc] init];
                        card.cardColor = cardColor;
                        card.cardSymbol = cardSymbol;
                        card.cardShading = cardShading;
                        card.cardNumber = cardNumber;
                        [self addCard:card atTop:YES];
                            //NSLog(@"created: %@-%@-%@-%d",card.cardColor,card.cardSymbol,card.cardShading,card.cardNumber);
                        
                    }
                }
            }
        }
    }
    return self;
}



@end


