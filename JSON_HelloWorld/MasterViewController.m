//
//  MasterViewController.m
//  JSON_HelloWorld
//
//  Created by Marin Todorov on 13/01/2013.
//  Copyright (c) 2013 Underplot ltd. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"

#import "JSONModelLib.h"
#import "KivaFeed.h"
#import "HUD.h"

@interface MasterViewController () {
    KivaFeed* _feed;
}
@end

@implementation MasterViewController

-(void)viewDidAppear:(BOOL)animated
{
    //show loader view
    [HUD showUIBlockingIndicatorWithText:@"Fetching JSON"];
    
    //fetch the feed
    _feed = [[KivaFeed alloc] initFromURLWithString:@"http://api.kivaws.org/v1/loans/search.json?status=fundraising"
                                         completion:^(JSONModel *model, JSONModelError *err) {
                                             
                                             //hide the loader view
                                             [HUD hideUIBlockingIndicator];
                                             
                                             //json fetched
                                             NSLog(@"loans: %@", _feed.loans);
                                             
                                             [self.tableView reloadData];
                                             
                                         }];
}

#pragma mark - table methods
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _feed.loans.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LoanModel* loan = _feed.loans[indexPath.row];

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ from %@",
                           loan.name, loan.location.country
                           ];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    LoanModel* loan = _feed.loans[indexPath.row];
    
    NSString* message = [NSString stringWithFormat:@"%@ from %@ needs a loan %@",
                         loan.name, loan.location.country, loan.use
                         ];
    
    
    [HUD showAlertWithTitle:@"Loan details" text:message];
}


@end
