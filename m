Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA25010977
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Jul 2023 23:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689635115; x=1721171115;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KUQQtNq2uvB9Nm/XXK/R1pKwggjaz1gf6C8pYQFDH/g=;
  b=X/1u0nsZ7Y3uns1sWgZh6ogFv2iQuPCmqDHTGB8nv3VQ9+mLKMTqv73d
   /dR84xA9PY+3Jn/HZJimABGPqlftD/DD080CC7182L0zWPQAVY8geBlTt
   V7JOZNyJ/Djux9h1TrXXwNJITFgykDdVtEeOVg7Zrw2n4s3FRO46n+3Ga
   ibF0U2ZHC9Ib986XZ/KYElddONSIWvHoOMwr8VbEDRbi1cgdzMT+gQRev
   XynVAV2rm20puXYE67tyWLMpKvvyXhB33ZeXgrMm56WHs1Ov07p+f/+IP
   HtPqv/dvdc3JpOTHYxaVecEyB8LqL2h3PnEbB51mMus4BxQv9kRISq+og
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="432237214"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="432237214"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 16:05:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="717387830"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="717387830"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 17 Jul 2023 16:05:12 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLXHD-0009z9-1x;
	Mon, 17 Jul 2023 23:05:11 +0000
Date: Tue, 18 Jul 2023 07:05:02 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Weinberger <richard@nod.at>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rw-misc:embedded_go_prog 1/1] include/linux/kern_levels.h:5:25:
 warning: format '%ld' expects argument of type 'long int', but argument 2
 has type 'ssize_t' {aka 'int'}
Message-ID: <202307180629.FjoLoRM8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rw/misc.git embedded_go_prog
head:   58a51666e0ed2b23253048b0616ee5879361cc4a
commit: 58a51666e0ed2b23253048b0616ee5879361cc4a [1/1] misc: Add demo driver for user mode driver usage
config: openrisc-randconfig-r024-20230717 (https://download.01.org/0day-ci/archive/20230718/202307180629.FjoLoRM8-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230718/202307180629.FjoLoRM8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307180629.FjoLoRM8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:22,
                    from ./arch/openrisc/include/generated/asm/bug.h:1,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/current.h:5,
                    from ./arch/openrisc/include/generated/asm/current.h:1,
                    from include/linux/sched.h:12,
                    from include/linux/freezer.h:8,
                    from drivers/misc/embedded_prog/eprog_kern.c:2:
   drivers/misc/embedded_prog/eprog_kern.c: In function 'eprog_thread':
>> include/linux/kern_levels.h:5:25: warning: format '%ld' expects argument of type 'long int', but argument 2 has type 'ssize_t' {aka 'int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:427:25: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:498:9: note: in expansion of macro 'printk'
     498 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:498:16: note: in expansion of macro 'KERN_ERR'
     498 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~
   drivers/misc/embedded_prog/eprog_kern.c:46:25: note: in expansion of macro 'pr_err'
      46 |                         pr_err("Fatal error while reading from userspace: %ld\n", nread);
         |                         ^~~~~~


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
