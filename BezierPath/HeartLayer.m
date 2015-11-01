//
//  HeartLayer.m
//  BezierPath
//
//  Created by WilliamZhang on 15/10/27.
//  Copyright © 2015年 WilliamZhang. All rights reserved.
//

#import "HeartLayer.h"

@implementation HeartLayer

- (void)drawInContext:(CGContextRef)ctx {
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    
    CGPoint startPoint = CGPointMake([self halfSide], [self quarterSide]);
    [bezierPath moveToPoint:startPoint];
    
    // point1 startPoint's top; point2 curvePoint's top
    [bezierPath addCurveToPoint:CGPointMake([self side], [self quarterSide])
                  controlPoint1:CGPointMake([self halfSide], - [self quarterSide] * 0.3)
                  controlPoint2:CGPointMake([self side], - [self quarterSide] * 0.3)];
    
    [bezierPath addCurveToPoint:CGPointMake([self halfSide], [self side])
                  controlPoint1:CGPointMake([self side], [self halfSide])
                  controlPoint2:CGPointMake([self halfSide], [self halfSide])];
    
    [bezierPath addCurveToPoint:CGPointMake(0, [self quarterSide])
                  controlPoint1:CGPointMake([self halfSide], [self halfSide])
                  controlPoint2:CGPointMake(0, [self halfSide])];
    
    [bezierPath addCurveToPoint:startPoint
                  controlPoint1:CGPointMake(0, - [self quarterSide] / 3)
                  controlPoint2:CGPointMake([self halfSide], - [self quarterSide] / 3)];
    
    [bezierPath closePath];
    
    CGContextAddPath(ctx, bezierPath.CGPath);
    CGContextSetStrokeColorWithColor(ctx, [UIColor blackColor].CGColor);
    CGContextSetFillColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextDrawPath(ctx, kCGPathFillStroke);
}

#pragma mark -
#pragma mark Private Method
- (CGFloat)side             { return CGRectGetWidth(self.bounds);}
- (CGFloat)halfSide         { return [self side] / 2;}
- (CGFloat)quarterSide      { return [self side] / 4;}
- (CGFloat)threeQuarterSide { return [self quarterSide] * 3;}

@end
