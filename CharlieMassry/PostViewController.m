//
//  PostViewController.m
//  CharlieMassry
//
//  Created by Charlie Massry on 12/29/14.
//  Copyright (c) 2014 Charlie Massry. All rights reserved.
//

#import "PostViewController.h"

@interface PostViewController ()

@end

@implementation PostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = self.post.title;
    
    [[NSNotificationCenter defaultCenter]
        addObserver:self
           selector:@selector(dataRetrieved:)
               name:@"initWithPostShowJSONFinishedLoading"
             object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.view.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

-(void)dataRetrieved:(NSNotification *)retrievedPost;
{
    self.post = [retrievedPost object];
    NSLog(@"%@", self.post);
    [self.view setNeedsDisplay];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
