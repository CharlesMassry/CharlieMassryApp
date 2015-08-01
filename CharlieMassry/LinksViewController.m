//
//  LinksViewController.m
//  CharlieMassry
//
//  Created by Charlie Massry on 7/31/15.
//  Copyright (c) 2015 Charlie Massry. All rights reserved.
//

#import "LinksViewController.h"
#import "APIClient.h"
#import "LinkViewCell.h"
#import <UIKit+AFNetworking.h>
#import "LinkViewController.h"

@interface LinksViewController ()
@property (strong, nonatomic) NSArray *links;
@end

@implementation LinksViewController

static NSString * const reuseIdentifier = @"LinkViewCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerNib:[UINib nibWithNibName:reuseIdentifier bundle:nil]
          forCellWithReuseIdentifier:reuseIdentifier];
    
    [APIClient getLinksIndexWithCompletionBlock:^(NSArray *links, NSError *error){
        self.links = links;
        [self.collectionView reloadData];
    }];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.links.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    LinkViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    Link *link = self.links[indexPath.row];

    [cell.imageView setImageWithURL:[NSURL URLWithString:link.imageURL]];
    cell.name.text = link.name;
    // Configure the cell
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    Link *link = self.links[indexPath.row];
    LinkViewController *linkVC = [[LinkViewController alloc] initWithLink:link];
    [self.navigationController pushViewController:linkVC animated:YES];
}

@end
