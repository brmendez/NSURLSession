//
//  ViewController.m
//  NSURLSession
//
//  Created by Brian Mendez on 11/21/14.
//  Copyright (c) 2014 Brian Mendez. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //creating a Session object and a Data Task. Making use of a completion handler to process the response we receive from the request.
//    
//    NSURLSession *session = [NSURLSession sharedSession];
//    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:@"https://itunes.apple.com/search?term=apple&media=tvShow"] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
//        NSDictionary *JSONData = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
//        NSLog(@"%@", JSONData);
//    }];
//    [dataTask resume];
    
    //Create a download task
    
    NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session2 = [NSURLSession sessionWithConfiguration:sessionConfiguration delegate:self delegateQueue:nil];
    NSURLSessionDownloadTask *downloadTask = [session2 downloadTaskWithURL:[NSURL URLWithString:@"https://ununsplash.imgix.net/photo-1416339426675-1f96fd81b653?q=75&fm=jpg&s=74e1a5f4c0a6a19d4372d136a6ce4ca7"]];
    [downloadTask resume];
    
}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location {
    NSData *data = [NSData dataWithContentsOfURL:location];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.progressView setHidden:YES];
        [self.imageView setImage:[UIImage imageWithData:data]];
    });
}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didResumeAtOffset:(int64_t)fileOffset expectedTotalBytes:(int64_t)expectedTotalBytes{
    
}

-(void) URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite {
    float progress = (double)totalBytesWritten / (double)totalBytesExpectedToWrite;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.progressView setProgress:progress];
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
