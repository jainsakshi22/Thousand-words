//
//  TWPhotosCollectionViewController.h
//  Thousand Words
//
//  Created by Sakshi Jain on 22/11/14.
//
//

#import <UIKit/UIKit.h>
#import "Album.h"

@interface TWPhotosCollectionViewController : UICollectionViewController

@property (strong,nonatomic) Album *album;

- (IBAction)cameraBarButtonItemPressed:(UIBarButtonItem *)sender;

@end
