//
//  Quiz6MasterViewController.m
//  Quiz6
//
//  Created by Samuel Tolkin on 4/7/14.
//  Copyright (c) 2014 Samuel Tolkin. All rights reserved.
//

#import "Quiz6MasterViewController.h"

#import "Quiz6DetailViewController.h"

#import "FETask.h"

@interface Quiz6MasterViewController () {
    NSMutableArray *_objects;
    
    
}
@end

@implementation Quiz6MasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    [self setTitle:@"My Tasks"];
    
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender
{
    
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    NSDate *startDate = [[NSDate alloc]init];
    
    FETask *newtask = [[FETask alloc] initWithItemName:@"New Task" dueDate:startDate urgency:0];
    
    
    
    [_objects insertObject:newtask atIndex:0];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    
    
}

-(void)viewWillAppear:(BOOL)animated{
    [self.tableView reloadData];
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    // static NSString *CellIdentifier = @"Cell";
    // UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell = [cell initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    
    // Configure the cell...
    FETask *t = [_objects objectAtIndex:[indexPath row]];
    
    
    if (t.urgency == 0) {
        //cell.backgroundColor = [UIColor colorWithRed:0.0 green:0.5 blue:0.0 alpha:0.5];
        cell.textLabel.textColor = [UIColor colorWithRed:0.0 green:0.5 blue:0.0 alpha:0.5];
        
    }
    else if (t.urgency <= 4){
        
        cell.textLabel.textColor = [UIColor colorWithRed:0.4 green:0.7 blue:0.0 alpha:0.5];
    }
    else if (t.urgency == 5){
        // cell.backgroundColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.0 alpha:0.5];
        cell.textLabel.textColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.0 alpha:0.5];
        
        
    }
    else if (t.urgency == 9){
        //cell.backgroundColor = [UIColor colorWithRed:0.5 green:0.0 blue:0.0 alpha:0.5];
        cell.textLabel.textColor = [UIColor colorWithRed:0.5 green:0.0 blue:0.0 alpha:0.5];
        
        
    }
    else{
        // cell.backgroundColor = [UIColor colorWithRed:0.7 green:0.4 blue:0.0 alpha:0.5];
        cell.textLabel.textColor = [UIColor colorWithRed:0.7 green:0.4 blue:0.0 alpha:0.5];
    }
    
    
    [cell.textLabel setText:[t taskName]];
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateStyle:NSDateFormatterLongStyle];
    NSString *datestring  =[df stringFromDate:t.dueDate];
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setMaximumFractionDigits:0];
    [formatter setMinimumFractionDigits:0];
    NSString *result = [formatter stringFromNumber:[NSNumber numberWithFloat:[t urgency]]];
    NSString *urgencystring = [NSString stringWithFormat: @"(%@)", result];
    datestring = [datestring stringByAppendingString:urgencystring];
    [cell.detailTextLabel setText:datestring];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    self.task = _objects[indexPath.row];
    
    Quiz6DetailViewController *details = (Quiz6DetailViewController*)[storyboard instantiateViewControllerWithIdentifier:@"details"];
    [details setTask:_task];
    
    
    
    details.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:details animated:YES];
    
}


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



/*- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 if ([[segue identifier] isEqualToString:@"showDetail"]) {
 NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
 FETask *object = _objects[indexPath.row];
 [[segue destinationViewController] setTask:object];
 }
 }*/





@end
