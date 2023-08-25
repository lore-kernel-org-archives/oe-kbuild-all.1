Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2207174F7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Aug 2023 20:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692996502; x=1724532502;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=xoox9kTXuE/D1NNTB3aAwNy4/U9essrjNJkVKbix7EY=;
  b=j1NgJVlzgiz4IpDkmjkI/jxaUho9ZXSaoJnUrO/oTt8u+ropQ8yRxPO0
   pVAajQ7e1Zjk7Y4Jd0bSnF0PqMuiT1IRMLbD6AlHuvozs96K/Q2ZLEYKx
   6LIOl0Mxqt+AOH3yTdmym8ZrE5IAnF6U8oWfeSlkVFWwfmpY8ILIa9Okx
   snKIUqLLe9Cb0AT2KAf5Hk8vt3RPNiaAJZUToEzysDaK39emZ2nbkQbVj
   NXGLKhwO20EGv/0MWqQMx0edK1gFSgixTfG8ZKdny1vlCPpD7zpwiAkr7
   gor+gyfQPasVZyPnXpNJYDOhO3Nc4m9uy1bB8VZylkauKkesviXpFttuj
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="441145945"
X-IronPort-AV: E=Sophos;i="6.02,201,1688454000"; 
   d="scan'208";a="441145945"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 13:48:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="861191941"
X-IronPort-AV: E=Sophos;i="6.02,201,1688454000"; 
   d="scan'208";a="861191941"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 25 Aug 2023 13:48:18 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZdj7-0003zX-2C;
	Fri, 25 Aug 2023 20:48:17 +0000
Date: Sat, 26 Aug 2023 04:48:10 +0800
From: kernel test robot <lkp@intel.com>
To: Jan Kara <jack@suse.cz>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jack-fs:bdev_handle 15/30] drivers/s390/block/dasd.c:3928:13:
 error: invalid storage class for function 'do_requeue_requests'
Message-ID: <202308260453.8cLfQqOf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs.git bdev_handle
head:   2097314eee185a69d02f5c562e6c52444b98bdfa
commit: 1a5d1f197d7d6846806f50383924a3edb859ccf3 [15/30] s390/dasd: Convert to bdev_open_by_path()
config: s390-randconfig-r003-20230826 (https://download.01.org/0day-ci/archive/20230826/202308260453.8cLfQqOf-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230826/202308260453.8cLfQqOf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308260453.8cLfQqOf-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/s390/block/dasd.c: In function 'dasd_generic_set_offline':
>> drivers/s390/block/dasd.c:3928:13: error: invalid storage class for function 'do_requeue_requests'
    3928 | static void do_requeue_requests(struct work_struct *work)
         |             ^~~~~~~~~~~~~~~~~~~
>> drivers/s390/block/dasd.c:3948:12: error: invalid storage class for function 'dasd_handle_autoquiesce'
    3948 | static int dasd_handle_autoquiesce(struct dasd_device *device,
         |            ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/s390/block/dasd.c:3973:29: error: invalid storage class for function 'dasd_generic_build_rdc'
    3973 | static struct dasd_ccw_req *dasd_generic_build_rdc(struct dasd_device *device,
         |                             ^~~~~~~~~~~~~~~~~~~~~~
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
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from drivers/s390/block/dasd.c:14:
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
>> drivers/s390/block/dasd.c:4057:6: warning: 'dasd_generic_shutdown' defined but not used [-Wunused-function]
    4057 | void dasd_generic_shutdown(struct ccw_device *cdev)
         |      ^~~~~~~~~~~~~~~~~~~~~
>> drivers/s390/block/dasd.c:4030:7: warning: 'dasd_get_sense' defined but not used [-Wunused-function]
    4030 | char *dasd_get_sense(struct irb *irb)
         |       ^~~~~~~~~~~~~~
>> drivers/s390/block/dasd.c:4006:5: warning: 'dasd_generic_read_dev_chars' defined but not used [-Wunused-function]
    4006 | int dasd_generic_read_dev_chars(struct dasd_device *device, int magic,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/s390/block/dasd.c:3948:12: warning: 'dasd_handle_autoquiesce' defined but not used [-Wunused-function]
    3948 | static int dasd_handle_autoquiesce(struct dasd_device *device,
         |            ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/s390/block/dasd.c:3928:13: warning: 'do_requeue_requests' defined but not used [-Wunused-function]
    3928 | static void do_requeue_requests(struct work_struct *work)
         |             ^~~~~~~~~~~~~~~~~~~
>> drivers/s390/block/dasd.c:3870:6: warning: 'dasd_generic_space_avail' defined but not used [-Wunused-function]
    3870 | void dasd_generic_space_avail(struct dasd_device *device)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/s390/block/dasd.c:3850:6: warning: 'dasd_generic_space_exhaust' defined but not used [-Wunused-function]
    3850 | void dasd_generic_space_exhaust(struct dasd_device *device,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/s390/block/dasd.c:3839:5: warning: 'dasd_generic_verify_path' defined but not used [-Wunused-function]
    3839 | int dasd_generic_verify_path(struct dasd_device *device, __u8 lpm)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/s390/block/dasd.c:3763:6: warning: 'dasd_generic_path_event' defined but not used [-Wunused-function]
    3763 | void dasd_generic_path_event(struct ccw_device *cdev, int *path_event)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/s390/block/dasd.c:3736:5: warning: 'dasd_generic_notify' defined but not used [-Wunused-function]
    3736 | int dasd_generic_notify(struct ccw_device *cdev, int event)
         |     ^~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/do_requeue_requests +3928 drivers/s390/block/dasd.c

a4d26c6aeceea33 Stefan Weinhuber   2011-01-05  3735  
a4d26c6aeceea33 Stefan Weinhuber   2011-01-05 @3736  int dasd_generic_notify(struct ccw_device *cdev, int event)
a4d26c6aeceea33 Stefan Weinhuber   2011-01-05  3737  {
a4d26c6aeceea33 Stefan Weinhuber   2011-01-05  3738  	struct dasd_device *device;
a4d26c6aeceea33 Stefan Weinhuber   2011-01-05  3739  	int ret;
a4d26c6aeceea33 Stefan Weinhuber   2011-01-05  3740  
a4d26c6aeceea33 Stefan Weinhuber   2011-01-05  3741  	device = dasd_device_from_cdev_locked(cdev);
a4d26c6aeceea33 Stefan Weinhuber   2011-01-05  3742  	if (IS_ERR(device))
a4d26c6aeceea33 Stefan Weinhuber   2011-01-05  3743  		return 0;
a4d26c6aeceea33 Stefan Weinhuber   2011-01-05  3744  	ret = 0;
a4d26c6aeceea33 Stefan Weinhuber   2011-01-05  3745  	switch (event) {
a4d26c6aeceea33 Stefan Weinhuber   2011-01-05  3746  	case CIO_GONE:
a4d26c6aeceea33 Stefan Weinhuber   2011-01-05  3747  	case CIO_BOXED:
a4d26c6aeceea33 Stefan Weinhuber   2011-01-05  3748  	case CIO_NO_PATH:
c93461515a1a164 Stefan Haberland   2016-08-08  3749  		dasd_path_no_path(device);
a4d26c6aeceea33 Stefan Weinhuber   2011-01-05  3750  		ret = dasd_generic_last_path_gone(device);
a4d26c6aeceea33 Stefan Weinhuber   2011-01-05  3751  		break;
a4d26c6aeceea33 Stefan Weinhuber   2011-01-05  3752  	case CIO_OPER:
^1da177e4c3f415 Linus Torvalds     2005-04-16  3753  		ret = 1;
c93461515a1a164 Stefan Haberland   2016-08-08  3754  		if (dasd_path_get_opm(device))
a4d26c6aeceea33 Stefan Weinhuber   2011-01-05  3755  			ret = dasd_generic_path_operational(device);
^1da177e4c3f415 Linus Torvalds     2005-04-16  3756  		break;
^1da177e4c3f415 Linus Torvalds     2005-04-16  3757  	}
^1da177e4c3f415 Linus Torvalds     2005-04-16  3758  	dasd_put_device(device);
^1da177e4c3f415 Linus Torvalds     2005-04-16  3759  	return ret;
^1da177e4c3f415 Linus Torvalds     2005-04-16  3760  }
7048a2b53291246 Fabian Frederick   2014-06-26  3761  EXPORT_SYMBOL_GPL(dasd_generic_notify);
^1da177e4c3f415 Linus Torvalds     2005-04-16  3762  
a4d26c6aeceea33 Stefan Weinhuber   2011-01-05 @3763  void dasd_generic_path_event(struct ccw_device *cdev, int *path_event)
a4d26c6aeceea33 Stefan Weinhuber   2011-01-05  3764  {
a4d26c6aeceea33 Stefan Weinhuber   2011-01-05  3765  	struct dasd_device *device;
a521b048bc8c5d3 Stefan Haberland   2016-08-08  3766  	int chp, oldopm, hpfpm, ifccpm;
a4d26c6aeceea33 Stefan Weinhuber   2011-01-05  3767  
a4d26c6aeceea33 Stefan Weinhuber   2011-01-05  3768  	device = dasd_device_from_cdev_locked(cdev);
a4d26c6aeceea33 Stefan Weinhuber   2011-01-05  3769  	if (IS_ERR(device))
a4d26c6aeceea33 Stefan Weinhuber   2011-01-05  3770  		return;
c93461515a1a164 Stefan Haberland   2016-08-08  3771  
c93461515a1a164 Stefan Haberland   2016-08-08  3772  	oldopm = dasd_path_get_opm(device);
a4d26c6aeceea33 Stefan Weinhuber   2011-01-05  3773  	for (chp = 0; chp < 8; chp++) {
a4d26c6aeceea33 Stefan Weinhuber   2011-01-05  3774  		if (path_event[chp] & PE_PATH_GONE) {
c93461515a1a164 Stefan Haberland   2016-08-08  3775  			dasd_path_notoper(device, chp);
a4d26c6aeceea33 Stefan Weinhuber   2011-01-05  3776  		}
a4d26c6aeceea33 Stefan Weinhuber   2011-01-05  3777  		if (path_event[chp] & PE_PATH_AVAILABLE) {
c93461515a1a164 Stefan Haberland   2016-08-08  3778  			dasd_path_available(device, chp);
a4d26c6aeceea33 Stefan Weinhuber   2011-01-05  3779  			dasd_schedule_device_bh(device);
a4d26c6aeceea33 Stefan Weinhuber   2011-01-05  3780  		}
f16330316321d1c Stefan Haberland   2012-01-18  3781  		if (path_event[chp] & PE_PATHGROUP_ESTABLISHED) {
c93461515a1a164 Stefan Haberland   2016-08-08  3782  			if (!dasd_path_is_operational(device, chp) &&
c93461515a1a164 Stefan Haberland   2016-08-08  3783  			    !dasd_path_need_verify(device, chp)) {
12d7b1078bb374f Stefan Haberland   2012-09-11  3784  				/*
12d7b1078bb374f Stefan Haberland   2012-09-11  3785  				 * we can not establish a pathgroup on an
12d7b1078bb374f Stefan Haberland   2012-09-11  3786  				 * unavailable path, so trigger a path
12d7b1078bb374f Stefan Haberland   2012-09-11  3787  				 * verification first
12d7b1078bb374f Stefan Haberland   2012-09-11  3788  				 */
c93461515a1a164 Stefan Haberland   2016-08-08  3789  			dasd_path_available(device, chp);
12d7b1078bb374f Stefan Haberland   2012-09-11  3790  			dasd_schedule_device_bh(device);
12d7b1078bb374f Stefan Haberland   2012-09-11  3791  			}
f16330316321d1c Stefan Haberland   2012-01-18  3792  			DBF_DEV_EVENT(DBF_WARNING, device, "%s",
f16330316321d1c Stefan Haberland   2012-01-18  3793  				      "Pathgroup re-established\n");
f16330316321d1c Stefan Haberland   2012-01-18  3794  			if (device->discipline->kick_validate)
f16330316321d1c Stefan Haberland   2012-01-18  3795  				device->discipline->kick_validate(device);
f16330316321d1c Stefan Haberland   2012-01-18  3796  		}
4d063e646b4bfe8 Jan Höppner        2020-10-08  3797  		if (path_event[chp] & PE_PATH_FCES_EVENT) {
4d063e646b4bfe8 Jan Höppner        2020-10-08  3798  			dasd_path_fcsec_update(device, chp);
4d063e646b4bfe8 Jan Höppner        2020-10-08  3799  			dasd_schedule_device_bh(device);
4d063e646b4bfe8 Jan Höppner        2020-10-08  3800  		}
a4d26c6aeceea33 Stefan Weinhuber   2011-01-05  3801  	}
a521b048bc8c5d3 Stefan Haberland   2016-08-08  3802  	hpfpm = dasd_path_get_hpfpm(device);
a521b048bc8c5d3 Stefan Haberland   2016-08-08  3803  	ifccpm = dasd_path_get_ifccpm(device);
a521b048bc8c5d3 Stefan Haberland   2016-08-08  3804  	if (!dasd_path_get_opm(device) && hpfpm) {
a521b048bc8c5d3 Stefan Haberland   2016-08-08  3805  		/*
a521b048bc8c5d3 Stefan Haberland   2016-08-08  3806  		 * device has no operational paths but at least one path is
a521b048bc8c5d3 Stefan Haberland   2016-08-08  3807  		 * disabled due to HPF errors
a521b048bc8c5d3 Stefan Haberland   2016-08-08  3808  		 * disable HPF at all and use the path(s) again
a521b048bc8c5d3 Stefan Haberland   2016-08-08  3809  		 */
a521b048bc8c5d3 Stefan Haberland   2016-08-08  3810  		if (device->discipline->disable_hpf)
a521b048bc8c5d3 Stefan Haberland   2016-08-08  3811  			device->discipline->disable_hpf(device);
a521b048bc8c5d3 Stefan Haberland   2016-08-08  3812  		dasd_device_set_stop_bits(device, DASD_STOPPED_NOT_ACC);
a521b048bc8c5d3 Stefan Haberland   2016-08-08  3813  		dasd_path_set_tbvpm(device, hpfpm);
a521b048bc8c5d3 Stefan Haberland   2016-08-08  3814  		dasd_schedule_device_bh(device);
a521b048bc8c5d3 Stefan Haberland   2016-08-08  3815  		dasd_schedule_requeue(device);
a521b048bc8c5d3 Stefan Haberland   2016-08-08  3816  	} else if (!dasd_path_get_opm(device) && ifccpm) {
a521b048bc8c5d3 Stefan Haberland   2016-08-08  3817  		/*
a521b048bc8c5d3 Stefan Haberland   2016-08-08  3818  		 * device has no operational paths but at least one path is
a521b048bc8c5d3 Stefan Haberland   2016-08-08  3819  		 * disabled due to IFCC errors
a521b048bc8c5d3 Stefan Haberland   2016-08-08  3820  		 * trigger path verification on paths with IFCC errors
a521b048bc8c5d3 Stefan Haberland   2016-08-08  3821  		 */
a521b048bc8c5d3 Stefan Haberland   2016-08-08  3822  		dasd_path_set_tbvpm(device, ifccpm);
a521b048bc8c5d3 Stefan Haberland   2016-08-08  3823  		dasd_schedule_device_bh(device);
a521b048bc8c5d3 Stefan Haberland   2016-08-08  3824  	}
a521b048bc8c5d3 Stefan Haberland   2016-08-08  3825  	if (oldopm && !dasd_path_get_opm(device) && !hpfpm && !ifccpm) {
c93461515a1a164 Stefan Haberland   2016-08-08  3826  		dev_warn(&device->cdev->dev,
c93461515a1a164 Stefan Haberland   2016-08-08  3827  			 "No verified channel paths remain for the device\n");
c93461515a1a164 Stefan Haberland   2016-08-08  3828  		DBF_DEV_EVENT(DBF_WARNING, device,
c93461515a1a164 Stefan Haberland   2016-08-08  3829  			      "%s", "last verified path gone");
1cee2975bbabd89 Stefan Haberland   2023-04-05  3830  		/* First call extended error reporting and check for autoquiesce. */
1cee2975bbabd89 Stefan Haberland   2023-04-05  3831  		dasd_handle_autoquiesce(device, NULL, DASD_EER_NOPATH);
c93461515a1a164 Stefan Haberland   2016-08-08  3832  		dasd_device_set_stop_bits(device,
c93461515a1a164 Stefan Haberland   2016-08-08  3833  					  DASD_STOPPED_DC_WAIT);
c93461515a1a164 Stefan Haberland   2016-08-08  3834  	}
a4d26c6aeceea33 Stefan Weinhuber   2011-01-05  3835  	dasd_put_device(device);
a4d26c6aeceea33 Stefan Weinhuber   2011-01-05  3836  }
a4d26c6aeceea33 Stefan Weinhuber   2011-01-05  3837  EXPORT_SYMBOL_GPL(dasd_generic_path_event);
a4d26c6aeceea33 Stefan Weinhuber   2011-01-05  3838  
a4d26c6aeceea33 Stefan Weinhuber   2011-01-05 @3839  int dasd_generic_verify_path(struct dasd_device *device, __u8 lpm)
a4d26c6aeceea33 Stefan Weinhuber   2011-01-05  3840  {
c93461515a1a164 Stefan Haberland   2016-08-08  3841  	if (!dasd_path_get_opm(device) && lpm) {
c93461515a1a164 Stefan Haberland   2016-08-08  3842  		dasd_path_set_opm(device, lpm);
a4d26c6aeceea33 Stefan Weinhuber   2011-01-05  3843  		dasd_generic_path_operational(device);
a4d26c6aeceea33 Stefan Weinhuber   2011-01-05  3844  	} else
c93461515a1a164 Stefan Haberland   2016-08-08  3845  		dasd_path_add_opm(device, lpm);
a4d26c6aeceea33 Stefan Weinhuber   2011-01-05  3846  	return 0;
a4d26c6aeceea33 Stefan Weinhuber   2011-01-05  3847  }
a4d26c6aeceea33 Stefan Weinhuber   2011-01-05  3848  EXPORT_SYMBOL_GPL(dasd_generic_verify_path);
a4d26c6aeceea33 Stefan Weinhuber   2011-01-05  3849  
9e12e54c7a8f616 Jan Höppner        2018-07-03 @3850  void dasd_generic_space_exhaust(struct dasd_device *device,
9e12e54c7a8f616 Jan Höppner        2018-07-03  3851  				struct dasd_ccw_req *cqr)
9e12e54c7a8f616 Jan Höppner        2018-07-03  3852  {
1cee2975bbabd89 Stefan Haberland   2023-04-05  3853  	/* First call extended error reporting and check for autoquiesce. */
1cee2975bbabd89 Stefan Haberland   2023-04-05  3854  	dasd_handle_autoquiesce(device, NULL, DASD_EER_NOSPC);
9e12e54c7a8f616 Jan Höppner        2018-07-03  3855  
9e12e54c7a8f616 Jan Höppner        2018-07-03  3856  	if (device->state < DASD_STATE_BASIC)
9e12e54c7a8f616 Jan Höppner        2018-07-03  3857  		return;
9e12e54c7a8f616 Jan Höppner        2018-07-03  3858  
9e12e54c7a8f616 Jan Höppner        2018-07-03  3859  	if (cqr->status == DASD_CQR_IN_IO ||
9e12e54c7a8f616 Jan Höppner        2018-07-03  3860  	    cqr->status == DASD_CQR_CLEAR_PENDING) {
9e12e54c7a8f616 Jan Höppner        2018-07-03  3861  		cqr->status = DASD_CQR_QUEUED;
9e12e54c7a8f616 Jan Höppner        2018-07-03  3862  		cqr->retries++;
9e12e54c7a8f616 Jan Höppner        2018-07-03  3863  	}
9e12e54c7a8f616 Jan Höppner        2018-07-03  3864  	dasd_device_set_stop_bits(device, DASD_STOPPED_NOSPC);
9e12e54c7a8f616 Jan Höppner        2018-07-03  3865  	dasd_device_clear_timer(device);
9e12e54c7a8f616 Jan Höppner        2018-07-03  3866  	dasd_schedule_device_bh(device);
9e12e54c7a8f616 Jan Höppner        2018-07-03  3867  }
9e12e54c7a8f616 Jan Höppner        2018-07-03  3868  EXPORT_SYMBOL_GPL(dasd_generic_space_exhaust);
9e12e54c7a8f616 Jan Höppner        2018-07-03  3869  
9e12e54c7a8f616 Jan Höppner        2018-07-03 @3870  void dasd_generic_space_avail(struct dasd_device *device)
9e12e54c7a8f616 Jan Höppner        2018-07-03  3871  {
9e12e54c7a8f616 Jan Höppner        2018-07-03  3872  	dev_info(&device->cdev->dev, "Extent pool space is available\n");
9e12e54c7a8f616 Jan Höppner        2018-07-03  3873  	DBF_DEV_EVENT(DBF_WARNING, device, "%s", "space available");
9e12e54c7a8f616 Jan Höppner        2018-07-03  3874  
9e12e54c7a8f616 Jan Höppner        2018-07-03  3875  	dasd_device_remove_stop_bits(device, DASD_STOPPED_NOSPC);
9e12e54c7a8f616 Jan Höppner        2018-07-03  3876  	dasd_schedule_device_bh(device);
9e12e54c7a8f616 Jan Höppner        2018-07-03  3877  
9e12e54c7a8f616 Jan Höppner        2018-07-03  3878  	if (device->block) {
9e12e54c7a8f616 Jan Höppner        2018-07-03  3879  		dasd_schedule_block_bh(device->block);
c68f4f4e296b601 Christoph Hellwig  2022-09-28  3880  		if (device->block->gdp)
c68f4f4e296b601 Christoph Hellwig  2022-09-28  3881  			blk_mq_run_hw_queues(device->block->gdp->queue, true);
9e12e54c7a8f616 Jan Höppner        2018-07-03  3882  	}
9e12e54c7a8f616 Jan Höppner        2018-07-03  3883  	if (!device->stopped)
9e12e54c7a8f616 Jan Höppner        2018-07-03  3884  		wake_up(&generic_waitq);
9e12e54c7a8f616 Jan Höppner        2018-07-03  3885  }
9e12e54c7a8f616 Jan Höppner        2018-07-03  3886  EXPORT_SYMBOL_GPL(dasd_generic_space_avail);
9e12e54c7a8f616 Jan Höppner        2018-07-03  3887  
a521b048bc8c5d3 Stefan Haberland   2016-08-08  3888  /*
a521b048bc8c5d3 Stefan Haberland   2016-08-08  3889   * clear active requests and requeue them to block layer if possible
a521b048bc8c5d3 Stefan Haberland   2016-08-08  3890   */
413862caad6fe7f Stefan Haberland   2022-09-20  3891  int dasd_generic_requeue_all_requests(struct dasd_device *device)
d41dd122acf960d Stefan Haberland   2009-06-16  3892  {
8a2278ce9c25048 Stefan Haberland   2023-07-21  3893  	struct dasd_block *block = device->block;
a521b048bc8c5d3 Stefan Haberland   2016-08-08  3894  	struct list_head requeue_queue;
d41dd122acf960d Stefan Haberland   2009-06-16  3895  	struct dasd_ccw_req *cqr, *n;
d41dd122acf960d Stefan Haberland   2009-06-16  3896  	int rc;
d41dd122acf960d Stefan Haberland   2009-06-16  3897  
8a2278ce9c25048 Stefan Haberland   2023-07-21  3898  	if (!block)
8a2278ce9c25048 Stefan Haberland   2023-07-21  3899  		return 0;
d41dd122acf960d Stefan Haberland   2009-06-16  3900  
8a2278ce9c25048 Stefan Haberland   2023-07-21  3901  	INIT_LIST_HEAD(&requeue_queue);
8a2278ce9c25048 Stefan Haberland   2023-07-21  3902  	rc = _dasd_requests_to_flushqueue(block, &requeue_queue);
c55768765e7b488 Stefan Haberland   2013-04-15  3903  
8a2278ce9c25048 Stefan Haberland   2023-07-21  3904  	/* Now call the callback function of flushed requests */
8a2278ce9c25048 Stefan Haberland   2023-07-21  3905  restart_cb:
8a2278ce9c25048 Stefan Haberland   2023-07-21  3906  	list_for_each_entry_safe(cqr, n, &requeue_queue, blocklist) {
8a2278ce9c25048 Stefan Haberland   2023-07-21  3907  		wait_event(dasd_flush_wq, (cqr->status < DASD_CQR_QUEUED));
8a2278ce9c25048 Stefan Haberland   2023-07-21  3908  		/* Process finished ERP request. */
8a2278ce9c25048 Stefan Haberland   2023-07-21  3909  		if (cqr->refers) {
8a2278ce9c25048 Stefan Haberland   2023-07-21  3910  			spin_lock_bh(&block->queue_lock);
8a2278ce9c25048 Stefan Haberland   2023-07-21  3911  			__dasd_process_erp(block->base, cqr);
8a2278ce9c25048 Stefan Haberland   2023-07-21  3912  			spin_unlock_bh(&block->queue_lock);
8a2278ce9c25048 Stefan Haberland   2023-07-21  3913  			/* restart list_for_xx loop since dasd_process_erp
8a2278ce9c25048 Stefan Haberland   2023-07-21  3914  			 * might remove multiple elements
9487cfd3430d073 Stefan Haberland   2018-02-07  3915  			 */
8a2278ce9c25048 Stefan Haberland   2023-07-21  3916  			goto restart_cb;
c55768765e7b488 Stefan Haberland   2013-04-15  3917  		}
8a2278ce9c25048 Stefan Haberland   2023-07-21  3918  		_dasd_requeue_request(cqr);
c55768765e7b488 Stefan Haberland   2013-04-15  3919  		list_del_init(&cqr->blocklist);
c55768765e7b488 Stefan Haberland   2013-04-15  3920  		cqr->block->base->discipline->free_cp(
c55768765e7b488 Stefan Haberland   2013-04-15  3921  			cqr, (struct request *) cqr->callback_data);
d41dd122acf960d Stefan Haberland   2009-06-16  3922  	}
9487cfd3430d073 Stefan Haberland   2018-02-07  3923  	dasd_schedule_device_bh(device);
d41dd122acf960d Stefan Haberland   2009-06-16  3924  	return rc;
d41dd122acf960d Stefan Haberland   2009-06-16  3925  }
413862caad6fe7f Stefan Haberland   2022-09-20  3926  EXPORT_SYMBOL_GPL(dasd_generic_requeue_all_requests);
a521b048bc8c5d3 Stefan Haberland   2016-08-08  3927  
a521b048bc8c5d3 Stefan Haberland   2016-08-08 @3928  static void do_requeue_requests(struct work_struct *work)
a521b048bc8c5d3 Stefan Haberland   2016-08-08  3929  {
a521b048bc8c5d3 Stefan Haberland   2016-08-08  3930  	struct dasd_device *device = container_of(work, struct dasd_device,
a521b048bc8c5d3 Stefan Haberland   2016-08-08  3931  						  requeue_requests);
a521b048bc8c5d3 Stefan Haberland   2016-08-08  3932  	dasd_generic_requeue_all_requests(device);
a521b048bc8c5d3 Stefan Haberland   2016-08-08  3933  	dasd_device_remove_stop_bits(device, DASD_STOPPED_NOT_ACC);
a521b048bc8c5d3 Stefan Haberland   2016-08-08  3934  	if (device->block)
a521b048bc8c5d3 Stefan Haberland   2016-08-08  3935  		dasd_schedule_block_bh(device->block);
a521b048bc8c5d3 Stefan Haberland   2016-08-08  3936  	dasd_put_device(device);
a521b048bc8c5d3 Stefan Haberland   2016-08-08  3937  }
a521b048bc8c5d3 Stefan Haberland   2016-08-08  3938  
a521b048bc8c5d3 Stefan Haberland   2016-08-08  3939  void dasd_schedule_requeue(struct dasd_device *device)
a521b048bc8c5d3 Stefan Haberland   2016-08-08  3940  {
a521b048bc8c5d3 Stefan Haberland   2016-08-08  3941  	dasd_get_device(device);
a521b048bc8c5d3 Stefan Haberland   2016-08-08  3942  	/* queue call to dasd_reload_device to the kernel event daemon. */
a521b048bc8c5d3 Stefan Haberland   2016-08-08  3943  	if (!schedule_work(&device->requeue_requests))
a521b048bc8c5d3 Stefan Haberland   2016-08-08  3944  		dasd_put_device(device);
a521b048bc8c5d3 Stefan Haberland   2016-08-08  3945  }
a521b048bc8c5d3 Stefan Haberland   2016-08-08  3946  EXPORT_SYMBOL(dasd_schedule_requeue);
a521b048bc8c5d3 Stefan Haberland   2016-08-08  3947  
1cee2975bbabd89 Stefan Haberland   2023-04-05 @3948  static int dasd_handle_autoquiesce(struct dasd_device *device,
1cee2975bbabd89 Stefan Haberland   2023-04-05  3949  				   struct dasd_ccw_req *cqr,
1cee2975bbabd89 Stefan Haberland   2023-04-05  3950  				   unsigned int reason)
1cee2975bbabd89 Stefan Haberland   2023-04-05  3951  {
1cee2975bbabd89 Stefan Haberland   2023-04-05  3952  	/* in any case write eer message with reason */
1cee2975bbabd89 Stefan Haberland   2023-04-05  3953  	if (dasd_eer_enabled(device))
1cee2975bbabd89 Stefan Haberland   2023-04-05  3954  		dasd_eer_write(device, cqr, reason);
1cee2975bbabd89 Stefan Haberland   2023-04-05  3955  
1cee2975bbabd89 Stefan Haberland   2023-04-05  3956  	if (!test_bit(reason, &device->aq_mask))
1cee2975bbabd89 Stefan Haberland   2023-04-05  3957  		return 0;
1cee2975bbabd89 Stefan Haberland   2023-04-05  3958  
1cee2975bbabd89 Stefan Haberland   2023-04-05  3959  	/* notify eer about autoquiesce */
1cee2975bbabd89 Stefan Haberland   2023-04-05  3960  	if (dasd_eer_enabled(device))
1cee2975bbabd89 Stefan Haberland   2023-04-05  3961  		dasd_eer_write(device, NULL, DASD_EER_AUTOQUIESCE);
1cee2975bbabd89 Stefan Haberland   2023-04-05  3962  
1cee2975bbabd89 Stefan Haberland   2023-04-05  3963  	pr_info("%s: The DASD has been put in the quiesce state\n",
1cee2975bbabd89 Stefan Haberland   2023-04-05  3964  		dev_name(&device->cdev->dev));
1cee2975bbabd89 Stefan Haberland   2023-04-05  3965  	dasd_device_set_stop_bits(device, DASD_STOPPED_QUIESCE);
1cee2975bbabd89 Stefan Haberland   2023-04-05  3966  
1cee2975bbabd89 Stefan Haberland   2023-04-05  3967  	if (device->features & DASD_FEATURE_REQUEUEQUIESCE)
1cee2975bbabd89 Stefan Haberland   2023-04-05  3968  		dasd_schedule_requeue(device);
1cee2975bbabd89 Stefan Haberland   2023-04-05  3969  
1cee2975bbabd89 Stefan Haberland   2023-04-05  3970  	return 1;
1cee2975bbabd89 Stefan Haberland   2023-04-05  3971  }
1cee2975bbabd89 Stefan Haberland   2023-04-05  3972  
763968e217c6657 Heiko Carstens     2007-05-10 @3973  static struct dasd_ccw_req *dasd_generic_build_rdc(struct dasd_device *device,
763968e217c6657 Heiko Carstens     2007-05-10  3974  						   int rdc_buffer_size,
68b781fe1bed890 Stefan Haberland   2009-09-11  3975  						   int magic)
17283b56eceb6b7 Cornelia Huck      2007-05-04  3976  {
17283b56eceb6b7 Cornelia Huck      2007-05-04  3977  	struct dasd_ccw_req *cqr;
17283b56eceb6b7 Cornelia Huck      2007-05-04  3978  	struct ccw1 *ccw;
17283b56eceb6b7 Cornelia Huck      2007-05-04  3979  
c5205f2ff2bec6a Sebastian Ott      2018-06-04  3980  	cqr = dasd_smalloc_request(magic, 1 /* RDC */, rdc_buffer_size, device,
c5205f2ff2bec6a Sebastian Ott      2018-06-04  3981  				   NULL);
17283b56eceb6b7 Cornelia Huck      2007-05-04  3982  
17283b56eceb6b7 Cornelia Huck      2007-05-04  3983  	if (IS_ERR(cqr)) {
fc19f381b3828aa Stefan Haberland   2009-03-26  3984  		/* internal error 13 - Allocating the RDC request failed*/
fc19f381b3828aa Stefan Haberland   2009-03-26  3985  		dev_err(&device->cdev->dev,
fc19f381b3828aa Stefan Haberland   2009-03-26  3986  			 "An error occurred in the DASD device driver, "
fc19f381b3828aa Stefan Haberland   2009-03-26  3987  			 "reason=%s\n", "13");
17283b56eceb6b7 Cornelia Huck      2007-05-04  3988  		return cqr;
17283b56eceb6b7 Cornelia Huck      2007-05-04  3989  	}
17283b56eceb6b7 Cornelia Huck      2007-05-04  3990  
17283b56eceb6b7 Cornelia Huck      2007-05-04  3991  	ccw = cqr->cpaddr;
17283b56eceb6b7 Cornelia Huck      2007-05-04  3992  	ccw->cmd_code = CCW_CMD_RDC;
b87c52e431adfe2 Alexander Gordeev  2023-02-10  3993  	ccw->cda = (__u32)virt_to_phys(cqr->data);
d9fa9441ed6e046 Stefan Haberland   2009-10-14  3994  	ccw->flags = 0;
d9fa9441ed6e046 Stefan Haberland   2009-10-14  3995  	ccw->count = rdc_buffer_size;
8e09f21574ea302 Stefan Weinhuber   2008-01-26  3996  	cqr->startdev = device;
8e09f21574ea302 Stefan Weinhuber   2008-01-26  3997  	cqr->memdev = device;
17283b56eceb6b7 Cornelia Huck      2007-05-04  3998  	cqr->expires = 10*HZ;
eb6e199bef28861 Stefan Weinhuber   2009-12-07  3999  	cqr->retries = 256;
1aae0560d160ee6 Heiko Carstens     2013-01-30  4000  	cqr->buildclk = get_tod_clock();
17283b56eceb6b7 Cornelia Huck      2007-05-04  4001  	cqr->status = DASD_CQR_FILLED;
17283b56eceb6b7 Cornelia Huck      2007-05-04  4002  	return cqr;
17283b56eceb6b7 Cornelia Huck      2007-05-04  4003  }
17283b56eceb6b7 Cornelia Huck      2007-05-04  4004  
17283b56eceb6b7 Cornelia Huck      2007-05-04  4005  
68b781fe1bed890 Stefan Haberland   2009-09-11 @4006  int dasd_generic_read_dev_chars(struct dasd_device *device, int magic,
92636b152f3b58e Sebastian Ott      2009-06-12  4007  				void *rdc_buffer, int rdc_buffer_size)
17283b56eceb6b7 Cornelia Huck      2007-05-04  4008  {
17283b56eceb6b7 Cornelia Huck      2007-05-04  4009  	int ret;
17283b56eceb6b7 Cornelia Huck      2007-05-04  4010  	struct dasd_ccw_req *cqr;
17283b56eceb6b7 Cornelia Huck      2007-05-04  4011  
9fe567d09f0f061 Martin Schwidefsky 2019-03-01  4012  	cqr = dasd_generic_build_rdc(device, rdc_buffer_size, magic);
17283b56eceb6b7 Cornelia Huck      2007-05-04  4013  	if (IS_ERR(cqr))
17283b56eceb6b7 Cornelia Huck      2007-05-04  4014  		return PTR_ERR(cqr);
17283b56eceb6b7 Cornelia Huck      2007-05-04  4015  
17283b56eceb6b7 Cornelia Huck      2007-05-04  4016  	ret = dasd_sleep_on(cqr);
9fe567d09f0f061 Martin Schwidefsky 2019-03-01  4017  	if (ret == 0)
9fe567d09f0f061 Martin Schwidefsky 2019-03-01  4018  		memcpy(rdc_buffer, cqr->data, rdc_buffer_size);
8e09f21574ea302 Stefan Weinhuber   2008-01-26  4019  	dasd_sfree_request(cqr, cqr->memdev);
17283b56eceb6b7 Cornelia Huck      2007-05-04  4020  	return ret;
17283b56eceb6b7 Cornelia Huck      2007-05-04  4021  }
aaff0f644a18201 Cornelia Huck      2007-05-10  4022  EXPORT_SYMBOL_GPL(dasd_generic_read_dev_chars);
20c644680af1ef9 Stefan Weinhuber   2006-03-24  4023  
f3eb5384cf0325c Stefan Weinhuber   2009-03-26  4024  /*
f3eb5384cf0325c Stefan Weinhuber   2009-03-26  4025   *   In command mode and transport mode we need to look for sense
f3eb5384cf0325c Stefan Weinhuber   2009-03-26  4026   *   data in different places. The sense data itself is allways
f3eb5384cf0325c Stefan Weinhuber   2009-03-26  4027   *   an array of 32 bytes, so we can unify the sense data access
f3eb5384cf0325c Stefan Weinhuber   2009-03-26  4028   *   for both modes.
f3eb5384cf0325c Stefan Weinhuber   2009-03-26  4029   */
f3eb5384cf0325c Stefan Weinhuber   2009-03-26 @4030  char *dasd_get_sense(struct irb *irb)
f3eb5384cf0325c Stefan Weinhuber   2009-03-26  4031  {
f3eb5384cf0325c Stefan Weinhuber   2009-03-26  4032  	struct tsb *tsb = NULL;
f3eb5384cf0325c Stefan Weinhuber   2009-03-26  4033  	char *sense = NULL;
f3eb5384cf0325c Stefan Weinhuber   2009-03-26  4034  
f3eb5384cf0325c Stefan Weinhuber   2009-03-26  4035  	if (scsw_is_tm(&irb->scsw) && (irb->scsw.tm.fcxs == 0x01)) {
f3eb5384cf0325c Stefan Weinhuber   2009-03-26  4036  		if (irb->scsw.tm.tcw)
b87c52e431adfe2 Alexander Gordeev  2023-02-10  4037  			tsb = tcw_get_tsb(phys_to_virt(irb->scsw.tm.tcw));
f3eb5384cf0325c Stefan Weinhuber   2009-03-26  4038  		if (tsb && tsb->length == 64 && tsb->flags)
f3eb5384cf0325c Stefan Weinhuber   2009-03-26  4039  			switch (tsb->flags & 0x07) {
f3eb5384cf0325c Stefan Weinhuber   2009-03-26  4040  			case 1:	/* tsa_iostat */
f3eb5384cf0325c Stefan Weinhuber   2009-03-26  4041  				sense = tsb->tsa.iostat.sense;
f3eb5384cf0325c Stefan Weinhuber   2009-03-26  4042  				break;
f3eb5384cf0325c Stefan Weinhuber   2009-03-26  4043  			case 2: /* tsa_ddpc */
f3eb5384cf0325c Stefan Weinhuber   2009-03-26  4044  				sense = tsb->tsa.ddpc.sense;
f3eb5384cf0325c Stefan Weinhuber   2009-03-26  4045  				break;
f3eb5384cf0325c Stefan Weinhuber   2009-03-26  4046  			default:
f3eb5384cf0325c Stefan Weinhuber   2009-03-26  4047  				/* currently we don't use interrogate data */
f3eb5384cf0325c Stefan Weinhuber   2009-03-26  4048  				break;
f3eb5384cf0325c Stefan Weinhuber   2009-03-26  4049  			}
f3eb5384cf0325c Stefan Weinhuber   2009-03-26  4050  	} else if (irb->esw.esw0.erw.cons) {
f3eb5384cf0325c Stefan Weinhuber   2009-03-26  4051  		sense = irb->ecw;
f3eb5384cf0325c Stefan Weinhuber   2009-03-26  4052  	}
f3eb5384cf0325c Stefan Weinhuber   2009-03-26  4053  	return sense;
f3eb5384cf0325c Stefan Weinhuber   2009-03-26  4054  }
f3eb5384cf0325c Stefan Weinhuber   2009-03-26  4055  EXPORT_SYMBOL_GPL(dasd_get_sense);
f3eb5384cf0325c Stefan Weinhuber   2009-03-26  4056  
4679e8933ae6b55 Stefan Haberland   2012-06-19 @4057  void dasd_generic_shutdown(struct ccw_device *cdev)
4679e8933ae6b55 Stefan Haberland   2012-06-19  4058  {
4679e8933ae6b55 Stefan Haberland   2012-06-19  4059  	struct dasd_device *device;
4679e8933ae6b55 Stefan Haberland   2012-06-19  4060  
4679e8933ae6b55 Stefan Haberland   2012-06-19  4061  	device = dasd_device_from_cdev(cdev);
4679e8933ae6b55 Stefan Haberland   2012-06-19  4062  	if (IS_ERR(device))
4679e8933ae6b55 Stefan Haberland   2012-06-19  4063  		return;
4679e8933ae6b55 Stefan Haberland   2012-06-19  4064  
4679e8933ae6b55 Stefan Haberland   2012-06-19  4065  	if (device->block)
4679e8933ae6b55 Stefan Haberland   2012-06-19  4066  		dasd_schedule_block_bh(device->block);
4679e8933ae6b55 Stefan Haberland   2012-06-19  4067  
4679e8933ae6b55 Stefan Haberland   2012-06-19  4068  	dasd_schedule_device_bh(device);
4679e8933ae6b55 Stefan Haberland   2012-06-19  4069  
4679e8933ae6b55 Stefan Haberland   2012-06-19  4070  	wait_event(shutdown_waitq, _wait_for_empty_queues(device));
4679e8933ae6b55 Stefan Haberland   2012-06-19  4071  }
4679e8933ae6b55 Stefan Haberland   2012-06-19  4072  EXPORT_SYMBOL_GPL(dasd_generic_shutdown);
4679e8933ae6b55 Stefan Haberland   2012-06-19  4073  
8e09f21574ea302 Stefan Weinhuber   2008-01-26 @4074  static int __init dasd_init(void)
^1da177e4c3f415 Linus Torvalds     2005-04-16  4075  {
^1da177e4c3f415 Linus Torvalds     2005-04-16  4076  	int rc;
^1da177e4c3f415 Linus Torvalds     2005-04-16  4077  
^1da177e4c3f415 Linus Torvalds     2005-04-16  4078  	init_waitqueue_head(&dasd_init_waitq);
8f61701bdf536c7 Horst Hummel       2006-08-30  4079  	init_waitqueue_head(&dasd_flush_wq);
c80ee724966a8ce Stefan Haberland   2008-05-30  4080  	init_waitqueue_head(&generic_waitq);
4679e8933ae6b55 Stefan Haberland   2012-06-19  4081  	init_waitqueue_head(&shutdown_waitq);
^1da177e4c3f415 Linus Torvalds     2005-04-16  4082  
^1da177e4c3f415 Linus Torvalds     2005-04-16  4083  	/* register 'common' DASD debug area, used for all DBF_XXX calls */
361f494d4e62ee5 Peter Tiedemann    2008-01-26  4084  	dasd_debug_area = debug_register("dasd", 1, 1, 8 * sizeof(long));
^1da177e4c3f415 Linus Torvalds     2005-04-16  4085  	if (dasd_debug_area == NULL) {
^1da177e4c3f415 Linus Torvalds     2005-04-16  4086  		rc = -ENOMEM;
^1da177e4c3f415 Linus Torvalds     2005-04-16  4087  		goto failed;
^1da177e4c3f415 Linus Torvalds     2005-04-16  4088  	}
^1da177e4c3f415 Linus Torvalds     2005-04-16  4089  	debug_register_view(dasd_debug_area, &debug_sprintf_view);
b0035f127e007ea Horst Hummel       2006-09-20  4090  	debug_set_level(dasd_debug_area, DBF_WARNING);
^1da177e4c3f415 Linus Torvalds     2005-04-16  4091  
^1da177e4c3f415 Linus Torvalds     2005-04-16  4092  	DBF_EVENT(DBF_EMERG, "%s", "debug area created");
^1da177e4c3f415 Linus Torvalds     2005-04-16  4093  
^1da177e4c3f415 Linus Torvalds     2005-04-16  4094  	dasd_diag_discipline_pointer = NULL;
^1da177e4c3f415 Linus Torvalds     2005-04-16  4095  
4fa52aa7a82f922 Stefan Weinhuber   2011-07-24  4096  	dasd_statistics_createroot();
4fa52aa7a82f922 Stefan Weinhuber   2011-07-24  4097  
^1da177e4c3f415 Linus Torvalds     2005-04-16  4098  	rc = dasd_devmap_init();
^1da177e4c3f415 Linus Torvalds     2005-04-16  4099  	if (rc)
^1da177e4c3f415 Linus Torvalds     2005-04-16  4100  		goto failed;
^1da177e4c3f415 Linus Torvalds     2005-04-16  4101  	rc = dasd_gendisk_init();
^1da177e4c3f415 Linus Torvalds     2005-04-16  4102  	if (rc)
^1da177e4c3f415 Linus Torvalds     2005-04-16  4103  		goto failed;
^1da177e4c3f415 Linus Torvalds     2005-04-16  4104  	rc = dasd_parse();
^1da177e4c3f415 Linus Torvalds     2005-04-16  4105  	if (rc)
^1da177e4c3f415 Linus Torvalds     2005-04-16  4106  		goto failed;
20c644680af1ef9 Stefan Weinhuber   2006-03-24  4107  	rc = dasd_eer_init();
20c644680af1ef9 Stefan Weinhuber   2006-03-24  4108  	if (rc)
20c644680af1ef9 Stefan Weinhuber   2006-03-24  4109  		goto failed;
^1da177e4c3f415 Linus Torvalds     2005-04-16  4110  #ifdef CONFIG_PROC_FS
^1da177e4c3f415 Linus Torvalds     2005-04-16  4111  	rc = dasd_proc_init();
^1da177e4c3f415 Linus Torvalds     2005-04-16  4112  	if (rc)
^1da177e4c3f415 Linus Torvalds     2005-04-16  4113  		goto failed;
^1da177e4c3f415 Linus Torvalds     2005-04-16  4114  #endif
^1da177e4c3f415 Linus Torvalds     2005-04-16  4115  
^1da177e4c3f415 Linus Torvalds     2005-04-16  4116  	return 0;
^1da177e4c3f415 Linus Torvalds     2005-04-16  4117  failed:
fc19f381b3828aa Stefan Haberland   2009-03-26  4118  	pr_info("The DASD device driver could not be initialized\n");
^1da177e4c3f415 Linus Torvalds     2005-04-16  4119  	dasd_exit();
^1da177e4c3f415 Linus Torvalds     2005-04-16  4120  	return rc;
^1da177e4c3f415 Linus Torvalds     2005-04-16  4121  }
^1da177e4c3f415 Linus Torvalds     2005-04-16  4122  
^1da177e4c3f415 Linus Torvalds     2005-04-16 @4123  module_init(dasd_init);
^1da177e4c3f415 Linus Torvalds     2005-04-16 @4124  module_exit(dasd_exit);

:::::: The code at line 3928 was first introduced by commit
:::::: a521b048bc8c5d3c57a468c2cba70eb60e873616 s390/dasd: channel path aware error recovery

:::::: TO: Stefan Haberland <sth@linux.vnet.ibm.com>
:::::: CC: Martin Schwidefsky <schwidefsky@de.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
