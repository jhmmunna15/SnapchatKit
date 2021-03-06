//
//  SKChatOutputStream.m
//  Pods
//
//  Created by Tanner on 1/3/16.
//
//

#import "SKChatOutputStream.h"
#import "NSDictionary+SnapchatKit.h"


@implementation NSOutputStream (SKChatOutputStream)

- (void)sendPacket:(SKPacket *)packet {
    NSLog(@"Sent:\n%@\n", packet);
    NSData *json = [packet.json.JSONString dataUsingEncoding:NSUTF8StringEncoding];
    int len = json.length;
    len = NSSwapInt(len);
    
    [self write:&len maxLength:sizeof(int)];
    [self write:json.bytes maxLength:json.length];
}

@end
