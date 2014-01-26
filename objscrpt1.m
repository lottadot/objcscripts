#!/usr/bin/env objc-run

/**
 @brief An Example objc-run script customized to work OOTB.
 
 @discussion Tested an OSX 10.9.1 machine with 
 Apple LLVM version 5.0 (clang-500.2.79) (based on LLVM 3.3svn)
 Target: x86_64-apple-darwin13.0.0
 Thread model: posix
 @note If you remove the shebang line from the first line of this file, you'll need to make sure the objc-run file is executable and in your $PATH
 
 @prerequesites
 ruby (ruby 2.0.0p353 (2013-11-22 revision 43784) [x86_64-darwin13.0.0])
 gem install cocoapods
*/

// The following instructs objc-run to run the cocoapods gem and use this as your 'podfile':

/*
podfile-start
platform :osx, '10.9'
pod 'Barista'
podfile-end
*/

@import Foundation;
#import "Barista.h"
#import "BARRouter.h"

int main(int argc, char *argv[]) {
  @autoreleasepool {
      // NSLog (@"arguments: %@", [[NSProcessInfo processInfo] arguments]);
      BARServer *server = [BARServer serverWithPort:33333];
      BARRouter *router = [[BARRouter alloc] init];
      [router addRoute:@"/" forHTTPMethod:@"GET" handler:^BOOL(BARConnection *connection, BARRequest *request, NSDictionary *parameters) {
          BARResponse *response = [[BARResponse alloc] init];
          response.responseData = [@"Hello world" dataUsingEncoding:NSUTF8StringEncoding];
          response.statusCode = 200;
          [connection sendResponse:response];
          return YES;
      }];
      [server addGlobalMiddleware:router];
      [server startListening];
      
      if (![[[ NSProcessInfo processInfo] arguments] containsObject:@"-quit"])
      {
          while(YES){
              [[NSRunLoop mainRunLoop] run];
          }
      }
  }
}

