Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8A020F5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jun 2023 15:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686842881; x=1718378881;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=42wlXSTSem5KUkem+ZBtsdGmzzUk1sWnWLaJasDrraU=;
  b=hlhH3xprLUkOgFEgk41LWA2ei70lezqWz5kNKMWSTFYpZNYDXyXl7mNF
   yMKmsTB6xpw7XJtIlai//LXFeVOzEkkqw/X9XRyylVbybWuYJuOyLgIlp
   pdY9rF8czMg//sENFmNxUYrWzr032f0XNM68d7CkhVTvyG3ymKlgrSgOH
   0etcYgOaZ3WBBGZ1wnZdTguvghB7YQUiASMWWmrljFF+srV53RSM4mUbN
   ZkjRr3/UJ6Ad8o4QAgf7Yd3+spDr+hXon8S6wEqc/imIrQTXsg3fXEDG7
   Z+PaWk+bySS0g8Rb6eOV0cJbzxncPFpQqf2WIUCQEKcUQvFH1p9fyyXUA
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="424857911"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; 
   d="scan'208";a="424857911"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2023 08:05:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="706695684"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; 
   d="scan'208";a="706695684"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 15 Jun 2023 08:05:35 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9oXW-00004a-2b;
	Thu, 15 Jun 2023 15:05:34 +0000
Date: Thu, 15 Jun 2023 23:05:23 +0800
From: kernel test robot <lkp@intel.com>
To: Laurent FERT <laurent.fert@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>,
	Yann Fouassier <yann.fouassier@intel.com>
Subject: [intel-lts:4.19/android_s 4697/30000]
 include/linux/kern_levels.h:5:25: warning: format '%llx' expects argument of
 type 'long long unsigned int', but argument 3 has type 'dma_addr_t' {aka
 'unsigned int'}
Message-ID: <202306152212.btOSABYN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Laurent,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_s
head:   84b0def7f5485c67cb173427c2009a55c6303842
commit: f1edb90e17515062e4de1a93c80f56938d8c1791 [4697/30000] intel_th: Support NPKT ACPI table in MSU
config: i386-randconfig-i014-20230615 (https://download.01.org/0day-ci/archive/20230615/202306152212.btOSABYN-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        # https://github.com/intel/linux-intel-lts/commit/f1edb90e17515062e4de1a93c80f56938d8c1791
        git remote add intel-lts https://github.com/intel/linux-intel-lts.git
        git fetch --no-tags intel-lts 4.19/android_s
        git checkout f1edb90e17515062e4de1a93c80f56938d8c1791
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306152212.btOSABYN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/gfp.h:6,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:22,
                    from include/linux/module.h:13,
                    from drivers/hwtracing/intel_th/msu.c:11:
   include/linux/mmzone.h: In function '__nr_to_section':
   include/linux/mmzone.h:1156:13: warning: the comparison will always evaluate as 'true' for the address of 'mem_section' will never be NULL [-Waddress]
    1156 |         if (!mem_section[SECTION_NR_TO_ROOT(nr)])
         |             ^
   include/linux/mmzone.h:1147:27: note: 'mem_section' declared here
    1147 | extern struct mem_section mem_section[NR_SECTION_ROOTS][SECTIONS_PER_ROOT];
         |                           ^~~~~~~~~~~
   In file included from include/linux/printk.h:7,
                    from include/linux/kernel.h:14,
                    from include/linux/list.h:9,
                    from include/linux/module.h:9:
   drivers/hwtracing/intel_th/msu.c: In function 'npkt_bind_buffer':
>> include/linux/kern_levels.h:5:25: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 3 has type 'dma_addr_t' {aka 'unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:308:16: note: in expansion of macro 'KERN_ERR'
     308 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~
   drivers/hwtracing/intel_th/msu.c:1418:17: note: in expansion of macro 'pr_err'
    1418 |                 pr_err("ioremap failed for buffer %s 0x%llx size:0x%x\n",
         |                 ^~~~~~
   drivers/hwtracing/intel_th/msu.c: In function 'npkt_bind_buffers':
   drivers/hwtracing/intel_th/msu.c:1433:37: warning: taking address of packed member of 'struct acpi_table_npkt' may result in an unaligned pointer value [-Waddress-of-packed-member]
    1433 |                 npkt_bind_buffer(i, &npkt->buffers[i], npkt->flags,
         |                                     ^~~~~~~~~~~~~~~~~
   drivers/hwtracing/intel_th/msu.c: At top level:
   include/linux/module.h:133:13: warning: 'init_module' specifies less restrictive attribute than its target 'intel_th_msc_driver_init': 'cold' [-Wmissing-attributes]
     133 |         int init_module(void) __attribute__((alias(#initfn)));
         |             ^~~~~~~~~~~
   include/linux/device.h:1604:1: note: in expansion of macro 'module_init'
    1604 | module_init(__driver##_init); \
         | ^~~~~~~~~~~
   drivers/hwtracing/intel_th/msu.c:1808:1: note: in expansion of macro 'module_driver'
    1808 | module_driver(intel_th_msc_driver,
         | ^~~~~~~~~~~~~
   In file included from drivers/hwtracing/intel_th/msu.c:12:
   drivers/hwtracing/intel_th/msu.c:1808:15: note: 'init_module' target declared here
    1808 | module_driver(intel_th_msc_driver,
         |               ^~~~~~~~~~~~~~~~~~~
   include/linux/device.h:1600:19: note: in definition of macro 'module_driver'
    1600 | static int __init __driver##_init(void) \
         |                   ^~~~~~~~
   include/linux/module.h:139:14: warning: 'cleanup_module' specifies less restrictive attribute than its target 'intel_th_msc_driver_exit': 'cold' [-Wmissing-attributes]
     139 |         void cleanup_module(void) __attribute__((alias(#exitfn)));
         |              ^~~~~~~~~~~~~~
   include/linux/device.h:1609:1: note: in expansion of macro 'module_exit'
    1609 | module_exit(__driver##_exit);
         | ^~~~~~~~~~~
   drivers/hwtracing/intel_th/msu.c:1808:1: note: in expansion of macro 'module_driver'
    1808 | module_driver(intel_th_msc_driver,
         | ^~~~~~~~~~~~~
   drivers/hwtracing/intel_th/msu.c:1808:15: note: 'cleanup_module' target declared here
    1808 | module_driver(intel_th_msc_driver,
         |               ^~~~~~~~~~~~~~~~~~~
   include/linux/device.h:1605:20: note: in definition of macro 'module_driver'
    1605 | static void __exit __driver##_exit(void) \
         |                    ^~~~~~~~
   drivers/hwtracing/intel_th/msu.c:57: warning: Function parameter or member 'msc' not described in 'msc_window'
   drivers/hwtracing/intel_th/msu.c:99: warning: bad line: 
   drivers/hwtracing/intel_th/msu.c:132: warning: Function parameter or member 'iter_list' not described in 'msc'
   drivers/hwtracing/intel_th/msu.c:896: warning: Function parameter or member 'nr_pages' not described in 'msc_buffer_alloc'
   drivers/hwtracing/intel_th/msu.c:896: warning: Function parameter or member 'nr_wins' not described in 'msc_buffer_alloc'
   drivers/hwtracing/intel_th/msu.c:896: warning: Excess function parameter 'size' description in 'msc_buffer_alloc'
   drivers/hwtracing/intel_th/msu.c:1320: warning: Function parameter or member 'buf' not described in 'stop_buffer_trace'
   drivers/hwtracing/intel_th/msu.c:1358: warning: Function parameter or member 'file' not described in 'read_npkt_dump_buf'
   drivers/hwtracing/intel_th/msu.c:1358: warning: Function parameter or member 'user_buf' not described in 'read_npkt_dump_buf'
   drivers/hwtracing/intel_th/msu.c:1358: warning: Function parameter or member 'count' not described in 'read_npkt_dump_buf'
   drivers/hwtracing/intel_th/msu.c:1358: warning: Function parameter or member 'ppos' not described in 'read_npkt_dump_buf'
   drivers/hwtracing/intel_th/msu.c:1392: warning: Function parameter or member 'type' not described in 'npkt_bind_buffer'
   drivers/hwtracing/intel_th/msu.c:1392: warning: Function parameter or member 'abuf' not described in 'npkt_bind_buffer'
   drivers/hwtracing/intel_th/msu.c:1392: warning: Function parameter or member 'flags' not described in 'npkt_bind_buffer'
   drivers/hwtracing/intel_th/msu.c:1392: warning: Function parameter or member 'buf' not described in 'npkt_bind_buffer'
   drivers/hwtracing/intel_th/msu.c:1392: warning: Function parameter or member 'msc' not described in 'npkt_bind_buffer'
   drivers/hwtracing/intel_th/msu.c:1450: warning: Function parameter or member 'msc' not described in 'intel_th_npkt_init'
   drivers/hwtracing/intel_th/msu.c:1489: warning: Function parameter or member 'msc' not described in 'intel_th_npkt_remove'
   drivers/hwtracing/intel_th/msu.c:1507: warning: Function parameter or member 'thdev' not described in 'intel_th_msc_first_trace'


vim +5 include/linux/kern_levels.h

314ba3520e513a Joe Perches 2012-07-30  4  
04d2c8c83d0e3a Joe Perches 2012-07-30 @5  #define KERN_SOH	"\001"		/* ASCII Start Of Header */
04d2c8c83d0e3a Joe Perches 2012-07-30  6  #define KERN_SOH_ASCII	'\001'
04d2c8c83d0e3a Joe Perches 2012-07-30  7  

:::::: The code at line 5 was first introduced by commit
:::::: 04d2c8c83d0e3ac5f78aeede51babb3236200112 printk: convert the format for KERN_<LEVEL> to a 2 byte pattern

:::::: TO: Joe Perches <joe@perches.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
