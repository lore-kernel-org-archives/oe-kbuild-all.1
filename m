Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17FF3648
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Apr 2023 05:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680584890; x=1712120890;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=71AYZLS/StnRSkvNLO6Sh4jfOB9PpM5d3B2nSqPUxgg=;
  b=b361rNAxmHvWTTASlMqgQbnkCA+1fxn+EIWip5l274eClJ18LAn4SUPo
   gfzULdxz13J4rLvgLl8JSb7KObdD2MJxA0eNitEoq5U24KHwRh5Jf7b2G
   sO/7hFSwt2yV+6lfBnM9ctWxLf3nM45hMr2kd829JuRKRFqDe25txJPWr
   R/RETmBNRN6b9RljtMLGR1DHxjaugujgOZpU+jsUWhS782hiNQxn5wAXv
   d27ngorPjf0DzdTbJ+Yz4NQfO5APqxBtdt008KFWc2OA2I1Ihm7Z2g+Ao
   8ihzMSBUv7rjtNMmtt93bKUgFSleru0JAcnvg3qzCvhHUy9uxGPF/6nXL
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="339577580"
X-IronPort-AV: E=Sophos;i="5.98,316,1673942400"; 
   d="scan'208";a="339577580"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2023 22:08:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="679755114"
X-IronPort-AV: E=Sophos;i="5.98,316,1673942400"; 
   d="scan'208";a="679755114"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 03 Apr 2023 22:08:05 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pjYto-000PDK-2D;
	Tue, 04 Apr 2023 05:08:04 +0000
Date: Tue, 4 Apr 2023 13:08:01 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [broonie-ci:regmap-maple-walk-find 10/12]
 drivers/base/regmap/regcache-maple.c:114:23: warning: 'upper_index' is used
 uninitialized
Message-ID: <202304041252.XM8BGUXI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git regmap-maple-walk-find
head:   d60818865b0e667d65342d7aa35d0d63163f7f09
commit: f033c26de5a5734625d2dd1dc196745fae186f1b [10/12] regmap: Add maple tree based register cache
config: arc-randconfig-r002-20230403 (https://download.01.org/0day-ci/archive/20230404/202304041252.XM8BGUXI-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git/commit/?id=f033c26de5a5734625d2dd1dc196745fae186f1b
        git remote add broonie-ci https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git
        git fetch --no-tags broonie-ci regmap-maple-walk-find
        git checkout f033c26de5a5734625d2dd1dc196745fae186f1b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash drivers/base/regmap/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304041252.XM8BGUXI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/base/regmap/regcache-maple.c: In function 'regcache_maple_drop':
   drivers/base/regmap/regcache-maple.c:113:23: warning: 'lower_index' is used uninitialized [-Wuninitialized]
     113 |         unsigned long lower_index, lower_last;
         |                       ^~~~~~~~~~~
   drivers/base/regmap/regcache-maple.c:113:36: warning: 'lower_last' is used uninitialized [-Wuninitialized]
     113 |         unsigned long lower_index, lower_last;
         |                                    ^~~~~~~~~~
>> drivers/base/regmap/regcache-maple.c:114:23: warning: 'upper_index' is used uninitialized [-Wuninitialized]
     114 |         unsigned long upper_index, upper_last;
         |                       ^~~~~~~~~~~
>> drivers/base/regmap/regcache-maple.c:114:36: warning: 'upper_last' is used uninitialized [-Wuninitialized]
     114 |         unsigned long upper_index, upper_last;
         |                                    ^~~~~~~~~~


vim +/upper_index +114 drivers/base/regmap/regcache-maple.c

   106	
   107	static int regcache_maple_drop(struct regmap *map, unsigned int min,
   108				       unsigned int max)
   109	{
   110		struct maple_tree *mt = map->cache;
   111		MA_STATE(mas, mt, min, max);
   112		unsigned long *entry, *lower, *upper;
   113		unsigned long lower_index, lower_last;
 > 114		unsigned long upper_index, upper_last;
   115		int ret;
   116	
   117		lower = NULL;
   118		upper = NULL;
   119	
   120		mas_lock(&mas);
   121	
   122		mas_for_each(&mas, entry, max) {
   123			/*
   124			 * This is safe because the regmap lock means the
   125			 * Maple lock is redundant, but we need to take it due
   126			 * to lockdep asserts in the maple tree code.
   127			 */
   128			mas_unlock(&mas);
   129	
   130			/* Do we need to save any of this entry? */
   131			if (mas.index < min) {
   132				lower_index = mas.index;
   133				lower_last = min -1;
   134	
   135				lower = kmemdup(entry, ((min - mas.index) *
   136							sizeof(unsigned long)),
   137						GFP_KERNEL);
   138				if (!lower) {
   139					ret = -ENOMEM;
   140					goto out;
   141				}
   142			}
   143	
   144			if (mas.last > max) {
   145				upper_index = max + 1;
   146				upper_last = mas.last;
   147	
   148				upper = kmemdup(&entry[max + 1],
   149						((mas.last - max) *
   150						 sizeof(unsigned long)),
   151						GFP_KERNEL);
   152				if (!upper) {
   153					ret = -ENOMEM;
   154					goto out;
   155				}
   156			}
   157	
   158			kfree(entry);
   159			mas_lock(&mas);
   160			mas_erase(&mas);
   161	
   162			/* Insert new nodes with the saved data */
   163			if (lower) {
   164				mas_set_range(&mas, lower_index, lower_last);
   165				ret = mas_store_gfp(&mas, lower, GFP_KERNEL);
   166				if (ret != 0)
   167					goto out;
   168				lower = NULL;
   169			}
   170	
   171			if (upper) {
   172				mas_set_range(&mas, upper_index, upper_last);
   173				ret = mas_store_gfp(&mas, upper, GFP_KERNEL);
   174				if (ret != 0)
   175					goto out;
   176				upper = NULL;
   177			}
   178		}
   179	
   180	out:
   181		mas_unlock(&mas);
   182		kfree(lower);
   183		kfree(upper);
   184	
   185		return ret;
   186	}
   187	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
