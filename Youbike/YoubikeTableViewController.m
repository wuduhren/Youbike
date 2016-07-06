//
//  YoubikeTableViewController.m
//  Youbike
//
//  Created by Eph on 2016/7/5.
//  Copyright © 2016年 AppWorks School WuDuhRen. All rights reserved.
//

#import "YoubikeTableViewController.h"
#import "YoubikeModel.h"
#import "YoubikeManager.h"

@interface YoubikeTableViewController ()

@property (strong, nonatomic) NSMutableArray *youbikeModelArray;

@end


@implementation YoubikeTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINib *cellNib = [ UINib nibWithNibName: @"YoubikeDataTableViewCell" bundle: nil ];
    [ self.tableView registerNib:cellNib forCellReuseIdentifier: @"YoubikeDataTableViewCell" ];
    
    self.youbikeModelArray = [[YoubikeManager sharedManager] ParseJson];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.youbikeModelArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *TableViewCellIdentifier = @"YoubikeDataTableViewCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: TableViewCellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TableViewCellIdentifier];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120;
}




@end
