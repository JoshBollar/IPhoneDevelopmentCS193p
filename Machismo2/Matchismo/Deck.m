//
//  Deck.m
//  Matchismo
//
//  Created by Joshua Bollar on 12/25/15.
//  Copyright (c) 2015 Joshua Bollar. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Deck.h"

@interface Deck()
@property(strong, nonatomic) NSMutableArray *cards; // of Card
@end

@implementation Deck


- (NSMutableArray *) cards
{
    if(!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

-(void) addCard:(Card *) card atTop: (BOOL) atTop {
    if(atTop) {
        [self.cards insertObject:card atIndex: 0];
    } else {
        [self.cards addObject: card];
    }
}

-(void) addCard:(Card *) card {
    [self addCard: card atTop: NO];
}

-(Card *) drawRandomCard {
    Card *randomCard = nil;
    
    if([self.cards count]) {
        unsigned index = arc4random() % [self.cards count];
        randomCard = self.cards[index];
        [self.cards removeObjectAtIndex:index];
    }
    
    return randomCard;
}



@end