Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55D6EA8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Aug 2023 08:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692691592; x=1724227592;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fwT4Wle2X52dgMcK4H9rLcR5C3n1OAluwVkvxTVKP2g=;
  b=GYhRnTUGuryOKhzzu5dOzI50LwelbqZLThiXzvQa7ayk2P3CR1DH2tBR
   oIYOOmWU89ScuJDz8ljiVPiDs4wgvyJrV6acVrjQWg0PlB+2QX4DSoGAJ
   NCpNdNYwCs+pcAOmC3qYou61iUrG8jMMWA/sKO2jQ0KU44hiH19Cqy+PN
   FZ68LcUpKKlFsjb+7axFaUhDqORj8Gsgm0+Y8eDeTVYZEmECmUFFKh+HY
   /eh5fy0cJc2WtibaFxgHh+mkgtegBb+5su5VUnzoDTvY/WXcqkzIdGzIH
   04Un+aOMKggF+hqSYtpJGi07Cckzd7c5g8BKrk+ryVQJyk0pP0ySImt5m
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="460181098"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; 
   d="scan'208";a="460181098"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 01:06:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="859811200"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; 
   d="scan'208";a="859811200"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 22 Aug 2023 01:06:30 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYMOw-0001Xg-2q;
	Tue, 22 Aug 2023 08:06:14 +0000
Date: Tue, 22 Aug 2023 16:05:58 +0800
From: kernel test robot <lkp@intel.com>
To: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Cc: oe-kbuild-all@lists.linux.dev, Hans Verkuil <hverkuil@xs4all.nl>
Subject: [hverkuil-media-tree:tmp 5/8]
 drivers/media/platform/toshiba/visconti/viif.c:635:12: warning:
 'visconti_viif_runtime_resume' defined but not used
Message-ID: <202308221554.FNPTezIb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/hverkuil/media_tree.git tmp
head:   84034d0d4a778f945c32751a1dba96e26db9dd0f
commit: 675839cab16284198a04f2b0619387ac607f08a4 [5/8] media: platform: visconti: Add Toshiba Visconti Video Input Interface driver
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230822/202308221554.FNPTezIb-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308221554.FNPTezIb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308221554.FNPTezIb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/media/platform/toshiba/visconti/viif.c:19:
   drivers/media/platform/toshiba/visconti/viif.h:114:34: error: field 'asd' has incomplete type
     114 |         struct v4l2_async_subdev asd;
         |                                  ^~~
   In file included from include/linux/bitfield.h:10,
                    from drivers/media/platform/toshiba/visconti/viif.c:8:
   drivers/media/platform/toshiba/visconti/viif.c: In function 'to_viif_subdev':
   include/linux/compiler_types.h:338:27: error: expression in static assertion is not an integer
     338 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   drivers/media/platform/toshiba/visconti/viif.c:172:16: note: in expansion of macro 'container_of'
     172 |         return container_of(asd, struct viif_subdev, asd);
         |                ^~~~~~~~~~~~
   drivers/media/platform/toshiba/visconti/viif.c: At top level:
   drivers/media/platform/toshiba/visconti/viif.c:370:18: error: initialization of 'int (*)(struct v4l2_async_notifier *, struct v4l2_subdev *, struct v4l2_async_connection *)' from incompatible pointer type 'int (*)(struct v4l2_async_notifier *, struct v4l2_subdev *, struct v4l2_async_subdev *)' [-Werror=incompatible-pointer-types]
     370 |         .bound = visconti_viif_notify_bound,
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/toshiba/visconti/viif.c:370:18: note: (near initialization for 'viif_notify_ops.bound')
   drivers/media/platform/toshiba/visconti/viif.c:371:19: error: initialization of 'void (*)(struct v4l2_async_notifier *, struct v4l2_subdev *, struct v4l2_async_connection *)' from incompatible pointer type 'void (*)(struct v4l2_async_notifier *, struct v4l2_subdev *, struct v4l2_async_subdev *)' [-Werror=incompatible-pointer-types]
     371 |         .unbind = visconti_viif_notify_unbind,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/toshiba/visconti/viif.c:371:19: note: (near initialization for 'viif_notify_ops.unbind')
   drivers/media/platform/toshiba/visconti/viif.c: In function 'visconti_viif_parse_dt':
   drivers/media/platform/toshiba/visconti/viif.c:442:43: error: 'V4L2_ASYNC_MATCH_FWNODE' undeclared (first use in this function); did you mean 'V4L2_ASYNC_MATCH_TYPE_FWNODE'?
     442 |                 viif_sd->asd.match_type = V4L2_ASYNC_MATCH_FWNODE;
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~
         |                                           V4L2_ASYNC_MATCH_TYPE_FWNODE
   drivers/media/platform/toshiba/visconti/viif.c:442:43: note: each undeclared identifier is reported only once for each function it appears in
   drivers/media/platform/toshiba/visconti/viif.c: In function 'visconti_viif_probe':
   drivers/media/platform/toshiba/visconti/viif.c:580:9: error: too few arguments to function 'v4l2_async_nf_init'
     580 |         v4l2_async_nf_init(&viif_dev->notifier);
         |         ^~~~~~~~~~~~~~~~~~
   In file included from drivers/media/platform/toshiba/visconti/viif.h:13:
   include/media/v4l2-async.h:159:6: note: declared here
     159 | void v4l2_async_nf_init(struct v4l2_async_notifier *notifier,
         |      ^~~~~~~~~~~~~~~~~~
   drivers/media/platform/toshiba/visconti/viif.c:582:17: error: implicit declaration of function '__v4l2_async_nf_add_subdev'; did you mean '__v4l2_async_nf_add_fwnode'? [-Werror=implicit-function-declaration]
     582 |                 __v4l2_async_nf_add_subdev(&viif_dev->notifier, viif_dev->asds[i]);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 __v4l2_async_nf_add_fwnode
   drivers/media/platform/toshiba/visconti/viif.c:584:38: error: passing argument 1 of 'v4l2_async_nf_register' from incompatible pointer type [-Werror=incompatible-pointer-types]
     584 |         ret = v4l2_async_nf_register(&viif_dev->v4l2_dev, &viif_dev->notifier);
         |                                      ^~~~~~~~~~~~~~~~~~~
         |                                      |
         |                                      struct v4l2_device *
   include/media/v4l2-async.h:281:56: note: expected 'struct v4l2_async_notifier *' but argument is of type 'struct v4l2_device *'
     281 | int v4l2_async_nf_register(struct v4l2_async_notifier *notifier);
         |                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~
   drivers/media/platform/toshiba/visconti/viif.c:584:15: error: too many arguments to function 'v4l2_async_nf_register'
     584 |         ret = v4l2_async_nf_register(&viif_dev->v4l2_dev, &viif_dev->notifier);
         |               ^~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-async.h:281:5: note: declared here
     281 | int v4l2_async_nf_register(struct v4l2_async_notifier *notifier);
         |     ^~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/toshiba/visconti/viif.c: In function 'to_viif_subdev':
   drivers/media/platform/toshiba/visconti/viif.c:173:1: error: control reaches end of non-void function [-Werror=return-type]
     173 | }
         | ^
   drivers/media/platform/toshiba/visconti/viif.c: At top level:
>> drivers/media/platform/toshiba/visconti/viif.c:635:12: warning: 'visconti_viif_runtime_resume' defined but not used [-Wunused-function]
     635 | static int visconti_viif_runtime_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/toshiba/visconti/viif.c:623:12: warning: 'visconti_viif_runtime_suspend' defined but not used [-Wunused-function]
     623 | static int visconti_viif_runtime_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/visconti_viif_runtime_resume +635 drivers/media/platform/toshiba/visconti/viif.c

   622	
 > 623	static int visconti_viif_runtime_suspend(struct device *dev)
   624	{
   625		/* This callback is kicked when the last device-file is closed */
   626		struct viif_device *viif_dev = dev_get_drvdata(dev);
   627	
   628		mutex_lock(&viif_dev->pow_lock);
   629		visconti_viif_hw_off(viif_dev);
   630		mutex_unlock(&viif_dev->pow_lock);
   631	
   632		return 0;
   633	}
   634	
 > 635	static int visconti_viif_runtime_resume(struct device *dev)
   636	{
   637		/* This callback is kicked when the first device-file is opened */
   638		struct viif_device *viif_dev = dev_get_drvdata(dev);
   639	
   640		viif_dev->rawpack_mode = (u32)VIIF_RAWPACK_DISABLE;
   641	
   642		mutex_lock(&viif_dev->pow_lock);
   643	
   644		/* Initialize HWD driver */
   645		visconti_viif_hw_on(viif_dev);
   646	
   647		/* VSYNC mask setting of MAIN unit */
   648		viif_main_vsync_set_irq_mask(viif_dev, MASK_INT_M_SYNC_MASK_SET);
   649	
   650		/* STATUS error mask setting of MAIN unit */
   651		viif_main_status_err_set_irq_mask(viif_dev, MASK_INT_M_DELAY_INT_ERROR);
   652	
   653		/* VSYNC mask settings of SUB unit */
   654		viif_sub_vsync_set_irq_mask(viif_dev, MASK_INT_S_SYNC_MASK_SET);
   655	
   656		/* STATUS error mask setting(unmask) of SUB unit */
   657		viif_sub_status_err_set_irq_mask(viif_dev,
   658						 MASK_INT_S_RESERVED_SET | MASK_INT_S_DELAY_INT_ERROR);
   659	
   660		mutex_unlock(&viif_dev->pow_lock);
   661	
   662		return 0;
   663	}
   664	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
