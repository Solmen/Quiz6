//
//  Quiz6DetailViewController.h
//  Quiz6
//
//  Created by Samuel Tolkin on 4/7/14.
//  Copyright (c) 2014 Samuel Tolkin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FETask;

@interface Quiz6DetailViewController : UIViewController <UITextFieldDelegate>
{
    
    __weak IBOutlet UITextField *taskName;
    __weak IBOutlet UIDatePicker *dueDate;
    __weak IBOutlet UILabel *urgencyLabel;
    __weak IBOutlet UISlider *taskUrgency;
    
}
- (IBAction)BackgroundTapped:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *taskName;
@property (weak, nonatomic) IBOutlet UISlider *taskUrgency;
@property (weak, nonatomic) IBOutlet UILabel *urgencyLabel;
@property (weak, nonatomic) IBOutlet UIDatePicker *date;



@property (nonatomic, strong) FETask *task;


- (IBAction)save:(id)sender;
- (IBAction)valuechanged:(id)sender;

@end
