//
//  AlertCustom.m
//  Minfo
//
//  Created by quannv on 10/20/14.
//  Copyright (c) 2014 Dungnt Gzone. All rights reserved.
//

#import "AlertCustom.h"
#import "UIImage+Blur.h"

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
        [btnCancel addTarget:self action:@selector(cancel:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btnCancel];
        [self setBackgroundColor:[UIColor redColor]];
    }
    return self;
}


- (instancetype) initWithTitle:(NSString *) title andDescription:(NSString *)description{

    NSString * path = [[NSBundle mainBundle] pathForResource:@"AlertCustom" ofType:@"bundle"];
    NSBundle *bundle = [NSBundle bundleWithPath:path];
    NSArray *nib = [bundle loadNibNamed:@"AlertCustom" owner:self options:nil];
    
    self = [nib objectAtIndex:0];
    if (self) {
        heightViewButton.constant = 0.0;
        [messageAlert setAttributedText:[self attributedStringWithTitle:title andMessage:description]];
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
    
   
    NSString * path = [[NSBundle mainBundle] pathForResource:@"AlertView" ofType:@"bundle"];
    NSBundle *bundle = [NSBundle bundleWithPath:path];
    NSArray *nib = [bundle loadNibNamed:@"AlertCustom" owner:self options:nil];
    
    self = [nib objectAtIndex:0];
    if (self) {
        _cancelBlock = [cancel copy];
        _selectBlock = [button copy];
        
        heightViewButton.constant = 0.0;
        [messageAlert setAttributedText:[self attributedStringWithTitle:title andMessage:message]];
        [messageAlert setTextAlignment:NSTextAlignmentCenter];
        
        heightTextField.constant = 0;
        originText.constant = 0;
        
        [self addButtonCancelWithTitle:cancelButtonTitle andOtherButtons:otherButtonTitles];
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
    
    
    NSString * path = [[NSBundle mainBundle] pathForResource:@"AlertCustom" ofType:@"bundle"];
    NSBundle *bundle = [NSBundle bundleWithPath:path];
    NSArray *nib = [bundle loadNibNamed:@"AlertCustom" owner:self options:nil];
    
    self = [nib objectAtIndex:0];
    if (self) {
        _cancelBlock = [cancel copy];
        _selectContainTextFeildBlock = [button copy];
        heightViewButton.constant = 0.0;
        [messageAlert setAttributedText:[self attributedStringWithTitle:title andMessage:message]];
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


- (NSMutableAttributedString *) attributedStringWithTitle:(NSString *) title andMessage:(NSString *) message{
    
    NSMutableParagraphStyle *paragraphStyle1 = NSMutableParagraphStyle.new;
    paragraphStyle1.paragraphSpacing                = 10;

    NSMutableAttributedString * attributedResults = [[NSMutableAttributedString alloc] initWithString:title attributes:[NSDictionary dictionaryWithObjectsAndKeys: [UIFont boldSystemFontOfSize:17], NSFontAttributeName, paragraphStyle1,NSParagraphStyleAttributeName, nil]];
    
    NSMutableParagraphStyle *paragraphStyle2 = NSMutableParagraphStyle.new;
    paragraphStyle2.paragraphSpacing                = 5;
    
    NSAttributedString * attributed = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"\n%@", message] attributes:[NSDictionary dictionaryWithObjectsAndKeys: [UIFont systemFontOfSize:14], NSFontAttributeName, paragraphStyle2,NSParagraphStyleAttributeName, nil]];

    
    [attributedResults appendAttributedString:attributed];

    return attributedResults;
}

- (instancetype) initWithTitle:(NSString *) title
                       message:(NSString *)message
                    viewCustom:(UIView *) customView
             cancelButtonTitle:(NSString *)cancelButtonTitle
             otherButtonTitles:(NSArray *) otherButtonTitles
             dismissWihtCancel:(CancelBlock) cancel
                 orButtonIndex:(SelectButton) button{
    
    NSString * path = [[NSBundle mainBundle] pathForResource:@"AlertCustom" ofType:@"bundle"];
    NSBundle *bundle = [NSBundle bundleWithPath:path];
    NSArray *nib = [bundle loadNibNamed:@"AlertCustom" owner:self options:nil];
    
    self = [nib objectAtIndex:0];
    if (self) {
        
        heightViewButton.constant = 0.0;
        _cancelBlock = [cancel copy];
        _selectBlock = [button copy];
        [messageAlert setAttributedText:[self attributedStringWithTitle:title andMessage:message]];
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

- (void) addButtonCancelWithTitle:(NSString *) cancelTitle andButtonWithTitle:(NSString *) title{
    
    //**************************************************************
    //**************************** button **********************************
    UIButton * buttonCancel = [[UIButton alloc] initWithFrame:CGRectMake(0.0 ,1.0, CGRectGetWidth(viewButton.frame)/2-0.5, 44)];
    buttonCancel.tag = 0;
    [buttonCancel addTarget:self action:@selector(buttonTouchUp:) forControlEvents:UIControlEventTouchUpInside];
    [buttonCancel setTitleColor:[UIColor colorWithRed:249.0/255 green:157.0/255 blue:50.0/255 alpha:1.0] forState:UIControlStateNormal];
    [buttonCancel.titleLabel setFont:[UIFont systemFontOfSize:16]];
    [buttonCancel setTitle:cancelTitle forState:UIControlStateNormal];
    buttonCancel.backgroundColor = [UIColor whiteColor];
    [viewButton addSubview:buttonCancel];
    
    //**************************************************************
    //**************************** button **********************************
    UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetWidth(viewButton.frame)/2 + 0.5,1.0, CGRectGetWidth(viewButton.frame)/2-0.5, 44)];
    button.tag = 0;
    [button addTarget:self action:@selector(buttonTouchUp:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitleColor:[UIColor colorWithRed:249.0/255 green:157.0/255 blue:50.0/255 alpha:1.0] forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont systemFontOfSize:16]];
    [button setTitle:title forState:UIControlStateNormal];
    button.backgroundColor = [UIColor whiteColor];
    [viewButton addSubview:button];
    heightViewButton.constant = heightViewButton.constant + 45;

}


- (void) addButtonCancelWithTitle:(NSString *) title andOtherButtons:(NSArray *)titles{
    
    if (titles == nil) {
        [self addButtonWithTitle:title index:0.0 andSelector:@selector(cancel:)];
        return;
    }
    
    if (titles.count == 1) {
        [self addButtonCancelWithTitle:title andButtonWithTitle:[titles firstObject]];
    }else if (titles.count > 1){
        heightViewButton.constant = 0.0;
        for (NSString * titleButton in titles) {
            [self addButtonWithTitle:titleButton index:[titles indexOfObject:titleButton] andSelector:@selector(buttonTouchUp:)];
        }
        [self addButtonWithTitle:title index:titles.count andSelector:@selector(cancel:)];
    }
    
    heightContentView.constant = heightViewButton.constant + CGRectGetMinY(viewButton.frame);
    [self updateConstraintsIfNeeded];
    
}

- (void) addButtonWithTitle:(NSString *) title index:(NSInteger )index andSelector:(SEL) selector{
    
    UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(0,44 * index + 1 * (index + 1), CGRectGetWidth(viewButton.frame), 44)];
    button.tag = index + 1;
    [button addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
    [button setTitleColor:[UIColor colorWithRed:249.0/255 green:157.0/255 blue:50.0/255 alpha:1.0] forState:UIControlStateNormal];
    button.backgroundColor = [UIColor whiteColor];
    [button.titleLabel setFont:[UIFont systemFontOfSize:16]];
    [button setTitle:title forState:UIControlStateNormal];
    [viewButton addSubview:button];
    
    //**************************** Add contraint for button **********************************
    NSLayoutConstraint * contraintTop = [NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:viewButton attribute:NSLayoutAttributeTop multiplier:1.0 constant:44 * index + 1 * (index + 1)];
    
    NSLayoutConstraint * contraintLeft = [NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:viewButton attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0];
    
    NSLayoutConstraint * contraintRight = [NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:viewButton attribute:NSLayoutAttributeRight multiplier:1.0 constant:0];
    
    NSLayoutConstraint * contraintHeight = [NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1.0 constant:44.0];
    
    [button addConstraint:contraintHeight];
    heightViewButton.constant = heightViewButton.constant + 44 + 1;
    [viewButton addConstraints:@[contraintTop, contraintLeft, contraintRight]];
    
}

- (void) addContraintToView:(UIView *) view{

    NSLayoutConstraint * contraintTop = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    
    NSLayoutConstraint * contraintLeft = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0];
    
    NSLayoutConstraint * contraintRight = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0];
    
    NSLayoutConstraint * contraintBottom = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0];
    
    [view addConstraints:@[contraintTop, contraintLeft, contraintRight, contraintBottom]];
    [view updateConstraintsIfNeeded];
}

- (void) show{

    UIWindow *keyWindow = [[[UIApplication sharedApplication] delegate] window];
    CGRect rect = [self frame];
    rect.size = keyWindow.bounds.size;
    [self setFrame:rect];
    
    NSLog(@"view: %@", keyWindow);
    [contentView setBackgroundColor:[UIColor colorWithWhite:1.0 alpha:0.01]];
    [self setBackgroundColor:[UIColor colorWithWhite:0.0 alpha:0.5]];
    contentView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.001, 0.001);
    [keyWindow addSubview:self];
    [self addContraintToView:keyWindow];
    
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
    UIWindow *keyWindow = [[[UIApplication sharedApplication] delegate] window];

    UIGraphicsBeginImageContextWithOptions(keyWindow.frame.size, NO, scale);
    {
        {
            [keyWindow.layer renderInContext:UIGraphicsGetCurrentContext()];
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
