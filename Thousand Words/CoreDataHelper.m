//
//  CoreDataHelper.m
//  Thousand Words
//
//  Created by Sakshi Jain on 16/11/14.
//
//

#import "CoreDataHelper.h"

@implementation CoreDataHelper

+(NSManagedObjectContext *)managedObjectContext
{
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    
    // if([delegate performSelector : @selector (managedObjectContext)]) {
    context = [delegate managedObjectContext];
//}
    return context;
}

@end
