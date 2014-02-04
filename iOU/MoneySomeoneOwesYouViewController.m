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
@synthesize dataArray, managedObjectContext, amtTheyOwe, personWhoOwesYouDueDate, personWhoOwesYouMoney;


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
    
    [owedMoney setValue:[NSNumber numberWithInteger:[[amtTheyOwe text] integerValue]] forKey:@"amountOwed"];
    [owedMoney setValue:personWhoOwesYouMoney.text forKey:@"name"];
    [owedMoney setValue:choice forKey:@"dueDate"];
    
    
    
    
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
    
}
@end
