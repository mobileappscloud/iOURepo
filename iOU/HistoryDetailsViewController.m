//
//  HistoryDetailsViewController.m
//  iOU
//
//  Created by iMac on 2/5/14.
//  Copyright (c) 2014 Testflight. All rights reserved.
//

#import "HistoryDetailsViewController.h"
#import "HomeTableViewController.h"

@interface HistoryDetailsViewController ()

@end

@implementation HistoryDetailsViewController
@synthesize labelCellNum, labelDueDatte, youOweArray, someoneOwesYouArray, labelDueDate;
-(NSManagedObjectContext *)managedObjectContext
{
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)])
    {
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
    
    [self.labelCellNum setText:self.cellNumString];
    [self.labelDueDate setText:self.dateString];
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)paid:(id)sender {
}
@end
