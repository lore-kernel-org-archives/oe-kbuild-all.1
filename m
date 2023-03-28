Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF5A7E4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Mar 2023 22:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680044006; x=1711580006;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SYgJrRmB+LAW7PBPXdAs0Nx+SINwbc9Bf1ExQoOESzI=;
  b=N2hnJ43nhI+qbwZfq1nytqHCt3I5GlUqxpP/Rfs5SFIOlD9c0PnuiSld
   30htMIfRDVFic6e23emQXxRr+YP5oM8lyilk9wI1PC8u6G4bGRR3RDdTg
   Twp5MHxHuOfFG6yNyrOJIp+zWJCsTR+LGPv9BbXo+aNIHd8b/a5JyWJyN
   f/dJrdhPggkgoltU3r97fHLmpWZpCLqmzROMY3Eeke9HVl5tsNZtMLMVd
   Dw8jCcT3GIJLRssctWZhw45FSdydj3oXlYTgJQDjaub/nWDvsBHxOEx/p
   neEQD+YxXm2L9kbC4ReNcf27kpb0jKghjM7PB5wiAUKjsLRSwczWJ4Spa
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="403334671"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; 
   d="scan'208";a="403334671"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2023 15:53:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="930074475"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; 
   d="scan'208";a="930074475"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 28 Mar 2023 15:53:24 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phIBv-000IwF-13;
	Tue, 28 Mar 2023 22:53:23 +0000
Date: Wed, 29 Mar 2023 06:52:43 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 2/2] include/linux/fsnotify.h:105:51:
 error: positional initialization of field in 'struct' declared with
 'designated_init' attribute
Message-ID: <202303290606.wxDoMnh0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   44a94ece47267e0a8ad9bd6bbf557f712c77e6d9
commit: 44a94ece47267e0a8ad9bd6bbf557f712c77e6d9 [2/2] ANDROID: fuse: Support errors from fuse daemon in canonical path
config: i386-defconfig (https://download.01.org/0day-ci/archive/20230329/202303290606.wxDoMnh0-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android13-5.15
        git checkout 44a94ece47267e0a8ad9bd6bbf557f712c77e6d9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303290606.wxDoMnh0-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/open.c:12:
   include/linux/fsnotify.h: In function 'fsnotify_file':
>> include/linux/fsnotify.h:105:51: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     105 |                         struct path lower_path = {0};
         |                                                   ^
   include/linux/fsnotify.h:105:51: note: (near initialization for 'lower_path')
   cc1: some warnings being treated as errors
--
   In file included from security/security.c:24:
   include/linux/fsnotify.h: In function 'fsnotify_file':
>> include/linux/fsnotify.h:105:51: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     105 |                         struct path lower_path = {0};
         |                                                   ^
   include/linux/fsnotify.h:105:51: note: (near initialization for 'lower_path')
   At top level:
   include/linux/lsm_hook_defs.h:404:18: warning: 'perf_event_write_default' defined but not used [-Wunused-const-variable=]
     404 | LSM_HOOK(int, 0, perf_event_write, struct perf_event *event)
         |                  ^~~~~~~~~~~~~~~~
   security/security.c:708:32: note: in definition of macro 'LSM_RET_DEFAULT'
     708 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:713:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     713 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:404:1: note: in expansion of macro 'LSM_HOOK'
     404 | LSM_HOOK(int, 0, perf_event_write, struct perf_event *event)
         | ^~~~~~~~
   include/linux/lsm_hook_defs.h:403:18: warning: 'perf_event_read_default' defined but not used [-Wunused-const-variable=]
     403 | LSM_HOOK(int, 0, perf_event_read, struct perf_event *event)
         |                  ^~~~~~~~~~~~~~~
   security/security.c:708:32: note: in definition of macro 'LSM_RET_DEFAULT'
     708 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:713:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     713 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:403:1: note: in expansion of macro 'LSM_HOOK'
     403 | LSM_HOOK(int, 0, perf_event_read, struct perf_event *event)
         | ^~~~~~~~
   include/linux/lsm_hook_defs.h:401:18: warning: 'perf_event_alloc_default' defined but not used [-Wunused-const-variable=]
     401 | LSM_HOOK(int, 0, perf_event_alloc, struct perf_event *event)
         |                  ^~~~~~~~~~~~~~~~
   security/security.c:708:32: note: in definition of macro 'LSM_RET_DEFAULT'
     708 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:713:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     713 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:401:1: note: in expansion of macro 'LSM_HOOK'
     401 | LSM_HOOK(int, 0, perf_event_alloc, struct perf_event *event)
         | ^~~~~~~~
   include/linux/lsm_hook_defs.h:400:18: warning: 'perf_event_open_default' defined but not used [-Wunused-const-variable=]
     400 | LSM_HOOK(int, 0, perf_event_open, struct perf_event_attr *attr, int type)
         |                  ^~~~~~~~~~~~~~~
   security/security.c:708:32: note: in definition of macro 'LSM_RET_DEFAULT'
     708 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:713:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     713 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:400:1: note: in expansion of macro 'LSM_HOOK'
     400 | LSM_HOOK(int, 0, perf_event_open, struct perf_event_attr *attr, int type)
         | ^~~~~~~~
   include/linux/lsm_hook_defs.h:397:18: warning: 'locked_down_default' defined but not used [-Wunused-const-variable=]
     397 | LSM_HOOK(int, 0, locked_down, enum lockdown_reason what)
         |                  ^~~~~~~~~~~
   security/security.c:708:32: note: in definition of macro 'LSM_RET_DEFAULT'
     708 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:713:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     713 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:397:1: note: in expansion of macro 'LSM_HOOK'
     397 | LSM_HOOK(int, 0, locked_down, enum lockdown_reason what)
         | ^~~~~~~~
   include/linux/lsm_hook_defs.h:383:18: warning: 'audit_rule_match_default' defined but not used [-Wunused-const-variable=]
     383 | LSM_HOOK(int, 0, audit_rule_match, u32 secid, u32 field, u32 op, void *lsmrule)
         |                  ^~~~~~~~~~~~~~~~
   security/security.c:708:32: note: in definition of macro 'LSM_RET_DEFAULT'
     708 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:713:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     713 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:383:1: note: in expansion of macro 'LSM_HOOK'
     383 | LSM_HOOK(int, 0, audit_rule_match, u32 secid, u32 field, u32 op, void *lsmrule)
         | ^~~~~~~~
   include/linux/lsm_hook_defs.h:382:18: warning: 'audit_rule_known_default' defined but not used [-Wunused-const-variable=]
     382 | LSM_HOOK(int, 0, audit_rule_known, struct audit_krule *krule)
         |                  ^~~~~~~~~~~~~~~~
   security/security.c:708:32: note: in definition of macro 'LSM_RET_DEFAULT'
     708 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:713:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     713 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:382:1: note: in expansion of macro 'LSM_HOOK'
     382 | LSM_HOOK(int, 0, audit_rule_known, struct audit_krule *krule)
         | ^~~~~~~~
   include/linux/lsm_hook_defs.h:380:18: warning: 'audit_rule_init_default' defined but not used [-Wunused-const-variable=]
     380 | LSM_HOOK(int, 0, audit_rule_init, u32 field, u32 op, char *rulestr,
         |                  ^~~~~~~~~~~~~~~
   security/security.c:708:32: note: in definition of macro 'LSM_RET_DEFAULT'
     708 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:713:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     713 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:380:1: note: in expansion of macro 'LSM_HOOK'
     380 | LSM_HOOK(int, 0, audit_rule_init, u32 field, u32 op, char *rulestr,
         | ^~~~~~~~
--
   In file included from kernel/trace/trace.c:49:
   include/linux/fsnotify.h: In function 'fsnotify_file':
>> include/linux/fsnotify.h:105:51: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     105 |                         struct path lower_path = {0};
         |                                                   ^
   include/linux/fsnotify.h:105:51: note: (near initialization for 'lower_path')
   kernel/trace/trace.c: In function 'trace_check_vprintf':
   kernel/trace/trace.c:3842:17: warning: function 'trace_check_vprintf' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    3842 |                 trace_seq_vprintf(&iter->seq, iter->fmt, ap);
         |                 ^~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:3909:17: warning: function 'trace_check_vprintf' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    3909 |                 trace_seq_vprintf(&iter->seq, p, ap);
         |                 ^~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from io_uring/io_uring.c:74:
   include/linux/fsnotify.h: In function 'fsnotify_file':
>> include/linux/fsnotify.h:105:51: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     105 |                         struct path lower_path = {0};
         |                                                   ^
   include/linux/fsnotify.h:105:51: note: (near initialization for 'lower_path')
   io_uring/io_uring.c: In function 'io_queue_async_work':
   io_uring/io_uring.c:1474:61: warning: parameter 'locked' set but not used [-Wunused-but-set-parameter]
    1474 | static void io_queue_async_work(struct io_kiocb *req, bool *locked)
         |                                                       ~~~~~~^~~~~~
   cc1: some warnings being treated as errors


vim +105 include/linux/fsnotify.h

    91	
    92	static inline int fsnotify_file(struct file *file, __u32 mask)
    93	{
    94		const struct path *path = &file->f_path;
    95	
    96		if (file->f_mode & FMODE_NONOTIFY)
    97			return 0;
    98	
    99		/*
   100		 * Open calls notify early on, so lower file system must be notified
   101		 */
   102		if (mask & FS_OPEN) {
   103			if (path->dentry->d_op &&
   104			    path->dentry->d_op->d_canonical_path) {
 > 105				struct path lower_path = {0};
   106				int ret;
   107	
   108				path->dentry->d_op->d_canonical_path(path, &lower_path);
   109				if (IS_ERR(lower_path.dentry))
   110					return PTR_ERR(lower_path.dentry);
   111	
   112				ret = fsnotify_parent(lower_path.dentry, mask,
   113						      &lower_path, FSNOTIFY_EVENT_PATH);
   114				path_put(&lower_path);
   115	
   116				if (ret)
   117					return ret;
   118			}
   119		}
   120	
   121		return fsnotify_parent(path->dentry, mask, path, FSNOTIFY_EVENT_PATH);
   122	}
   123	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
