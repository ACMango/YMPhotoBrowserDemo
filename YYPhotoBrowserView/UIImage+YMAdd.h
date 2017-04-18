//
//  UIImage+YMAdd.h
//  YMPhotoBrowserDemo
//
//  Created by dazhi on 2017/4/17.
//  Copyright © 2017年 yanming. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (YMAdd)

/**
 Create and return a 1x1 point size image with the given color.
 
 @param color  The color.
 */
+ (nullable UIImage *)imageWithColor:(UIColor *_Nullable)color;

/**
 Create and return a pure color image with the given color and size.
 
 @param color  The color.
 @param size   New image's type.
 */
+ (nullable UIImage *)imageWithColor:(UIColor *_Nullable)color size:(CGSize)size;

/**
 Applies a blur effect to this image. Suitable for displaying white text.
 (same as iOS Notification Center)
 */
- (nullable UIImage *)imageByBlurDark;

@end
