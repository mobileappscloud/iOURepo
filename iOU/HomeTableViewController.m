//
//  HomeTableViewController.m
//  iOU
//
//  Created by iMac on 2/1/14.
//  Copyright (c) 2014 Testflight. All rights reserved.
//

#import "HomeTableViewController.h"

@interface HomeTableViewController ()

@end

@implementation HomeTableViewController
@synthesize YouOweArray, SomeonesOwesYouArray, MyArray;

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

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"OwedMoney"];
    NSFetchRequest *myFetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"TheyOweMoney"];
    YouOweArray = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    SomeonesOwesYouArray = [[managedObjectContext executeFetchRequest:myFetchRequest error:nil] mutableCopy];
    MyArray = [[NSMutableArray alloc] initWithObjects:YouOweArray, SomeonesOwesYouArray, nil];
    
    
    [self.tableView reloadData];
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    //test for github

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [MyArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[MyArray objectAtIndex:section] count];
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
  if (section == 0)
      return @"You Owe";
    else if(section == 1)
        return @"They Owe";
    else{
        return @"Blah";
    }
      
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    
    if (indexPath.section == 0)
    {
        
        
        NSManagedObject *YouOweData = [YouOweArray objectAtIndex:indexPath.row];
        

        [cell.textLabel setText:[NSString stringWithFormat:@"You owe %@ $%@ USD", [YouOweData valueForKey:@"youOweThisPerson"], [YouOweData valueForKey:@"amountYouOwe"]]];
        [cell.detailTextLabel setText:[NSString stringWithFormat:@"Due by %@", [YouOweData valueForKey:@"youOweDate"]]];

    }
    
    else if (indexPath.section == 1)
    {
        NSManagedObject *TheyOweYouData = [SomeonesOwesYouArray objectAtIndex:indexPath.row];
        
        [cell.textLabel setText:[NSString stringWithFormat:@"%@ owes you $%@ USD", [TheyOweYouData valueForKey:@"name"], [TheyOweYouData valueForKey:@"amountOwed"]]];
        [cell.detailTextLabel setText:[NSString stringWithFormat:@"Due by %@", [TheyOweYouData valueForKey:@"dueDate"]]];
        
    }
         return cell;
}


-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSManagedObjectContext *context = [self managedObjectContext];
    
    if (editingStyle == UITableViewCellEditingStyleDelete && indexPath.section == 0)
    {
        [context deleteObject:[YouOweArray objectAtIndex:indexPath.row]];
        
        NSError *error = nil;
        if (![context save:&error])
        {
            NSLog(@"Can't Delete! %@ %@", error, [error localizedDescription]);
            return;
        }
        
        [YouOweArray removeObjectAtIndex:indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    
    else  if (editingStyle == UITableViewCellEditingStyleDelete && indexPath.section == 1)
    {
        [context deleteObject:[SomeonesOwesYouArray objectAtIndex:indexPath.row]];
        
        NSError *error = nil;
        if (![context save:&error])
        {
            NSLog(@"Can't Delete! %@ %@", error, [error localizedDescription]);
            return;
        }
        
        [SomeonesOwesYouArray removeObjectAtIndex:indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
