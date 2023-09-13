Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFCCA10F5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Sep 2023 09:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694597774; x=1726133774;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FVOc85rFsrAB8QwZe0Sivcc2jvy4otci0/iHnaTtcBs=;
  b=TpOoiWREoeUurhb/BLxRGYAZJl70xuP9f2v+oZNSMZrtJ4BLEo0p9If6
   csKPP06vhCrV7S+T+TW2eAwQzzDtbhPWWz7DxreH1WNxWJArUClRtOP+x
   4Tr68ezKN5obMa1+TQAuyljCcVvnkd3Bs+x6TaUMTKXeyEk+nt+9e75H7
   e7TvoLEiYkSKQ97A0cvUWxx9iVuBcw9PhxdwZOC6pkXwJ/RyTCy2gIsrS
   6ql8/N4v86y7lnqKR528dChv3Uk4lWJNoCacd7m6PwUgyPR+4ivPZ2cx1
   St4q0lvmfk5Vje1azHppw6j3yT0Ee25aLwLfOpvhwYCGrrnmhzPzw8hNl
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="442642712"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; 
   d="scan'208";a="442642712"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 02:36:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="834235899"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; 
   d="scan'208";a="834235899"
Received: from lkp-server02.sh.intel.com (HELO cf13c67269a2) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 13 Sep 2023 02:36:12 -0700
Received: from kbuild by cf13c67269a2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgMI5-0000LB-0R;
	Wed, 13 Sep 2023 09:36:09 +0000
Date: Wed, 13 Sep 2023 17:35:15 +0800
From: kernel test robot <lkp@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v1 1/2] PM: Introduce export macros for _SIMPLE_ variants
 of _PM_OPS()
Message-ID: <202309131742.496HslJs-lkp@intel.com>
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
kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.6-rc1 next-20230913]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Raag-Jadav/PM-Introduce-export-macros-for-_SIMPLE_-variants-of-_PM_OPS/20230913-154244
base:   linus/master
patch link:    https://lore.kernel.org/r/20230913074032.27927-2-raag.jadav%40intel.com
patch subject: [RFC v1 1/2] PM: Introduce export macros for _SIMPLE_ variants of _PM_OPS()
config: arc-randconfig-r004-20230913 (https://download.01.org/0day-ci/archive/20230913/202309131742.496HslJs-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230913/202309131742.496HslJs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309131742.496HslJs-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:25,
                    from drivers/iio/humidity/hts221_core.c:12:
>> include/linux/pm.h:430:9: warning: data definition has no type or storage class
     430 |         EXPORT_NS_SIMPLE_PM_OPS(name, ns) = { \
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/humidity/hts221_core.c:678:1: note: in expansion of macro 'EXPORT_NS_SIMPLE_DEV_PM_OPS'
     678 | EXPORT_NS_SIMPLE_DEV_PM_OPS(hts221_pm_ops, hts221_suspend, hts221_resume,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pm.h:430:9: error: type defaults to 'int' in declaration of 'EXPORT_NS_SIMPLE_PM_OPS' [-Werror=implicit-int]
     430 |         EXPORT_NS_SIMPLE_PM_OPS(name, ns) = { \
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/humidity/hts221_core.c:678:1: note: in expansion of macro 'EXPORT_NS_SIMPLE_DEV_PM_OPS'
     678 | EXPORT_NS_SIMPLE_DEV_PM_OPS(hts221_pm_ops, hts221_suspend, hts221_resume,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/iio/humidity/hts221_core.c:678:1: warning: parameter names (without types) in function declaration
   drivers/iio/humidity/hts221_core.c:678:1: error: function 'EXPORT_NS_SIMPLE_PM_OPS' is initialized like a variable
   include/linux/pm.h:313:9: error: field name not in record or union initializer
     313 |         .suspend = pm_sleep_ptr(suspend_fn), \
         |         ^
   include/linux/pm.h:431:17: note: in expansion of macro 'SYSTEM_SLEEP_PM_OPS'
     431 |                 SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn) \
         |                 ^~~~~~~~~~~~~~~~~~~
   drivers/iio/humidity/hts221_core.c:678:1: note: in expansion of macro 'EXPORT_NS_SIMPLE_DEV_PM_OPS'
     678 | EXPORT_NS_SIMPLE_DEV_PM_OPS(hts221_pm_ops, hts221_suspend, hts221_resume,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pm.h:313:9: note: (near initialization for 'EXPORT_NS_SIMPLE_PM_OPS')
     313 |         .suspend = pm_sleep_ptr(suspend_fn), \
         |         ^
   include/linux/pm.h:431:17: note: in expansion of macro 'SYSTEM_SLEEP_PM_OPS'
     431 |                 SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn) \
         |                 ^~~~~~~~~~~~~~~~~~~
   drivers/iio/humidity/hts221_core.c:678:1: note: in expansion of macro 'EXPORT_NS_SIMPLE_DEV_PM_OPS'
     678 | EXPORT_NS_SIMPLE_DEV_PM_OPS(hts221_pm_ops, hts221_suspend, hts221_resume,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/iio/humidity/hts221_core.c:10:
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
   drivers/iio/humidity/hts221_core.c:678:1: note: in expansion of macro 'EXPORT_NS_SIMPLE_DEV_PM_OPS'
     678 | EXPORT_NS_SIMPLE_DEV_PM_OPS(hts221_pm_ops, hts221_suspend, hts221_resume,
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
   drivers/iio/humidity/hts221_core.c:678:1: note: in expansion of macro 'EXPORT_NS_SIMPLE_DEV_PM_OPS'
     678 | EXPORT_NS_SIMPLE_DEV_PM_OPS(hts221_pm_ops, hts221_suspend, hts221_resume,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pm.h:314:9: error: field name not in record or union initializer
     314 |         .resume = pm_sleep_ptr(resume_fn), \
         |         ^
   include/linux/pm.h:431:17: note: in expansion of macro 'SYSTEM_SLEEP_PM_OPS'
     431 |                 SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn) \
         |                 ^~~~~~~~~~~~~~~~~~~
   drivers/iio/humidity/hts221_core.c:678:1: note: in expansion of macro 'EXPORT_NS_SIMPLE_DEV_PM_OPS'
     678 | EXPORT_NS_SIMPLE_DEV_PM_OPS(hts221_pm_ops, hts221_suspend, hts221_resume,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pm.h:314:9: note: (near initialization for 'EXPORT_NS_SIMPLE_PM_OPS')
     314 |         .resume = pm_sleep_ptr(resume_fn), \
         |         ^
   include/linux/pm.h:431:17: note: in expansion of macro 'SYSTEM_SLEEP_PM_OPS'
     431 |                 SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn) \
         |                 ^~~~~~~~~~~~~~~~~~~
   drivers/iio/humidity/hts221_core.c:678:1: note: in expansion of macro 'EXPORT_NS_SIMPLE_DEV_PM_OPS'
     678 | EXPORT_NS_SIMPLE_DEV_PM_OPS(hts221_pm_ops, hts221_suspend, hts221_resume,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/kernel.h:59:33: warning: excess elements in scalar initializer
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
   drivers/iio/humidity/hts221_core.c:678:1: note: in expansion of macro 'EXPORT_NS_SIMPLE_DEV_PM_OPS'
     678 | EXPORT_NS_SIMPLE_DEV_PM_OPS(hts221_pm_ops, hts221_suspend, hts221_resume,
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
   drivers/iio/humidity/hts221_core.c:678:1: note: in expansion of macro 'EXPORT_NS_SIMPLE_DEV_PM_OPS'
     678 | EXPORT_NS_SIMPLE_DEV_PM_OPS(hts221_pm_ops, hts221_suspend, hts221_resume,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pm.h:315:9: error: field name not in record or union initializer
     315 |         .freeze = pm_sleep_ptr(suspend_fn), \
         |         ^
   include/linux/pm.h:431:17: note: in expansion of macro 'SYSTEM_SLEEP_PM_OPS'
     431 |                 SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn) \
         |                 ^~~~~~~~~~~~~~~~~~~
   drivers/iio/humidity/hts221_core.c:678:1: note: in expansion of macro 'EXPORT_NS_SIMPLE_DEV_PM_OPS'
     678 | EXPORT_NS_SIMPLE_DEV_PM_OPS(hts221_pm_ops, hts221_suspend, hts221_resume,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pm.h:315:9: note: (near initialization for 'EXPORT_NS_SIMPLE_PM_OPS')
     315 |         .freeze = pm_sleep_ptr(suspend_fn), \
         |         ^
   include/linux/pm.h:431:17: note: in expansion of macro 'SYSTEM_SLEEP_PM_OPS'
     431 |                 SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn) \
         |                 ^~~~~~~~~~~~~~~~~~~
   drivers/iio/humidity/hts221_core.c:678:1: note: in expansion of macro 'EXPORT_NS_SIMPLE_DEV_PM_OPS'
     678 | EXPORT_NS_SIMPLE_DEV_PM_OPS(hts221_pm_ops, hts221_suspend, hts221_resume,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/kernel.h:59:33: warning: excess elements in scalar initializer
      59 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                 ^
   include/linux/pm.h:476:28: note: in expansion of macro 'PTR_IF'
     476 | #define pm_sleep_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM_SLEEP), (_ptr))
         |                            ^~~~~~
   include/linux/pm.h:315:19: note: in expansion of macro 'pm_sleep_ptr'
     315 |         .freeze = pm_sleep_ptr(suspend_fn), \
         |                   ^~~~~~~~~~~~
   include/linux/pm.h:431:17: note: in expansion of macro 'SYSTEM_SLEEP_PM_OPS'
     431 |                 SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn) \
         |                 ^~~~~~~~~~~~~~~~~~~
   drivers/iio/humidity/hts221_core.c:678:1: note: in expansion of macro 'EXPORT_NS_SIMPLE_DEV_PM_OPS'
     678 | EXPORT_NS_SIMPLE_DEV_PM_OPS(hts221_pm_ops, hts221_suspend, hts221_resume,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:59:33: note: (near initialization for 'EXPORT_NS_SIMPLE_PM_OPS')
      59 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                 ^
   include/linux/pm.h:476:28: note: in expansion of macro 'PTR_IF'
     476 | #define pm_sleep_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM_SLEEP), (_ptr))
         |                            ^~~~~~
   include/linux/pm.h:315:19: note: in expansion of macro 'pm_sleep_ptr'
     315 |         .freeze = pm_sleep_ptr(suspend_fn), \
         |                   ^~~~~~~~~~~~
   include/linux/pm.h:431:17: note: in expansion of macro 'SYSTEM_SLEEP_PM_OPS'
     431 |                 SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn) \
         |                 ^~~~~~~~~~~~~~~~~~~
   drivers/iio/humidity/hts221_core.c:678:1: note: in expansion of macro 'EXPORT_NS_SIMPLE_DEV_PM_OPS'
     678 | EXPORT_NS_SIMPLE_DEV_PM_OPS(hts221_pm_ops, hts221_suspend, hts221_resume,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pm.h:316:9: error: field name not in record or union initializer
     316 |         .thaw = pm_sleep_ptr(resume_fn), \
         |         ^
   include/linux/pm.h:431:17: note: in expansion of macro 'SYSTEM_SLEEP_PM_OPS'
     431 |                 SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn) \
         |                 ^~~~~~~~~~~~~~~~~~~
   drivers/iio/humidity/hts221_core.c:678:1: note: in expansion of macro 'EXPORT_NS_SIMPLE_DEV_PM_OPS'
     678 | EXPORT_NS_SIMPLE_DEV_PM_OPS(hts221_pm_ops, hts221_suspend, hts221_resume,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pm.h:316:9: note: (near initialization for 'EXPORT_NS_SIMPLE_PM_OPS')
     316 |         .thaw = pm_sleep_ptr(resume_fn), \
         |         ^
   include/linux/pm.h:431:17: note: in expansion of macro 'SYSTEM_SLEEP_PM_OPS'
     431 |                 SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn) \
         |                 ^~~~~~~~~~~~~~~~~~~
   drivers/iio/humidity/hts221_core.c:678:1: note: in expansion of macro 'EXPORT_NS_SIMPLE_DEV_PM_OPS'
     678 | EXPORT_NS_SIMPLE_DEV_PM_OPS(hts221_pm_ops, hts221_suspend, hts221_resume,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/kernel.h:59:33: warning: excess elements in scalar initializer
      59 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                 ^
   include/linux/pm.h:476:28: note: in expansion of macro 'PTR_IF'
     476 | #define pm_sleep_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM_SLEEP), (_ptr))
         |                            ^~~~~~
   include/linux/pm.h:316:17: note: in expansion of macro 'pm_sleep_ptr'
     316 |         .thaw = pm_sleep_ptr(resume_fn), \
         |                 ^~~~~~~~~~~~
   include/linux/pm.h:431:17: note: in expansion of macro 'SYSTEM_SLEEP_PM_OPS'
     431 |                 SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn) \
         |                 ^~~~~~~~~~~~~~~~~~~
   drivers/iio/humidity/hts221_core.c:678:1: note: in expansion of macro 'EXPORT_NS_SIMPLE_DEV_PM_OPS'
     678 | EXPORT_NS_SIMPLE_DEV_PM_OPS(hts221_pm_ops, hts221_suspend, hts221_resume,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:59:33: note: (near initialization for 'EXPORT_NS_SIMPLE_PM_OPS')
      59 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                 ^
   include/linux/pm.h:476:28: note: in expansion of macro 'PTR_IF'
     476 | #define pm_sleep_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM_SLEEP), (_ptr))
         |                            ^~~~~~
   include/linux/pm.h:316:17: note: in expansion of macro 'pm_sleep_ptr'
     316 |         .thaw = pm_sleep_ptr(resume_fn), \
         |                 ^~~~~~~~~~~~
   include/linux/pm.h:431:17: note: in expansion of macro 'SYSTEM_SLEEP_PM_OPS'
     431 |                 SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn) \
         |                 ^~~~~~~~~~~~~~~~~~~
   drivers/iio/humidity/hts221_core.c:678:1: note: in expansion of macro 'EXPORT_NS_SIMPLE_DEV_PM_OPS'
     678 | EXPORT_NS_SIMPLE_DEV_PM_OPS(hts221_pm_ops, hts221_suspend, hts221_resume,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pm.h:317:9: error: field name not in record or union initializer
     317 |         .poweroff = pm_sleep_ptr(suspend_fn), \
         |         ^
   include/linux/pm.h:431:17: note: in expansion of macro 'SYSTEM_SLEEP_PM_OPS'
     431 |                 SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn) \
         |                 ^~~~~~~~~~~~~~~~~~~
   drivers/iio/humidity/hts221_core.c:678:1: note: in expansion of macro 'EXPORT_NS_SIMPLE_DEV_PM_OPS'
     678 | EXPORT_NS_SIMPLE_DEV_PM_OPS(hts221_pm_ops, hts221_suspend, hts221_resume,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pm.h:317:9: note: (near initialization for 'EXPORT_NS_SIMPLE_PM_OPS')
     317 |         .poweroff = pm_sleep_ptr(suspend_fn), \
         |         ^
   include/linux/pm.h:431:17: note: in expansion of macro 'SYSTEM_SLEEP_PM_OPS'
     431 |                 SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn) \
         |                 ^~~~~~~~~~~~~~~~~~~
   drivers/iio/humidity/hts221_core.c:678:1: note: in expansion of macro 'EXPORT_NS_SIMPLE_DEV_PM_OPS'
     678 | EXPORT_NS_SIMPLE_DEV_PM_OPS(hts221_pm_ops, hts221_suspend, hts221_resume,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/kernel.h:59:33: warning: excess elements in scalar initializer
      59 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                 ^
   include/linux/pm.h:476:28: note: in expansion of macro 'PTR_IF'
     476 | #define pm_sleep_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM_SLEEP), (_ptr))
         |                            ^~~~~~
   include/linux/pm.h:317:21: note: in expansion of macro 'pm_sleep_ptr'
     317 |         .poweroff = pm_sleep_ptr(suspend_fn), \
         |                     ^~~~~~~~~~~~
   include/linux/pm.h:431:17: note: in expansion of macro 'SYSTEM_SLEEP_PM_OPS'
     431 |                 SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn) \
         |                 ^~~~~~~~~~~~~~~~~~~
   drivers/iio/humidity/hts221_core.c:678:1: note: in expansion of macro 'EXPORT_NS_SIMPLE_DEV_PM_OPS'
     678 | EXPORT_NS_SIMPLE_DEV_PM_OPS(hts221_pm_ops, hts221_suspend, hts221_resume,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:59:33: note: (near initialization for 'EXPORT_NS_SIMPLE_PM_OPS')
      59 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                 ^
   include/linux/pm.h:476:28: note: in expansion of macro 'PTR_IF'
     476 | #define pm_sleep_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM_SLEEP), (_ptr))
         |                            ^~~~~~
   include/linux/pm.h:317:21: note: in expansion of macro 'pm_sleep_ptr'
     317 |         .poweroff = pm_sleep_ptr(suspend_fn), \
         |                     ^~~~~~~~~~~~
   include/linux/pm.h:431:17: note: in expansion of macro 'SYSTEM_SLEEP_PM_OPS'
     431 |                 SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn) \
         |                 ^~~~~~~~~~~~~~~~~~~
   drivers/iio/humidity/hts221_core.c:678:1: note: in expansion of macro 'EXPORT_NS_SIMPLE_DEV_PM_OPS'
     678 | EXPORT_NS_SIMPLE_DEV_PM_OPS(hts221_pm_ops, hts221_suspend, hts221_resume,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pm.h:318:9: error: field name not in record or union initializer
     318 |         .restore = pm_sleep_ptr(resume_fn),
         |         ^
   include/linux/pm.h:431:17: note: in expansion of macro 'SYSTEM_SLEEP_PM_OPS'
     431 |                 SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn) \
         |                 ^~~~~~~~~~~~~~~~~~~
   drivers/iio/humidity/hts221_core.c:678:1: note: in expansion of macro 'EXPORT_NS_SIMPLE_DEV_PM_OPS'
     678 | EXPORT_NS_SIMPLE_DEV_PM_OPS(hts221_pm_ops, hts221_suspend, hts221_resume,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pm.h:318:9: note: (near initialization for 'EXPORT_NS_SIMPLE_PM_OPS')
     318 |         .restore = pm_sleep_ptr(resume_fn),
         |         ^
   include/linux/pm.h:431:17: note: in expansion of macro 'SYSTEM_SLEEP_PM_OPS'
     431 |                 SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn) \
         |                 ^~~~~~~~~~~~~~~~~~~
   drivers/iio/humidity/hts221_core.c:678:1: note: in expansion of macro 'EXPORT_NS_SIMPLE_DEV_PM_OPS'
     678 | EXPORT_NS_SIMPLE_DEV_PM_OPS(hts221_pm_ops, hts221_suspend, hts221_resume,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/kernel.h:59:33: warning: excess elements in scalar initializer
      59 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                 ^
   include/linux/pm.h:476:28: note: in expansion of macro 'PTR_IF'
     476 | #define pm_sleep_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM_SLEEP), (_ptr))
         |                            ^~~~~~
   include/linux/pm.h:318:20: note: in expansion of macro 'pm_sleep_ptr'
     318 |         .restore = pm_sleep_ptr(resume_fn),
         |                    ^~~~~~~~~~~~
   include/linux/pm.h:431:17: note: in expansion of macro 'SYSTEM_SLEEP_PM_OPS'
     431 |                 SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn) \
         |                 ^~~~~~~~~~~~~~~~~~~
   drivers/iio/humidity/hts221_core.c:678:1: note: in expansion of macro 'EXPORT_NS_SIMPLE_DEV_PM_OPS'
     678 | EXPORT_NS_SIMPLE_DEV_PM_OPS(hts221_pm_ops, hts221_suspend, hts221_resume,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:59:33: note: (near initialization for 'EXPORT_NS_SIMPLE_PM_OPS')
      59 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                 ^
   include/linux/pm.h:476:28: note: in expansion of macro 'PTR_IF'
     476 | #define pm_sleep_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM_SLEEP), (_ptr))
         |                            ^~~~~~
   include/linux/pm.h:318:20: note: in expansion of macro 'pm_sleep_ptr'
     318 |         .restore = pm_sleep_ptr(resume_fn),
         |                    ^~~~~~~~~~~~
   include/linux/pm.h:431:17: note: in expansion of macro 'SYSTEM_SLEEP_PM_OPS'
     431 |                 SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn) \
         |                 ^~~~~~~~~~~~~~~~~~~
   drivers/iio/humidity/hts221_core.c:678:1: note: in expansion of macro 'EXPORT_NS_SIMPLE_DEV_PM_OPS'
     678 | EXPORT_NS_SIMPLE_DEV_PM_OPS(hts221_pm_ops, hts221_suspend, hts221_resume,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
..


vim +430 include/linux/pm.h

   410	
   411	/*
   412	 * Use this if you want to use the same suspend and resume callbacks for suspend
   413	 * to RAM and hibernation.
   414	 *
   415	 * If the underlying dev_pm_ops struct symbol has to be exported, use
   416	 * EXPORT_SIMPLE_DEV_PM_OPS() or EXPORT_GPL_SIMPLE_DEV_PM_OPS() instead.
   417	 */
   418	#define DEFINE_SIMPLE_DEV_PM_OPS(name, suspend_fn, resume_fn) \
   419		_DEFINE_DEV_PM_OPS(name, suspend_fn, resume_fn, NULL, NULL, NULL)
   420	
   421	#define EXPORT_SIMPLE_DEV_PM_OPS(name, suspend_fn, resume_fn) \
   422		EXPORT_SIMPLE_PM_OPS(name) = { \
   423			SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn) \
   424		}
   425	#define EXPORT_GPL_SIMPLE_DEV_PM_OPS(name, suspend_fn, resume_fn) \
   426		EXPORT_GPL_SIMPLE_PM_OPS(name) = { \
   427			SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn) \
   428		}
   429	#define EXPORT_NS_SIMPLE_DEV_PM_OPS(name, suspend_fn, resume_fn, ns)	\
 > 430		EXPORT_NS_SIMPLE_PM_OPS(name, ns) = { \
   431			SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn) \
   432		}
   433	#define EXPORT_NS_GPL_SIMPLE_DEV_PM_OPS(name, suspend_fn, resume_fn, ns)	\
   434		EXPORT_NS_GPL_SIMPLE_PM_OPS(name, ns) = { \
   435			SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn) \
   436		}
   437	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
