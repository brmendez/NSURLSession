//
//  ViewController.h
//  NSURLSession
//
//  Created by Brian Mendez on 11/21/14.
//  Copyright (c) 2014 Brian Mendez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <NSURLSessionDelegate, NSURLSessionDownloadDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;

@end

