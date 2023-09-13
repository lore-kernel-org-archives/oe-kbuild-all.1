Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B641DA49
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Sep 2023 09:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694597049; x=1726133049;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5d3wU/VPV+JvQAF+BcinZ0+T/5nOyDoguu3t5ebj9Mo=;
  b=h8TWiOhZ7H0G48Tmli2P9BQuAGj8ZliN287FT2DSp2iIzR5tvdJYPL5Z
   W9YK/Kn1z2vnh0Kp+ZbjuK14G9t9HMtNicATBif1B7d5ApPbhpjXQaR9R
   hJ6a9HOvgqDOS8LY/zEj51vMXF7noasPlizZK6U65gA2kFKfbaDBgS2ua
   w61jb7/uzDL4xwVW9vvuWUrs+vrc8Mji62RgHLvsYGF/JTsbNgk1eGKxO
   fpglA55mJQZ66SfIAk4fefR8akfQsSMouI+knsbhwT9WOm94e5oTOYYH+
   +8eYrC60RJjacEzpZ6CgaWvhaEEaoCuFnTtsOMFjiudxxbf4kxNZQDiqj
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="445047845"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; 
   d="scan'208";a="445047845"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 02:24:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="693788949"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; 
   d="scan'208";a="693788949"
Received: from lkp-server02.sh.intel.com (HELO cf13c67269a2) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 13 Sep 2023 02:24:06 -0700
Received: from kbuild by cf13c67269a2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgM6O-0000KX-2N;
	Wed, 13 Sep 2023 09:24:04 +0000
Date: Wed, 13 Sep 2023 17:23:36 +0800
From: kernel test robot <lkp@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v1 1/2] PM: Introduce export macros for _SIMPLE_ variants
 of _PM_OPS()
Message-ID: <202309131731.unx0PbdR-lkp@intel.com>
References: <20230913074032.27927-2-raag.jadav@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230913074032.27927-2-raag.jadav@intel.com>

Hi Raag,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.6-rc1 next-20230913]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Raag-Jadav/PM-Introduce-export-macros-for-_SIMPLE_-variants-of-_PM_OPS/20230913-154244
base:   linus/master
patch link:    https://lore.kernel.org/r/20230913074032.27927-2-raag.jadav%40intel.com
patch subject: [RFC v1 1/2] PM: Introduce export macros for _SIMPLE_ variants of _PM_OPS()
config: openrisc-randconfig-r006-20230913 (https://download.01.org/0day-ci/archive/20230913/202309131731.unx0PbdR-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230913/202309131731.unx0PbdR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309131731.unx0PbdR-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:25,
                    from include/linux/acpi.h:14,
                    from drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:59:
   include/linux/pm.h:430:9: warning: data definition has no type or storage class
     430 |         EXPORT_NS_SIMPLE_PM_OPS(name, ns) = { \
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:2858:1: note: in expansion of macro 'EXPORT_NS_SIMPLE_DEV_PM_OPS'
    2858 | EXPORT_NS_SIMPLE_DEV_PM_OPS(st_lsm6dsx_pm_ops, st_lsm6dsx_suspend,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pm.h:430:9: error: type defaults to 'int' in declaration of 'EXPORT_NS_SIMPLE_PM_OPS' [-Werror=implicit-int]
     430 |         EXPORT_NS_SIMPLE_PM_OPS(name, ns) = { \
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:2858:1: note: in expansion of macro 'EXPORT_NS_SIMPLE_DEV_PM_OPS'
    2858 | EXPORT_NS_SIMPLE_DEV_PM_OPS(st_lsm6dsx_pm_ops, st_lsm6dsx_suspend,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:2858:1: warning: parameter names (without types) in function declaration
>> drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:2858:1: error: function 'EXPORT_NS_SIMPLE_PM_OPS' is initialized like a variable
   include/linux/pm.h:313:9: error: field name not in record or union initializer
     313 |         .suspend = pm_sleep_ptr(suspend_fn), \
         |         ^
   include/linux/pm.h:431:17: note: in expansion of macro 'SYSTEM_SLEEP_PM_OPS'
     431 |                 SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn) \
         |                 ^~~~~~~~~~~~~~~~~~~
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:2858:1: note: in expansion of macro 'EXPORT_NS_SIMPLE_DEV_PM_OPS'
    2858 | EXPORT_NS_SIMPLE_DEV_PM_OPS(st_lsm6dsx_pm_ops, st_lsm6dsx_suspend,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pm.h:313:9: note: (near initialization for 'EXPORT_NS_SIMPLE_PM_OPS')
     313 |         .suspend = pm_sleep_ptr(suspend_fn), \
         |         ^
   include/linux/pm.h:431:17: note: in expansion of macro 'SYSTEM_SLEEP_PM_OPS'
     431 |                 SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn) \
         |                 ^~~~~~~~~~~~~~~~~~~
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:2858:1: note: in expansion of macro 'EXPORT_NS_SIMPLE_DEV_PM_OPS'
    2858 | EXPORT_NS_SIMPLE_DEV_PM_OPS(st_lsm6dsx_pm_ops, st_lsm6dsx_suspend,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:57:
   include/linux/kernel.h:59:33: error: invalid initializer
      59 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                 ^
   include/linux/pm.h:476:28: note: in expansion of macro 'PTR_IF'
     476 | #define pm_sleep_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM_SLEEP), (_ptr))
         |                            ^~~~~~
   include/linux/pm.h:313:20: note: in expansion of macro 'pm_sleep_ptr'
     313 |         .suspend = pm_sleep_ptr(suspend_fn), \
         |                    ^~~~~~~~~~~~
   include/linux/pm.h:431:17: note: in expansion of macro 'SYSTEM_SLEEP_PM_OPS'
     431 |                 SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn) \
         |                 ^~~~~~~~~~~~~~~~~~~
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:2858:1: note: in expansion of macro 'EXPORT_NS_SIMPLE_DEV_PM_OPS'
    2858 | EXPORT_NS_SIMPLE_DEV_PM_OPS(st_lsm6dsx_pm_ops, st_lsm6dsx_suspend,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:59:33: note: (near initialization for 'EXPORT_NS_SIMPLE_PM_OPS')
      59 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                 ^
   include/linux/pm.h:476:28: note: in expansion of macro 'PTR_IF'
     476 | #define pm_sleep_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM_SLEEP), (_ptr))
         |                            ^~~~~~
   include/linux/pm.h:313:20: note: in expansion of macro 'pm_sleep_ptr'
     313 |         .suspend = pm_sleep_ptr(suspend_fn), \
         |                    ^~~~~~~~~~~~
   include/linux/pm.h:431:17: note: in expansion of macro 'SYSTEM_SLEEP_PM_OPS'
     431 |                 SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn) \
         |                 ^~~~~~~~~~~~~~~~~~~
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:2858:1: note: in expansion of macro 'EXPORT_NS_SIMPLE_DEV_PM_OPS'
    2858 | EXPORT_NS_SIMPLE_DEV_PM_OPS(st_lsm6dsx_pm_ops, st_lsm6dsx_suspend,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pm.h:314:9: error: field name not in record or union initializer
     314 |         .resume = pm_sleep_ptr(resume_fn), \
         |         ^
   include/linux/pm.h:431:17: note: in expansion of macro 'SYSTEM_SLEEP_PM_OPS'
     431 |                 SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn) \
         |                 ^~~~~~~~~~~~~~~~~~~
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:2858:1: note: in expansion of macro 'EXPORT_NS_SIMPLE_DEV_PM_OPS'
    2858 | EXPORT_NS_SIMPLE_DEV_PM_OPS(st_lsm6dsx_pm_ops, st_lsm6dsx_suspend,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pm.h:314:9: note: (near initialization for 'EXPORT_NS_SIMPLE_PM_OPS')
     314 |         .resume = pm_sleep_ptr(resume_fn), \
         |         ^
   include/linux/pm.h:431:17: note: in expansion of macro 'SYSTEM_SLEEP_PM_OPS'
     431 |                 SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn) \
         |                 ^~~~~~~~~~~~~~~~~~~
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:2858:1: note: in expansion of macro 'EXPORT_NS_SIMPLE_DEV_PM_OPS'
    2858 | EXPORT_NS_SIMPLE_DEV_PM_OPS(st_lsm6dsx_pm_ops, st_lsm6dsx_suspend,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:59:33: warning: excess elements in scalar initializer
      59 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                 ^
   include/linux/pm.h:476:28: note: in expansion of macro 'PTR_IF'
     476 | #define pm_sleep_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM_SLEEP), (_ptr))
         |                            ^~~~~~
   include/linux/pm.h:314:19: note: in expansion of macro 'pm_sleep_ptr'
     314 |         .resume = pm_sleep_ptr(resume_fn), \
         |                   ^~~~~~~~~~~~
   include/linux/pm.h:431:17: note: in expansion of macro 'SYSTEM_SLEEP_PM_OPS'
     431 |                 SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn) \
         |                 ^~~~~~~~~~~~~~~~~~~
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:2858:1: note: in expansion of macro 'EXPORT_NS_SIMPLE_DEV_PM_OPS'
    2858 | EXPORT_NS_SIMPLE_DEV_PM_OPS(st_lsm6dsx_pm_ops, st_lsm6dsx_suspend,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:59:33: note: (near initialization for 'EXPORT_NS_SIMPLE_PM_OPS')
      59 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                 ^
   include/linux/pm.h:476:28: note: in expansion of macro 'PTR_IF'
     476 | #define pm_sleep_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM_SLEEP), (_ptr))
         |                            ^~~~~~
   include/linux/pm.h:314:19: note: in expansion of macro 'pm_sleep_ptr'
     314 |         .resume = pm_sleep_ptr(resume_fn), \
         |                   ^~~~~~~~~~~~
   include/linux/pm.h:431:17: note: in expansion of macro 'SYSTEM_SLEEP_PM_OPS'
     431 |                 SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn) \
         |                 ^~~~~~~~~~~~~~~~~~~
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:2858:1: note: in expansion of macro 'EXPORT_NS_SIMPLE_DEV_PM_OPS'
    2858 | EXPORT_NS_SIMPLE_DEV_PM_OPS(st_lsm6dsx_pm_ops, st_lsm6dsx_suspend,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pm.h:315:9: error: field name not in record or union initializer
     315 |         .freeze = pm_sleep_ptr(suspend_fn), \
         |         ^


vim +/EXPORT_NS_SIMPLE_PM_OPS +2858 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c

d3f770582aeb11 Lorenzo Bianconi 2017-04-27  2857  
2b059449b5a3d2 Jonathan Cameron 2022-06-04 @2858  EXPORT_NS_SIMPLE_DEV_PM_OPS(st_lsm6dsx_pm_ops, st_lsm6dsx_suspend,
2b059449b5a3d2 Jonathan Cameron 2022-06-04  2859  			    st_lsm6dsx_resume, IIO_LSM6DSX);
d3f770582aeb11 Lorenzo Bianconi 2017-04-27  2860  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
