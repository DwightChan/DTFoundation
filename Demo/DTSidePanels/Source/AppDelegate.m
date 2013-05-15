//
//  AppDelegate.m
//  DTSidePanelController
//
//  Created by Oliver Drobnik on 15.05.13.
//  Copyright (c) 2013 Cocoanetics. All rights reserved.
//

#import "AppDelegate.h"

#import "DTSidePanelController.h"
#import "TableViewController.h"
#import "DemoViewController.h"

@implementation AppDelegate
{
	DTSidePanelController *_sidePanelController;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

	// create a panel controller as root
	_sidePanelController = [[DTSidePanelController alloc] init];
	
	UIViewController *leftVC = [[TableViewController alloc] init];
	leftVC.navigationItem.title = @"Left";
	UINavigationController *leftNav = [[UINavigationController alloc] initWithRootViewController:leftVC];

	UIViewController *rightVC = [[TableViewController alloc] init];
	rightVC.navigationItem.title = @"Right";
	UINavigationController *rightNav = [[UINavigationController alloc] initWithRootViewController:rightVC];
	
	UIViewController *centerVC = [[DemoViewController alloc] initWithNibName:@"DemoViewController" bundle:nil];
	centerVC.navigationItem.title = @"Center";
	centerVC.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Left" style:UIBarButtonItemStyleBordered target:self action:@selector(showLeftPanel:)];
	centerVC.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Right" style:UIBarButtonItemStyleBordered target:self action:@selector(showRightPanel:)];
	UINavigationController *centerNav = [[UINavigationController alloc] initWithRootViewController:centerVC];
	
	[_sidePanelController setWidth:100 forPanel:DTSidePanelControllerPanelLeft animated:NO];
	
	_sidePanelController.leftPanelController = leftNav;
	_sidePanelController.centerPanelController = centerNav;
	_sidePanelController.rightPanelController = rightNav;
	
	
	self.window.rootViewController = _sidePanelController;
    [self.window makeKeyAndVisible];
	
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
	// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
	// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
	// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
	// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
	// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
	// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - Actions

- (void)showLeftPanel:(id)sender
{
	if (_sidePanelController.presentedPanel == DTSidePanelControllerPanelCenter)
	{
		[_sidePanelController presentPanel:DTSidePanelControllerPanelLeft animated:YES];
	}
	else
	{
		[_sidePanelController presentPanel:DTSidePanelControllerPanelCenter animated:YES];
	}
}

- (void)showRightPanel:(id)sender
{
	if (_sidePanelController.presentedPanel == DTSidePanelControllerPanelCenter)
	{
		[_sidePanelController presentPanel:DTSidePanelControllerPanelRight animated:YES];
	}
	else
	{
		[_sidePanelController presentPanel:DTSidePanelControllerPanelCenter animated:YES];
	}}

@end
