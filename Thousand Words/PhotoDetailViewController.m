//
//  PhotoDetailViewController.m
//  Thousand Words
//
//  Created by Sakshi Jain on 13/12/14.
//
//

#import "PhotoDetailViewController.h"
#import "Photo.h"
#import "FiltersCollectionViewController.h"

@interface PhotoDetailViewController ()

@end

@implementation PhotoDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    self.imageView.image = self.photo.image;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"Filter Segue"])
    {
        if ([segue.destinationViewController isKindOfClass:[FiltersCollectionViewController class]])
        {
            FiltersCollectionViewController *targetViewController = segue.destinationViewController;
            targetViewController.photo = self.photo;
        }
    }
    
}


#pragma mark - IBActions method

- (IBAction)addFilterButtonPressed:(UIButton *)sender
{
    
}

- (IBAction)deleteButtonPressed:(UIButton *)sender
{
    [[self.photo managedObjectContext ] deleteObject:self.photo];
    
    //permanently delete when restarting the simulator
    NSError *error = nil;
    [[self.photo managedObjectContext] save:&error];
    if (error)
    {
        NSLog(@"error");
    }
        
    
    [self.navigationController popViewControllerAnimated:YES];
}
@end
