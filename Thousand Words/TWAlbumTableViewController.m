//
//  TWAlbumTableViewController.m
//  Thousand Words
//
//  Created by Sakshi Jain on 11/11/14.
//
//

#import "TWAlbumTableViewController.h"
#import "Album.h"
#import "CoreDataHelper.h"

@interface TWAlbumTableViewController () <UIAlertViewDelegate>

@end

@implementation TWAlbumTableViewController

-(NSMutableArray *)albums
{
    if (!_albums) _albums = [[NSMutableArray alloc] init];
    return _albums;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

//Queries our database for objects
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Album"];
    fetchRequest.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"date" ascending:YES]];
    
    NSError *error = nil;
    
    NSArray *fetchedAlbums = [[CoreDataHelper managedObjectContext] executeFetchRequest:fetchRequest error:&error];
    self.albums = [fetchedAlbums mutableCopy];
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBActions

-(IBAction)addAlbumBarButtonItemPressed:(UIBarButtonItem *)sender
{
    //Add delegate this time as we are using other button "Add" here
    UIAlertView *newAlbumAlertView = [[UIAlertView alloc] initWithTitle:@"Enter new album name" message:nil delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Add", nil];
    [newAlbumAlertView setAlertViewStyle : UIAlertViewStylePlainTextInput];
    [newAlbumAlertView show];
}

#pragma mark - Helper methods

/* 
 This method will create an album object in our database, and returns it. It takes one parameter, an NSString which will be set to our albums name.
 
 We first access our app delegate, and from that we get our NSManagedObjectContext. Each NSManagedObject belongs to only one NSMangedObject context which is responsible for managing it. We will be using the same context in the entire application.
 
 Next we create our new persistent Album object using the class method insertNewObjectForEntityForName. This is a class method on NSEntitiyDescription that takes both the entities name and a context, or Scratchpad. With our NSMangedObject subclass, we set its attributes exactly as we would properties. Notice the [NSDate date] method makes sure that our Album’s date attribute represents the date it was created. Finally, we save our new object to the database using the method save.
 */
-(Album *)albumNameWithAlbum : (NSString *)name
{
    //Create a variable that points to the NSManagedObjectContext from our App Delegate.
    NSManagedObjectContext *context  = [CoreDataHelper managedObjectContext];
    
    //Next, create an NSManagedObject subclass with the class method insertNewObjectForEntityForName and set its’ attributes. //Create new persistent NSMangagedObject
    Album *album = [NSEntityDescription insertNewObjectForEntityForName:@"Album" inManagedObjectContext:context];
    album.name = name;
    album.date = [NSDate date];
    
    NSError *error = nil;
    //Finally, call the method save on the instance of our NSManagedObjectContext.
    if (![context save : &error])
    {
        //we have an error
        NSLog(@"%@", error);
    }
    return album;
    
}

#pragma mark - UIAlertView Delegate

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex ==1)
    {
        NSString *alertText = [alertView textFieldAtIndex:0].text;
        /*
        Album *newAlbum = [self albumNameWithAlbum:alertText];
        [self.albums addObject:newAlbum];
        [self.tableView reloadData];
         */
        
        //Perform same task as above 3 lines
        //Efficient way: Use insert method instead of reloading the whole table
        [self.albums addObject:[self albumNameWithAlbum:alertText]];
        [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:[self.albums count] -1 inSection:0]]withRowAnimation:UITableViewRowAnimationFade];
        
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return [self.albums count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    Album *selectedAlbum = self.albums[indexPath.row];
    cell.textLabel.text = selectedAlbum.name;
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
