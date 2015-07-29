//
//  Card.h
//  CardMatching
//
//  Created by Joshua Bollar on 7/27/15.
//  Copyright (c) 2015 Joshua Bollar. All rights reserved.
//

#ifndef CardMatching_Card_h
#define CardMatching_Card_h

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;
@property (nonatomic, getter=isChosen) BOOL chosen;
@property (nonatomic, getter=isMatched) BOOL matched;

- (int)match:(Card *)card;
- (int)matchMany:(NSArray *)otherCards;
@end
#endif
