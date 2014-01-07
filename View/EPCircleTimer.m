//
//  CircleTimer.m
//  TrueOrLie
//
//  Based from Po-Pomodoro by Nikita Kolmogorov.


#import "EPCircleTimer.h"
#define lineWidth 10

@implementation EPCircleTimer{
    UILabel *leftScore,*rightScore;
    UIColor *color;
}

@synthesize percent;

-(void) setScore:(NSInteger)firstScore :(NSInteger)secondScore{
    leftScore.text = [NSString stringWithFormat:@"%ld", (long)firstScore];
    rightScore.text = [NSString stringWithFormat:@"%ld", (long)secondScore];
}

#pragma mark - Accessors -

- (void)setPercent:(float)newPercent {
    percent = newPercent / 2;
    [self setNeedsDisplay];
}

- (float)percent {
    return percent * 2;
}
#pragma mark - View life cycle -

- (void)awakeFromNib
{
    [super awakeFromNib];
    leftScore = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width/4, self.frame.size.height/4, self.frame.size.width/4, self.frame.size.height/2 + 2* lineWidth)];
    leftScore.backgroundColor = [UIColor clearColor];
    leftScore.textColor=[UIColor redColor];
    leftScore.text = @"0";
    [leftScore setTransform:CGAffineTransformMakeRotation(M_PI/2)];
    [self addSubview:leftScore];
    
    rightScore = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width/2, self.frame.size.height/4, self.frame.size.width/4, self.frame.size.height/2 - 2* lineWidth)];
    rightScore.backgroundColor = [UIColor clearColor];
    rightScore.textColor=[UIColor redColor];
    rightScore.text = @"0";
    [rightScore setTransform:CGAffineTransformMakeRotation(-M_PI/2)];
    [self addSubview:rightScore];
    
    color = self.backgroundColor;
    self.backgroundColor = [UIColor clearColor];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, lineWidth);
    
    CGContextBeginPath(context);
    CGContextAddArc(context, self.frame.size.width/2, self.frame.size.height/2, self.frame.size.width/2-lineWidth/2, 0, 2*M_PI, YES);
    CGContextClosePath(context);
    
    CGContextSetStrokeColorWithColor(context, color.CGColor);
    CGContextDrawPath(context, kCGPathStroke);
    
    CGContextSetLineWidth(context, lineWidth/2);
    CGContextBeginPath(context);
    float start = (self.reverse) ? 3*M_PI_2 : 2*M_PI*(percent/100.0f)-M_PI_2;
    float end = (self.reverse) ? 2*M_PI*(percent/100.0f)-M_PI_2 : -M_PI_2;
    
    CGContextAddArc(context, self.frame.size.width/2, self.frame.size.height/2, self.frame.size.width/2-lineWidth/2, start, end, YES);
    CGContextSetStrokeColorWithColor(context, [UIColor colorWithRed:0.000 green:0.400 blue:1.000 alpha:1.000].CGColor);
    CGContextDrawPath(context, kCGPathStroke);
    
    start = (self.reverse) ? 3*M_PI_2 : 2*M_PI*(percent/100.0f)+M_PI_2;
    end = (self.reverse) ? 2*M_PI*(percent/100.0f)+M_PI_2 : +M_PI_2;
    
    CGContextAddArc(context, self.frame.size.width/2, self.frame.size.height/2, self.frame.size.width/2-lineWidth/2, start, end, YES);
    CGContextSetStrokeColorWithColor(context, [UIColor colorWithRed:0.000 green:0.400 blue:1.000 alpha:1.000].CGColor);
    CGContextDrawPath(context, kCGPathStroke);
}



@end
