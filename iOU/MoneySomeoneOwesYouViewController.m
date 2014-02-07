//
//  MoneySomeoneOwesYouViewController.m
//  iOU
//
//  Created by iMac on 2/2/14.
//  Copyright (c) 2014 Testflight. All rights reserved.
//

#import "MoneySomeoneOwesYouViewController.h"
#import "TheyOweMoney.h"

@interface MoneySomeoneOwesYouViewController ()

@end

@implementation MoneySomeoneOwesYouViewController
@synthesize dataArray, managedObjectContext, amtTheyOwe, personWhoOwesYouDueDate, personWhoOwesYouMoney, cellNum;


- (NSManagedObjectContext *)managedObjectContext
{
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    amtTheyOwe.delegate = self;
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSManagedObjectContext *context = [self managedObjectContext];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"TheyOweMoney" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    
    NSError *error;
    self.dataArray =[managedObjectContext executeFetchRequest:fetchRequest error:&error];
	// Do any additional setup after loading the view.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:TRUE];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)save:(id)sender {
    
    NSDate *choice = [personWhoOwesYouDueDate date];
    
    NSManagedObjectContext *context =  [self managedObjectContext];
    TheyOweMoney *owedMoney = [NSEntityDescription insertNewObjectForEntityForName:@"TheyOweMoney" inManagedObjectContext:context];
    [owedMoney setValue:choice forKey:@"dueDate"];
    [owedMoney setValue:cellNum.text forKey:@"theyOweCellNum"];
    [owedMoney setValue:[NSNumber numberWithInteger:[[amtTheyOwe text] integerValue]] forKey:@"amountOwed"];
    [owedMoney setValue:personWhoOwesYouMoney.text forKey:@"name"];
    
    NSLog(@"%@", choice);
    
    
    
    
    
    NSError *error;
    
    if (![context save:&error])
    {
        NSLog(@"Whoops! Couldnt find the save %@", error.localizedDescription);
    }
    else
    {
        UIAlertView *myAlertview = [[UIAlertView alloc] initWithTitle:@"Success!" message:@"Data successfully saved!" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
        [myAlertview show];
    }
    
    personWhoOwesYouMoney.text = @" ";
    amtTheyOwe.text = @" ";
    self.cellNum.text = @" ";
}

- (IBAction)addContact:(id)sender {
    ABPeoplePickerNavigationController *picker = [[ABPeoplePickerNavigationController alloc] init];
    picker.peoplePickerDelegate = self;
    
    [self presentViewController:picker animated:YES completion:nil];
    
}
-(void)peoplePickerNavigationControllerDidCancel:(ABPeoplePickerNavigationController *)peoplePicker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)displayPerson:(ABRecordRef)person
{
    // NSManagedObjectContext *context =  [self managedObjectContext];
    // OwedMoney *owedMoney = [NSEntityDescription insertNewObjectForEntityForName:@"OwedMoney" inManagedObjectContext:context];
    
    //  NSData *imgData = (__bridge_transfer NSData *)ABPersonCopyImageData(person);
    
    //  [owedMoney setValue:imgData forKey:@"youOwePic"];
    
    NSString *name = (__bridge_transfer NSString*)ABRecordCopyValue(person, kABPersonFirstNameProperty);
    personWhoOwesYouMoney.text = name;
    
    NSString *phone = nil;
    
    ABMultiValueRef phoneNumbers = ABRecordCopyValue(person, kABPersonPhoneProperty);
    
    if (ABMultiValueGetCount(phoneNumbers) > 0)
    {
        phone = (__bridge_transfer NSString*)ABMultiValueCopyValueAtIndex(phoneNumbers, 0);
    }
    
    else{
        phone = @"[None]";
    }
    
    self.cellNum.text = phone;
    CFRelease(phoneNumbers);
}

-(BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person
{
    [self displayPerson:person];
    [self dismissViewControllerAnimated:YES completion:nil];
    return NO;
}

-(BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier
{
    return NO;
}


@end
