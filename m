Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9827E5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Mar 2023 16:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680108255; x=1711644255;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zxtHb1N4+kKnGOo66Y7BM99FxPHmqMPmDBehfEPU3xM=;
  b=NcsP4LnKiYfqjXuE4wLA+wW6BCUFy9rt9ZBkSyR8tn+KZWUtMRsio7Z7
   W/Q/TAGpGoUrJhXwsd1/jsqIIyGB0FcxD+Sa+dyKg8Po/8p8QLAl1u4hg
   f8wSYuuc6TZ6L8oq+V7BOujHnrAGAwCDliSzR/wEF2PZ8jonbS/OUIYg2
   DNaF+no99QMRafux2GoHJcrE6b3+l4Js9wWZe+N0ulB65vqarpg+U10Sp
   MQTx9q2G4rc0YZNojIk2G+yPQoW9VwQbqe38VQSN41fBddWoJ46d0kUAj
   ssBe3wcNgaYq0ZMU86166nrwB/vjxkI7zX9RBt/dn+KOt0BA3yDb6c3r0
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="329412610"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="329412610"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 09:43:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="773639677"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="773639677"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 29 Mar 2023 09:43:06 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phYt3-000JjG-16;
	Wed, 29 Mar 2023 16:43:01 +0000
Date: Thu, 30 Mar 2023 00:42:51 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [broonie-ci:regcache-maple 9/9]
 drivers/base/regmap/regcache-maple.c:113:23: warning: 'lower_index' is used
 uninitialized
Message-ID: <202303300025.IHHoQsfs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git regcache-maple
head:   3d72d594813f7cb01e847dd00b22e13d0dbd9747
commit: d0ad050978356732a879889e796425bce31b8cbd [9/9] regmap: Add maple tree based register cache
config: arc-randconfig-r013-20230329 (https://download.01.org/0day-ci/archive/20230330/202303300025.IHHoQsfs-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git/commit/?id=d0ad050978356732a879889e796425bce31b8cbd
        git remote add broonie-ci https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git
        git fetch --no-tags broonie-ci regcache-maple
        git checkout d0ad050978356732a879889e796425bce31b8cbd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash drivers/base/regmap/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303300025.IHHoQsfs-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/base/regmap/regcache-maple.c: In function 'regcache_maple_drop':
>> drivers/base/regmap/regcache-maple.c:113:23: warning: 'lower_index' is used uninitialized [-Wuninitialized]
     113 |         unsigned long lower_index, lower_last;
         |                       ^~~~~~~~~~~
>> drivers/base/regmap/regcache-maple.c:113:36: warning: 'lower_last' is used uninitialized [-Wuninitialized]
     113 |         unsigned long lower_index, lower_last;
         |                                    ^~~~~~~~~~


vim +/lower_index +113 drivers/base/regmap/regcache-maple.c

   106	
   107	static int regcache_maple_drop(struct regmap *map, unsigned int min,
   108				       unsigned int max)
   109	{
   110		struct maple_tree *mt = map->cache;
   111		MA_STATE(mas, mt, min, max);
   112		unsigned long *entry, *lower, *upper;
 > 113		unsigned long lower_index, lower_last;
   114		unsigned long upper_index, upper_last;
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
