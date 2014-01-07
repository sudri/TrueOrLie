//
//  EPGameViewController.m
//  TrueOrLie
//
//  Created by Eduard Pyatnitsyn on 27.12.13.
//  Copyright (c) 2013 Eduard Pyatnitsyn. All rights reserved.
//

#import "EPGameViewController.h"
#import "EPEndRound.h"

@interface EPGameViewController (){
    NSTimer *timer,*splashTimer;
    NSDictionary *question;
    EPEndRound *splash;
    int leftScore,rightScore;
    char winner;
}

@end

@implementation EPGameViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    winner = '4';
	// Do any additional setup after loading the view.
    [_topLabel setTransform:CGAffineTransformMakeRotation(M_PI)];
    [_leftLabel setTransform:CGAffineTransformMakeRotation(M_PI/2)];
    [_rightLabel setTransform:CGAffineTransformMakeRotation(-M_PI/2)];
    //[_leftLabel setTransform: CGAffineTransformMakeRotation(M_PI/2)];
    [_topYesBtn setTransform:CGAffineTransformMakeRotation(M_PI)];
    [_topNoBtn setTransform:CGAffineTransformMakeRotation(M_PI)];
    [_leftNoBtn setTransform:CGAffineTransformMakeRotation(M_PI/2)];
    [_leftYesBtn setTransform:CGAffineTransformMakeRotation(M_PI/2)];
    [_rightNoBtn setTransform:CGAffineTransformMakeRotation(-M_PI/2)];
    [_rightYesBtn setTransform:CGAffineTransformMakeRotation(-M_PI/2)];
    [_rightScoreLabel setTransform:CGAffineTransformMakeRotation(-M_PI/2)];
    [_leftScoreLabel setTransform:CGAffineTransformMakeRotation(M_PI/2)];
    [self.view setBackgroundColor:[UIColor colorWithRed:0.600 green:1.000 blue:0.600 alpha:1.000]];
    //    UIView *splitLine = [[UIView alloc] initWithFrame:CGRectMake((self.view.frame.size.width/2)-2, 0, 5, self.view.frame.size.height)];
    //    splitLine.backgroundColor= [UIColor colorWithRed:0.600 green:1.000 blue:0.600 alpha:1.000];
    //    [self.view addSubview:splitLine];
    leftScore              = 0;
    rightScore             = 0;
    [self nextQuestion];
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}


-(void) changeScore{
    _leftScoreLabel.text=[NSString stringWithFormat:@"%i",leftScore];
    _rightScoreLabel.text=[NSString stringWithFormat:@"%i",rightScore];
    [_circle setScore:leftScore :rightScore];

}


-(void) tick {
    if ([_circle percent]<100) {
        [_circle setPercent:[_circle percent]+1];
    }else{
        leftScore--;
        rightScore--;
        winner = '0';
        [self changeScore];
        [self nextQuestion];
    }
}


-(void) nextQuestion{
    [self changeScore];
    if (timer != nil) {
        [timer invalidate];
        timer = nil;
    }
    splash = [[EPEndRound alloc] initWithFrame:self.view.frame];

    switch (winner) {
        case '1':
            [splash leftCorrect];
            break;
        case '2':
            [splash rightCorrect];
            break;
        case '0':
            [splash timesUp];
            break;
        default:
            break;
    }
    [self.view addSubview:splash];
    splashTimer = [NSTimer scheduledTimerWithTimeInterval:2.0
                                                           target:self
                                                         selector:@selector(splashTick)
                                                         userInfo:nil
                                                          repeats:NO];
}


-(void) splashTick{
    if (_leftLabel.isHidden){
        _leftLabel.hidden = NO;
        _rightLabel.hidden = NO;
    }
    [splashTimer invalidate];
    splashTimer = nil;
    [splash removeFromSuperview];
    winner = '3';
    NSString *file         = [[NSBundle mainBundle] pathForResource:@"question" ofType:@"plist"];
    //NSDictionary *questionsDict = [NSDictionary dictionaryWithContentsOfFile:file];
    NSArray *questionArray = [NSArray arrayWithContentsOfFile:file];
    question               = [questionArray objectAtIndex:(arc4random()%[questionArray count])];
    _leftLabel.text        = [question objectForKey:@"0"];
    _rightLabel.text       = [question objectForKey:@"0"];
    [_circle setPercent:0];
    timer                  = [NSTimer scheduledTimerWithTimeInterval:0.1
                                                              target:self
                                                            selector:@selector(tick)
                                                            userInfo:nil
                                                             repeats:YES];
    _leftNoBtn.enabled = YES;
    _leftYesBtn.enabled = YES;
    _rightNoBtn.enabled = YES;
    _rightYesBtn.enabled = YES;
}

- (IBAction)leftYes:(id)sender {
    if ([[question objectForKey:@"1"] boolValue] == YES){
        leftScore++;
        winner = '1';
        [self nextQuestion];
    }else{
        leftScore--;
        [self changeScore];
        if (_rightNoBtn.enabled != NO){
            _leftNoBtn.enabled = NO;
            _leftYesBtn.enabled = NO;
        }else{
            winner = '0';
            [self nextQuestion];
        }
    }
}

- (IBAction)leftNo:(id)sender {
    if ([[question objectForKey:@"1"] boolValue] == NO){
        leftScore++;
        winner = '1';
        [self changeScore];
        [self nextQuestion];
    }else{
        leftScore--;
        [self changeScore];
        if (_rightNoBtn.enabled != NO){
            _leftNoBtn.enabled = NO;
            _leftYesBtn.enabled = NO;
        }else{
            winner = '0';
            [self nextQuestion];
        }
    }
}

- (IBAction)rightYes:(id)sender {
    if ([[question objectForKey:@"1"] boolValue] == YES){
        rightScore++;
        winner = '2';
        [self changeScore];
        [self nextQuestion];
    }else{
        rightScore--;
        [self changeScore];
        if (_leftNoBtn.enabled !=NO){
            _rightNoBtn.enabled = NO;
            _rightYesBtn.enabled = NO;
        }else{
            winner = '0';
            [self nextQuestion];
        }
    }
}

- (IBAction)rightNo:(id)sender {
    if ([[question objectForKey:@"1"] boolValue] == NO){
        rightScore++;
        winner = '2';
        [self changeScore];
        [self nextQuestion];
    }else{
        rightScore--;
        [self changeScore];
        if (_leftNoBtn.enabled !=NO){
            _rightNoBtn.enabled = NO;
            _rightYesBtn.enabled = NO;
        }else{
            winner = '0';
            [self nextQuestion];
        }
    }
}
@end
