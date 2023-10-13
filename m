Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84CE6FB3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 08:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jCfaaYBi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697186819; x=1728722819;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/Lh+wj5itA0UPlNXj/vBLl4ZijY8OrPfotyCQPaIIwk=;
  b=jCfaaYBiG62ula8MY6T7NL2bXgh9zDTvfV12RcyE80eiOYtO6HnBtxWz
   3z1XYMVD0JBbuVqAsPbU5ojowFfOoVkvsRgVww5yT4OIVjA1hG0aCY141
   KgGnjnjvU0s/bYxHrxhl2xClIZjXFBqM7+yQCeJtRN0WjbhcGVBMPvbiF
   SbVvBDNxDcicT0WtcJ5dRZb2gFgfnaLlYStWuaaRXLjWJfDZMQB0fBm0A
   ERBUS4Yfb6hz8Sl3TY0wRxAE5nZHwfhI7/3pjNrt8BrTw7eVKvfcdR9Oq
   BgF6YZ/EGAnxou4odAPXg2TXQvRIZL/mryzI1LiygpqSn72RP+BkN7N5X
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="382363919"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="382363919"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 01:46:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="898482719"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="898482719"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 13 Oct 2023 01:45:08 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrDot-0004X5-31;
	Fri, 13 Oct 2023 08:46:55 +0000
Date: Fri, 13 Oct 2023 16:46:35 +0800
From: kernel test robot <lkp@intel.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v1 2/2] mm: swap: Swap-out small-sized THP without
 splitting
Message-ID: <202310131622.SS2hYSwL-lkp@intel.com>
References: <20231010142111.3997780-3-ryan.roberts@arm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231010142111.3997780-3-ryan.roberts@arm.com>

Hi Ryan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linus/master v6.6-rc5 next-20231013]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Roberts/mm-swap-Remove-CLUSTER_FLAG_HUGE-from-swap_cluster_info-flags/20231010-222442
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20231010142111.3997780-3-ryan.roberts%40arm.com
patch subject: [RFC PATCH v1 2/2] mm: swap: Swap-out small-sized THP without splitting
config: arm-randconfig-004-20231013 (https://download.01.org/0day-ci/archive/20231013/202310131622.SS2hYSwL-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231013/202310131622.SS2hYSwL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310131622.SS2hYSwL-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/mm.h:29,
                    from include/linux/memcontrol.h:20,
                    from include/linux/swap.h:9,
                    from include/linux/suspend.h:5,
                    from include/linux/regulator/consumer.h:35,
                    from include/linux/i2c.h:19,
                    from drivers/iio/accel/mxc4005.c:9:
>> include/linux/pgtable.h:8:26: error: 'PMD_SHIFT' undeclared here (not in a function); did you mean 'P4D_SHIFT'?
       8 | #define PMD_ORDER       (PMD_SHIFT - PAGE_SHIFT)
         |                          ^~~~~~~~~
   include/linux/swap.h:323:33: note: in expansion of macro 'PMD_ORDER'
     323 |         unsigned int large_next[PMD_ORDER]; /*
         |                                 ^~~~~~~~~
   drivers/iio/accel/mxc4005.c:472:36: warning: 'mxc4005_acpi_match' defined but not used [-Wunused-const-variable=]
     472 | static const struct acpi_device_id mxc4005_acpi_match[] = {
         |                                    ^~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/mm.h:29,
                    from include/linux/memcontrol.h:20,
                    from include/linux/swap.h:9,
                    from include/linux/suspend.h:5,
                    from include/linux/regulator/consumer.h:35,
                    from include/linux/i2c.h:19,
                    from include/linux/iio/common/st_sensors.h:13,
                    from drivers/iio/accel/st_accel_core.c:20:
>> include/linux/pgtable.h:8:26: error: 'PMD_SHIFT' undeclared here (not in a function); did you mean 'P4D_SHIFT'?
       8 | #define PMD_ORDER       (PMD_SHIFT - PAGE_SHIFT)
         |                          ^~~~~~~~~
   include/linux/swap.h:323:33: note: in expansion of macro 'PMD_ORDER'
     323 |         unsigned int large_next[PMD_ORDER]; /*
         |                                 ^~~~~~~~~
--
   In file included from include/linux/mm.h:29,
                    from include/linux/memcontrol.h:20,
                    from include/linux/swap.h:9,
                    from include/linux/suspend.h:5,
                    from include/linux/regulator/consumer.h:35,
                    from include/linux/i2c.h:19,
                    from drivers/iio/accel/mma9553.c:8:
>> include/linux/pgtable.h:8:26: error: 'PMD_SHIFT' undeclared here (not in a function); did you mean 'P4D_SHIFT'?
       8 | #define PMD_ORDER       (PMD_SHIFT - PAGE_SHIFT)
         |                          ^~~~~~~~~
   include/linux/swap.h:323:33: note: in expansion of macro 'PMD_ORDER'
     323 |         unsigned int large_next[PMD_ORDER]; /*
         |                                 ^~~~~~~~~
   drivers/iio/accel/mma9553.c:1229:36: warning: 'mma9553_acpi_match' defined but not used [-Wunused-const-variable=]
    1229 | static const struct acpi_device_id mma9553_acpi_match[] = {
         |                                    ^~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/mm.h:29,
                    from include/linux/memcontrol.h:20,
                    from include/linux/swap.h:9,
                    from include/linux/suspend.h:5,
                    from include/linux/regulator/consumer.h:35,
                    from include/linux/i2c.h:19,
                    from drivers/iio/accel/mxc6255.c:11:
>> include/linux/pgtable.h:8:26: error: 'PMD_SHIFT' undeclared here (not in a function); did you mean 'P4D_SHIFT'?
       8 | #define PMD_ORDER       (PMD_SHIFT - PAGE_SHIFT)
         |                          ^~~~~~~~~
   include/linux/swap.h:323:33: note: in expansion of macro 'PMD_ORDER'
     323 |         unsigned int large_next[PMD_ORDER]; /*
         |                                 ^~~~~~~~~
   drivers/iio/accel/mxc6255.c:167:36: warning: 'mxc6255_acpi_match' defined but not used [-Wunused-const-variable=]
     167 | static const struct acpi_device_id mxc6255_acpi_match[] = {
         |                                    ^~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/mm.h:29,
                    from include/linux/memcontrol.h:20,
                    from include/linux/swap.h:9,
                    from include/linux/suspend.h:5,
                    from include/linux/regulator/consumer.h:35,
                    from include/linux/i2c.h:19,
                    from drivers/iio/accel/da280.c:10:
>> include/linux/pgtable.h:8:26: error: 'PMD_SHIFT' undeclared here (not in a function); did you mean 'P4D_SHIFT'?
       8 | #define PMD_ORDER       (PMD_SHIFT - PAGE_SHIFT)
         |                          ^~~~~~~~~
   include/linux/swap.h:323:33: note: in expansion of macro 'PMD_ORDER'
     323 |         unsigned int large_next[PMD_ORDER]; /*
         |                                 ^~~~~~~~~
   drivers/iio/accel/da280.c:171:36: warning: 'da280_acpi_match' defined but not used [-Wunused-const-variable=]
     171 | static const struct acpi_device_id da280_acpi_match[] = {
         |                                    ^~~~~~~~~~~~~~~~
--
   In file included from include/linux/mm.h:29,
                    from include/linux/memcontrol.h:20,
                    from include/linux/swap.h:9,
                    from include/linux/suspend.h:5,
                    from include/linux/regulator/consumer.h:35,
                    from include/linux/i2c.h:19,
                    from drivers/iio/accel/stk8ba50.c:11:
>> include/linux/pgtable.h:8:26: error: 'PMD_SHIFT' undeclared here (not in a function); did you mean 'P4D_SHIFT'?
       8 | #define PMD_ORDER       (PMD_SHIFT - PAGE_SHIFT)
         |                          ^~~~~~~~~
   include/linux/swap.h:323:33: note: in expansion of macro 'PMD_ORDER'
     323 |         unsigned int large_next[PMD_ORDER]; /*
         |                                 ^~~~~~~~~
   drivers/iio/accel/stk8ba50.c:533:36: warning: 'stk8ba50_acpi_id' defined but not used [-Wunused-const-variable=]
     533 | static const struct acpi_device_id stk8ba50_acpi_id[] = {
         |                                    ^~~~~~~~~~~~~~~~
--
   In file included from include/linux/mm.h:29,
                    from include/linux/memcontrol.h:20,
                    from include/linux/swap.h:9,
                    from include/linux/suspend.h:5,
                    from include/linux/regulator/consumer.h:35,
                    from include/linux/i2c.h:19,
                    from drivers/iio/accel/bmc150-accel-i2c.c:9:
>> include/linux/pgtable.h:8:26: error: 'PMD_SHIFT' undeclared here (not in a function); did you mean 'P4D_SHIFT'?
       8 | #define PMD_ORDER       (PMD_SHIFT - PAGE_SHIFT)
         |                          ^~~~~~~~~
   include/linux/swap.h:323:33: note: in expansion of macro 'PMD_ORDER'
     323 |         unsigned int large_next[PMD_ORDER]; /*
         |                                 ^~~~~~~~~
   drivers/iio/accel/bmc150-accel-i2c.c:219:36: warning: 'bmc150_accel_acpi_match' defined but not used [-Wunused-const-variable=]
     219 | static const struct acpi_device_id bmc150_accel_acpi_match[] = {
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~


vim +8 include/linux/pgtable.h

f25748e3c34eb8 include/asm-generic/pgtable.h Dan Williams            2016-01-15   7  
051ddcfeb1bdba include/linux/pgtable.h       Matthew Wilcox (Oracle  2023-08-18  @8) #define PMD_ORDER	(PMD_SHIFT - PAGE_SHIFT)
051ddcfeb1bdba include/linux/pgtable.h       Matthew Wilcox (Oracle  2023-08-18   9) #define PUD_ORDER	(PUD_SHIFT - PAGE_SHIFT)
051ddcfeb1bdba include/linux/pgtable.h       Matthew Wilcox (Oracle  2023-08-18  10) 

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
