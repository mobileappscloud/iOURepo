//
//  Home.m
//  iOU
//
//  Created by iMac on 2/2/14.
//  Copyright (c) 2014 Testflight. All rights reserved.
//

#import "Home.h"

@interface Home ()

@end

@implementation Home
@synthesize managedObjectcontext;

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
