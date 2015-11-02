//
//  MainViewController.m
//  Yelp
//
//  Created by Timothy Lee on 3/21/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import "MainViewController.h"
#import "YelpBusiness.h"
#import "BusinessCell.h"
#import "BusinessSearchSettings.h"
#import "FiltersViewController.h"

#import "MBProgressHUD.h"

@interface MainViewController () <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, FiltersViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UITableView *mainTableView;
@property (strong, nonatomic) NSArray *businesses;
@property (strong, nonatomic) UISearchBar *searchBar;
@property (strong, nonatomic) BusinessSearchSettings *searchSettings;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self initializeTableView];
    [self initializeAppearance];
    [self initializeSearchBar];

    [self doSearch];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void) doSearch {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [YelpBusiness searchWithTerm:self.searchSettings.term
                        sortMode:self.searchSettings.sortMode
                      categories:self.searchSettings.categories
                           deals:self.searchSettings.hasDeal
                      completion:^(NSArray *businesses, NSError *error) {
                          if (!error) {
                              for (YelpBusiness *business in businesses) {
                                  NSLog(@"%@", business);
                              }
                              self.businesses = businesses;
                              self.searchBar.text = self.searchSettings.term;

                              [self.mainTableView reloadData];
                          } else {
                              NSLog(@"An error occurred: %@", error.description);
                              [self alertNetworkError];
                          }

                          [MBProgressHUD hideHUDForView:self.view animated:YES];
                      }];

}

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar {
    [self.searchBar setShowsCancelButton:YES animated:YES];
    return YES;
}

- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar {
    [self.searchBar setShowsCancelButton:NO animated:YES];
    return YES;
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    searchBar.text = @"";
    [searchBar resignFirstResponder];
}

- (void) searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    self.searchSettings.term = searchBar.text;
    [searchBar resignFirstResponder];
    [self doSearch];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)initializeTableView {
    self.mainTableView.dataSource = self;
    self.mainTableView.delegate = self;
    
    [self.mainTableView registerNib:[UINib nibWithNibName:@"BusinessCell" bundle:nil] forCellReuseIdentifier:@"BusinessCell"];
    
    self.mainTableView.estimatedRowHeight = 100;
    self.mainTableView.rowHeight = UITableViewAutomaticDimension;
}

- (void)initializeAppearance {
    self.title = @"Yelp";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleLightContent;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
}

- (void)initializeSearchBar {
    self.searchSettings = [[BusinessSearchSettings alloc] init];
    self.searchBar = [[UISearchBar alloc] init];
    self.searchBar.delegate = self;
    [self.searchBar sizeToFit];
    self.navigationItem.titleView = self.searchBar;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Filter" style:UIBarButtonItemStylePlain target:self action:@selector(onFilterButton)];
}

- (void)alertNetworkError {
    UIAlertController *myAlertController = [UIAlertController alertControllerWithTitle:@"Error"
                                                                               message:@"Network error, please check your network connection."
                                                                        preferredStyle:UIAlertControllerStyleAlert                   ];
    UIAlertAction* ok = [UIAlertAction
                         actionWithTitle:@"OK"
                         style:UIAlertActionStyleDefault
                         handler:^(UIAlertAction * action)
                         {
                             [myAlertController dismissViewControllerAnimated:YES completion:nil];
                             
                         }];
    [myAlertController addAction: ok];
    [self presentViewController:myAlertController animated:YES completion:nil];
}

#pragma mark - Table view methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.businesses.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BusinessCell *cell = [self.mainTableView dequeueReusableCellWithIdentifier:@"BusinessCell"];
    YelpBusiness *business = self.businesses[indexPath.row];
    cell.business = business;
    
    return cell;
}

#pragma mark - Filter delegate methods
- (void)filtersViewController:(FiltersViewController *)filtersViewController didChangeFilters:(NSDictionary *)filters {
    self.searchSettings.term = @"car wash";
    [self doSearch];
}

#pragma mark - Private methods
- (void)onFilterButton {
    FiltersViewController *filtersViewController = [[FiltersViewController alloc] init];
    filtersViewController.delegate = self;

    UINavigationController *filtersViewNavigationController = [[UINavigationController alloc] initWithRootViewController:filtersViewController];
    [self presentViewController:filtersViewNavigationController animated:YES completion:nil];
}

@end
