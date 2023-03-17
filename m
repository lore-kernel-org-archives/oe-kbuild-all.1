Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD877C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Mar 2023 00:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679011859; x=1710547859;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KufK/6xFfx7HW5QcM2GsN3moVXnfww/cwt4Ke9fgN80=;
  b=Odnucx5cFpzrKbmmbT6d5jlGXC+uunELM7IkOlLWTEiWLZgF6Fr89EcH
   7U/7Yzg5E+/kIkNhCFUtW3qxqzDinVvoObE/FjpC9FfFZEMEmzAb+8M09
   WUhsxSO5SIywMCADeWVRKJWlOFN/6W5ynnlQ1YoNeJJyZBnLQwt3UMEaD
   v9GW45PE1p/abKKNB7MzWo+CjH+ZbvEkBlIP5Ah0n+NYkvB/MNfzQDo7U
   QRzenDPOjH2wri5yV05Ta/C6Z0kwMrVlMHqCATWR4TDK9Q7fblOUaSKhQ
   Ec6Ri80lDVHQOTD7G2HlGwv065hOURxOVzbqka9WVd/1p9sRUu5FY1v99
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="338158848"
X-IronPort-AV: E=Sophos;i="5.98,267,1673942400"; 
   d="scan'208";a="338158848"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2023 17:10:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="682499113"
X-IronPort-AV: E=Sophos;i="5.98,267,1673942400"; 
   d="scan'208";a="682499113"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 16 Mar 2023 17:10:47 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcxgE-0008ti-2K;
	Fri, 17 Mar 2023 00:10:46 +0000
Date: Fri, 17 Mar 2023 08:10:26 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.10 67/69] include/linux/kern_levels.h:5:25:
 warning: format '%llu' expects argument of type 'long long unsigned int',
 but argument 3 has type 'long unsigned int'
Message-ID: <202303170815.RNLLC1lX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.10
head:   aacf4827f4c27b0c33e275a98138c13be633c217
commit: 2c88b559a996981e862d35551e3f3b611847f9e3 [67/69] CHROMIUM: hibernate: Add 2 new ioctls to secure image transfer.
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20230317/202303170815.RNLLC1lX-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-5.10
        git checkout 2c88b559a996981e862d35551e3f3b611847f9e3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303170815.RNLLC1lX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/printk.h:7,
                    from include/linux/kernel.h:16,
                    from include/linux/list.h:9,
                    from include/linux/preempt.h:11,
                    from include/linux/spinlock.h:51,
                    from include/linux/swap.h:5,
                    from include/linux/suspend.h:5,
                    from kernel/power/user.c:10:
   kernel/power/user.c: In function 'snapshot_write_block_device':
>> include/linux/kern_levels.h:5:25: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 3 has type 'long unsigned int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:343:16: note: in expansion of macro 'KERN_ERR'
     343 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~
   kernel/power/user.c:323:25: note: in expansion of macro 'pr_err'
     323 |                         pr_err("submitting bio failed at sector: %llu block number: %llu\n",
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
https://github.com/intel/lkp-tests
