Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A7E6FC3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Nov 2023 06:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CWRjej9d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699685281; x=1731221281;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/cH/bADwvfK3yOy5x5cbezubT3Fab3RNZ7ce3BvEl2c=;
  b=CWRjej9dXYv+UX79t5j6OeDPRVS+6q73o/jUb9uuJhqIMXuHrHBt63pT
   L6CU+3UWrVrHZbnNCu+l2qJYu5tpEWYKBpxSnemrFLV0eh67TOWqUfqA8
   bWj/L7MuuaICOry46j7pMLH0BLefIWy/6mvj2NqnQEv7qkIrnpfhE4Vej
   7Z5+6GYAG9KIWb0my2/Th10zLsZ1cppHhtX7sJBSjAh01A88ml+EmGf73
   3Ui7KWFmZ57YHhW5jthpaN6239csblcFROaMcElxdAO0pCNLvCgeCKxGw
   QkmqRAG0nn4xoGY+qtsdXFwBnuLQsARx2iVJoGfNIrdbhrCbPJosfL6C6
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="393132281"
X-IronPort-AV: E=Sophos;i="6.03,294,1694761200"; 
   d="scan'208";a="393132281"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 22:48:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="1011106567"
X-IronPort-AV: E=Sophos;i="6.03,294,1694761200"; 
   d="scan'208";a="1011106567"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 10 Nov 2023 22:47:59 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1hmf-000AHJ-0f;
	Sat, 11 Nov 2023 06:47:57 +0000
Date: Sat, 11 Nov 2023 14:47:04 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 22/22] include/linux/kern_levels.h:5:25:
 warning: format '%ld' expects argument of type 'long int', but argument 4
 has type 'loff_t' {aka 'long long int'}
Message-ID: <202311111414.bNI8CFIz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   0b15f05ae56061c55d3fb9d7412fef3385132ecd
commit: 0b15f05ae56061c55d3fb9d7412fef3385132ecd [22/22] CHROMIUM: PM: hibernate: Rewrite xfer block device ioctls
config: x86_64-randconfig-004-20231111 (https://download.01.org/0day-ci/archive/20231111/202311111414.bNI8CFIz-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231111/202311111414.bNI8CFIz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311111414.bNI8CFIz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/kernel.h:20,
                    from arch/x86/include/asm/percpu.h:27,
                    from arch/x86/include/asm/preempt.h:6,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:55,
                    from include/linux/swap.h:5,
                    from include/linux/suspend.h:5,
                    from kernel/power/user.c:10:
   kernel/power/user.c: In function 'snapshot_set_block_device':
>> include/linux/kern_levels.h:5:25: warning: format '%ld' expects argument of type 'long int', but argument 4 has type 'loff_t' {aka 'long long int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:422:25: note: in definition of macro 'printk_index_wrap'
     422 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:523:9: note: in expansion of macro 'printk'
     523 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:14:25: note: in expansion of macro 'KERN_SOH'
      14 | #define KERN_INFO       KERN_SOH "6"    /* informational */
         |                         ^~~~~~~~
   include/linux/printk.h:523:16: note: in expansion of macro 'KERN_INFO'
     523 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~
   kernel/power/user.c:278:9: note: in expansion of macro 'pr_info'
     278 |         pr_info("snapshot block device set to %02x:%02x: %ld blocks", MAJOR(dev), MINOR(dev),
         |         ^~~~~~~


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
