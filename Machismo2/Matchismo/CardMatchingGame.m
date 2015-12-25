//
//  CardMatchingGame.m
//  Matchismo2
//
//  Created by Joshua Bollar on 12/25/15.
//  Copyright (c) 2015 Joshua Bollar. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards; // of Card


@end

@implementation CardMatchingGame

static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;

- (NSMutableArray *) cards {
    if(!_cards)
        _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (instancetype) initWithCardCount:(NSUInteger) count
                         usingDeck:(Deck *) deck {
    self = [super init];
    if(self) {
        for(int i = 0; i < count; i++) {
            Card * card = [deck drawRandomCard];
            if(card) {
                [self.cards addObject: card];
            } else {
                self = nil;
                break;
            }
        }
    }
    return self;
}

-(void) chooseCardAtIndex:(NSUInteger)index {
    Card *card = [self cardAtIndex:index];
    if(!card.isMatched) {
        if(card.isChosen) {
            card.chosen = NO;
        } else {
            for(Card * otherCard in _cards) {
                if(otherCard.isChosen && !otherCard.isMatched) {
                    int matchScore = [card  match:@[otherCard]];
                    if(matchScore) {
                        self.score += matchScore * MATCH_BONUS;
                        card.matched = true;
                        otherCard.matched = true;
                    } else {
                        self.score -= MISMATCH_PENALTY;
                        otherCard.chosen = false;
                    }
                    break;
                }
            }
            self.score -= COST_TO_CHOOSE;
            card.chosen = true;
        }
    }
}

- (Card *) cardAtIndex:(NSUInteger)index {
    if(index < _cards.count) {
        return self.cards[index];
    }
    return nil;
}

- (instancetype) init {
    return nil;
}
@end