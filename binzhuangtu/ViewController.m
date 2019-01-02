//
//  ViewController.m
//  binzhuangtu
//
//  Created by blm on 2018/11/29.
//  Copyright © 2018 BLM. All rights reserved.
//

#import "ViewController.h"
#import <CoreText/CoreText.h>
#import "FFProgressView.h"

@interface ViewController ()
@property (nonatomic, strong) NSMutableArray *modelArray;
@property (nonatomic, strong) NSMutableArray *colorArray;
@property (nonatomic, strong) FFProgressView *progressview;
@end
static NSInteger Max = 6;
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _progressview = [FFProgressView progressView];
    _progressview.frame = CGRectMake(100, 100, 100, 100);
    _progressview.currentProgress = 0.3;
    _progressview.lableColor = [UIColor blueColor];
    [self.view addSubview:_progressview];
//    CGFloat start = -M_PI_2;
//    CGFloat end = -M_PI_2;
//    CGFloat angle = 0;
//    NSArray *values = @[@(0.2),@(0.8)];
//    CGFloat radius = self.view.bounds.size.width / 2 - 80;
//    CGPoint point = CGPointMake(self.view.bounds.size.width / 2, self.view.bounds.size.height / 2);
////    NSMutableArray *pointArray = [NSMutableArray array];
////    NSMutableArray *centerArray = [NSMutableArray array];
////    self.modelArray = [NSMutableArray array];
////    self.colorArray = [NSMutableArray array];
//
//    for (NSInteger i = 0; i < values.count; i++) {
//        start = end;
//        angle = M_PI * 2 * [values[i]floatValue];
//        end = start + angle;
//
//        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:point radius:radius startAngle:start endAngle:end clockwise:true];
//
//        //[path addLineToPoint:point];
//
//        UIColor *color = [UIColor colorWithRed: (arc4random() % 255 / 255.0) green: (arc4random() % 255 / 255.0 )  blue:  (arc4random() % 255) / 255.0  alpha:1];
//
//        CAShapeLayer *layer = [CAShapeLayer layer];
//        layer.fillColor = [UIColor clearColor].CGColor;
//        layer.lineWidth = 10;
//        layer.lineCap = kCALineCapRound;
//        layer.lineJoin = kCALineJoinRound;
//        layer.strokeColor = color.CGColor;
//        layer.path = path.CGPath;
//        layer.strokeEnd = 0;
//        [self.view.layer addSublayer:layer];
//        CABasicAnimation *animate = [self pathBasicAnimate];
//        [layer addAnimation:animate forKey:@""];
//    }
       // CGFloat radianCenter = (start + end) * 0.5;
        
        
        // 获取指引线的起点
//        CGFloat lineStartX = self.view.frame.size.width * 0.5 + radius * cos(radianCenter);
//        CGFloat lineStartY = self.view.frame.size.height * 0.5 + radius * sin(radianCenter);
//
//
//        CGPoint linePoint = CGPointMake(lineStartX, lineStartY);
        // Do any additional setup after loading the view, typically from a nib.
//        if (i <= Max / 2 - 1) {
//            [pointArray insertObject:[NSValue valueWithCGPoint:linePoint] atIndex:0];
//            [centerArray insertObject:[NSNumber numberWithFloat:radianCenter] atIndex:0];
//            [self.modelArray insertObject:values[i] atIndex:0];
//            [self.colorArray insertObject:color atIndex:0];
//        } else {
//            [pointArray addObject:[NSValue valueWithCGPoint:linePoint]];
//            [centerArray addObject:[NSNumber numberWithFloat:radianCenter]];
//            [self.modelArray addObject:values[i]];
//            [self.colorArray addObject:color];
//        }
//
//    }
//
//    [self drawLineWithPointArray:pointArray centerArray:centerArray];
    
//    UIView *contentView = [[UIView alloc]init];
//    contentView.center = point;
//    contentView.bounds = CGRectMake(0, 0, 100, 100);
//    contentView.backgroundColor = [UIColor whiteColor];
//    contentView.layer.cornerRadius = 100 / 2;
//    contentView.layer.masksToBounds = true;
//    [self.view addSubview:contentView];
//
//    UILabel *lable = [[UILabel alloc]init];
//    lable.frame = CGRectMake(0, 0, contentView.bounds.size.width, contentView.bounds.size.height);
//    lable.textAlignment = NSTextAlignmentCenter;
//    lable.textColor = [UIColor blackColor];
//    [contentView addSubview:lable];
//    lable.text = @"哈哈哈哈";
}

- (CABasicAnimation *)pathBasicAnimate
{
    CABasicAnimation *animate = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animate.removedOnCompletion = NO;
    animate.duration = 0.5;
    animate.fillMode = kCAFillModeForwards;
    animate.toValue = @1;
    return animate;
}

- (void)drawLineWithPointArray:(NSArray *)pointArray centerArray:(NSArray *)centerArray {
    
    // 记录每一个指引线包括数据所占用位置的和（总体位置）
    CGRect rect = CGRectZero;
    
    // 用于计算指引线长度
    CGFloat width = self.view.bounds.size.width * 0.5;
    
    for (int i = 0; i < pointArray.count; i++) {
        
        // 取出数据
        NSValue *value = pointArray[i];
        
        // 每个圆弧中心店的位置
        CGPoint point = value.CGPointValue;
        
        // 每个圆弧中心点的角度
        CGFloat radianCenter = [centerArray[i] floatValue];
        
        // 颜色（绘制数据时要用）
        UIColor *color = _colorArray[i];
        

        NSArray *aValues = _modelArray;
        // 模型的数据
        NSString *name = [NSString stringWithFormat:@"%d哈哈哈哈", i];
        NSString *number = [NSString stringWithFormat:@"%.2f%%", [aValues[i]floatValue] * 100];
        
        
        // 圆弧中心点的x值和y值
        CGFloat x = point.x;
        CGFloat y = point.y;
        
        // 指引线终点的位置（x, y）
        CGFloat startX = x + 10 * cos(radianCenter);
        CGFloat startY = y + 10 * sin(radianCenter);
        
        // 指引线转折点的位置(x, y)
        CGFloat breakPointX = x + 20 * cos(radianCenter);
        CGFloat breakPointY = y + 20 * sin(radianCenter);
        
        // 转折点到中心竖线的垂直长度（为什么+20, 在实际做出的效果中，有的转折线很丑，+20为了美化）
        CGFloat margin = fabs(width - breakPointX) + 20;
        
        // 指引线长度
        CGFloat lineWidth = width - margin;
        
        // 指引线起点（x, y）
        CGFloat endX;
        CGFloat endY;
        
        // 绘制文字和数字时，所占的size（width和height）
        // width使用lineWidth更好，我这么写固定值是为了达到产品要求
        CGFloat numberWidth = 80.f;
        CGFloat numberHeight = 15.f;
        
        CGFloat titleWidth = numberWidth;
        CGFloat titleHeight = numberHeight;
        
        // 绘制文字和数字时的起始位置（x, y）与上面的合并起来就是frame
        CGFloat numberX;// = breakPointX;
        CGFloat numberY = breakPointY - numberHeight;
        
        CGFloat titleX = breakPointX;
        CGFloat titleY = breakPointY + 2;
        
        
        // 文本段落属性(绘制文字和数字时需要)
        NSMutableParagraphStyle * paragraph = [[NSMutableParagraphStyle alloc]init];
        // 文字靠右
        paragraph.alignment = NSTextAlignmentRight;
        
        // 判断x位置，确定在指引线向左还是向右绘制
        // 根据需要变更指引线的起始位置
        // 变更文字和数字的位置
        if (x <= width) { // 在左边
            
            endX = 10;
            endY = breakPointY;
            
            // 文字靠左
            paragraph.alignment = NSTextAlignmentLeft;
            
            numberX = endX;
            titleX = endX;
            
        } else {    // 在右边
            
            endX = self.view.bounds.size.width - 10;
            endY = breakPointY;
            
            numberX = endX - numberWidth;
            titleX = endX - titleWidth;
        }
        
        
        if (i != 0) {
            
            // 当i!=0时，就需要计算位置总和(方法开始出的rect)与rect1(将进行绘制的位置)是否有重叠
            CGRect rect1 = CGRectMake(numberX, numberY, numberWidth, titleY + titleHeight - numberY);
            
            CGFloat margin = 0;
            
            if (CGRectIntersectsRect(rect, rect1)) {
                // 两个面积重叠
                // 三种情况
                // 1. 压上面
                // 2. 压下面
                // 3. 包含
                // 通过计算让面积重叠的情况消除
                if (CGRectContainsRect(rect, rect1)) {// 包含
                    
                    if (i % Max <= Max * 0.5 - 1) {
                        // 将要绘制的位置在总位置偏上
                        margin = CGRectGetMaxY(rect1) - rect.origin.y;
                        endY -= margin;
                    } else {
                        // 将要绘制的位置在总位置偏下
                        margin = CGRectGetMaxY(rect) - rect1.origin.y;
                        endY += margin;
                    }
                    
                    
                } else {    // 相交
                    
                    if (CGRectGetMaxY(rect1) > rect.origin.y && rect1.origin.y < rect.origin.y) { // 压在总位置上面
                        margin = CGRectGetMaxY(rect1) - rect.origin.y;
                        endY -= margin;
                        
                    } else if (rect1.origin.y < CGRectGetMaxY(rect) &&  CGRectGetMaxY(rect1) > CGRectGetMaxY(rect)) {  // 压总位置下面
                        margin = CGRectGetMaxY(rect) - rect1.origin.y;
                        endY += margin;
                    }
                    
                }
            }
            titleY = endY + 2;
            numberY = endY - numberHeight;
            
            
            // 通过计算得出的将要绘制的位置
            CGRect rect2 = CGRectMake(numberX, numberY, numberWidth, titleY + titleHeight - numberY);
            
            // 把新获得的rect和之前的rect合并
            if (numberX == rect.origin.x) {
                // 当两个位置在同一侧的时候才需要合并
                if (rect2.origin.y < rect.origin.y) {
                    rect = CGRectMake(rect.origin.x, rect2.origin.y, rect.size.width, rect.size.height + rect2.size.height);
                } else {
                    rect = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height + rect2.size.height);
                }
            }
            
        } else {
            rect = CGRectMake(numberX, numberY, numberWidth, titleY + titleHeight - numberY);
        }
        
        
        // 重新制定转折点
        if (endX == 10) {
            breakPointX = endX + lineWidth;
        } else {
            breakPointX = endX - lineWidth;
        }
        
        breakPointY = endY;
        //2.绘制路径
        UIBezierPath *path = [UIBezierPath bezierPath];
        
        [path moveToPoint:CGPointMake(endX, endY)];
        
        [path addLineToPoint:CGPointMake(breakPointX, breakPointY)];
        
        [path addLineToPoint:CGPointMake(startX, startY)];
        
        CAShapeLayer *layer = [CAShapeLayer layer];
        layer.lineWidth = 0.5;
        layer.strokeColor = color.CGColor;
        layer.lineJoin = kCALineJoinRound;
        layer.path = path.CGPath;
        layer.fillColor = nil;
        [self.view.layer addSublayer:layer];
        
        
        // 在终点处添加点(小圆点)
        // movePoint，让转折线指向小圆点中心
        CGFloat movePoint = -2.5;
        
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = color;
        [self.view addSubview:view];
        CGRect rect = view.frame;
        rect.size = CGSizeMake(5, 5);
        rect.origin = CGPointMake(startX + movePoint, startY - 2.5);
        view.frame = rect;
        view.layer.cornerRadius = 2.5;
        view.layer.masksToBounds = true;
        
        UIFont *font = [UIFont systemFontOfSize:9];
        NSMutableAttributedString *nameAttributed = [[NSMutableAttributedString alloc]initWithString:name];
        CFStringRef fontName = (__bridge CFStringRef)font.fontName;
        CGFloat fontSize = font.pointSize;
        CTFontRef fontRef = CTFontCreateWithName(fontName, fontSize, NULL);
        
        NSDictionary *attribs = @{(__bridge id)kCTForegroundColorAttributeName: (__bridge id)color.CGColor, (__bridge id)kCTFontAttributeName: (__bridge id)fontRef, (__bridge id)kCTParagraphStyleAttributeName: paragraph};
        [nameAttributed setAttributes:attribs range:NSMakeRange(0, nameAttributed.length)];
        
        NSMutableAttributedString *numberAttributed = [[NSMutableAttributedString alloc]initWithString:number];
        [numberAttributed setAttributes:attribs range:NSMakeRange(0, numberAttributed.length)];
        CFRelease(fontRef);
        
        CATextLayer *textlayer = [CATextLayer layer];
        textlayer.frame = CGRectMake(numberX, numberY, numberWidth, numberHeight);
        textlayer.string = nameAttributed;
        textlayer.alignmentMode = paragraph.alignment == NSTextAlignmentRight ? kCAAlignmentRight : kCAAlignmentLeft;
        textlayer.contentsScale = [UIScreen mainScreen].scale;
        [self.view.layer addSublayer:textlayer];
        
        CATextLayer *titlelayer = [CATextLayer layer];
        titlelayer.frame = CGRectMake(titleX, titleY, titleWidth, titleHeight);
        titlelayer.string = numberAttributed;
        titlelayer.alignmentMode = paragraph.alignment == NSTextAlignmentRight ? kCAAlignmentRight : kCAAlignmentLeft;
        titlelayer.contentsScale = [UIScreen mainScreen].scale;
        [self.view.layer addSublayer:titlelayer];
        //指引线上面的数字
        [name drawInRect:CGRectMake(numberX, numberY, numberWidth, numberHeight) withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:9.0], NSForegroundColorAttributeName:color,NSParagraphStyleAttributeName:paragraph}];
        
        // 指引线下面的title
        [number drawInRect:CGRectMake(titleX, titleY, titleWidth, titleHeight) withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:9.0],NSForegroundColorAttributeName:color,NSParagraphStyleAttributeName:paragraph}];
        
    }
}



@end
