//
//  Album.h
//  Thousand Words
//
//  Created by Sakshi Jain on 13/11/14.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Album : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSDate * date;

@end
