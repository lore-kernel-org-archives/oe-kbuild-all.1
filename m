Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4E13D92
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Aug 2023 04:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692159107; x=1723695107;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+hM076mTtFVP/XFcJDY1enqLmYazFXdz1WhZ1vHbVPY=;
  b=UblMME610QuYB48XhokvkAOJz0/w3giaxdk9oQ2QuSBybaGv435FXoO3
   2RVQpRx9/iKSWPwnUFABvBy+VqIZ8MY1YwaaSL7P5zO6iEXzBdATLb965
   WEa7r6uzx39h/KgXzw2UuJ/otIDM+VpwcqmOhw10AEbrMzt8qRsLLffvo
   KBU/dspVmQwBfUQFwndqBkvfkcPllU8Gq4TqktSfpnM6o3eymL7+g2QWE
   r4oVF+0g5JGsgrSPr9RSk5oFtYXRj6n3HVfTiFftevUfsv67w2/1haHDN
   CFkdWjHmkwn/QoypX8cFwTncKI6p0FbISdj+MRNM4fPyqIA8s+skKyuZb
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="458786769"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; 
   d="scan'208";a="458786769"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2023 21:11:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="683895889"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; 
   d="scan'208";a="683895889"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 15 Aug 2023 21:11:40 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qW7sh-0001Tt-07;
	Wed, 16 Aug 2023 04:11:39 +0000
Date: Wed, 16 Aug 2023 12:11:25 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Rosenberg <drosen@google.com>,
	linux-f2fs-devel@lists.sourceforge.net
Cc: oe-kbuild-all@lists.linux.dev, Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>,
	linux-kernel@vger.kernel.org, kernel-team@android.com,
	Daniel Rosenberg <drosen@google.com>
Subject: Re: [PATCH 1/1] ANDROID: f2fs: Support Block Size == Page Size
Message-ID: <202308161231.MjDoxlOG-lkp@intel.com>
References: <20230816011432.1966838-2-drosen@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230816011432.1966838-2-drosen@google.com>

Hi Daniel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 0cc81b1ad51287847e494e055e5d3426f95e7921]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Rosenberg/ANDROID-f2fs-Support-Block-Size-Page-Size/20230816-091721
base:   0cc81b1ad51287847e494e055e5d3426f95e7921
patch link:    https://lore.kernel.org/r/20230816011432.1966838-2-drosen%40google.com
patch subject: [PATCH 1/1] ANDROID: f2fs: Support Block Size == Page Size
config: m68k-randconfig-r013-20230816 (https://download.01.org/0day-ci/archive/20230816/202308161231.MjDoxlOG-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230816/202308161231.MjDoxlOG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308161231.MjDoxlOG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/printk.h:7,
                    from include/asm-generic/bug.h:22,
                    from arch/m68k/include/asm/bug.h:32,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/m68k/include/generated/asm/preempt.h:1,
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
   fs/f2fs/f2fs.h:2315:26: note: in expansion of macro 'KERN_WARNING'
    2315 |         f2fs_printk(sbi, KERN_WARNING fmt, ##__VA_ARGS__)
         |                          ^~~~~~~~~~~~
   fs/f2fs/inode.c:325:25: note: in expansion of macro 'f2fs_warn'
     325 |                         f2fs_warn(sbi, "%s: inode (ino=%lx) has corrupted i_inline_xattr_size: %d, max: %zu",
         |                         ^~~~~~~~~


vim +5 include/linux/kern_levels.h

314ba3520e513a Joe Perches 2012-07-30  4  
04d2c8c83d0e3a Joe Perches 2012-07-30 @5  #define KERN_SOH	"\001"		/* ASCII Start Of Header */
04d2c8c83d0e3a Joe Perches 2012-07-30  6  #define KERN_SOH_ASCII	'\001'
04d2c8c83d0e3a Joe Perches 2012-07-30  7  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
