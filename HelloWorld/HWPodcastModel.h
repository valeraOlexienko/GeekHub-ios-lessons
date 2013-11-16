//
//  HWPodcastModel.h
//  HelloWorld
//
//  Created by Valery Olexienko on 16.11.13.
//  Copyright (c) 2013 Valery Olexienko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HWPodcastModel : NSObject

@property NSString *title;
@property NSString *description;
@property NSString *imageUrl;

- (id) initWithTitle:(NSString *) title Description:(NSString *) description andImageUrl: (NSString *) url;

+ (void)parsePodcastsFromUrl:(NSString *) urlOrNill callback: (void (^)(NSArray*)) callbackOrNill;

@end
