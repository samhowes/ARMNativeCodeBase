//
//  StaticTableViewController.m
//  ARMonopolyNativeCodeBase
//
//  Created by Samuel Howes on 2/5/14.
//  Copyright (c) 2014 Samuel Howes. All rights reserved.
//

#import <MobileCoreServices/MobileCoreServices.h>
#import "ARMStaticTableViewController.h"
#import "ARMPlayerInfo.h"

@interface ARMStaticTableViewController ()

@property UIImagePickerController *cameraUI;

@end

@implementation ARMStaticTableViewController

@synthesize userDisplayStringTextField;
@synthesize userDisplayImageView;
@synthesize userData;
@synthesize cameraToolbar;
@synthesize cameraUI;


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
		
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	cameraToolbar.clipsToBounds = YES; // Remove the top border of the toolbar
	[userDisplayImageView.layer setBorderColor:[[UIColor grayColor] CGColor]]; // add a border to the image view
	[userDisplayImageView.layer setBorderWidth:1.0];

	if (userData && [userData playerDisplayName]) {
		[userDisplayStringTextField setText:[userData playerDisplayName]];
	}

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:animated];
	self.navigationController.view.backgroundColor = [UIColor whiteColor];
	self.navigationController.navigationBar.translucent = NO;
	
	
}

/****************************************************************************/
/*							UI protocols									*/
/****************************************************************************/

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	if (textField != userDisplayStringTextField)
	{
		return NO;
	}
	[userData setPlayerDisplayName:[textField text]];
	[textField resignFirstResponder];
	return YES;
}


- (IBAction)cameraButtonWasPressed:(id)sender {
	UIActionSheet *chooseImageActionSheeet =
		[[UIActionSheet alloc] initWithTitle:nil delegate:self
						   cancelButtonTitle:@"Cancel"
					  destructiveButtonTitle:nil
						   otherButtonTitles:@"Take Photo", @"Choose Existing", nil];

	[chooseImageActionSheeet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
	NSLog(@"Button at index: %ld was pressed", (long)buttonIndex);
	switch (buttonIndex) {
		case 0: 			// Take Photo
			[self showImagePickerForSourceType:UIImagePickerControllerSourceTypeCamera];
			break;
		case 1:				// Choose photo
			[self showImagePickerForSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
			break;
		case 2: 			// Cancel
			break;
			
		default:
			break;
	}
}

- (void)showImagePickerForSourceType:(UIImagePickerControllerSourceType)sourceType
{
	cameraUI = [[UIImagePickerController alloc] init];
	cameraUI.sourceType = sourceType;
	//imagePickerController.modalPresentationStyle = UIModalPresentationCurrentContext;
	
	cameraUI.mediaTypes = [NSArray arrayWithObjects:(NSString *)kUTTypeImage, nil];
	cameraUI.allowsEditing = YES;
	cameraUI.delegate = self;
	[[UIApplication sharedApplication] setStatusBarHidden:YES];
	[self presentViewController:cameraUI animated:YES completion:nil];
}


#pragma mark - UIImagePickerControllerDelegate Methods
/****************************************************************************/
/*					UIImagePickerControllerDelegate							*/
/****************************************************************************/

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
	[self dismissViewControllerAnimated:YES completion:nil];
	[[UIApplication sharedApplication] setStatusBarHidden:NO];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
	NSString *mediaType = [info objectForKey: UIImagePickerControllerMediaType];
	UIImage *originalImage, *editedImage, *imageToSave;
	
	if (CFStringCompare((CFStringRef)mediaType, kUTTypeImage, 0) == kCFCompareEqualTo)
	{
		editedImage = 	(UIImage *)[info objectForKey:UIImagePickerControllerEditedImage];
		originalImage = (UIImage *)[info objectForKey:UIImagePickerControllerOriginalImage];
		if (editedImage) {
			imageToSave = editedImage;
		} else {
			imageToSave = originalImage;
		}
		
		// Save the new image to the camera roll
		userDisplayImageView.image = imageToSave;
		[userData setPlayerDisplayImage:imageToSave];
	}
	
	if (CFStringCompare ((CFStringRef) mediaType, kUTTypeMovie, 0) == kCFCompareEqualTo)
	{
		NSLog(@"Error: movie encounterd as a result of the image picker!");
	}
	
	[self dismissViewControllerAnimated:YES completion:nil];
	[[UIApplication sharedApplication] setStatusBarHidden:NO];
	cameraUI = nil;
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
