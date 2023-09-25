Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBD0A46
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Sep 2023 01:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695604997; x=1727140997;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6sVZRiotsmL00ZmOLHcutCwg4Dmv28OiRqrgLO8rcFA=;
  b=k/AYjU/Xu7S5WMEjnVTLC8PY5d7YEBg68m4Nw6IWKreWyJf9vXT5JF+L
   uHRF4HOr+6S2n8RK7E4QL/iTxWmseBRl0yoYd4TrAL4pzoL7/MjgZb6Vv
   Ac56OIFCovRa4YYgabrp/ULR3fJeYn6NHlzbRWsxsUyf+xKTD0qYOUaeQ
   4Q+3kDXIGBNL9GaVkyzGw1cLOb/XGt6YGPQzBt7Ol8WL//dfNyDpnJhhK
   MnqfqZHi6tFBfNWHATJf7o8rjxUdh3T3Jr6OGi2KmoMfuvES9Fa0t7rJM
   oeUVQ6J0xMPyndVv9w44gQ2Tcj6ETi4eUmrO0qfDiNDT7vEEuwsWTmAk6
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="412075742"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="412075742"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2023 18:23:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="777491323"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="777491323"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 24 Sep 2023 18:23:11 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qkaJa-0000j8-17;
	Mon, 25 Sep 2023 01:23:10 +0000
Date: Mon, 25 Sep 2023 09:23:04 +0800
From: kernel test robot <lkp@intel.com>
To: Dan Carpenter <error27@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>
Subject: include/linux/kern_levels.h:5:25: warning: format '%lx' expects
 argument of type 'long unsigned int', but argument 2 has type 'unsigned int'
Message-ID: <202309250903.XNAjFuxy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6465e260f48790807eef06b583b38ca9789b6072
commit: 02a07872f84fc5fe61fa65310ff23bcad166a4f5 ASoC: dma-sh7760: cleanup a debug printk
date:   4 years, 9 months ago
config: sh-randconfig-r015-20221226 (https://download.01.org/0day-ci/archive/20230925/202309250903.XNAjFuxy-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230925/202309250903.XNAjFuxy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309250903.XNAjFuxy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/kernel.h:14,
                    from include/linux/list.h:9,
                    from include/linux/module.h:9,
                    from sound/soc/sh/dma-sh7760.c:13:
   sound/soc/sh/dma-sh7760.c: In function 'camelot_prepare':
>> include/linux/kern_levels.h:5:25: warning: format '%lx' expects argument of type 'long unsigned int', but argument 2 has type 'unsigned int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:136:24: note: in definition of macro 'no_printk'
     136 |                 printk(fmt, ##__VA_ARGS__);             \
         |                        ^~~
   include/linux/kern_levels.h:15:25: note: in expansion of macro 'KERN_SOH'
      15 | #define KERN_DEBUG      KERN_SOH "7"    /* debug-level messages */
         |                         ^~~~~~~~
   include/linux/printk.h:346:19: note: in expansion of macro 'KERN_DEBUG'
     346 |         no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
         |                   ^~~~~~~~~~
   sound/soc/sh/dma-sh7760.c:205:9: note: in expansion of macro 'pr_debug'
     205 |         pr_debug("PCM data: addr 0x%08lx len %d\n",
         |         ^~~~~~~~


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
