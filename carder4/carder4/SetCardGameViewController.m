//
//  SetCardGameViewController.m
//  Carder
//
//  Created by Michael Schack on 11.02.13.
//  Copyright (c) 2013 Michael Schack. All rights reserved.
//

#import "SetCardGameViewController.h"
#import "SetCardGameDeck.h"
#import "SetPlayingCard.h"
#import "SetCardGame.h"

@interface SetCardGameViewController ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (strong, nonatomic) SetCardGame *gameset;



        
@end

@implementation SetCardGameViewController

-(SetCardGame *)gameset
{
    if (!_gameset) {
        
        _gameset = [[SetCardGame alloc] initWithCardCount:self.cardButtons.count usingDeck:[[SetCardGameDeck alloc] init]];
        NSLog(@"SetGame init with %d cards",self.cardButtons.count);
        
    }
    return _gameset;
    
}

- (NSString *)getSymbol: (NSNumber *)cardSymbol numberOfSymbols: (NSUInteger)cardNumber
{
    NSDictionary *cardSymbols = @{@1: @"●", @2: @"▲", @3: @"■"};
    NSMutableString *result = [[NSMutableString alloc] init];
    for (int i=1; i<=cardNumber;i++)
    {
        [result appendString:cardSymbols[cardSymbol]];
    }
    return result;
}

-(void)updateUI
{
    
    for (UIButton *cardButton in self.cardButtons)
    {
        SetPlayingCard *card = (SetPlayingCard *)[self.gameset cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
    
    NSLog(@" Symbol...: %@", [self getSymbol:card.cardSymbol numberOfSymbols:card.cardNumber]);
    
    
    
     {
        
         //[cardButton setAttributedTitle:self.cardContents forState:<#(UIControlState)#> forState:UIControlStateNormal];
         // [cardButton setTitle:@"●" forState:UIControlStateSelected];
        
         //[cardButton setAttributedTitle: cardContents forState:UIControlStateNormal];

        
        }
        //if ([card.cardSymbol compare:@"diamond"]) NSLog(@"▲");
        //if ([card.cardSymbol compare:@"squiggle"]) NSLog(@"■");
    


    
        [cardButton setTitle:[self getSymbol:card.cardSymbol numberOfSymbols:card.cardNumber] forState:UIControlStateSelected];
        [cardButton setTitle:[self getSymbol:card.cardSymbol numberOfSymbols:card.cardNumber] forState:UIControlStateNormal];
    

        // [cardButton setTitle:card.contents forState:UIControlStateSelected|UIControlStateDisabled];
        cardButton.selected = card.isFaceUp;
        cardButton.enabled = !card.isUnplayable;
        
        cardButton.alpha = card.isUnplayable ? 0.3 : 1.0;
        cardButton.alpha = card.isFaceUp ? 0.3 : 1.0;

        NSLog(@"%@", card.contents);
    }
    
    
}

- (IBAction)flipCard:(UIButton *)sender
{
    
    [self.gameset flipCardAtIndex:[self.cardButtons indexOfObject:sender]];
    [self updateUI];
    
}

-(void)setCardButtons:(NSArray *)cardButtons
{
    _cardButtons = cardButtons;
    
}



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view.
    
    [self updateUI];
    
}


@end
