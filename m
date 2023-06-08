Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4F328F3
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Jun 2023 06:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686205792; x=1717741792;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ribm3SEoBeFk1oJCgwZm0KusnpoXOaQSi2B941N/Ak4=;
  b=T60782i4afXA06z4dmaYmURUFsuQa+8i6MKAayvRBJSEWvQFZ69Wz1Eg
   givkh617+EjHm9rfBkJHGaaaoVOa1snqsyK8BrQL88ZUFDKqonEcwbJaB
   TmZPW+poXpnC2MPs0w5yh4YjfgNBYyArIhXJKZKonAIU+HEPy56IXlS0O
   81xDjcwBeZd8s/6p1Wv2pXOBqnu83VviUaykje0O8cgINb6p7BHT9U+G5
   OzNpoMH1+evik1+DuJ2Pkh3Ini2GLJbcDD/4USnfXBrgfw1pi2ptkpIO0
   DKTzbDbwSSEsXWnhmIkz3szeVItGL2c9YCeXpSFhiXpMAvGqAYCaSw/sP
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="420786987"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; 
   d="scan'208";a="420786987"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2023 23:29:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="822473058"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; 
   d="scan'208";a="822473058"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 07 Jun 2023 23:29:39 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q799O-0007Sx-0u;
	Thu, 08 Jun 2023 06:29:38 +0000
Date: Thu, 8 Jun 2023 14:28:42 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 81/84] include/linux/kern_levels.h:5:25:
 warning: format '%llu' expects argument of type 'long long unsigned int',
 but argument 3 has type 'long unsigned int'
Message-ID: <202306081449.ooozJodE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   065dd1013be45db19d557765f1e0e8404962d231
commit: 6a29e8e6604154d61ac043426f2e40991d2a748c [81/84] CHROMIUM: hibernate: Add 2 new ioctls to secure image transfer.
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20230608/202306081449.ooozJodE-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-5.15
        git checkout 6a29e8e6604154d61ac043426f2e40991d2a748c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash kernel/power/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306081449.ooozJodE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:22,
                    from arch/mips/include/asm/bug.h:42,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/mips/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:55,
                    from include/linux/swap.h:5,
                    from include/linux/suspend.h:5,
                    from kernel/power/user.c:10:
   kernel/power/user.c: In function 'snapshot_write_block_device':
>> include/linux/kern_levels.h:5:25: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 3 has type 'long unsigned int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:422:25: note: in definition of macro 'printk_index_wrap'
     422 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:493:9: note: in expansion of macro 'printk'
     493 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:493:16: note: in expansion of macro 'KERN_ERR'
     493 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~
   kernel/power/user.c:324:25: note: in expansion of macro 'pr_err'
     324 |                         pr_err("submitting bio failed at sector: %llu block number: %llu\n",
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
