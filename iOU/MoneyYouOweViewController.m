//
//  MoneyYouOweViewController.m
//  iOU
//
//  Created by iMac on 2/2/14.
//  Copyright (c) 2014 Testflight. All rights reserved.
//

#import "MoneyYouOweViewController.h"
#import "OwedMoney.h"

@interface MoneyYouOweViewController ()

@end

@implementation MoneyYouOweViewController
@synthesize amtYouOwe, personYouOweDueDate, personYouOweMoney, managedObjectContext;

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
    
    amtYouOwe.delegate = self;
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSManagedObjectContext *context = [self managedObjectContext];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"OwedMoney" inManagedObjectContext:context];
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
    NSDate *choice = [personYouOweDueDate date];
    
    NSManagedObjectContext *context =  [self managedObjectContext];
    OwedMoney *owedMoney = [NSEntityDescription insertNewObjectForEntityForName:@"OwedMoney" inManagedObjectContext:context];
    
    [owedMoney setValue:[NSNumber numberWithInteger:[[amtYouOwe text] integerValue]] forKey:@"amountYouOwe"];
    [owedMoney setValue:personYouOweMoney.text forKey:@"youOweThisPerson"];
    [owedMoney setValue:choice forKey:@"youOweDate"];
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
    
    
    
    
}
@end
