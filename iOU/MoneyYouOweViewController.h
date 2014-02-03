//
//  MoneyYouOweViewController.h
//  iOU
//
//  Created by iMac on 2/2/14.
//  Copyright (c) 2014 Testflight. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MoneyYouOweViewController : UIViewController <UITextFieldDelegate>
{
    
}
@property (weak, nonatomic) IBOutlet UITextField *personYouOweMoney;
@property (weak, nonatomic) IBOutlet UIDatePicker *personYouOweDueDate;
- (IBAction)save:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *amtYouOwe;
@property (nonatomic, strong)NSManagedObjectContext *managedObjectContext;
@property (strong) NSArray *dataArray;

@end
