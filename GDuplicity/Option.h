//
//  Option.h
//  GDuplicity
//
//  Created by Hubert on 21/08/13.
//  Copyright (c) 2013 Hubert. All rights reserved.
//

#include <stdbool.h>

#import <Foundation/Foundation.h>

@interface Option : NSObject {
    Boolean     allow_source_mismatch;
    NSString*   archive_dir;
    Boolean     asynchronous_upload;
    Boolean     dry_run;
    NSInteger   encrypt_key;
    NSString*   encrypt_secret_keyring;
    NSInteger   encrypt_sign_key;
    NSString*   exclude;
    Boolean     exclude_device_files;
    NSString*   exclude_filelist;
    Boolean     exclude_filelist_stdin;
    NSString*   exclude_globbing_filelist;
    NSString*   --exclude-if-present;
    Boolean     --exclude-other-filesystems;
    NSString*   --exclude-regexp;
    Boolean     --extra-clean;
    NSString*   --file-to-restore;
    NSString*   --full-if-older-than;
    Boolean     --force;
    Boolean     --ftp-passive;
    Boolean     --ftp-regular;
    Boolean     --gio;
    NSInteger   --hidden-encrypt-key;
    Boolean     --ignore-errors;
    NSString*   --imap-mailbox;
    NSString*   --gpg-options;
    NSString*   --include;
    NSString*   --include-filelist;
    Boolean     --include-filelist-stdin;
    NSString*   --include-globbing-filelist;
    NSString*   --include-regexp;
    NSInteger   --log-fd;
    NSString*   --log-file;
    NSString*   --name;
    Boolean     --no-encryption;
    Boolean     --no-print-statistics;
    Boolean     --null-separator;
    Boolean     --numeric-owner;
    NSInteger   --num-retries;
    Boolean     --old-filenames;
    NSString*   --rename_orig;
    NSString*   --rsync-options;
    NSString*   --s3-european-buckets;
    Boolean     --s3-unencrypted-connection;
    Boolean     --s3-use-new-style;
    NSString*   --scp-command;
    NSString*   --sftp-command;
    Boolean     --short-filenames;
    
}


- (void) test;

@end
