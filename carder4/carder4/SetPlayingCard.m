//
//  SetPlayingCard.m
//  Carder
//
//  Created by Michael Schack on 12.02.13.
//  Copyright (c) 2013 Michael Schack. All rights reserved.
//

#import "SetPlayingCard.h"

@implementation SetPlayingCard

@synthesize cardColor = _cardColor; // because we provide setter AND getter
@synthesize cardSymbol = _cardSymbol;
@synthesize cardShading = _cardShading;
@synthesize cardNumber = _cardNumber;

-(int)match:(NSArray *)otherCards
{
    int score=0;
    
    return score;
    
}

- (NSString *) contents
{
    return [NSString stringWithFormat:@"%@-%@-%@-%d",self.cardColor,self.cardSymbol,self.cardShading,self.cardNumber];
    
}


- (void)setCardColor:(NSNumber  *) cardColor
{
    if ( [[SetPlayingCard validCardColors] containsObject:cardColor]) {
        _cardColor = cardColor;
    }
}

- (NSNumber *)cardColor
{
    return _cardColor ? _cardColor : @-1;
}


- (void)setCardSymbol:(NSNumber *) cardSymbol
{
    if ( [[SetPlayingCard validCardSymbols] containsObject:cardSymbol]) {
        _cardSymbol = cardSymbol;
    }
}

- (NSNumber *) cardSymbol
{
    return _cardSymbol ? _cardSymbol : @-1;
}


-(void) setCardShading:(NSString *)cardShading
{
    if ( [[SetPlayingCard validCardShadings] containsObject:cardShading]) {
        _cardShading = cardShading;
    }
}

- (NSString *) cardShading
{
    return _cardShading ? _cardShading : @"?";
}


+ (NSArray *)cardNumberStrings
{
    return @[@"?",@"one",@"two",@"three"];
}

+ (NSUInteger)maxCardNumbers { return [self cardNumberStrings].count-1; }

- (void)setCardNumber:(NSUInteger)cardNumber
{
    if (cardNumber <= [SetPlayingCard maxCardNumbers]) {
        _cardNumber = cardNumber;
    }
}



+ (NSArray *)validCardColors
{
    return @[@1,@2,@3];
    
}

+ (NSArray *)validCardSymbols
{
    return @[@1,@2,@3];
}

+ (NSArray *) validCardShadings
{
    return @[@"solid", @"striped", @"open"];
}

@end
