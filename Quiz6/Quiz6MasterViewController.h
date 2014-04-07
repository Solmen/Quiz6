//
//  Quiz6MasterViewController.h
//  Quiz6
//
//  Created by Samuel Tolkin on 4/7/14.
//  Copyright (c) 2014 Samuel Tolkin. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "FETask.h"

@interface Quiz6MasterViewController : UITableViewController
{
    NSMutableArray *tasks;
    
    
}

@property (nonatomic, strong) FETask *task;



@end
