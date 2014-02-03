//
//  OwedMoney.h
//  iOU
//
//  Created by iMac on 2/2/14.
//  Copyright (c) 2014 Testflight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface OwedMoney : NSManagedObject

@property (nonatomic, retain) NSString * personWhoOwesYou;
@property (nonatomic, retain) NSString * youOweThisPerson;
@property (nonatomic, retain) NSDate * personOweDate;
@property (nonatomic, retain) NSDate * youOweDate;
@property (nonatomic, retain) NSNumber * amountYouOwe;
@property (nonatomic, retain) NSNumber * amountTheyOwe;

@end
