//
//  FFProgressView.h
//  binzhuangtu
//
//  Created by blm on 2019/1/2.
//  Copyright © 2019 BLM. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FFProgressView : UIView
+ (instancetype)progressView;
@property (nonatomic, assign) CGFloat currentProgress;
@property (nonatomic, assign) NSInteger progressWidth;
@property (nonatomic, strong) UIColor *bgColor;
@property (nonatomic, strong) UIColor *progressColor;
@property (nonatomic, assign) CGFloat radius;
@property (nonatomic, assign) CFTimeInterval duration;
@property (nonatomic, strong) UIColor *lableColor;
@property (nonatomic, strong) UIFont *lableFont;
@end

NS_ASSUME_NONNULL_END
