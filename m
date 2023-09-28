Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27A2370
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Sep 2023 00:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695862137; x=1727398137;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=WR+nCpcr38Lq5kUTndlLXjsI7nJCO4J92LgGQQXsFHU=;
  b=iPi+vIinKp+cftKbuo3+y/q9fcsOxGyTsYfqxhYDezjhMI+4ye3RH4hW
   D390AKcp0etv6vHYYDcJoGHPlyAMhao/2d7kHh6AzF8GBlX0BJfcri5qq
   rMXbC8eXzqRdf/63Zmfi7WzJA4Pf6knHQPIxgvoD+nDYdJ4tCM/GYDgJ/
   bjkHFyVUdarOVFpn9nvkSUXiUrmcxwnKkyt744hHL7H0uuYs/hk2YBz/j
   zCfCtfg4bUSFrYXtv6HbsF66RgvAuiIsWs+rXLmVoDmCopbzvRtaJ5HuS
   gWXb/hnXtVSjmmMUo1Y8TJ2Ts3w37FDFIn51ve/SXyDoOzGPHhOKlPfQF
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="566539"
X-IronPort-AV: E=Sophos;i="6.03,182,1694761200"; 
   d="scan'208";a="566539"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 17:48:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="815062601"
X-IronPort-AV: E=Sophos;i="6.03,182,1694761200"; 
   d="scan'208";a="815062601"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 27 Sep 2023 17:48:53 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlfD1-0000vr-1E;
	Thu, 28 Sep 2023 00:48:51 +0000
Date: Thu, 28 Sep 2023 08:48:07 +0800
From: kernel test robot <lkp@intel.com>
To: Jan Kara <jack@suse.cz>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>,
	Christian Brauner <brauner@kernel.org>
Subject: [brauner-vfs:vfs.super 15/30] drivers/s390/block/dasd.c:3714:19:
 error: non-static declaration of 'dasd_generic_last_path_gone' follows
 static declaration
Message-ID: <202309280833.eHDrQDAN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.super
head:   953863a5a2ff126582a21068485dbf7d8ae1d6dc
commit: 5581d03457f862235d08762822bf6aa913266340 [15/30] s390/dasd: Convert to bdev_open_by_path()
config: s390-randconfig-001-20230928 (https://download.01.org/0day-ci/archive/20230928/202309280833.eHDrQDAN-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230928/202309280833.eHDrQDAN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309280833.eHDrQDAN-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/s390/block/dasd.c:1107:5: warning: no previous prototype for 'dasd_stats_generic_show' [-Wmissing-prototypes]
    1107 | int dasd_stats_generic_show(struct seq_file *m, void *v)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/linkage.h:7,
                    from include/linux/preempt.h:10,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from drivers/s390/block/dasd.c:14:
   drivers/s390/block/dasd.c: In function 'dasd_generic_set_offline':
>> drivers/s390/block/dasd.c:3714:19: error: non-static declaration of 'dasd_generic_last_path_gone' follows static declaration
    3714 | EXPORT_SYMBOL_GPL(dasd_generic_last_path_gone);
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:74:28: note: in definition of macro '__EXPORT_SYMBOL'
      74 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:87:41: note: in expansion of macro '_EXPORT_SYMBOL'
      87 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   drivers/s390/block/dasd.c:3714:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    3714 | EXPORT_SYMBOL_GPL(dasd_generic_last_path_gone);
         | ^~~~~~~~~~~~~~~~~
   drivers/s390/block/dasd.c:3690:5: note: previous definition of 'dasd_generic_last_path_gone' with type 'int(struct dasd_device *)'
    3690 | int dasd_generic_last_path_gone(struct dasd_device *device)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/s390/block/dasd.c:3734:19: error: non-static declaration of 'dasd_generic_path_operational' follows static declaration
    3734 | EXPORT_SYMBOL_GPL(dasd_generic_path_operational);
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:74:28: note: in definition of macro '__EXPORT_SYMBOL'
      74 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:87:41: note: in expansion of macro '_EXPORT_SYMBOL'
      87 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   drivers/s390/block/dasd.c:3734:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    3734 | EXPORT_SYMBOL_GPL(dasd_generic_path_operational);
         | ^~~~~~~~~~~~~~~~~
   drivers/s390/block/dasd.c:3716:5: note: previous definition of 'dasd_generic_path_operational' with type 'int(struct dasd_device *)'
    3716 | int dasd_generic_path_operational(struct dasd_device *device)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/s390/block/dasd.c:3761:19: error: non-static declaration of 'dasd_generic_notify' follows static declaration
    3761 | EXPORT_SYMBOL_GPL(dasd_generic_notify);
         |                   ^~~~~~~~~~~~~~~~~~~
   include/linux/export.h:74:28: note: in definition of macro '__EXPORT_SYMBOL'
      74 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:87:41: note: in expansion of macro '_EXPORT_SYMBOL'
      87 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   drivers/s390/block/dasd.c:3761:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    3761 | EXPORT_SYMBOL_GPL(dasd_generic_notify);
         | ^~~~~~~~~~~~~~~~~
   drivers/s390/block/dasd.c:3736:5: note: previous definition of 'dasd_generic_notify' with type 'int(struct ccw_device *, int)'
    3736 | int dasd_generic_notify(struct ccw_device *cdev, int event)
         |     ^~~~~~~~~~~~~~~~~~~
>> drivers/s390/block/dasd.c:3837:19: error: non-static declaration of 'dasd_generic_path_event' follows static declaration
    3837 | EXPORT_SYMBOL_GPL(dasd_generic_path_event);
         |                   ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:74:28: note: in definition of macro '__EXPORT_SYMBOL'
      74 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:87:41: note: in expansion of macro '_EXPORT_SYMBOL'
      87 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   drivers/s390/block/dasd.c:3837:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    3837 | EXPORT_SYMBOL_GPL(dasd_generic_path_event);
         | ^~~~~~~~~~~~~~~~~
   drivers/s390/block/dasd.c:3763:6: note: previous definition of 'dasd_generic_path_event' with type 'void(struct ccw_device *, int *)'
    3763 | void dasd_generic_path_event(struct ccw_device *cdev, int *path_event)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/s390/block/dasd.c:3848:19: error: non-static declaration of 'dasd_generic_verify_path' follows static declaration
    3848 | EXPORT_SYMBOL_GPL(dasd_generic_verify_path);
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:74:28: note: in definition of macro '__EXPORT_SYMBOL'
      74 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:87:41: note: in expansion of macro '_EXPORT_SYMBOL'
      87 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   drivers/s390/block/dasd.c:3848:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    3848 | EXPORT_SYMBOL_GPL(dasd_generic_verify_path);
         | ^~~~~~~~~~~~~~~~~
   drivers/s390/block/dasd.c:3839:5: note: previous definition of 'dasd_generic_verify_path' with type 'int(struct dasd_device *, __u8)' {aka 'int(struct dasd_device *, unsigned char)'}
    3839 | int dasd_generic_verify_path(struct dasd_device *device, __u8 lpm)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/s390/block/dasd.c:3868:19: error: non-static declaration of 'dasd_generic_space_exhaust' follows static declaration
    3868 | EXPORT_SYMBOL_GPL(dasd_generic_space_exhaust);
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:74:28: note: in definition of macro '__EXPORT_SYMBOL'
      74 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:87:41: note: in expansion of macro '_EXPORT_SYMBOL'
      87 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   drivers/s390/block/dasd.c:3868:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    3868 | EXPORT_SYMBOL_GPL(dasd_generic_space_exhaust);
         | ^~~~~~~~~~~~~~~~~
   drivers/s390/block/dasd.c:3850:6: note: previous definition of 'dasd_generic_space_exhaust' with type 'void(struct dasd_device *, struct dasd_ccw_req *)'
    3850 | void dasd_generic_space_exhaust(struct dasd_device *device,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/s390/block/dasd.c:3886:19: error: non-static declaration of 'dasd_generic_space_avail' follows static declaration
    3886 | EXPORT_SYMBOL_GPL(dasd_generic_space_avail);
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:74:28: note: in definition of macro '__EXPORT_SYMBOL'
      74 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:87:41: note: in expansion of macro '_EXPORT_SYMBOL'
      87 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   drivers/s390/block/dasd.c:3886:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    3886 | EXPORT_SYMBOL_GPL(dasd_generic_space_avail);
         | ^~~~~~~~~~~~~~~~~
   drivers/s390/block/dasd.c:3870:6: note: previous definition of 'dasd_generic_space_avail' with type 'void(struct dasd_device *)'
    3870 | void dasd_generic_space_avail(struct dasd_device *device)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/s390/block/dasd.c:3926:19: error: non-static declaration of 'dasd_generic_requeue_all_requests' follows static declaration
    3926 | EXPORT_SYMBOL_GPL(dasd_generic_requeue_all_requests);
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:74:28: note: in definition of macro '__EXPORT_SYMBOL'
      74 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:87:41: note: in expansion of macro '_EXPORT_SYMBOL'
      87 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   drivers/s390/block/dasd.c:3926:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    3926 | EXPORT_SYMBOL_GPL(dasd_generic_requeue_all_requests);
         | ^~~~~~~~~~~~~~~~~
   drivers/s390/block/dasd.c:3891:5: note: previous definition of 'dasd_generic_requeue_all_requests' with type 'int(struct dasd_device *)'
    3891 | int dasd_generic_requeue_all_requests(struct dasd_device *device)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/s390/block/dasd.c:3928:13: error: invalid storage class for function 'do_requeue_requests'
    3928 | static void do_requeue_requests(struct work_struct *work)
         |             ^~~~~~~~~~~~~~~~~~~
>> drivers/s390/block/dasd.c:3946:15: error: non-static declaration of 'dasd_schedule_requeue' follows static declaration
    3946 | EXPORT_SYMBOL(dasd_schedule_requeue);
         |               ^~~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:74:28: note: in definition of macro '__EXPORT_SYMBOL'
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
>> drivers/s390/block/dasd.c:3948:12: error: invalid storage class for function 'dasd_handle_autoquiesce'
    3948 | static int dasd_handle_autoquiesce(struct dasd_device *device,
         |            ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/s390/block/dasd.c:3973:29: error: invalid storage class for function 'dasd_generic_build_rdc'
    3973 | static struct dasd_ccw_req *dasd_generic_build_rdc(struct dasd_device *device,
         |                             ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/s390/block/dasd.c:4022:19: error: non-static declaration of 'dasd_generic_read_dev_chars' follows static declaration
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
>> drivers/s390/block/dasd.c:4055:19: error: non-static declaration of 'dasd_get_sense' follows static declaration
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
>> drivers/s390/block/dasd.c:4072:19: error: non-static declaration of 'dasd_generic_shutdown' follows static declaration
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
>> drivers/s390/block/dasd.c:4074:19: error: invalid storage class for function 'dasd_init'
    4074 | static int __init dasd_init(void)
         |                   ^~~~~~~~~
   In file included from include/linux/printk.h:6,
                    from include/asm-generic/bug.h:22,
                    from arch/s390/include/asm/bug.h:69,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from arch/s390/include/asm/cmpxchg.h:11,
                    from arch/s390/include/asm/atomic.h:16,
                    from include/linux/atomic.h:7,
                    from include/linux/jump_label.h:255,
                    from arch/s390/include/asm/cpu.h:15,
                    from arch/s390/include/asm/lowcore.h:14,
                    from arch/s390/include/asm/current.h:13,
                    from arch/s390/include/asm/preempt.h:5,
                    from include/linux/preempt.h:79:
>> drivers/s390/block/dasd.c:4123:13: error: initializer element is not constant
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
>> drivers/s390/block/dasd.c:4124:1: error: expected declaration or statement at end of input
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
   drivers/s390/block/dasd.c:3948:12: warning: 'dasd_handle_autoquiesce' defined but not used [-Wunused-function]
    3948 | static int dasd_handle_autoquiesce(struct dasd_device *device,
         |            ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/s390/block/dasd.c:3928:13: warning: 'do_requeue_requests' defined but not used [-Wunused-function]
    3928 | static void do_requeue_requests(struct work_struct *work)
         |             ^~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/dasd_generic_last_path_gone +3714 drivers/s390/block/dasd.c

^1da177e4c3f41 Linus Torvalds    2005-04-16  3689  
a4d26c6aeceea3 Stefan Weinhuber  2011-01-05  3690  int dasd_generic_last_path_gone(struct dasd_device *device)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3691  {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3692  	struct dasd_ccw_req *cqr;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3693  
a4d26c6aeceea3 Stefan Weinhuber  2011-01-05  3694  	dev_warn(&device->cdev->dev, "No operational channel path is left "
a4d26c6aeceea3 Stefan Weinhuber  2011-01-05  3695  		 "for the device\n");
a4d26c6aeceea3 Stefan Weinhuber  2011-01-05  3696  	DBF_DEV_EVENT(DBF_WARNING, device, "%s", "last path gone");
1cee2975bbabd8 Stefan Haberland  2023-04-05  3697  	/* First call extended error reporting and check for autoquiesce. */
1cee2975bbabd8 Stefan Haberland  2023-04-05  3698  	dasd_handle_autoquiesce(device, NULL, DASD_EER_NOPATH);
20c644680af1ef Stefan Weinhuber  2006-03-24  3699  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3700  	if (device->state < DASD_STATE_BASIC)
a4d26c6aeceea3 Stefan Weinhuber  2011-01-05  3701  		return 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3702  	/* Device is active. We want to keep it. */
8e09f21574ea30 Stefan Weinhuber  2008-01-26  3703  	list_for_each_entry(cqr, &device->ccw_queue, devlist)
a4d26c6aeceea3 Stefan Weinhuber  2011-01-05  3704  		if ((cqr->status == DASD_CQR_IN_IO) ||
a4d26c6aeceea3 Stefan Weinhuber  2011-01-05  3705  		    (cqr->status == DASD_CQR_CLEAR_PENDING)) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3706  			cqr->status = DASD_CQR_QUEUED;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3707  			cqr->retries++;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3708  		}
eb6e199bef2886 Stefan Weinhuber  2009-12-07  3709  	dasd_device_set_stop_bits(device, DASD_STOPPED_DC_WAIT);
8e09f21574ea30 Stefan Weinhuber  2008-01-26  3710  	dasd_device_clear_timer(device);
8e09f21574ea30 Stefan Weinhuber  2008-01-26  3711  	dasd_schedule_device_bh(device);
a4d26c6aeceea3 Stefan Weinhuber  2011-01-05  3712  	return 1;
a4d26c6aeceea3 Stefan Weinhuber  2011-01-05  3713  }
a4d26c6aeceea3 Stefan Weinhuber  2011-01-05 @3714  EXPORT_SYMBOL_GPL(dasd_generic_last_path_gone);
a4d26c6aeceea3 Stefan Weinhuber  2011-01-05  3715  
a4d26c6aeceea3 Stefan Weinhuber  2011-01-05  3716  int dasd_generic_path_operational(struct dasd_device *device)
a4d26c6aeceea3 Stefan Weinhuber  2011-01-05  3717  {
a4d26c6aeceea3 Stefan Weinhuber  2011-01-05  3718  	dev_info(&device->cdev->dev, "A channel path to the device has become "
a4d26c6aeceea3 Stefan Weinhuber  2011-01-05  3719  		 "operational\n");
a4d26c6aeceea3 Stefan Weinhuber  2011-01-05  3720  	DBF_DEV_EVENT(DBF_WARNING, device, "%s", "path operational");
eb6e199bef2886 Stefan Weinhuber  2009-12-07  3721  	dasd_device_remove_stop_bits(device, DASD_STOPPED_DC_WAIT);
8e09f21574ea30 Stefan Weinhuber  2008-01-26  3722  	dasd_schedule_device_bh(device);
e443343e509aac Stefan Haberland  2017-05-22  3723  	if (device->block) {
8e09f21574ea30 Stefan Weinhuber  2008-01-26  3724  		dasd_schedule_block_bh(device->block);
c68f4f4e296b60 Christoph Hellwig 2022-09-28  3725  		if (device->block->gdp)
c68f4f4e296b60 Christoph Hellwig 2022-09-28  3726  			blk_mq_run_hw_queues(device->block->gdp->queue, true);
e443343e509aac Stefan Haberland  2017-05-22  3727  	}
931a3dce819d2d Stefan Haberland  2014-07-18  3728  
931a3dce819d2d Stefan Haberland  2014-07-18  3729  	if (!device->stopped)
931a3dce819d2d Stefan Haberland  2014-07-18  3730  		wake_up(&generic_waitq);
931a3dce819d2d Stefan Haberland  2014-07-18  3731  
a4d26c6aeceea3 Stefan Weinhuber  2011-01-05  3732  	return 1;
a4d26c6aeceea3 Stefan Weinhuber  2011-01-05  3733  }
a4d26c6aeceea3 Stefan Weinhuber  2011-01-05 @3734  EXPORT_SYMBOL_GPL(dasd_generic_path_operational);
a4d26c6aeceea3 Stefan Weinhuber  2011-01-05  3735  
a4d26c6aeceea3 Stefan Weinhuber  2011-01-05  3736  int dasd_generic_notify(struct ccw_device *cdev, int event)
a4d26c6aeceea3 Stefan Weinhuber  2011-01-05  3737  {
a4d26c6aeceea3 Stefan Weinhuber  2011-01-05  3738  	struct dasd_device *device;
a4d26c6aeceea3 Stefan Weinhuber  2011-01-05  3739  	int ret;
a4d26c6aeceea3 Stefan Weinhuber  2011-01-05  3740  
a4d26c6aeceea3 Stefan Weinhuber  2011-01-05  3741  	device = dasd_device_from_cdev_locked(cdev);
a4d26c6aeceea3 Stefan Weinhuber  2011-01-05  3742  	if (IS_ERR(device))
a4d26c6aeceea3 Stefan Weinhuber  2011-01-05  3743  		return 0;
a4d26c6aeceea3 Stefan Weinhuber  2011-01-05  3744  	ret = 0;
a4d26c6aeceea3 Stefan Weinhuber  2011-01-05  3745  	switch (event) {
a4d26c6aeceea3 Stefan Weinhuber  2011-01-05  3746  	case CIO_GONE:
a4d26c6aeceea3 Stefan Weinhuber  2011-01-05  3747  	case CIO_BOXED:
a4d26c6aeceea3 Stefan Weinhuber  2011-01-05  3748  	case CIO_NO_PATH:
c93461515a1a16 Stefan Haberland  2016-08-08  3749  		dasd_path_no_path(device);
a4d26c6aeceea3 Stefan Weinhuber  2011-01-05  3750  		ret = dasd_generic_last_path_gone(device);
a4d26c6aeceea3 Stefan Weinhuber  2011-01-05  3751  		break;
a4d26c6aeceea3 Stefan Weinhuber  2011-01-05  3752  	case CIO_OPER:
^1da177e4c3f41 Linus Torvalds    2005-04-16  3753  		ret = 1;
c93461515a1a16 Stefan Haberland  2016-08-08  3754  		if (dasd_path_get_opm(device))
a4d26c6aeceea3 Stefan Weinhuber  2011-01-05  3755  			ret = dasd_generic_path_operational(device);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3756  		break;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3757  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3758  	dasd_put_device(device);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3759  	return ret;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3760  }
7048a2b5329124 Fabian Frederick  2014-06-26 @3761  EXPORT_SYMBOL_GPL(dasd_generic_notify);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3762  
a4d26c6aeceea3 Stefan Weinhuber  2011-01-05  3763  void dasd_generic_path_event(struct ccw_device *cdev, int *path_event)
a4d26c6aeceea3 Stefan Weinhuber  2011-01-05  3764  {
a4d26c6aeceea3 Stefan Weinhuber  2011-01-05  3765  	struct dasd_device *device;
a521b048bc8c5d Stefan Haberland  2016-08-08  3766  	int chp, oldopm, hpfpm, ifccpm;
a4d26c6aeceea3 Stefan Weinhuber  2011-01-05  3767  
a4d26c6aeceea3 Stefan Weinhuber  2011-01-05  3768  	device = dasd_device_from_cdev_locked(cdev);
a4d26c6aeceea3 Stefan Weinhuber  2011-01-05  3769  	if (IS_ERR(device))
a4d26c6aeceea3 Stefan Weinhuber  2011-01-05  3770  		return;
c93461515a1a16 Stefan Haberland  2016-08-08  3771  
c93461515a1a16 Stefan Haberland  2016-08-08  3772  	oldopm = dasd_path_get_opm(device);
a4d26c6aeceea3 Stefan Weinhuber  2011-01-05  3773  	for (chp = 0; chp < 8; chp++) {
a4d26c6aeceea3 Stefan Weinhuber  2011-01-05  3774  		if (path_event[chp] & PE_PATH_GONE) {
c93461515a1a16 Stefan Haberland  2016-08-08  3775  			dasd_path_notoper(device, chp);
a4d26c6aeceea3 Stefan Weinhuber  2011-01-05  3776  		}
a4d26c6aeceea3 Stefan Weinhuber  2011-01-05  3777  		if (path_event[chp] & PE_PATH_AVAILABLE) {
c93461515a1a16 Stefan Haberland  2016-08-08  3778  			dasd_path_available(device, chp);
a4d26c6aeceea3 Stefan Weinhuber  2011-01-05  3779  			dasd_schedule_device_bh(device);
a4d26c6aeceea3 Stefan Weinhuber  2011-01-05  3780  		}
f16330316321d1 Stefan Haberland  2012-01-18  3781  		if (path_event[chp] & PE_PATHGROUP_ESTABLISHED) {
c93461515a1a16 Stefan Haberland  2016-08-08  3782  			if (!dasd_path_is_operational(device, chp) &&
c93461515a1a16 Stefan Haberland  2016-08-08  3783  			    !dasd_path_need_verify(device, chp)) {
12d7b1078bb374 Stefan Haberland  2012-09-11  3784  				/*
12d7b1078bb374 Stefan Haberland  2012-09-11  3785  				 * we can not establish a pathgroup on an
12d7b1078bb374 Stefan Haberland  2012-09-11  3786  				 * unavailable path, so trigger a path
12d7b1078bb374 Stefan Haberland  2012-09-11  3787  				 * verification first
12d7b1078bb374 Stefan Haberland  2012-09-11  3788  				 */
c93461515a1a16 Stefan Haberland  2016-08-08  3789  			dasd_path_available(device, chp);
12d7b1078bb374 Stefan Haberland  2012-09-11  3790  			dasd_schedule_device_bh(device);
12d7b1078bb374 Stefan Haberland  2012-09-11  3791  			}
f16330316321d1 Stefan Haberland  2012-01-18  3792  			DBF_DEV_EVENT(DBF_WARNING, device, "%s",
f16330316321d1 Stefan Haberland  2012-01-18  3793  				      "Pathgroup re-established\n");
f16330316321d1 Stefan Haberland  2012-01-18  3794  			if (device->discipline->kick_validate)
f16330316321d1 Stefan Haberland  2012-01-18  3795  				device->discipline->kick_validate(device);
f16330316321d1 Stefan Haberland  2012-01-18  3796  		}
4d063e646b4bfe Jan Höppner       2020-10-08  3797  		if (path_event[chp] & PE_PATH_FCES_EVENT) {
4d063e646b4bfe Jan Höppner       2020-10-08  3798  			dasd_path_fcsec_update(device, chp);
4d063e646b4bfe Jan Höppner       2020-10-08  3799  			dasd_schedule_device_bh(device);
4d063e646b4bfe Jan Höppner       2020-10-08  3800  		}
a4d26c6aeceea3 Stefan Weinhuber  2011-01-05  3801  	}
a521b048bc8c5d Stefan Haberland  2016-08-08  3802  	hpfpm = dasd_path_get_hpfpm(device);
a521b048bc8c5d Stefan Haberland  2016-08-08  3803  	ifccpm = dasd_path_get_ifccpm(device);
a521b048bc8c5d Stefan Haberland  2016-08-08  3804  	if (!dasd_path_get_opm(device) && hpfpm) {
a521b048bc8c5d Stefan Haberland  2016-08-08  3805  		/*
a521b048bc8c5d Stefan Haberland  2016-08-08  3806  		 * device has no operational paths but at least one path is
a521b048bc8c5d Stefan Haberland  2016-08-08  3807  		 * disabled due to HPF errors
a521b048bc8c5d Stefan Haberland  2016-08-08  3808  		 * disable HPF at all and use the path(s) again
a521b048bc8c5d Stefan Haberland  2016-08-08  3809  		 */
a521b048bc8c5d Stefan Haberland  2016-08-08  3810  		if (device->discipline->disable_hpf)
a521b048bc8c5d Stefan Haberland  2016-08-08  3811  			device->discipline->disable_hpf(device);
a521b048bc8c5d Stefan Haberland  2016-08-08  3812  		dasd_device_set_stop_bits(device, DASD_STOPPED_NOT_ACC);
a521b048bc8c5d Stefan Haberland  2016-08-08  3813  		dasd_path_set_tbvpm(device, hpfpm);
a521b048bc8c5d Stefan Haberland  2016-08-08  3814  		dasd_schedule_device_bh(device);
a521b048bc8c5d Stefan Haberland  2016-08-08  3815  		dasd_schedule_requeue(device);
a521b048bc8c5d Stefan Haberland  2016-08-08  3816  	} else if (!dasd_path_get_opm(device) && ifccpm) {
a521b048bc8c5d Stefan Haberland  2016-08-08  3817  		/*
a521b048bc8c5d Stefan Haberland  2016-08-08  3818  		 * device has no operational paths but at least one path is
a521b048bc8c5d Stefan Haberland  2016-08-08  3819  		 * disabled due to IFCC errors
a521b048bc8c5d Stefan Haberland  2016-08-08  3820  		 * trigger path verification on paths with IFCC errors
a521b048bc8c5d Stefan Haberland  2016-08-08  3821  		 */
a521b048bc8c5d Stefan Haberland  2016-08-08  3822  		dasd_path_set_tbvpm(device, ifccpm);
a521b048bc8c5d Stefan Haberland  2016-08-08  3823  		dasd_schedule_device_bh(device);
a521b048bc8c5d Stefan Haberland  2016-08-08  3824  	}
a521b048bc8c5d Stefan Haberland  2016-08-08  3825  	if (oldopm && !dasd_path_get_opm(device) && !hpfpm && !ifccpm) {
c93461515a1a16 Stefan Haberland  2016-08-08  3826  		dev_warn(&device->cdev->dev,
c93461515a1a16 Stefan Haberland  2016-08-08  3827  			 "No verified channel paths remain for the device\n");
c93461515a1a16 Stefan Haberland  2016-08-08  3828  		DBF_DEV_EVENT(DBF_WARNING, device,
c93461515a1a16 Stefan Haberland  2016-08-08  3829  			      "%s", "last verified path gone");
1cee2975bbabd8 Stefan Haberland  2023-04-05  3830  		/* First call extended error reporting and check for autoquiesce. */
1cee2975bbabd8 Stefan Haberland  2023-04-05  3831  		dasd_handle_autoquiesce(device, NULL, DASD_EER_NOPATH);
c93461515a1a16 Stefan Haberland  2016-08-08  3832  		dasd_device_set_stop_bits(device,
c93461515a1a16 Stefan Haberland  2016-08-08  3833  					  DASD_STOPPED_DC_WAIT);
c93461515a1a16 Stefan Haberland  2016-08-08  3834  	}
a4d26c6aeceea3 Stefan Weinhuber  2011-01-05  3835  	dasd_put_device(device);
a4d26c6aeceea3 Stefan Weinhuber  2011-01-05  3836  }
a4d26c6aeceea3 Stefan Weinhuber  2011-01-05 @3837  EXPORT_SYMBOL_GPL(dasd_generic_path_event);
a4d26c6aeceea3 Stefan Weinhuber  2011-01-05  3838  
a4d26c6aeceea3 Stefan Weinhuber  2011-01-05  3839  int dasd_generic_verify_path(struct dasd_device *device, __u8 lpm)
a4d26c6aeceea3 Stefan Weinhuber  2011-01-05  3840  {
c93461515a1a16 Stefan Haberland  2016-08-08  3841  	if (!dasd_path_get_opm(device) && lpm) {
c93461515a1a16 Stefan Haberland  2016-08-08  3842  		dasd_path_set_opm(device, lpm);
a4d26c6aeceea3 Stefan Weinhuber  2011-01-05  3843  		dasd_generic_path_operational(device);
a4d26c6aeceea3 Stefan Weinhuber  2011-01-05  3844  	} else
c93461515a1a16 Stefan Haberland  2016-08-08  3845  		dasd_path_add_opm(device, lpm);
a4d26c6aeceea3 Stefan Weinhuber  2011-01-05  3846  	return 0;
a4d26c6aeceea3 Stefan Weinhuber  2011-01-05  3847  }
a4d26c6aeceea3 Stefan Weinhuber  2011-01-05 @3848  EXPORT_SYMBOL_GPL(dasd_generic_verify_path);
a4d26c6aeceea3 Stefan Weinhuber  2011-01-05  3849  
9e12e54c7a8f61 Jan Höppner       2018-07-03  3850  void dasd_generic_space_exhaust(struct dasd_device *device,
9e12e54c7a8f61 Jan Höppner       2018-07-03  3851  				struct dasd_ccw_req *cqr)
9e12e54c7a8f61 Jan Höppner       2018-07-03  3852  {
1cee2975bbabd8 Stefan Haberland  2023-04-05  3853  	/* First call extended error reporting and check for autoquiesce. */
1cee2975bbabd8 Stefan Haberland  2023-04-05  3854  	dasd_handle_autoquiesce(device, NULL, DASD_EER_NOSPC);
9e12e54c7a8f61 Jan Höppner       2018-07-03  3855  
9e12e54c7a8f61 Jan Höppner       2018-07-03  3856  	if (device->state < DASD_STATE_BASIC)
9e12e54c7a8f61 Jan Höppner       2018-07-03  3857  		return;
9e12e54c7a8f61 Jan Höppner       2018-07-03  3858  
9e12e54c7a8f61 Jan Höppner       2018-07-03  3859  	if (cqr->status == DASD_CQR_IN_IO ||
9e12e54c7a8f61 Jan Höppner       2018-07-03  3860  	    cqr->status == DASD_CQR_CLEAR_PENDING) {
9e12e54c7a8f61 Jan Höppner       2018-07-03  3861  		cqr->status = DASD_CQR_QUEUED;
9e12e54c7a8f61 Jan Höppner       2018-07-03  3862  		cqr->retries++;
9e12e54c7a8f61 Jan Höppner       2018-07-03  3863  	}
9e12e54c7a8f61 Jan Höppner       2018-07-03  3864  	dasd_device_set_stop_bits(device, DASD_STOPPED_NOSPC);
9e12e54c7a8f61 Jan Höppner       2018-07-03  3865  	dasd_device_clear_timer(device);
9e12e54c7a8f61 Jan Höppner       2018-07-03  3866  	dasd_schedule_device_bh(device);
9e12e54c7a8f61 Jan Höppner       2018-07-03  3867  }
9e12e54c7a8f61 Jan Höppner       2018-07-03 @3868  EXPORT_SYMBOL_GPL(dasd_generic_space_exhaust);
9e12e54c7a8f61 Jan Höppner       2018-07-03  3869  
9e12e54c7a8f61 Jan Höppner       2018-07-03  3870  void dasd_generic_space_avail(struct dasd_device *device)
9e12e54c7a8f61 Jan Höppner       2018-07-03  3871  {
9e12e54c7a8f61 Jan Höppner       2018-07-03  3872  	dev_info(&device->cdev->dev, "Extent pool space is available\n");
9e12e54c7a8f61 Jan Höppner       2018-07-03  3873  	DBF_DEV_EVENT(DBF_WARNING, device, "%s", "space available");
9e12e54c7a8f61 Jan Höppner       2018-07-03  3874  
9e12e54c7a8f61 Jan Höppner       2018-07-03  3875  	dasd_device_remove_stop_bits(device, DASD_STOPPED_NOSPC);
9e12e54c7a8f61 Jan Höppner       2018-07-03  3876  	dasd_schedule_device_bh(device);
9e12e54c7a8f61 Jan Höppner       2018-07-03  3877  
9e12e54c7a8f61 Jan Höppner       2018-07-03  3878  	if (device->block) {
9e12e54c7a8f61 Jan Höppner       2018-07-03  3879  		dasd_schedule_block_bh(device->block);
c68f4f4e296b60 Christoph Hellwig 2022-09-28  3880  		if (device->block->gdp)
c68f4f4e296b60 Christoph Hellwig 2022-09-28  3881  			blk_mq_run_hw_queues(device->block->gdp->queue, true);
9e12e54c7a8f61 Jan Höppner       2018-07-03  3882  	}
9e12e54c7a8f61 Jan Höppner       2018-07-03  3883  	if (!device->stopped)
9e12e54c7a8f61 Jan Höppner       2018-07-03  3884  		wake_up(&generic_waitq);
9e12e54c7a8f61 Jan Höppner       2018-07-03  3885  }
9e12e54c7a8f61 Jan Höppner       2018-07-03 @3886  EXPORT_SYMBOL_GPL(dasd_generic_space_avail);
9e12e54c7a8f61 Jan Höppner       2018-07-03  3887  

:::::: The code at line 3714 was first introduced by commit
:::::: a4d26c6aeceea330ee5e0fb6b017d57e3b252d29 [S390] dasd: do path verification for paths added at runtime

:::::: TO: Stefan Weinhuber <wein@de.ibm.com>
:::::: CC: Martin Schwidefsky <sky@mschwide.boeblingen.de.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
