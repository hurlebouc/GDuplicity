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
    NSString*   exclude_if_present;
    Boolean     exclude_other_filesystems;
    NSString*   exclude_regexp;
    Boolean     extra_clean;
    NSString*   file_to_restore;
    NSString*   full_if_older_than;
    Boolean     force;
    Boolean     ftp_passive;
    Boolean     ftp_regular;
    Boolean     gio;
    NSInteger   hidden_encrypt_key;
    Boolean     ignore_errors;
    NSString*   imap_mailbox;
    NSString*   gpg_options;
    NSString*   include;
    NSString*   include_filelist;
    Boolean     include_filelist_stdin;
    NSString*   include_globbing_filelist;
    NSString*   include_regexp;
    NSInteger   log_fd;
    NSString*   log_file;
    NSString*   name;
    Boolean     no_encryption;
    Boolean     no_print_statistics;
    Boolean     null_separator;
    Boolean     numeric_owner;
    NSInteger   num_retries;
    Boolean     old_filenames;
    NSString*   rename_orig;
    NSString*   rsync_options;
    NSString*   s3_european_buckets;
    Boolean     s3_unencrypted_connection;
    Boolean     s3_use_new_style;
    NSString*   scp_command;
    NSString*   sftp_command;
    Boolean     short_filenames;
    NSInteger   sign_key;
    Boolean     ssh_askpass;
    NSString*   ssh_backend;
    NSString*   ssh_options;
    NSString*   ssl_cacert_file;
    Boolean     ssl_no_check_certificate;
    NSString*   tempdir;
    NSString*   time;
    char        time_separator;
    NSInteger   timeout;
    Boolean     use_agent;
    Boolean     use_scp;
    NSInteger   verbosity;
    NSInteger   volsize;
}

_ (void) test;

@end
