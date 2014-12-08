//
//  AlertCustom.h
//  Minfo
//
//  Created by quannv on 10/20/14.
//  Copyright (c) 2014 Dungnt Gzone. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^CancelBlock)(NSString * title);
typedef void(^SelectButton)(NSString * title, NSInteger index);
typedef void(^SelectButtonAndTextFeild)(NSString * title, NSInteger index, NSString * text);

@interface AlertCustom : UIView{

    IBOutlet UIView *contentView;
    IBOutlet UILabel *messageAlert;
    IBOutlet UIView *viewButton;
    IBOutlet NSLayoutConstraint *heightViewButton;
    IBOutlet NSLayoutConstraint *heightContentView;
    IBOutlet UIImageView *imageBackground;
    IBOutlet NSLayoutConstraint *heightMessage;
    IBOutlet NSLayoutConstraint *heightTextField;
    IBOutlet NSLayoutConstraint *originText;
    IBOutlet UITextField *textFeild;
}

@property (nonatomic, assign, readonly) BOOL isShowTextFeild;

- (instancetype) initWithTitle:(NSString *) title andDescription:(NSString *)description;
- (instancetype) initWithTitle:(NSString *) title message:(NSString *)message delegate:(id)delegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSArray *) otherButtonTitles dismissWihtCancel:(CancelBlock) cancel orButtonIndex:(SelectButton) button;

- (instancetype) initWithTitle:(NSString *) title
                       message:(NSString *)message
              containTextFeild:(BOOL) isContain
             cancelButtonTitle:(NSString *)cancelButtonTitle
             otherButtonTitles:(NSArray *) otherButtonTitles
             dismissWihtCancel:(CancelBlock) cancel
                 orButtonIndex:(SelectButtonAndTextFeild) button;

- (instancetype) initWithTitle:(NSString *) title
                       message:(NSString *)message
                    viewCustom:(UIView *) customView
             cancelButtonTitle:(NSString *)cancelButtonTitle
             otherButtonTitles:(NSArray *) otherButtonTitles
             dismissWihtCancel:(CancelBlock) cancel
                 orButtonIndex:(SelectButton) button;
- (void) show;
- (void) showTextFeild:(BOOL) isShow;

- (void) addCustomView:(UIView *) customView;
@end
