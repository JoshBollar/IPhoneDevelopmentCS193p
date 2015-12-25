//
//  CardMatchingGame.h
//  Matchismo2
//
//  Created by Joshua Bollar on 12/25/15.
//  Copyright (c) 2015 Joshua Bollar. All rights reserved.
//

#ifndef Matchismo2_CardMatchingGame_h
#define Matchismo2_CardMatchingGame_h

#import <Foundation/Foundation.h>
#import "Deck.h"
@interface CardMatchingGame : NSObject

// the default initializer
- (instancetype) initWithCardCount:(NSUInteger) count usingDeck: (Deck *) deck;

- (void) chooseCardAtIndex:(NSUInteger) index;

- (Card *) cardAtIndex:(NSUInteger) index;

@property (nonatomic, readonly) NSInteger score;
@end


#endif

