//
//  NQViewController.m
//  AlertView
//
//  Created by Quan Nguyen Van on 12/08/2014.
//  Copyright (c) 2014 Quan Nguyen Van. All rights reserved.
//

#import "NQViewController.h"
#import "AlertCustom.h"

@interface NQViewController ()

@end

@implementation NQViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
  
	// Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)showAlert:(id)sender {
    AlertCustom * custom = [[AlertCustom alloc] initWithTitle:@"Test Title" message:@"There's something wrong with the way you create your paragraph style. Check the example I've added, it worked in EGOTextView, at least it displayed the line as centered, but the thing seems to be buggy, selection doesn't work properly with centered text" delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:@[@"button 1", @"button 2", @"button 3", @"button4"] dismissWihtCancel:^(NSString *title) {
        NSLog(@"button Cancel With Title: %@", title);
    } orButtonIndex:^(NSString *title, NSInteger index) {
        NSLog(@"button  With Title: %@ and Index: %ld", title, index);
        
    }];
    [custom show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
