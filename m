Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34CC31DA3D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Sep 2023 09:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694595788; x=1726131788;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zPrJW5WprCYsSPhbhwiH/I+FS4FF9Lhh/gzaxBZstGM=;
  b=E7KpW+v3jOjaNGm0jH2aWIZ4t3oQViC9ptSC1rheOTfAMQnjogvtsgjE
   vJpG0hKKPKAkbkgQoUAFQEOOMCZjLbiAZVyF2FUmnBBS9kzk2gEZqKXFL
   aO7gnfcvBE8X1AWSqHxPuPXM0QGsKHG+s0EEPM1MLPWqibZY9ZudOBqkl
   3f21d2OIZdTG7HdfFJSJjB9TJRrBQhCl7dxTIa/qVTR42UvvyDpg/zTuA
   OdP3heprgs5xzi2SP7Mn26zgG+nvsaFmz+Jouj91tL5Y2ALwZUDhRhLGw
   7LVKF68N2tg1IRhezRjBVu3CWzLEcraRddTFBbz9F6E4T7C3TqVP/tt7o
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="445044439"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; 
   d="scan'208";a="445044439"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 02:03:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="814149187"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; 
   d="scan'208";a="814149187"
Received: from lkp-server02.sh.intel.com (HELO cf13c67269a2) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 13 Sep 2023 02:03:05 -0700
Received: from kbuild by cf13c67269a2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgLm3-0000Ir-1T;
	Wed, 13 Sep 2023 09:03:03 +0000
Date: Wed, 13 Sep 2023 17:02:44 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Rosenberg <drosen@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-f2fs-devel@lists.sourceforge.net,
	Jaegeuk Kim <jaegeuk@kernel.org>
Subject: [jaegeuk-f2fs:dev-test 8/9] include/linux/kern_levels.h:5:25:
 warning: format '%zu' expects argument of type 'size_t', but argument 6 has
 type 'long unsigned int'
Message-ID: <202309131625.SJzoZDIO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
head:   67dadd6ef509ed922ec667ef6b0ef0cdbb2fe04c
commit: e152f298a65c86ab89200d2d32132ab359c66a3c [8/9] f2fs: Support Block Size == Page Size
config: sparc-randconfig-r031-20230913 (https://download.01.org/0day-ci/archive/20230913/202309131625.SJzoZDIO-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230913/202309131625.SJzoZDIO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309131625.SJzoZDIO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/printk.h:7,
                    from include/asm-generic/bug.h:22,
                    from arch/sparc/include/asm/bug.h:25,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/sparc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from fs/f2fs/inode.c:8:
   fs/f2fs/inode.c: In function 'sanity_check_inode':
>> include/linux/kern_levels.h:5:25: warning: format '%zu' expects argument of type 'size_t', but argument 6 has type 'long unsigned int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/kern_levels.h:12:25: note: in expansion of macro 'KERN_SOH'
      12 | #define KERN_WARNING    KERN_SOH "4"    /* warning conditions */
         |                         ^~~~~~~~
   fs/f2fs/f2fs.h:2321:26: note: in expansion of macro 'KERN_WARNING'
    2321 |         f2fs_printk(sbi, KERN_WARNING fmt, ##__VA_ARGS__)
         |                          ^~~~~~~~~~~~
   fs/f2fs/inode.c:318:25: note: in expansion of macro 'f2fs_warn'
     318 |                         f2fs_warn(sbi, "%s: inode (ino=%lx) has corrupted i_inline_xattr_size: %d, max: %zu",
         |                         ^~~~~~~~~


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
