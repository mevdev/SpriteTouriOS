//
//  MenuViewController.m
//  Sprite Tour
//
//  Created by Robert Linnemann on 11/24/13.
//  Copyright (c) 2013 Robert Linnemann. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController ()
{
    int menuIndex;
    NSString *menuTitle;
}
@end

@implementation MenuViewController



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
    menuIndex = 0;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    menuIndex = indexPath.row;
    menuTitle = [NSString stringWithString:[tableView cellForRowAtIndexPath:indexPath].textLabel.text];
    [self performSegueWithIdentifier:@"showtime" sender:nil];
}



-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"showtime"]){
        ViewController *vc = (ViewController *)segue.destinationViewController;
        vc.indexSelected = menuIndex;
        vc.title = menuTitle;
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
