//
//  ViewController.m
//  Matchismo
//
//  Created by Joshua Bollar on 12/24/15.
//  Copyright (c) 2015 Joshua Bollar. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (strong, nonatomic) Deck * deck;
@property (nonatomic) int flipCount;
@end

@implementation ViewController

-(Deck *) deck {
    if(!_deck) {
        _deck = [self createDeck];
    }
    return _deck;
}

- (Deck *) createDeck {
    return [[PlayingCardDeck alloc] init];
}

- (void) setFlipCount: (int) flipCount {
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
}

- (IBAction)touchCardButton:(UIButton *)sender
{
    if ([sender.currentTitle length]) {
        UIImage * cardImage = [UIImage imageNamed:@"cardback"];
        [sender setBackgroundImage:cardImage forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
         self.flipCount++;
    } else {
        Card * card = [self.deck drawRandomCard];
        if(card) {
            UIImage * cardImage = [UIImage imageNamed:@"cardfront"];
            [sender setBackgroundImage:cardImage forState:UIControlStateNormal];
            [sender setTitle: card.contents forState:UIControlStateNormal];
            self.flipCount++;
        }
    }
   
}

@end
