//
//  UIView+frame.m
//  04-抽屉效果
//
//  Created by Page on 16/3/19.
//  Copyright © 2016年 Apple.com. All rights reserved.
//


#import "UIView+frame.h"

@implementation UIView (frame)

- (void)setX:(CGFloat)x
{
     CGRect frame = self.frame;
     frame.origin.x = x;
     self.frame = frame;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y
{
         CGRect frame = self.frame;
         frame.origin.y = y;
         self.frame = frame;
}

 - (CGFloat)y
 {
         return self.frame.origin.y;
     }

 - (void)setOrigin:(CGPoint)origin
 {
         CGRect frame = self.frame;
         frame.origin = origin;
         self.frame = frame;
     }

 - (CGPoint)origin
 {
         return self.frame.origin;
     }

 - (void)setWidth:(CGFloat)width
 {
         CGRect frame = self.frame;
         frame.size.width = width;
         self.frame = frame;
     }

 - (CGFloat)width
 {
         return self.frame.size.width;
     }

 - (void)setHeight:(CGFloat)height
 {
         CGRect frame = self.frame;
         frame.size.height = height;
         self.frame = frame;
     }

 - (CGFloat)height
 {
         return self.frame.size.height;
     }

 - (void)setSize:(CGSize)size
 {
         CGRect frame = self.frame;
         frame.size = size;
         self.frame = frame;
     }
 
 - (CGSize)size
 {
         return self.frame.size;
     }

@end
