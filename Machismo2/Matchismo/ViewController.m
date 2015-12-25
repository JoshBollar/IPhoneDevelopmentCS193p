//
//  ViewController.m
//  Matchismo
//
//  Created by Joshua Bollar on 12/24/15.
//  Copyright (c) 2015 Joshua Bollar. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) CardMatchingGame * game;
@end

@implementation ViewController

- (CardMatchingGame *) game {
    if(!_game) {
        _game = [[CardMatchingGame alloc]
                 initWithCardCount:[self.cardButtons count]
                 usingDeck: [self createDeck]];
    }
    return _game;
}

- (Deck *) createDeck {
    return [[PlayingCardDeck alloc] init];
}

- (IBAction)touchCardButton:(UIButton *)sender
{
    int cardIndex = [self.cardButtons indexOfObject: sender];
    [self.game chooseCardAtIndex: cardIndex];
    [self updateUI];
}

-(void) updateUI {
    for(UIButton * cardButton in self.cardButtons) {
        int cardIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardIndex];
        [cardButton setTitle: [self titleForCard: card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage: [self backgroundImageForCard: card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
    }
    self.scoreLabel.text = [NSString stringWithFormat: @"Score: %d", self.game.score];
}

- (NSString *) titleForCard:(Card *) card {
    if(card.isChosen) {
        return card.contents;
    }
    return @"";
}

- (UIImage *) backgroundImageForCard:(Card *) card
{
    if(card.isChosen) {
        return [UIImage imageNamed: @"cardfront"];
    }
    return [UIImage imageNamed: @"cardback"];
}
@end
