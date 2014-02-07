//
//  HistoryDetailsViewController.h
//  iOU
//
//  Created by iMac on 2/5/14.
//  Copyright (c) 2014 Testflight. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HistoryDetailsViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIView *labelDueDatte;
@property (weak, nonatomic) IBOutlet UILabel *labelCellNum;
@property (nonatomic, strong)NSManagedObjectContext *managedObjectContext;
@property (strong)NSMutableArray *youOweArray;
@property (strong)NSMutableArray *someoneOwesYouArray;
@property (weak, nonatomic) IBOutlet UILabel *labelDueDate;
@property (strong, nonatomic)NSString *cellNumString;
@property (strong, nonatomic)NSString *dateString;
- (IBAction)paid:(id)sender;



@end
