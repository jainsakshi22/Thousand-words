//
//  TWAlbumTableViewController.h
//  Thousand Words
//
//  Created by Sakshi Jain on 11/11/14.
//
//

#import <UIKit/UIKit.h>

@interface TWAlbumTableViewController : UITableViewController

@property (strong,nonatomic) NSMutableArray *albums;

- (IBAction)addAlbumBarButtonItemPressed:(UIBarButtonItem *)sender;

@end
