//
//  CardGameViewController.m
//  Carder
//
//  Created by Michael Schack on 29.01.13.
//  Copyright (c) 2013 Michael Schack. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "PlayingCard.h"
#import "CardMatchingGame.h"
#import "GameResults.h"

@interface CardGameViewController ()

@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (strong, nonatomic) CardMatchingGame *game;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *resultOfLastFlipLabel;
@property (strong, nonatomic) GameResults *gameResults;


@end

@implementation CardGameViewController

-(GameResults *)gameResults
{
    if (!_gameResults) {
        _gameResults=[[GameResults alloc] init];
    }
    return _gameResults;
    
        
}



- (IBAction)dealButton:(id)sender {
    
    self.game = nil;
    self.flipCount = 0;
    self.gameResults = nil;

    [self updateUI];
}

-(CardMatchingGame *)game
{
    if (!_game) {
        
        _game = [[CardMatchingGame alloc] initWithCardCount:self.cardButtons.count
                                                  usingDeck:[[PlayingCardDeck alloc] init]];
        self.game.gameMode = 0;
        self.game.resultOfLastFlip = [NSString stringWithFormat:@" - "];

    }
    return _game;
    
}

-(void)setCardButtons:(NSArray *)cardButtons
{
    _cardButtons = cardButtons;
    [self updateUI];

}

-(void)updateUI
{
    UIImage *cardBackImage = [UIImage imageNamed:@"cardback.png"];

    for (UIButton *cardButton in self.cardButtons) {
        Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
        [cardButton setTitle:card.contents forState:UIControlStateSelected];
        [cardButton setTitle:card.contents forState:UIControlStateSelected|UIControlStateDisabled];
        cardButton.selected = card.isFaceUp;
        cardButton.enabled = !card.isUnplayable;
        if (!cardButton.selected)[cardButton setImage:cardBackImage forState:UIControlStateNormal]; else [cardButton setImage:nil forState:UIControlStateNormal];
        cardButton.alpha = card.isUnplayable ? 0.3 : 1.0;
        
    }


    
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
    self.resultOfLastFlipLabel.text = [NSString stringWithFormat:@"%@", self.game.resultOfLastFlip];
    if (self.game.gameOver)  self.resultOfLastFlipLabel.text = [NSString stringWithFormat:@"Game Over!"];
                                                                   
    
}

-(void)setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
}


- (IBAction)flipCard:(UIButton *)sender
{
    
    [self.game flipCardAtIndex:[self.cardButtons indexOfObject:sender]];
    self.flipCount++;
    self.gameResults.score = self.game.score;
    [self updateUI];
    
}

@end
