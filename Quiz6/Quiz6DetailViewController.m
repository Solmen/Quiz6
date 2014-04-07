//
//  Quiz6DetailViewController.m
//  Quiz6
//
//  Created by Samuel Tolkin on 4/7/14.
//  Copyright (c) 2014 Samuel Tolkin. All rights reserved.
//

#import "Quiz6DetailViewController.h"
#import "FETask.h"
#import "Quiz6MasterViewController.h"

@interface Quiz6DetailViewController ()
- (void)configureView;

@end

@implementation Quiz6DetailViewController

@synthesize task;

#pragma mark - Managing the detail item

- (void)configureView
{
    // Update the user interface for the detail item.
    
    if (self.task) {
        [self.taskName setText:[task taskName]];
        [self.date setDate:[task dueDate]];
        [self.taskUrgency setValue:[task urgency]];
        int slidervalue = [task urgency];
        [self.urgencyLabel setText:[NSString stringWithFormat:@"Urgency: %d.00", slidervalue]];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.taskName.delegate = self;
    [self configureView];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)save:(id)sender {
    
    [[self view] endEditing:YES];
    [task setTaskName:[_taskName text]];
    [task setDueDate:[_date date]];
    [task setUrgency:[_taskUrgency value]];
    
    self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self shouldPerformSegueWithIdentifier:@"no" sender:self];
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)valuechanged:(id)sender{
    int sliderValue = [_taskUrgency value];
    [self.urgencyLabel setText:[NSString stringWithFormat:@"Urgency: %d.00", sliderValue]];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}




@end
