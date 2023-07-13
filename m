Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4757B125CD
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Jul 2023 11:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689248584; x=1720784584;
  h=date:from:cc:subject:message-id:mime-version;
  bh=5JKmxzFTcr3msYqZOuf3VeeRaMXftNImwXWuH6xmShc=;
  b=PCmWwhg3+T5x5RgPbvkKj662mXHtrZoppXTa7h2KHcHHrxMWYG9YPLDV
   2ra9kTunRNinBukuLvfHaUEWuwSolCOr3+QiicQbYxFKVlAmXTWtRAEYT
   8w5pcmBkr5UphAgeBJSIv/KTUospxfYhKQ3EiKx02hkCssz5whbYckeyM
   PBUM7gwx2Nk5AWLN+G0/TsCrvmqq5gl98nDjGDBZdpqYBd7rD+RKJTeer
   n5GK3YkAzUJdGlHFr/93HuAiThtk70loHNkggtsrXq8Nmv+14PIzLVedz
   TPPPz1BeGW8EJVXvrpEUVM6Mjxorr0BvdnT/Tw+EIxK/6bZMFUj3OD+Z3
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="368696926"
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="368696926"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2023 04:42:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="672234380"
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="672234380"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 13 Jul 2023 04:42:52 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJuii-0006aW-0T
	for oe-kbuild-all@lists.linux.dev;
	Thu, 13 Jul 2023 11:42:52 +0000
Date: Thu, 13 Jul 2023 19:42:20 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:4.19/android_t 14738/30000]
 include/linux/kern_levels.h:5:25: warning: format '%lu' expects argument of
 type 'long unsigned int', but argument 6 has type 'blkcnt_t' {aka 'long long
 unsigned int'}
Message-ID: <202307131918.efAaxske-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_t
head:   0f6dab7d9f97996aec10a8e2e854ec3bd628d550
commit: 714629517bbdacc1d240de3dc70e7df9528f5ffa [14738/30000] Merge remote-tracking branch 'aosp/upstream-f2fs-stable-linux-4.19.y' into android-4.19 (v5.7-rc1)
config: arm-randconfig-r014-20230713 (https://download.01.org/0day-ci/archive/20230713/202307131918.efAaxske-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230713/202307131918.efAaxske-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307131918.efAaxske-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/printk.h:7,
                    from include/linux/kernel.h:14,
                    from include/linux/list.h:9,
                    from include/linux/wait.h:7,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from fs/f2fs/inode.c:8:
   fs/f2fs/inode.c: In function 'sanity_check_inode':
>> include/linux/kern_levels.h:5:25: warning: format '%lu' expects argument of type 'long unsigned int', but argument 6 has type 'blkcnt_t' {aka 'long long unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/kern_levels.h:12:25: note: in expansion of macro 'KERN_SOH'
      12 | #define KERN_WARNING    KERN_SOH "4"    /* warning conditions */
         |                         ^~~~~~~~
   fs/f2fs/f2fs.h:2012:26: note: in expansion of macro 'KERN_WARNING'
    2012 |         f2fs_printk(sbi, KERN_WARNING fmt, ##__VA_ARGS__)
         |                          ^~~~~~~~~~~~
   fs/f2fs/inode.c:303:25: note: in expansion of macro 'f2fs_warn'
     303 |                         f2fs_warn(sbi, "%s: inode (ino=%lx) has inconsistent "
         |                         ^~~~~~~~~


vim +5 include/linux/kern_levels.h

314ba3520e513a7 Joe Perches 2012-07-30  4  
04d2c8c83d0e3ac Joe Perches 2012-07-30 @5  #define KERN_SOH	"\001"		/* ASCII Start Of Header */
04d2c8c83d0e3ac Joe Perches 2012-07-30  6  #define KERN_SOH_ASCII	'\001'
04d2c8c83d0e3ac Joe Perches 2012-07-30  7  

:::::: The code at line 5 was first introduced by commit
:::::: 04d2c8c83d0e3ac5f78aeede51babb3236200112 printk: convert the format for KERN_<LEVEL> to a 2 byte pattern

:::::: TO: Joe Perches <joe@perches.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
