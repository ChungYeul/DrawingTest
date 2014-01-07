//
//  DrawingView.m
//  DrawingTest
//
//  Created by In Chung Yeul on 2014. 1. 7..
//  Copyright (c) 2014년 In Chung Yeul. All rights reserved.
//

#import "DrawingView.h"
@interface DrawingView() {
    UIBezierPath *myPath;
}
@end

@implementation DrawingView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        myPath = [[UIBezierPath alloc] init];
        myPath.lineWidth = 10;
        [[UIColor blackColor] setStroke];
    }
    return self;
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *mytouch = [[touches allObjects] objectAtIndex:0];
    CGPoint point = [mytouch locationInView:self];
    [myPath moveToPoint:point];
    NSLog(@"touch began : %@", NSStringFromCGPoint(point));
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *mytouch = [[touches allObjects] objectAtIndex:0];
    CGPoint point = [mytouch locationInView:self];
    [myPath addLineToPoint:point];
    [self setNeedsDisplay];
    NSLog(@"touch moved : %@", NSStringFromCGPoint(point));
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
}

- (void)drawRect:(CGRect)rect
{
    [myPath stroke];
}

@end
