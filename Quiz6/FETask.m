//
//  FETask.m
//  Quiz5FromEmpty
//
//  Created by Michael Toth on 3/16/14.
//  Copyright (c) 2014 Michael Toth. All rights reserved.
//

#import "FETask.h"

@implementation FETask

- (id)initWithItemName:(NSString *)taskName
               dueDate:(NSDate *) dueDate
               urgency:(float)urgency;
{
    // Call the superclass's designated initializer
    self = [super init];
    
    // Did the superclass's designated initializer succeed?
    if(self) {
        // Give the instance variables initial values
        [self setTaskName:taskName];
        [self setUrgency:urgency];
        [self setDueDate:dueDate];
    }
    
    // Return the address of the newly initialized object
    return self;
}

@end
