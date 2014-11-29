//
//  TWPhotoCollectionViewCell.m
//  Thousand Words
//
//  Created by Sakshi Jain on 22/11/14.
//
//

#import "TWPhotoCollectionViewCell.h"
#define IMAGEVIEW_BORDER_LENGTH 5

@implementation TWPhotoCollectionViewCell

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setup];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        [self setup];
    }
    return self;
}

-(void)setup
{
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0+IMAGEVIEW_BORDER_LENGTH, 0+IMAGEVIEW_BORDER_LENGTH, 180-(2*IMAGEVIEW_BORDER_LENGTH),180-(2*IMAGEVIEW_BORDER_LENGTH))];
                      //CGRectInset(self.bounds, IMAGEVIEW_BORDER_LENGTH, IMAGEVIEW_BORDER_LENGTH)];
    [self.contentView addSubview:self.imageView];
}


@end
