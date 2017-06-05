//
//  AppDelegate.m
//  caipudaquan
//
//  Created by guoruiqing on 2017/5/20.
//  Copyright © 2017年 xhhl. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "HomeViewController.h"
#import "ClassifyViewController.h"
#import "MoreViewController.h"
#import "AFAppDotNetAPIClient.h"
#import <SystemConfiguration/CaptiveNetwork.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    UITabBarController *tb = [[UITabBarController alloc]init];
    
    self.window.rootViewController = tb;
    
    
    HomeViewController *home = [[HomeViewController alloc]init];
    ClassifyViewController *class = [[ClassifyViewController alloc]init];
    MoreViewController *more = [[MoreViewController alloc]init];
    
    NSArray *controllers =[NSArray arrayWithObjects:home,class,more,nil];
    NSArray *images = [NSArray arrayWithObjects:@"home_Recipe",@"home_classify",@"home_more" ,nil];
    NSArray *selectedImage =[NSArray arrayWithObjects:@"home_Recipe_selected",@"home_classify_selected",@"home_more_selected" ,nil];
    NSArray *titleArray = [NSArray arrayWithObjects:@"菜谱大全",@"菜谱分类", @"更多",nil];
    
    NSMutableArray *tabArray = [NSMutableArray array];

    for(int i=0;i<3;i++)
    {
        UIViewController *vc = [controllers objectAtIndex:i];
                
        vc.tabBarItem.title = [titleArray objectAtIndex:i];
        vc.tabBarItem.image = [UIImage imageNamed:[images objectAtIndex:i]];
        vc.tabBarItem.selectedImage = [[UIImage imageNamed:[selectedImage objectAtIndex:i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [vc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:253/255.0 green:108.0/255.0 blue:33/255.0 alpha:1.0]} forState:UIControlStateSelected];
        
        UINavigationController *nv = [[UINavigationController alloc] initWithRootViewController:vc];
        nv.navigationBar.barTintColor =[UIColor colorWithRed:253/255.0 green:108.0/255.0 blue:33/255.0 alpha:1.0];
        [nv.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
        [tabArray addObject:nv];
        
        
    }
    
    
    tb.viewControllers = tabArray;
    
   // [self selfLogin];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


-(void)selfLogin
{
     NSString *ccc = @"device=ios#iPhone9,2#10.3.2#2.0.0#1242#2208#appStore#Wifi#232.70#com.jnzc.recipebook#1;t=1495534727;xhcode=F5E68B97128A17A7F5795B3469A314C4;snsuid=1391630090240;hmac=73b98ee2b7f1d81312c4b49dea847922;User-Agent=xhapp#ios#2.0.0;token=0c36d58be7321f80;appid=1;JSESSIONID=CD56DB0A3BE39E976860736A9DAF4BB9";
    
    [[AFAppDotNetAPIClient sharedClient].requestSerializer setHTTPShouldHandleCookies:YES];
    [[AFAppDotNetAPIClient sharedClient].requestSerializer setValue:ccc forHTTPHeaderField:@"Cookie"];
    
    [[AFAppDotNetAPIClient sharedClient] GET:@"dish/search?pg=1&world=aa" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
       
    }];

    
}




@end
