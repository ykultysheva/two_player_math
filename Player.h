//
//  Player.h
//  player_math
//
//  Created by Yana Kultysheva on 2016-07-05.
//  Copyright © 2016 Yana Kultysheva. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

@property NSInteger score;
@property NSInteger answer;
@property NSString *name;

-(instancetype)initWithScore:(NSInteger)score;

@end
