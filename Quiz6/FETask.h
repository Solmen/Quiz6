//
//  FETask.h
//  Quiz5FromEmpty
//
//  Created by Michael Toth on 3/16/14.
//  Copyright (c) 2014 Michael Toth. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FETask : NSObject
@property (nonatomic) float urgency;
@property (nonatomic, retain) NSDate *dueDate;
@property (nonatomic, retain) NSString *taskName;

- (id)initWithItemName:(NSString *)taskName
               dueDate:(NSDate *) dueDate
               urgency:(float)urgency;
@end
