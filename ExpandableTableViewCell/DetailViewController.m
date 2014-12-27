//
//  DetailViewController.m
//  ExpandableTableViewCell
//
//  Created by Evan Anger on 12/27/14.
//  Copyright (c) 2014 Evan Anger. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (nonatomic) NSMutableArray *selections;
@end

@implementation DetailViewController


- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    self.selections = [NSMutableArray arrayWithArray:@[ @NO, @NO, @NO, @NO, @NO ]];
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINib *nib = [UINib nibWithNibName:@"ExpandableTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"Expandable"];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.selections.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Expandable"];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSNumber *selection = [self.selections objectAtIndex:indexPath.row];
    if([selection boolValue]) {
        return 88;
    } else {
        return 44;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [UIView new];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSNumber *selection = [self.selections objectAtIndex:indexPath.row];
    if([selection boolValue]) {
        [self.selections setObject:@NO atIndexedSubscript:indexPath.row];
    } else {
        self.selections = [NSMutableArray arrayWithArray:@[ @NO, @NO, @NO, @NO, @NO ]];
        [self.selections setObject:@YES atIndexedSubscript:indexPath.row];
    }
    
    [self.tableView beginUpdates];
    [self.tableView endUpdates];
}

@end
