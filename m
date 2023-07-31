Received: from mgamail.intel.com (unknown [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE67A629
	for <oe-kbuild-all@lists.linux.dev>; Mon, 31 Jul 2023 02:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690769982; x=1722305982;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gWjNSYPsvxtveHG2f6HrYkEJtRYlRmwXuEgv6hJjIuk=;
  b=PbjUmo+UcH4FGPJWsXPy6vkiYrohUE5NnB4IlpDFkwo/soS0rKE31ARG
   sBlywcVf2SdH9Ye5zABq6quKrAv1X/jFPR9RUCxjebc69f5MY0249E76B
   S3DYQqu3tqQioDkQCgeTNIL+n7AeiZLWA2Pk8KDWydsVB4sbnd+ih0WjI
   fzg3AWHXy2ybtqRm58bc+9rcdjY7S6WLCg+rjjVm92HTkY56/5H+w2VGo
   MfCvxFT9+NYASSmKJZ0l9wngvgCYZLUIvuWf91l9mn9IWVdpC5w3RCbtT
   dpIAKgNqydq9h91U6hdYMrQ8cKVrhZMAry1CMrLF3fuvm9UzzpINnB7Ib
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="358937323"
X-IronPort-AV: E=Sophos;i="6.01,243,1684825200"; 
   d="scan'208";a="358937323"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2023 19:19:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="757772208"
X-IronPort-AV: E=Sophos;i="6.01,243,1684825200"; 
   d="scan'208";a="757772208"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 30 Jul 2023 19:19:39 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQIVI-0004sp-3C;
	Mon, 31 Jul 2023 02:19:27 +0000
Date: Mon, 31 Jul 2023 10:18:25 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Cercueil <paul@crapouillou.net>
Cc: oe-kbuild-all@lists.linux.dev, Andi Shyti <andi.shyti@kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [andi-shyti:i2c/andi-for-next 23/27]
 drivers/i2c/busses/i2c-virtio.c:270:10: error: 'struct virtio_driver' has no
 member named 'freeze'
Message-ID: <202307311024.v8oxwdyi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/andi-for-next
head:   1851a80ee87d2decf774ee5785c8dd25e30bd118
commit: 73d546c76235b5329c0b6d370c836777443fd208 [23/27] i2c: virtio: Remove #ifdef guards for PM related functions
config: microblaze-randconfig-r025-20230731 (https://download.01.org/0day-ci/archive/20230731/202307311024.v8oxwdyi-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230731/202307311024.v8oxwdyi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307311024.v8oxwdyi-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-virtio.c:270:10: error: 'struct virtio_driver' has no member named 'freeze'
     270 |         .freeze                 = pm_sleep_ptr(virtio_i2c_freeze),
         |          ^~~~~~
   In file included from include/linux/cpumask.h:10,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from include/linux/resource_ext.h:11,
                    from include/linux/acpi.h:13,
                    from drivers/i2c/busses/i2c-virtio.c:11:
>> include/linux/kernel.h:58:33: error: initialization of 'const struct virtio_device_id *' from incompatible pointer type 'int (*)(struct virtio_device *)' [-Werror=incompatible-pointer-types]
      58 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                 ^
   include/linux/pm.h:452:28: note: in expansion of macro 'PTR_IF'
     452 | #define pm_sleep_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM_SLEEP), (_ptr))
         |                            ^~~~~~
   drivers/i2c/busses/i2c-virtio.c:270:35: note: in expansion of macro 'pm_sleep_ptr'
     270 |         .freeze                 = pm_sleep_ptr(virtio_i2c_freeze),
         |                                   ^~~~~~~~~~~~
   include/linux/kernel.h:58:33: note: (near initialization for 'virtio_i2c_driver.id_table')
      58 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                 ^
   include/linux/pm.h:452:28: note: in expansion of macro 'PTR_IF'
     452 | #define pm_sleep_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM_SLEEP), (_ptr))
         |                            ^~~~~~
   drivers/i2c/busses/i2c-virtio.c:270:35: note: in expansion of macro 'pm_sleep_ptr'
     270 |         .freeze                 = pm_sleep_ptr(virtio_i2c_freeze),
         |                                   ^~~~~~~~~~~~
   include/linux/kernel.h:58:33: warning: initialized field overwritten [-Woverride-init]
      58 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                 ^
   include/linux/pm.h:452:28: note: in expansion of macro 'PTR_IF'
     452 | #define pm_sleep_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM_SLEEP), (_ptr))
         |                            ^~~~~~
   drivers/i2c/busses/i2c-virtio.c:270:35: note: in expansion of macro 'pm_sleep_ptr'
     270 |         .freeze                 = pm_sleep_ptr(virtio_i2c_freeze),
         |                                   ^~~~~~~~~~~~
   include/linux/kernel.h:58:33: note: (near initialization for 'virtio_i2c_driver.id_table')
      58 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                 ^
   include/linux/pm.h:452:28: note: in expansion of macro 'PTR_IF'
     452 | #define pm_sleep_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM_SLEEP), (_ptr))
         |                            ^~~~~~
   drivers/i2c/busses/i2c-virtio.c:270:35: note: in expansion of macro 'pm_sleep_ptr'
     270 |         .freeze                 = pm_sleep_ptr(virtio_i2c_freeze),
         |                                   ^~~~~~~~~~~~
>> drivers/i2c/busses/i2c-virtio.c:271:10: error: 'struct virtio_driver' has no member named 'restore'
     271 |         .restore                = pm_sleep_ptr(virtio_i2c_restore),
         |          ^~~~~~~
>> include/linux/kernel.h:58:33: error: initialization of 'const unsigned int *' from incompatible pointer type 'int (*)(struct virtio_device *)' [-Werror=incompatible-pointer-types]
      58 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                 ^
   include/linux/pm.h:452:28: note: in expansion of macro 'PTR_IF'
     452 | #define pm_sleep_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM_SLEEP), (_ptr))
         |                            ^~~~~~
   drivers/i2c/busses/i2c-virtio.c:271:35: note: in expansion of macro 'pm_sleep_ptr'
     271 |         .restore                = pm_sleep_ptr(virtio_i2c_restore),
         |                                   ^~~~~~~~~~~~
   include/linux/kernel.h:58:33: note: (near initialization for 'virtio_i2c_driver.feature_table')
      58 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                 ^
   include/linux/pm.h:452:28: note: in expansion of macro 'PTR_IF'
     452 | #define pm_sleep_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM_SLEEP), (_ptr))
         |                            ^~~~~~
   drivers/i2c/busses/i2c-virtio.c:271:35: note: in expansion of macro 'pm_sleep_ptr'
     271 |         .restore                = pm_sleep_ptr(virtio_i2c_restore),
         |                                   ^~~~~~~~~~~~
   include/linux/kernel.h:58:33: warning: initialized field overwritten [-Woverride-init]
      58 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                 ^
   include/linux/pm.h:452:28: note: in expansion of macro 'PTR_IF'
     452 | #define pm_sleep_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM_SLEEP), (_ptr))
         |                            ^~~~~~
   drivers/i2c/busses/i2c-virtio.c:271:35: note: in expansion of macro 'pm_sleep_ptr'
     271 |         .restore                = pm_sleep_ptr(virtio_i2c_restore),
         |                                   ^~~~~~~~~~~~
   include/linux/kernel.h:58:33: note: (near initialization for 'virtio_i2c_driver.feature_table')
      58 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                 ^
   include/linux/pm.h:452:28: note: in expansion of macro 'PTR_IF'
     452 | #define pm_sleep_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM_SLEEP), (_ptr))
         |                            ^~~~~~
   drivers/i2c/busses/i2c-virtio.c:271:35: note: in expansion of macro 'pm_sleep_ptr'
     271 |         .restore                = pm_sleep_ptr(virtio_i2c_restore),
         |                                   ^~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +270 drivers/i2c/busses/i2c-virtio.c

   260	
   261	static struct virtio_driver virtio_i2c_driver = {
   262		.feature_table		= features,
   263		.feature_table_size	= ARRAY_SIZE(features),
   264		.id_table		= id_table,
   265		.probe			= virtio_i2c_probe,
   266		.remove			= virtio_i2c_remove,
   267		.driver			= {
   268			.name	= "i2c_virtio",
   269		},
 > 270		.freeze			= pm_sleep_ptr(virtio_i2c_freeze),
 > 271		.restore		= pm_sleep_ptr(virtio_i2c_restore),
   272	};
   273	module_virtio_driver(virtio_i2c_driver);
   274	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
