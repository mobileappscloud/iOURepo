//
//  MoneyYouOweViewController.h
//  iOU
//
//  Created by iMac on 2/2/14.
//  Copyright (c) 2014 Testflight. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AddressBookUI/AddressBookUI.h>

@interface MoneyYouOweViewController : UIViewController <UITextFieldDelegate, ABPeoplePickerNavigationControllerDelegate>
{
    
}
@property (weak, nonatomic) IBOutlet UITextField *personYouOweMoney;
@property (weak, nonatomic) IBOutlet UIDatePicker *personYouOweDueDate;
- (IBAction)save:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *amtYouOwe;
@property (nonatomic, strong)NSManagedObjectContext *managedObjectContext;
@property (strong) NSArray *dataArray;
- (IBAction)addContact:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *cellNum;

@end
