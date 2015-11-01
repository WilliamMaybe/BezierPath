//
//  HeartView.m
//  BezierPath
//
//  Created by WilliamZhang on 15/10/27.
//  Copyright © 2015年 WilliamZhang. All rights reserved.
//

#import "HeartView.h"
#import "HeartLayer.h"

@interface HeartView ()

@property (nonatomic ,strong) CALayer *heartLayer;

@end

@implementation HeartView

+ (Class)layerClass {
    return [HeartLayer class];
}

- (instancetype)initWithFrame:(CGRect)frame {
    CGFloat width = CGRectGetWidth(frame);
    CGFloat height = CGRectGetHeight(frame);
    CGFloat side = MIN(width, height);
    frame.size = CGSizeMake(side, side);
    
    self = [super initWithFrame:frame];
    if (self) {
        [self.layer addSublayer:self.heartLayer];
    }
    return self;
}

- (void)layoutSublayersOfLayer:(CALayer *)layer {
    [super layoutSublayersOfLayer:layer];
    self.heartLayer.frame = self.bounds;
    [self.heartLayer setNeedsDisplay];
}

#pragma mark -
#pragma mark Initializer
- (CALayer *)heartLayer {
    if (!_heartLayer) {
        _heartLayer = [HeartLayer layer];
        _heartLayer.contentsScale = [UIScreen mainScreen].scale;
    }
    return _heartLayer;
}


@end
