//
//  EPPlayer.h
//  TrueOrLie
//
//  Created by Eduard Pyatnitsyn on 27.12.13.
//  Copyright (c) 2013 Eduard Pyatnitsyn. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol EPPlayer <NSObject>
@required
- (void) playerWin;
@end

@interface EPPlayer : NSObject
@property NSInteger *score;
@property NSInteger *correctAnswer;

@end
