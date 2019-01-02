//
//  JumpView.m
//  binzhuangtu
//
//  Created by blm on 2018/11/30.
//  Copyright © 2018 BLM. All rights reserved.
//

#import "JumpView.h"

@interface JumpView() <UIGestureRecognizerDelegate>
@property (nonatomic, strong) NSArray *contents;
@property (nonatomic, assign) CGPoint position;
@property (nonatomic, strong) TapBlock tapBlock;
@end

@implementation JumpView

+ (JumpView *)jumpViewShowWithContents:(NSArray <JumpViewModel *> *)contents position:(CGPoint)position tapBlock:(TapBlock)tapBlock{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    JumpView *view = [[JumpView alloc]initWithFrame:window.bounds];
    view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    view.contents = contents;
    view.position = position;
    view.tapBlock = tapBlock;
    return view;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(bgTap)];
        tapGR.delegate = self;
        [self addGestureRecognizer:tapGR];
    }
    return self;
}

- (void)bgTap {
    [self hide];
}

- (void)show {
    if (!_jumpDistance) {
        _jumpDistance = 100;
    }
    
    if (!_showViewSize) {
        _showViewSize = 50;
    }
    
    if (_position.y + _showViewSize > [UIScreen mainScreen].bounds.size.height) {
        _position.y = [UIScreen mainScreen].bounds.size.height - _showViewSize;
    }
    
    if (_position.y + _showViewSize <= _showViewSize) {
        _position.y = _showViewSize;
    }
    
    if (_position.x + _showViewSize > [UIScreen mainScreen].bounds.size.width) {
        _position.x = [UIScreen mainScreen].bounds.size.width - _showViewSize;
    }
    
    if (_position.x + _showViewSize <= _showViewSize) {
        _position.x = _showViewSize;
    }
    
    NSInteger i = 1;
    for (JumpViewModel *model in _contents) {
        UIView *showView = [[UIView alloc]init];
        showView.center = _position;
        showView.bounds = CGRectMake(0, 0, _showViewSize, _showViewSize);
        showView.layer.cornerRadius = _showViewSize / 2;
        showView.layer.masksToBounds = true;
        showView.center =  CGPointMake(360 * cos(M_PI / 2 * i / _contents.count), 360 * sin(M_PI / 2 * i / _contents.count));
        //360 * (float)Math.cos(Pi /2 * position /3
        showView.backgroundColor = [UIColor colorWithRed:arc4random() % 255 / 255.0 green:arc4random() % 255 / 255.0 blue:arc4random() % 255 / 255.0 alpha:1];
        [self addSubview:showView];
        i += 1;
    }
}

- (void)hide {
    [UIView animateWithDuration:0.2 animations:^{
        self.alpha = 0.2;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    return [touch.view isEqual:self];
}


@end
