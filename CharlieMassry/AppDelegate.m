//
//  AppDelegate.m
//  CharlieMassry
//
//  Created by Charlie Massry on 12/27/14.
//  Copyright (c) 2014 Charlie Massry. All rights reserved.
//

#import "AppDelegate.h"
#import "PostsTableViewController.h"
#import "ArtViewController.h"
#import "LinksViewController.h"
#import "Util.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    PostsTableViewController *postsTableViewController = [[PostsTableViewController alloc] initWithStyle:UITableViewStylePlain];
    postsTableViewController.title = @"Blog";
    postsTableViewController.tabBarItem.image = [UIImage imageNamed:@"blog_icon"];
    UINavigationController *postNavController = [[UINavigationController alloc] initWithRootViewController:postsTableViewController];
    
    ArtViewController *artViewController = [[ArtViewController alloc] initWithNibName:@"ArtViewController" bundle:nil];
    artViewController.title = @"Art";
    UINavigationController *artNavController = [[UINavigationController alloc] initWithRootViewController:artViewController];
    
    LinksViewController *linkViewController = [[LinksViewController alloc] initWithNibName:@"LinksViewController" bundle:nil];
    linkViewController.title = @"Links";
    UINavigationController *linksNavController = [[UINavigationController alloc] initWithRootViewController:linkViewController];
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    [tabBarController setViewControllers:@[postNavController, artNavController, linksNavController]];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = tabBarController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
