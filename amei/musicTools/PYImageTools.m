//
//  PYImageTools.m
//  musicPlay
//
//  Created by user on 16/10/25.
//  Copyright © 2016年 loda. All rights reserved.
//

#import "PYImageTools.h"

@implementation PYImageTools
/**
 *  图片圆形切片
 */
+(UIImage*)circleImageWithName:(NSString *)name borderWith:(CGFloat)borderWith borderColor:(UIColor *)borderColor{
    //加载原图
    UIImage *oldImage = [UIImage imageNamed:name];
    
    //2.开启上下文
    CGFloat imageW = oldImage.size.width + 2*borderWith;
    CGFloat imageH = oldImage.size.height + 2*borderWith;
    
    CGSize imageSize = CGSizeMake(imageW, imageH);
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0.0);
    
    //3.获取当前上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //4.画边框
    [borderColor set];
    CGFloat bigRadius = imageW * 0.5;
    CGFloat centerX = bigRadius;
    CGFloat centerY = bigRadius;
    CGContextAddArc(ctx, centerX, centerY, bigRadius, 0, M_PI*2, 0);
    CGContextFillPath(ctx);
    
    //5. 小圆
    CGFloat smallRadius = bigRadius - borderWith;
    CGContextAddArc(ctx, centerX, centerY, smallRadius, 0, M_PI*2, 0);
    //裁剪 (裁剪后面的东西才会受到裁剪影响)
    CGContextClip(ctx);
    
    //6.画圆
    [oldImage drawInRect:CGRectMake(borderWith, borderWith, oldImage.size.width, oldImage.size.height)];
    
    //7. 取图
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //8.结束上下文
    UIGraphicsEndPDFContext();
    
    return newImage;
    
}

@end
