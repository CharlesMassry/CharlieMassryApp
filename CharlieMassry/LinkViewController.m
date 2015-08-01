//
//  LinkViewController.m
//  CharlieMassry
//
//  Created by Charlie Massry on 7/31/15.
//  Copyright (c) 2015 Charlie Massry. All rights reserved.
//

#import "LinkViewController.h"

@interface LinkViewController ()

@end

@implementation LinkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(instancetype)initWithLink:(Link *)link {
    self = [super initWithNibName:NSStringFromClass([self class]) bundle:nil];

    if (self) {
        UIWebView *webView = [[UIWebView alloc] init];
        self.view = webView;
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:link.linkURL]];
        [(UIWebView *)self.view loadRequest:request];
    }
    
    return self;
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
