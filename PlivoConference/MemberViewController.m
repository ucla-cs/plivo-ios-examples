//
//  MemberViewController.m
//  PlivoConference
//
//  Copyright (c) 2013 Plivo Inc. All rights reserved.
//  Use of this software is subject to the
//  terms mentioned here, http://plivo.com/terms/

#import "MemberViewController.h"
#import "AppDelegate.h"
#import "Members.h"

@interface MemberViewController ()

@end

@implementation MemberViewController {
    NSMutableArray *members;
}

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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    AppDelegate *delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    NSMutableArray *membersTable = delegate.members;
    
    return [membersTable count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"MemberCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    AppDelegate *delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    NSMutableArray *membersTable = delegate.members;
    
    Members *member = [membersTable objectAtIndex:indexPath.row];
    
	cell.textLabel.text = member.name;
	cell.detailTextLabel.text = member.sipURI;
    
    return cell;
}

@end
