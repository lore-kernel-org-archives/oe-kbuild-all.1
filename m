Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70921DA43
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Aug 2023 18:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692728945; x=1724264945;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7QAtEx3hpfUkX/Sy2OysDYqWKDCWvaVWhehqC44J3SE=;
  b=F2QOIe5qiVqdckgX0gUhx8DIwC39SrnAtP6v4n8kfM60+ifl7AidPh7Q
   v6kZ0lKQWk0ZUNWUIyD+vd/QZrAwCF8mX8swZI4eiX4Ko54sGyg2Zfvm0
   KH48VXE/zVacO9V4X6NqCBNZ6sWoa9qiXWNgTlt8fx1uTUMxcrB3UXXZ1
   A2Y5KwHsIWihtfG0uegu90vMq2FsNsBTIHVWcFJNvbRDvEdYNO98YhYsO
   YdZK1X7CxXiFPqpXQ+p4mHUJpR4qOQ40SM89LsmJMQtYUiJqZtgvcqsS7
   nKqc5B+/eYkg6/1ILC6fADoK6MNcKhE3zfWAkqQ5YzGIm8oczV9gHdf8L
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="353519358"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; 
   d="scan'208";a="353519358"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 11:29:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="713276103"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; 
   d="scan'208";a="713276103"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 22 Aug 2023 11:29:02 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYW7h-0000Qe-1K;
	Tue, 22 Aug 2023 18:29:01 +0000
Date: Wed, 23 Aug 2023 02:28:54 +0800
From: kernel test robot <lkp@intel.com>
To: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Cc: oe-kbuild-all@lists.linux.dev, Hans Verkuil <hverkuil@xs4all.nl>
Subject: [hverkuil-media-tree:tmp 5/8]
 drivers/media/platform/toshiba/visconti/viif.h:114:34: error: field 'asd'
 has incomplete type
Message-ID: <202308230252.qxSyD1BY-lkp@intel.com>
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
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230823/202308230252.qxSyD1BY-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308230252.qxSyD1BY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308230252.qxSyD1BY-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/media/platform/toshiba/visconti/viif.c:19:
>> drivers/media/platform/toshiba/visconti/viif.h:114:34: error: field 'asd' has incomplete type
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
>> drivers/media/platform/toshiba/visconti/viif.c:370:18: error: initialization of 'int (*)(struct v4l2_async_notifier *, struct v4l2_subdev *, struct v4l2_async_connection *)' from incompatible pointer type 'int (*)(struct v4l2_async_notifier *, struct v4l2_subdev *, struct v4l2_async_subdev *)' [-Werror=incompatible-pointer-types]
     370 |         .bound = visconti_viif_notify_bound,
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/toshiba/visconti/viif.c:370:18: note: (near initialization for 'viif_notify_ops.bound')
>> drivers/media/platform/toshiba/visconti/viif.c:371:19: error: initialization of 'void (*)(struct v4l2_async_notifier *, struct v4l2_subdev *, struct v4l2_async_connection *)' from incompatible pointer type 'void (*)(struct v4l2_async_notifier *, struct v4l2_subdev *, struct v4l2_async_subdev *)' [-Werror=incompatible-pointer-types]
     371 |         .unbind = visconti_viif_notify_unbind,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/toshiba/visconti/viif.c:371:19: note: (near initialization for 'viif_notify_ops.unbind')
   drivers/media/platform/toshiba/visconti/viif.c: In function 'visconti_viif_parse_dt':
>> drivers/media/platform/toshiba/visconti/viif.c:442:43: error: 'V4L2_ASYNC_MATCH_FWNODE' undeclared (first use in this function); did you mean 'V4L2_ASYNC_MATCH_TYPE_FWNODE'?
     442 |                 viif_sd->asd.match_type = V4L2_ASYNC_MATCH_FWNODE;
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~
         |                                           V4L2_ASYNC_MATCH_TYPE_FWNODE
   drivers/media/platform/toshiba/visconti/viif.c:442:43: note: each undeclared identifier is reported only once for each function it appears in
   drivers/media/platform/toshiba/visconti/viif.c: In function 'visconti_viif_probe':
>> drivers/media/platform/toshiba/visconti/viif.c:580:9: error: too few arguments to function 'v4l2_async_nf_init'
     580 |         v4l2_async_nf_init(&viif_dev->notifier);
         |         ^~~~~~~~~~~~~~~~~~
   In file included from drivers/media/platform/toshiba/visconti/viif.h:13:
   include/media/v4l2-async.h:159:6: note: declared here
     159 | void v4l2_async_nf_init(struct v4l2_async_notifier *notifier,
         |      ^~~~~~~~~~~~~~~~~~
>> drivers/media/platform/toshiba/visconti/viif.c:582:17: error: implicit declaration of function '__v4l2_async_nf_add_subdev'; did you mean '__v4l2_async_nf_add_fwnode'? [-Werror=implicit-function-declaration]
     582 |                 __v4l2_async_nf_add_subdev(&viif_dev->notifier, viif_dev->asds[i]);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 __v4l2_async_nf_add_fwnode
>> drivers/media/platform/toshiba/visconti/viif.c:584:38: error: passing argument 1 of 'v4l2_async_nf_register' from incompatible pointer type [-Werror=incompatible-pointer-types]
     584 |         ret = v4l2_async_nf_register(&viif_dev->v4l2_dev, &viif_dev->notifier);
         |                                      ^~~~~~~~~~~~~~~~~~~
         |                                      |
         |                                      struct v4l2_device *
   include/media/v4l2-async.h:281:56: note: expected 'struct v4l2_async_notifier *' but argument is of type 'struct v4l2_device *'
     281 | int v4l2_async_nf_register(struct v4l2_async_notifier *notifier);
         |                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~
>> drivers/media/platform/toshiba/visconti/viif.c:584:15: error: too many arguments to function 'v4l2_async_nf_register'
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
   drivers/media/platform/toshiba/visconti/viif.c:635:12: warning: 'visconti_viif_runtime_resume' defined but not used [-Wunused-function]
     635 | static int visconti_viif_runtime_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/toshiba/visconti/viif.c:623:12: warning: 'visconti_viif_runtime_suspend' defined but not used [-Wunused-function]
     623 | static int visconti_viif_runtime_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from drivers/media/platform/toshiba/visconti/viif_capture.c:13:
>> drivers/media/platform/toshiba/visconti/viif.h:114:34: error: field 'asd' has incomplete type
     114 |         struct v4l2_async_subdev asd;
         |                                  ^~~


vim +/asd +114 drivers/media/platform/toshiba/visconti/viif.h

   105	
   106	/**
   107	 * struct viif_subdev - information of attached subdevice (image sensor)
   108	 * @v4l2_sd: v4l2 subdev for the sensor
   109	 * @asd: async subdev for the sensor
   110	 * @num_lane: num of CSI2 DPHY lanes, specified in Device Tree
   111	 */
   112	struct viif_subdev {
   113		struct v4l2_subdev *v4l2_sd;
 > 114		struct v4l2_async_subdev asd;
   115		unsigned int num_lane;
   116	};
   117	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
