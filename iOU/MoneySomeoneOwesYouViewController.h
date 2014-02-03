//
//  MoneySomeoneOwesYouViewController.h
//  iOU
//
//  Created by iMac on 2/2/14.
//  Copyright (c) 2014 Testflight. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MoneySomeoneOwesYouViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *personWhoOwesYouMoney;
@property (weak, nonatomic) IBOutlet UIDatePicker *personWhoOwesYouDueDate;
@property (weak, nonatomic) IBOutlet UIButton *save;
@property (weak, nonatomic) IBOutlet UITextField *amtTheyOwe;

@end
