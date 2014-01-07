//
//  CircleTimer.m
//  TrueOrLie
//
//  Based from Po-Pomodoro by Nikita Kolmogorov.

#import <UIKit/UIKit.h>

@interface EPCircleTimer : UIView
@property float percent;
@property BOOL reverse;

-(void) setScore:(NSInteger) firstScore :(NSInteger) secondScore;
@end
