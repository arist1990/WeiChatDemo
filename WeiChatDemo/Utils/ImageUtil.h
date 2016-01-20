//
//  ImageUtil.h
//  BigMouse
//
//  Created by ARIST on 15/10/6.
//  Copyright (c) 2015年 深圳市葵花子科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ImageUtil : NSObject

+ (UIImage *)getCIGaussianBlurImageWithRadius:(CGFloat)radius image:(UIImage *)image;

+ (UIImage *)fixOrientation:(UIImage *)aImage;

+ (UIImage *)createNonInterpolatedUIImageFormCIImage:(CIImage *)image withSize:(CGFloat) size;

+ (CIImage *)createQRForString:(NSString *)qrString;

+ (UIImage *)caputureView:(UIView *)view;

@end
