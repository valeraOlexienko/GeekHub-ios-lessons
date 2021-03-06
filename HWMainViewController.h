//
//  HWMainViewController.h
//  HelloWorld
//
//  Created by Valery Olexienko on 10.10.13.
//  Copyright (c) 2013 Valery Olexienko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HWPodcastDetailsController.h"

@interface HWMainViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>{
    IBOutlet UITableView *tableView;
}

- (id)initWithPodcasts: (NSArray *) podcasts;

@end
