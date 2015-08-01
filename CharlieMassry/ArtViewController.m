//
//  ArtViewController.m
//  CharlieMassry
//
//  Created by Charlie Massry on 7/29/15.
//  Copyright (c) 2015 Charlie Massry. All rights reserved.
//

#import "ArtViewController.h"
#import "ArtViewCell.h"
#import "APIClient.h"
#import "Art.h"
#import <UIKit+AFNetworking.h>

@interface ArtViewController ()
@property (strong, nonatomic) NSArray *arts;
@end

@implementation ArtViewController

static NSString * const ArtViewCellIdentifier = @"ArtViewCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    [APIClient getArtIndexWithCompletionBlock:^(NSArray *arts, NSError *error) {
        self.arts = arts;
        [self.collectionView reloadData];
    }];
    // Register cell classes

    [self.collectionView registerNib:[UINib nibWithNibName:ArtViewCellIdentifier bundle:nil]
          forCellWithReuseIdentifier:ArtViewCellIdentifier];
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
    return self.arts.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ArtViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ArtViewCellIdentifier
                                                                  forIndexPath:indexPath];
    
    // Configure the cell
    Art *art = self.arts[indexPath.row];
    [cell.thumbnailView setImageWithURL:[NSURL URLWithString:art.imageURL]];
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
