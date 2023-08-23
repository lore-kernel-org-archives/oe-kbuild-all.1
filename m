Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE31FC8ED
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Aug 2023 16:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692806933; x=1724342933;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GdSC7CFYdriPz8asefgmK7GQ58pymgMhzulv8Eqm/xI=;
  b=iS5puPKB6y2uon3RWOSrjy//gzUuXTo3zo0ifjZB0OO7XUSLg8vAZ1w2
   8yclty2osXFnVYXGfKDLg9xpBZiPPr/08Jopi5q+46xxaS1+vzGL/ZT98
   Tgqawg5WQgIrpfVC+3yMFRy+/mhFQenfCJkzyN6nI6ApkScXUAxncAaC5
   LFF2Tat4e0hab/aJy+cqffaUoLUWfP29mAKJ5ceNxzCdTlNgVt2wgmO8A
   bRWTTsS2SGmJsVh2DmHv66RJW1vWvipICdvyS7baEcca/c2bTPOWd/y7s
   7wZdheBCvxJqfqO8b7nKjC4yPDG0s9cgrk1ODWWWl5D7HU64hhMbJmTPv
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="460566906"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="460566906"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 09:05:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="766187930"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="766187930"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 23 Aug 2023 09:05:46 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYqMX-0001L9-12;
	Wed, 23 Aug 2023 16:05:42 +0000
Date: Thu, 24 Aug 2023 00:04:35 +0800
From: kernel test robot <lkp@intel.com>
To: Jan Kara <jack@suse.cz>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jack-fs:bdev_handle 15/30] drivers/s390/block/dasd.c:67:13:
 warning: 'do_requeue_requests' used but never defined
Message-ID: <202308232301.dWUtJveH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs.git bdev_handle
head:   da5dcba801d35f1a8fba1aa1e5eaf1e769a4373d
commit: 95c993a9b1178afc4f000bfef7bcfb9ea10abb6a [15/30] s390/dasd: Convert to bdev_open_by_path()
config: s390-defconfig (https://download.01.org/0day-ci/archive/20230823/202308232301.dWUtJveH-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308232301.dWUtJveH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308232301.dWUtJveH-lkp@intel.com/

All warnings (new ones prefixed by >>):

      74 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:86:41: note: in expansion of macro '_EXPORT_SYMBOL'
      86 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
         |                                         ^~~~~~~~~~~~~~
   drivers/s390/block/dasd.c:3946:1: note: in expansion of macro 'EXPORT_SYMBOL'
    3946 | EXPORT_SYMBOL(dasd_schedule_requeue);
         | ^~~~~~~~~~~~~
   drivers/s390/block/dasd.c:3939:6: note: previous definition of 'dasd_schedule_requeue' with type 'void(struct dasd_device *)'
    3939 | void dasd_schedule_requeue(struct dasd_device *device)
         |      ^~~~~~~~~~~~~~~~~~~~~
   drivers/s390/block/dasd.c:3948:12: error: invalid storage class for function 'dasd_handle_autoquiesce'
    3948 | static int dasd_handle_autoquiesce(struct dasd_device *device,
         |            ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/s390/block/dasd.c:3973:29: error: invalid storage class for function 'dasd_generic_build_rdc'
    3973 | static struct dasd_ccw_req *dasd_generic_build_rdc(struct dasd_device *device,
         |                             ^~~~~~~~~~~~~~~~~~~~~~
   drivers/s390/block/dasd.c:4022:19: error: non-static declaration of 'dasd_generic_read_dev_chars' follows static declaration
    4022 | EXPORT_SYMBOL_GPL(dasd_generic_read_dev_chars);
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:74:28: note: in definition of macro '__EXPORT_SYMBOL'
      74 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:87:41: note: in expansion of macro '_EXPORT_SYMBOL'
      87 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   drivers/s390/block/dasd.c:4022:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    4022 | EXPORT_SYMBOL_GPL(dasd_generic_read_dev_chars);
         | ^~~~~~~~~~~~~~~~~
   drivers/s390/block/dasd.c:4006:5: note: previous definition of 'dasd_generic_read_dev_chars' with type 'int(struct dasd_device *, int,  void *, int)'
    4006 | int dasd_generic_read_dev_chars(struct dasd_device *device, int magic,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/s390/block/dasd.c:4055:19: error: non-static declaration of 'dasd_get_sense' follows static declaration
    4055 | EXPORT_SYMBOL_GPL(dasd_get_sense);
         |                   ^~~~~~~~~~~~~~
   include/linux/export.h:74:28: note: in definition of macro '__EXPORT_SYMBOL'
      74 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:87:41: note: in expansion of macro '_EXPORT_SYMBOL'
      87 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   drivers/s390/block/dasd.c:4055:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    4055 | EXPORT_SYMBOL_GPL(dasd_get_sense);
         | ^~~~~~~~~~~~~~~~~
   drivers/s390/block/dasd.c:4030:7: note: previous definition of 'dasd_get_sense' with type 'char *(struct irb *)'
    4030 | char *dasd_get_sense(struct irb *irb)
         |       ^~~~~~~~~~~~~~
   drivers/s390/block/dasd.c:4072:19: error: non-static declaration of 'dasd_generic_shutdown' follows static declaration
    4072 | EXPORT_SYMBOL_GPL(dasd_generic_shutdown);
         |                   ^~~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:74:28: note: in definition of macro '__EXPORT_SYMBOL'
      74 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:87:41: note: in expansion of macro '_EXPORT_SYMBOL'
      87 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   drivers/s390/block/dasd.c:4072:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    4072 | EXPORT_SYMBOL_GPL(dasd_generic_shutdown);
         | ^~~~~~~~~~~~~~~~~
   drivers/s390/block/dasd.c:4057:6: note: previous definition of 'dasd_generic_shutdown' with type 'void(struct ccw_device *)'
    4057 | void dasd_generic_shutdown(struct ccw_device *cdev)
         |      ^~~~~~~~~~~~~~~~~~~~~
   drivers/s390/block/dasd.c:4074:19: error: invalid storage class for function 'dasd_init'
    4074 | static int __init dasd_init(void)
         |                   ^~~~~~~~~
   In file included from include/linux/printk.h:6,
                    from include/asm-generic/bug.h:22,
                    from arch/s390/include/asm/bug.h:69,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from arch/s390/include/asm/preempt.h:6,
                    from include/linux/preempt.h:79:
   drivers/s390/block/dasd.c:4123:13: error: initializer element is not constant
    4123 | module_init(dasd_init);
         |             ^~~~~~~~~
   include/linux/init.h:270:55: note: in definition of macro '____define_initcall'
     270 |                 __attribute__((__section__(__sec))) = fn;
         |                                                       ^~
   include/linux/init.h:280:9: note: in expansion of macro '__unique_initcall'
     280 |         __unique_initcall(fn, id, __sec, __initcall_id(fn))
         |         ^~~~~~~~~~~~~~~~~
   include/linux/init.h:282:35: note: in expansion of macro '___define_initcall'
     282 | #define __define_initcall(fn, id) ___define_initcall(fn, id, .initcall##id)
         |                                   ^~~~~~~~~~~~~~~~~~
   include/linux/init.h:311:41: note: in expansion of macro '__define_initcall'
     311 | #define device_initcall(fn)             __define_initcall(fn, 6)
         |                                         ^~~~~~~~~~~~~~~~~
   include/linux/init.h:316:24: note: in expansion of macro 'device_initcall'
     316 | #define __initcall(fn) device_initcall(fn)
         |                        ^~~~~~~~~~~~~~~
   include/linux/module.h:88:25: note: in expansion of macro '__initcall'
      88 | #define module_init(x)  __initcall(x);
         |                         ^~~~~~~~~~
   drivers/s390/block/dasd.c:4123:1: note: in expansion of macro 'module_init'
    4123 | module_init(dasd_init);
         | ^~~~~~~~~~~
   drivers/s390/block/dasd.c:4124:1: error: expected declaration or statement at end of input
    4124 | module_exit(dasd_exit);
         | ^~~~~~~~~~~
   drivers/s390/block/dasd.c: At top level:
>> drivers/s390/block/dasd.c:67:13: warning: 'do_requeue_requests' used but never defined
      67 | static void do_requeue_requests(struct work_struct *);
         |             ^~~~~~~~~~~~~~~~~~~
>> drivers/s390/block/dasd.c:76:12: warning: 'dasd_handle_autoquiesce' used but never defined
      76 | static int dasd_handle_autoquiesce(struct dasd_device *, struct dasd_ccw_req *,
         |            ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/s390/block/dasd.c: In function 'dasd_generic_set_offline':
   drivers/s390/block/dasd.c:4125: error: control reaches end of non-void function [-Werror=return-type]
   drivers/s390/block/dasd.c: At top level:
>> drivers/s390/block/dasd.c:3948:12: warning: 'dasd_handle_autoquiesce' defined but not used [-Wunused-function]
    3948 | static int dasd_handle_autoquiesce(struct dasd_device *device,
         |            ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/s390/block/dasd.c:3928:13: warning: 'do_requeue_requests' defined but not used [-Wunused-function]
    3928 | static void do_requeue_requests(struct work_struct *work)
         |             ^~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/do_requeue_requests +67 drivers/s390/block/dasd.c

^1da177e4c3f41 Linus Torvalds   2005-04-16  58  
^1da177e4c3f41 Linus Torvalds   2005-04-16  59  /*
^1da177e4c3f41 Linus Torvalds   2005-04-16  60   * SECTION: prototypes for static functions of dasd.c
^1da177e4c3f41 Linus Torvalds   2005-04-16  61   */
8e09f21574ea30 Stefan Weinhuber 2008-01-26  62  static int dasd_flush_block_queue(struct dasd_block *);
d2f2df69885d05 Sebastian Ott    2018-07-03  63  static void dasd_device_tasklet(unsigned long);
d2f2df69885d05 Sebastian Ott    2018-07-03  64  static void dasd_block_tasklet(unsigned long);
4927b3f74c6a2f Al Viro          2006-12-06  65  static void do_kick_device(struct work_struct *);
501183f2ed7443 Stefan Haberland 2010-05-17  66  static void do_reload_device(struct work_struct *);
a521b048bc8c5d Stefan Haberland 2016-08-08 @67  static void do_requeue_requests(struct work_struct *);
8e09f21574ea30 Stefan Weinhuber 2008-01-26  68  static void dasd_return_cqr_cb(struct dasd_ccw_req *, void *);
e99e88a9d2b067 Kees Cook        2017-10-16  69  static void dasd_device_timeout(struct timer_list *);
e99e88a9d2b067 Kees Cook        2017-10-16  70  static void dasd_block_timeout(struct timer_list *);
eb6e199bef2886 Stefan Weinhuber 2009-12-07  71  static void __dasd_process_erp(struct dasd_device *, struct dasd_ccw_req *);
4fa52aa7a82f92 Stefan Weinhuber 2011-07-24  72  static void dasd_profile_init(struct dasd_profile *, struct dentry *);
4fa52aa7a82f92 Stefan Weinhuber 2011-07-24  73  static void dasd_profile_exit(struct dasd_profile *);
5a3b7b112884f8 Stefan Haberland 2016-03-18  74  static void dasd_hosts_init(struct dentry *, struct dasd_device *);
5a3b7b112884f8 Stefan Haberland 2016-03-18  75  static void dasd_hosts_exit(struct dasd_device *);
1cee2975bbabd8 Stefan Haberland 2023-04-05 @76  static int dasd_handle_autoquiesce(struct dasd_device *, struct dasd_ccw_req *,
1cee2975bbabd8 Stefan Haberland 2023-04-05  77  				   unsigned int);
^1da177e4c3f41 Linus Torvalds   2005-04-16  78  /*
^1da177e4c3f41 Linus Torvalds   2005-04-16  79   * SECTION: Operations on the device structure.
^1da177e4c3f41 Linus Torvalds   2005-04-16  80   */
^1da177e4c3f41 Linus Torvalds   2005-04-16  81  static wait_queue_head_t dasd_init_waitq;
8f61701bdf536c Horst Hummel     2006-08-30  82  static wait_queue_head_t dasd_flush_wq;
c80ee724966a8c Stefan Haberland 2008-05-30  83  static wait_queue_head_t generic_waitq;
4679e8933ae6b5 Stefan Haberland 2012-06-19  84  static wait_queue_head_t shutdown_waitq;
^1da177e4c3f41 Linus Torvalds   2005-04-16  85  

:::::: The code at line 67 was first introduced by commit
:::::: a521b048bc8c5d3c57a468c2cba70eb60e873616 s390/dasd: channel path aware error recovery

:::::: TO: Stefan Haberland <sth@linux.vnet.ibm.com>
:::::: CC: Martin Schwidefsky <schwidefsky@de.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
