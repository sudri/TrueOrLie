//
//  EPEndRound.m
//  TrueOrLie
//
//  Created by Eduard Pyatnitsyn on 07.01.14.
//  Copyright (c) 2014 Eduard Pyatnitsyn. All rights reserved.
//

#import "EPEndRound.h"

@implementation EPEndRound{
    UIColor *color;
}


- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setBackgroundColor:[UIColor clearColor]];
        self.opaque=NO;
        self.clearsContextBeforeDrawing=YES;
    }
    return self;
}

-(void)leftCorrect{
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width/2, self.frame.size.height)];
    imgView.image = [UIImage imageNamed:@"correct.png"];
    imgView.contentMode = UIViewContentModeCenter;
    [imgView setTransform:CGAffineTransformMakeRotation(M_PI/2)];
    [self addSubview:imgView];
    
    UIImageView *opponentImage = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width/2, 0, self.frame.size.width/2, self.frame.size.height)];
    opponentImage.image = [UIImage imageNamed:@"cross.png"];
    opponentImage.contentMode = UIViewContentModeCenter;
    [opponentImage setTransform:CGAffineTransformMakeRotation(-M_PI/2)];
    [self addSubview:opponentImage];
}

-(void) rightCorrect{
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width/2, 0, self.frame.size.width/2, self.frame.size.height)];
    imgView.image = [UIImage imageNamed:@"correct.png"];
    imgView.contentMode = UIViewContentModeCenter;
    [imgView setTransform:CGAffineTransformMakeRotation(-M_PI/2)];
    [self addSubview:imgView];
    
    UIImageView *opponentImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width/2, self.frame.size.height)];
    opponentImage.image = [UIImage imageNamed:@"cross.png"];
    opponentImage.contentMode = UIViewContentModeCenter;
    [opponentImage setTransform:CGAffineTransformMakeRotation(M_PI/2)];
    [self addSubview:opponentImage];
}

-(void) timesUp{
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width/2, 0, self.frame.size.width/2, self.frame.size.height)];
    imgView.image = [UIImage imageNamed:@"cross.png"];
    imgView.contentMode = UIViewContentModeCenter;
    [imgView setTransform:CGAffineTransformMakeRotation(-M_PI/2)];
    [self addSubview:imgView];
    
    UIImageView *opponentImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width/2, self.frame.size.height)];
    opponentImage.image = [UIImage imageNamed:@"cross.png"];
    opponentImage.contentMode = UIViewContentModeCenter;
    [opponentImage setTransform:CGAffineTransformMakeRotation(M_PI/2)];
    [self addSubview:opponentImage];
}

- (void)drawRect:(CGRect)rect
{
    //[self timesUp];
    
}


@end
