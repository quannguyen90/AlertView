//
//  UIImage+Blur.h
//  Pods
//
//  Created by quannv on 12/8/14.
//
//

#import <UIKit/UIKit.h>

@interface UIImage (Blur)

- (UIImage *)blurryEffectImageWithRadius:(CGFloat)blurRadius
                               tintColor:(UIColor *)tintColor
                   saturationDeltaFactor:(CGFloat)saturationDeltaFactor;
@end
