//
//  MainTableViewController.m
//  GrailDiary
//
//  Created by Komari Herring on 8/1/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

#import "MainTableViewController.h"
#import "QuarterbackDetails.h"

@interface MainTableViewController ()

@property (strong, nonatomic) NSMutableArray *quarterbacks;

@end

@implementation MainTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Top 10 NFL Quarterbacks";
    self.quarterbacks = [[NSMutableArray alloc]init];
    [self loadQuarterbacks];
}
- (void)loadQuarterbacks
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"quarterbacks" ofType:@"json"];
    
    NSArray *quarterbacksJSON = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath] options:0 error:nil];
    
    for (NSDictionary *ADict in quarterbacksJSON)
    {
        QuarterbackDetails *aDetail = [QuarterbackDetails quarterbackDetailsWithDictionary:ADict];
        [self.quarterbacks addObject:aDetail];
    }
}
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return self.quarterbacks.count;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    

}
*/

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QuarterbackDetailsCell" forIndexPath:indexPath];
    QuarterbackDetails *detail = self.quarterbacks[indexPath.row]; 
    cell.textLabel.text = detail.name;
    cell.detailTextLabel.text = detail.team;
    
    return cell;
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
