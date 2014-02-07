//
//  TheyOweMoney.h
//  iOU
//
//  Created by iMac on 2/7/14.
//  Copyright (c) 2014 Testflight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface TheyOweMoney : NSManagedObject

@property (nonatomic, retain) NSNumber * amountOwed;
@property (nonatomic, retain) NSDate * dueDate;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * theyOweCellNum;
@property (nonatomic, retain) NSData * theyOwePic;
@property (nonatomic, retain) NSNumber * paid;

@end
