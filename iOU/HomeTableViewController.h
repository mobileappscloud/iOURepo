//
//  HomeTableViewController.h
//  iOU
//
//  Created by iMac on 2/1/14.
//  Copyright (c) 2014 Testflight. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeTableViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>
{
    
}
@property (strong, nonatomic) IBOutlet UITableView *myTableView;
@property (nonatomic, strong)NSMutableArray *YouOweArray;
@property (nonatomic, strong)NSMutableArray *SomeonesOwesYouArray;
@property (nonatomic, strong)NSMutableArray *MyArray;

@end
