//
//  TWPictureDataTransformer.m
//  Thousand Words
//
//  Created by Sakshi Jain on 01/12/14.
//
//

#import "TWPictureDataTransformer.h"
#import <UIKit/UIKit.h>

@implementation TWPictureDataTransformer

+(Class)transformedValueClass
{
    return [NSData class];
}

+(BOOL)allowsReverseTransformation
{
    return YES;
}

-(id)transformedValue:(id)value
{
    return UIImagePNGRepresentation(value);
}

-(id)reverseTransformedValue:(id)value
{
    UIImage *image = [UIImage imageWithData:value];
    return image;
}

@end
