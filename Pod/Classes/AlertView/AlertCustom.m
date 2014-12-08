//
//  AlertCustom.m
//  Minfo
//
//  Created by quannv on 10/20/14.
//  Copyright (c) 2014 Dungnt Gzone. All rights reserved.
//

#import "AlertCustom.h"
#import "AppDelegate.h"
#import "UIImage+PACBlurryEffect.h"

@interface AlertCustom ()

@property (nonatomic, copy) CancelBlock  cancelBlock;
@property (nonatomic, copy) SelectButton  selectBlock;
@property (nonatomic, copy) SelectButtonAndTextFeild  selectContainTextFeildBlock;

@end

@implementation AlertCustom

- (instancetype) initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        heightViewButton.constant = 0.0;
        UIButton * btnCancel = [[UIButton alloc] initWithFrame:frame];
        [btnCancel addTarget:self action:@selector(dismissView) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btnCancel];
        [self setBackgroundColor:[UIColor redColor]];
    }
    return self;
}


- (instancetype) initWithTitle:(NSString *) title andDescription:(NSString *)description{

    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"AlertCustom" owner:self options:nil];

    self = [nib objectAtIndex:0];
    if (self) {
        heightViewButton.constant = 0.0;
        NSMutableAttributedString * attributed = [[NSMutableAttributedString alloc] initWithString:title attributes:[NSDictionary dictionaryWithObjectsAndKeys: [UIFont boldSystemFontOfSize:17], NSFontAttributeName, nil]];
        [attributed appendAttributedString:[[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"\n%@", description] attributes:[NSDictionary dictionaryWithObjectsAndKeys: [UIFont systemFontOfSize:15], NSFontAttributeName, nil]]];
        [messageAlert setAttributedText:attributed];
    }
    return self;
}


- (instancetype) initWithTitle:(NSString *) title
                       message:(NSString *)message
                      delegate:(id)delegate
             cancelButtonTitle:(NSString *)cancelButtonTitle
             otherButtonTitles:(NSArray *) otherButtonTitles
             dismissWihtCancel:(CancelBlock) cancel
                 orButtonIndex:(SelectButton) button{
    
   
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"AlertCustom" owner:self options:nil];
    
    self = [nib objectAtIndex:0];
    if (self) {
        _cancelBlock = [cancel copy];
        _selectBlock = [button copy];
        heightViewButton.constant = 0.0;
        NSMutableAttributedString * attributed = [[NSMutableAttributedString alloc] initWithString:title attributes:[NSDictionary dictionaryWithObjectsAndKeys: [UIFont boldSystemFontOfSize:17], NSFontAttributeName, nil]];
        
        [attributed appendAttributedString:[[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"\n%@", message] attributes:[NSDictionary dictionaryWithObjectsAndKeys: [UIFont systemFontOfSize:15], NSFontAttributeName, nil]]];

        [messageAlert setAttributedText:attributed];
        [messageAlert setTextAlignment:NSTextAlignmentCenter];
        [self updateConstraintsIfNeeded];

        [self addButtonCancelWithTitle:cancelButtonTitle andOtherButtons:otherButtonTitles];
        heightTextField.constant = 0;
        originText.constant = 0;
        contentView.layer.cornerRadius = 10.0;
        contentView.layer.borderWidth = 1.5f;
        contentView.layer.borderColor = [UIColor clearColor].CGColor;
        contentView.layer.masksToBounds = YES;
    }
    return self;
}

- (instancetype) initWithTitle:(NSString *) title
                       message:(NSString *)message
              containTextFeild:(BOOL) isContain
             cancelButtonTitle:(NSString *)cancelButtonTitle
             otherButtonTitles:(NSArray *) otherButtonTitles
             dismissWihtCancel:(CancelBlock) cancel
                 orButtonIndex:(SelectButtonAndTextFeild) button{
    
    
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"AlertCustom" owner:self options:nil];
    
    self = [nib objectAtIndex:0];
    if (self) {
        _cancelBlock = [cancel copy];
        _selectContainTextFeildBlock = [button copy];
        heightViewButton.constant = 0.0;
        NSMutableAttributedString * attributed = [[NSMutableAttributedString alloc] initWithString:title attributes:[NSDictionary dictionaryWithObjectsAndKeys: [UIFont boldSystemFontOfSize:17], NSFontAttributeName, nil]];
        
        [attributed appendAttributedString:[[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"\n%@", message] attributes:[NSDictionary dictionaryWithObjectsAndKeys: [UIFont systemFontOfSize:15], NSFontAttributeName, nil]]];
        
        [messageAlert setAttributedText:attributed];
        [messageAlert setTextAlignment:NSTextAlignmentCenter];
        [self updateConstraintsIfNeeded];
        
        [self addButtonCancelWithTitle:cancelButtonTitle andOtherButtons:otherButtonTitles];
        heightTextField.constant = 0;
        originText.constant = 0;
        contentView.layer.cornerRadius = 10.0;
        contentView.layer.borderWidth = 1.5f;
        contentView.layer.borderColor = [UIColor clearColor].CGColor;
        contentView.layer.masksToBounds = YES;
        [self showTextFeild:isContain];

    }
    return self;
}


- (instancetype) initWithTitle:(NSString *) title
                       message:(NSString *)message
                    viewCustom:(UIView *) customView
             cancelButtonTitle:(NSString *)cancelButtonTitle
             otherButtonTitles:(NSArray *) otherButtonTitles
             dismissWihtCancel:(CancelBlock) cancel
                 orButtonIndex:(SelectButton) button{
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"AlertCustom" owner:self options:nil];
    
    self = [nib objectAtIndex:0];
    if (self) {
        
        heightViewButton.constant = 0.0;
        _cancelBlock = [cancel copy];
        _selectBlock = [button copy];
        
        NSMutableAttributedString * attributed = [[NSMutableAttributedString alloc] initWithString:title attributes:[NSDictionary dictionaryWithObjectsAndKeys: [UIFont boldSystemFontOfSize:17], NSFontAttributeName, nil]];
        
        [attributed appendAttributedString:[[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"\n%@", message] attributes:[NSDictionary dictionaryWithObjectsAndKeys: [UIFont systemFontOfSize:15], NSFontAttributeName, nil]]];
        
        [messageAlert setAttributedText:attributed];
        [messageAlert setTextAlignment:NSTextAlignmentCenter];
        [self updateConstraintsIfNeeded];
        [self addCustomView:customView];
        [self addButtonCancelWithTitle:cancelButtonTitle andOtherButtons:otherButtonTitles];
        heightTextField.constant = 0;
        originText.constant = 0;
        contentView.layer.cornerRadius = 10.0;
        contentView.layer.borderWidth = 1.5f;
        contentView.layer.borderColor = [UIColor clearColor].CGColor;
        contentView.layer.masksToBounds = YES;
        
    }
    
    return self;
}

- (void) showTextFeild:(BOOL) isShow{
    _isShowTextFeild = isShow;
    heightTextField.constant = 35.0;
    originText.constant = 15.;
    textFeild.layer.borderColor = [UIColor grayColor].CGColor;
    textFeild.layer.borderWidth = 0.5;
    textFeild.layer.cornerRadius = 2.0;
    [textFeild becomeFirstResponder];
    [contentView updateConstraints];
}

- (void) addButtonCancelWithTitle:(NSString *) title{

    UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(0.0, 0.0, CGRectGetWidth(viewButton.frame), 44)];
    [button addTarget:self action:@selector(cancel) forControlEvents:UIControlEventTouchUpInside];
    
}
- (IBAction)exitKeyboard:(id)sender {
    
}

- (void) addButtonCancelWithTitle:(NSString *) title andOtherButtons:(NSArray *)titles{
    
    
    UIButton * buttonCancel = [[UIButton alloc] initWithFrame:CGRectMake(0.0, heightViewButton.constant, CGRectGetWidth(viewButton.frame), 44)];
    [buttonCancel addTarget:self action:@selector(cancel:) forControlEvents:UIControlEventTouchUpInside];
    [buttonCancel setTitleColor:[UIColor colorWithRed:249.0/255 green:157.0/255 blue:50.0/255 alpha:1.0] forState:UIControlStateNormal];
    [buttonCancel.titleLabel setFont:[UIFont boldSystemFontOfSize:18]];
    buttonCancel.layer.borderColor = [UIColor colorWithWhite:0.2 alpha:0.8].CGColor;
    buttonCancel.layer.borderWidth = 0.5;
    [buttonCancel setTitle:title forState:UIControlStateNormal];
    [viewButton addSubview:buttonCancel];

    if (titles == nil) {
        heightViewButton.constant = 44;
        heightContentView.constant = CGRectGetMinY(viewButton.frame) + heightViewButton.constant;
        [viewButton setBackgroundColor:[UIColor clearColor]];
        [self updateConstraintsIfNeeded];
        return;
    }
    
    if (titles.count == 1) {
        
        [buttonCancel setFrame:CGRectMake(0.0, heightViewButton.constant, CGRectGetWidth(viewButton.frame)/2, 44)];
        
        UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetWidth(viewButton.frame) /2, heightViewButton.constant, CGRectGetWidth(viewButton.frame) /2, 44)];
        [button addTarget:self action:@selector(buttonTouchUp:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = 1;
        [button setTitle:[titles firstObject] forState:UIControlStateNormal];
        [button.titleLabel setFont:[UIFont systemFontOfSize:16]];
        button.layer.borderColor = [UIColor colorWithWhite:0.2 alpha:0.8].CGColor;
        [button setTitleColor:[UIColor colorWithRed:249.0/255 green:157.0/255 blue:50.0/255 alpha:1.0] forState:UIControlStateNormal];
        button.layer.borderWidth = 0.5;
        
        UIImageView * imageSeparator = [[UIImageView alloc] initWithFrame:CGRectMake(0, heightViewButton.constant , CGRectGetWidth(viewButton.frame), 0.5)];
        [imageSeparator setBackgroundColor:[UIColor colorWithWhite:0.2 alpha:0.8]];
        [viewButton addSubview:imageSeparator];

        UIImageView * imageSeparator1 = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetWidth(viewButton.frame) /2, heightViewButton.constant , 0.5, 44)];
        [imageSeparator1 setBackgroundColor:[UIColor colorWithWhite:0.2 alpha:0.8]];
        [viewButton addSubview:imageSeparator1];
        [viewButton addSubview:button];
        
        heightViewButton.constant = heightViewButton.constant + 44;
        heightContentView.constant = CGRectGetMinY(viewButton.frame) + heightViewButton.constant;
        
        
    }else if (titles.count > 1){
    
        for (NSString * titleButton in titles) {
            
            UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(0,heightViewButton.constant, CGRectGetWidth(viewButton.frame), 44)];
            button.tag = [titles indexOfObject:titleButton] + 1;
            [button addTarget:self action:@selector(buttonTouchUp:) forControlEvents:UIControlEventTouchUpInside];
            [button setTitleColor:[UIColor colorWithRed:249.0/255 green:157.0/255 blue:50.0/255 alpha:1.0] forState:UIControlStateNormal];
            [button.titleLabel setFont:[UIFont systemFontOfSize:16]];
            [button setTitle:titleButton forState:UIControlStateNormal];

            UIImageView * imageSeparator = [[UIImageView alloc] initWithFrame:CGRectMake(0, [titles indexOfObject:titleButton] * 44 - 0.5, CGRectGetWidth(viewButton.frame), 0.5)];
            [imageSeparator setBackgroundColor:[UIColor colorWithWhite:0.2 alpha:0.8]];
            [viewButton addSubview:imageSeparator];
            heightViewButton.constant = heightViewButton.constant + 44;
            [viewButton addSubview:button];

        }
        
        UIImageView * imageSeparator = [[UIImageView alloc] initWithFrame:CGRectMake(0, 44 * titles.count , CGRectGetWidth(viewButton.frame), 0.5)];
        [imageSeparator setBackgroundColor:[UIColor colorWithWhite:0.2 alpha:0.8]];
        [viewButton addSubview:imageSeparator];
        
        [buttonCancel setFrame:CGRectMake(0.0, heightViewButton.constant, CGRectGetWidth(viewButton.frame), 44)];
        heightViewButton.constant = heightViewButton.constant + 44;

        heightContentView.constant = CGRectGetMinY(viewButton.frame) + heightViewButton.constant;
    }
    [viewButton setBackgroundColor:[UIColor clearColor]];
    [self updateConstraintsIfNeeded];
    
}

- (void) show{

    AppDelegate * delegate  = (AppDelegate *)[UIApplication sharedApplication].delegate;
    if (_isShowTextFeild) {
        [self setCenter:CGPointMake(delegate.window.center.x, delegate.window.center.y - 100)];

    }else{
        [self setCenter:CGPointMake(delegate.window.center.x, delegate.window.center.y)];
    }
    
    [contentView setBackgroundColor:[UIColor colorWithWhite:1.0 alpha:0.01]];
    [self setBackgroundColor:[UIColor colorWithWhite:0.0 alpha:0.5]];
    contentView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.001, 0.001);
    [delegate.window addSubview:self];
    [UIView animateWithDuration:0.1 animations:^{
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.25 animations:^{
            [contentView setBackgroundColor:[UIColor colorWithWhite:1.0 alpha:0.97]];
            contentView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.0, 1.0);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.1 animations:^{
                [contentView setBackgroundColor:[UIColor colorWithWhite:1.0 alpha:0.97]];
                contentView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
            } completion:^(BOOL finished) {
            }];

        }];

    }];
    
}

- (void) didMoveToWindow{


}

- (void) addCustomView:(UIView *)customView{

    [customView setFrame:CGRectMake(0.0, 0, contentView.frame.size.width, customView.frame.size.height)];
    [viewButton addSubview:customView];
    heightViewButton.constant = heightViewButton.constant + customView.frame.size.height;
    heightContentView.constant = CGRectGetMinY(viewButton.frame) + heightViewButton.constant;
    
}

- (UIImage*)imageByCropping:(UIImage *)imageToCrop toRect:(CGRect)rect

{
    //create a context to do our clipping in
    CGImageRef imageRef = CGImageCreateWithImageInRect([imageToCrop CGImage], CGRectMake((imageToCrop.size.width/2 - rect.size.width), (imageToCrop.size.height/2 - rect.size.height)/2, rect.size.width, rect.size.height));
    UIImage *cropped = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    return cropped;
    
}

- (UIImage *)screenshot
{
    CGFloat scale = [[UIScreen mainScreen] scale];
    UIImage *screenshot;
    AppDelegate * delegate  = (AppDelegate *)[UIApplication sharedApplication].delegate;

    UIGraphicsBeginImageContextWithOptions(delegate.window.frame.size, NO, scale);
    {
        {
            [delegate.window.layer renderInContext:UIGraphicsGetCurrentContext()];
            screenshot = UIGraphicsGetImageFromCurrentImageContext();
        }
    }
    
    UIGraphicsEndImageContext();
    NSLog(@"image Size: %@", NSStringFromCGSize(screenshot.size));
    return screenshot;
}

- (void) dismissView:(void (^)(BOOL))dismissSuccess{

    [UIView animateWithDuration:0.35 animations:^{
        [contentView setBackgroundColor:[UIColor colorWithWhite:1.0 alpha:0.97]];
        contentView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.001, 0.001);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.1 animations:^{
        } completion:^(BOOL finished) {
            dismissSuccess(YES);
            [self removeFromSuperview];

        }];
        
    }];

}

- (void) buttonTouchUp:(UIButton *) button{
    if (_isShowTextFeild) {
        [self dismissView:^(BOOL isSuccess) {
            _selectContainTextFeildBlock (button.titleLabel.text, button.tag -1, textFeild.text ? textFeild.text : @"");
        }];
    }else{
        [self dismissView:^(BOOL isSuccess) {
            _selectBlock (button.titleLabel.text, button.tag -1);
        }];
        
    }

}

- (void) cancel:(UIButton *) button{
    [self dismissView:^(BOOL isSuccess) {
        _cancelBlock (button.titleLabel.text);
    }];
    
}

- (void)dealloc {

}
@end
