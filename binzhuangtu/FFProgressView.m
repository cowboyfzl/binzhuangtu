//
//  FFProgressView.m
//  binzhuangtu
//
//  Created by blm on 2019/1/2.
//  Copyright © 2019 BLM. All rights reserved.
//

#import "FFProgressView.h"

@interface FFProgressView ()
@property (nonatomic, strong) UILabel *progressLabel;
@end

static NSInteger const DefaultWidth = 10;
static NSInteger const DefaultRadius = DefaultWidth / 2;
static CFTimeInterval const Defaultduration = 1;
@implementation FFProgressView

+ (instancetype)progressView {
    return [self new];
}

- (void)setCurrentProgress:(CGFloat)currentProgress {
    [self layoutIfNeeded];
    [self.layer removeFromSuperlayer];
    _currentProgress = currentProgress;
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self->_currentProgress < 0) {
            self->_currentProgress = 0;
        }
        
        if (self->_currentProgress > 1.0) {
            self->_currentProgress = 1.0;
        }
        
        
        self.radius = self.radius ?: DefaultRadius;
        self.progressWidth = self.progressWidth ?: DefaultWidth;
        self.bgColor = self.bgColor ?: [UIColor lightGrayColor];
        self.progressColor = self.progressColor ?: [UIColor redColor];
        self.duration = self.duration ?: Defaultduration;
        self.lableFont = self.lableFont ?: [UIFont systemFontOfSize:14];
        self.lableColor = self.lableColor ?: [UIColor blackColor];
        
        CGFloat start = -M_PI_2;
        CGFloat end = -M_PI_2;
        CGFloat angle = 0;
        CGFloat bgValue = 1.0 - currentProgress;
        NSArray *values = @[@(currentProgress),@(bgValue)];
        CGFloat radius = self.bounds.size.width / 2 - self.radius;
        CGPoint point = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
        
        for (NSInteger i = 0; i < values.count; i++) {
            start = end;
            angle = M_PI * 2 * [values[i]floatValue];
            end = start + angle;
            UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:point radius:radius startAngle:start endAngle:end clockwise:true];
            CAShapeLayer *layer = [CAShapeLayer layer];
            layer.fillColor = [UIColor clearColor].CGColor;
            layer.lineWidth = self.progressWidth;
            layer.lineCap = kCALineCapRound;
            layer.strokeColor = i == 0 ? self.progressColor.CGColor : self.bgColor.CGColor;
            layer.path = path.CGPath;
            layer.strokeEnd = 0;
            [self.layer insertSublayer:layer atIndex:0];
            CABasicAnimation *animate = [self pathBasicAnimate];
            [layer addAnimation:animate forKey:@""];
        }
        
        self.progressLabel.font = self.lableFont;
        self.progressLabel.textColor = self.lableColor;
        self.progressLabel.text = [NSString stringWithFormat:@"%.0f%@", self->_currentProgress * 100, @"%"];
        [self.progressLabel sizeToFit];
        self.progressLabel.center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
    });
}

- (CABasicAnimation *)pathBasicAnimate {
    CABasicAnimation *animate = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animate.removedOnCompletion = NO;
    animate.duration = _duration;
    animate.fillMode = kCAFillModeForwards;
    animate.toValue = @1;
    return animate;
}

- (UILabel *)progressLabel {
    if (!_progressLabel) {
        _progressLabel = [[UILabel alloc]init];
        _progressLabel.textColor = [UIColor blackColor];
        _progressLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_progressLabel];
    }
    
    return _progressLabel;
}

@end
