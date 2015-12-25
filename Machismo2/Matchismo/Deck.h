//
//  Deck.h
//  Matchismo
//
//  Created by Joshua Bollar on 12/25/15.
//  Copyright (c) 2015 Joshua Bollar. All rights reserved.
//

#ifndef Matchismo_Deck_h
#define Matchismo_Deck_h


#endif

#import "Card.h"

@interface Deck : NSObject

-(void) addCard: (Card *) card atTop: (BOOL) atTop;
-(void) addCard: (Card *) card;

-(Card *) drawRandomCard;
@end