//
//  ViewController.m
//  CardMatching
//
//  Created by Joshua Bollar on 7/27/15.
//  Copyright (c) 2015 Joshua Bollar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) Deck * deckOfCards;
@end

@implementation ViewController

-(Deck *) deckOfCards
{
    if(!_deckOfCards) _deckOfCards = [[PlayingCardDeck alloc] init];
    return _deckOfCards;
}

- (void) setFlipCount: (int) flipCount
{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat: @"Flips: %d", self.flipCount];
    NSLog(@"flipCount = %d", self.flipCount);
}

- (IBAction)touchCardButton:(UIButton *)sender
{
    if([sender.currentTitle length]) {
        [sender setBackgroundImage: [UIImage imageNamed: @"cardback"]
                          forState: UIControlStateNormal];
        [sender setTitle: @"" forState: UIControlStateNormal];
    }
    else {
        [sender setBackgroundImage: [UIImage imageNamed: @"cardfront"]
                          forState: UIControlStateNormal];
        
        Card * drawnCard = [self.deckOfCards drawRandomCard];
        if(drawnCard != nil) {
            [sender setTitle: drawnCard.contents forState: UIControlStateNormal];
        }
        else {
            [sender setTitle: @"FIN" forState: UIControlStateNormal];
        }
        
    }
    self.flipCount++;
}

@end
