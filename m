Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C899762F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Mar 2023 04:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679804010; x=1711340010;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kFNku97bZt6y06wwP5iCpxBEPE+eUMrqt5tBnu/AXoo=;
  b=PpJd8dpKHBNXTSYE3bDNZlC/dA+MMsvUyIcX2+e+16W5muOgrFCq+zes
   qIt0rQ77S7fbYKZrvML/6wSfFsZujccZIFeZCfFYrus6QXiSXyV53MGQk
   Bpes9FTOFBOgVxlOFQV2frL3rgdUVcrDsR7EN/segeympmLC1/DUxH5jL
   qe9aS++M4+nNGJkQY6Ut37kpSzGRCuYj+tIW7ITWzalVGaQHE3BRndFvo
   2wIr9jlrcrJ65xX8d8g9c4Bh4sLVIbt+NAu2NmYNcmG8DqO0Ob/Ruw6eP
   jhKQEQdNG1iYfIQHfmDsooJ7NxHu0vqzZ9iwOJtwtEg94k5cEqcQ3K/t5
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10660"; a="341618968"
X-IronPort-AV: E=Sophos;i="5.98,291,1673942400"; 
   d="scan'208";a="341618968"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2023 21:13:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10660"; a="676596159"
X-IronPort-AV: E=Sophos;i="5.98,291,1673942400"; 
   d="scan'208";a="676596159"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 25 Mar 2023 21:13:29 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pgHl2-000Grv-1D;
	Sun, 26 Mar 2023 04:13:28 +0000
Date: Sun, 26 Mar 2023 12:13:17 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [broonie-ci:regcache-maple 9/9]
 drivers/base/regmap/regcache-maple.c:107:23: warning: 'lower_index' is used
 uninitialized
Message-ID: <202303261249.u43tji3k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git regcache-maple
head:   4af3053a956457882ba34e259c4ae8df3502caf4
commit: 4af3053a956457882ba34e259c4ae8df3502caf4 [9/9] regmap: Add maple tree based register cache
config: arc-randconfig-r012-20230326 (https://download.01.org/0day-ci/archive/20230326/202303261249.u43tji3k-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git/commit/?id=4af3053a956457882ba34e259c4ae8df3502caf4
        git remote add broonie-ci https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git
        git fetch --no-tags broonie-ci regcache-maple
        git checkout 4af3053a956457882ba34e259c4ae8df3502caf4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash drivers/base/regmap/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303261249.u43tji3k-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/base/regmap/regcache-maple.c: In function 'regcache_maple_drop':
>> drivers/base/regmap/regcache-maple.c:107:23: warning: 'lower_index' is used uninitialized [-Wuninitialized]
     107 |         unsigned long lower_index, lower_last;
         |                       ^~~~~~~~~~~
>> drivers/base/regmap/regcache-maple.c:107:36: warning: 'lower_last' is used uninitialized [-Wuninitialized]
     107 |         unsigned long lower_index, lower_last;
         |                                    ^~~~~~~~~~


vim +/lower_index +107 drivers/base/regmap/regcache-maple.c

   100	
   101	static int regcache_maple_drop(struct regmap *map, unsigned int min,
   102				       unsigned int max)
   103	{
   104		struct maple_tree *mt = map->cache;
   105		MA_STATE(mas, mt, min, max);
   106		unsigned long *entry, *lower, *upper;
 > 107		unsigned long lower_index, lower_last;
   108		unsigned long upper_index, upper_last;
   109		int ret;
   110	
   111		mas_for_each(&mas, entry, max) {
   112			lower = NULL;
   113			upper = NULL;
   114	
   115			/* Do we need to save any of this entry? */
   116			if (mas.index < min) {
   117				lower_index = mas.index;
   118				lower_last = min -1;
   119	
   120				lower = kmemdup(entry, ((min - mas.index) *
   121							sizeof(unsigned long)),
   122						GFP_KERNEL);
   123				if (!lower)
   124					return -ENOMEM;
   125			}
   126	
   127			if (mas.last > max) {
   128				upper_index = max + 1;
   129				upper_last = mas.last;
   130	
   131				upper = kmemdup(&entry[max + 1],
   132						((mas.last - max) *
   133						 sizeof(unsigned long)),
   134						GFP_KERNEL);
   135				if (!upper) {
   136					kfree(lower);
   137					return -ENOMEM;
   138				}
   139			}
   140	
   141			/* Delete the current entry */
   142			mas_erase(&mas);
   143			kfree(entry);
   144	
   145			/* Insert new nodes with the saved data */
   146			if (lower) {
   147				mas_set_range(&mas, lower_index, lower_last);
   148				ret = mas_store_gfp(&mas, lower, GFP_KERNEL);
   149				if (ret != 0) {
   150					kfree(lower);
   151					kfree(upper);
   152					return ret;
   153				}
   154			}
   155	
   156			if (upper) {
   157				mas_set_range(&mas, upper_index, upper_last);
   158				ret = mas_store_gfp(&mas, upper, GFP_KERNEL);
   159				if (ret != 0) {
   160					kfree(upper);
   161					return ret;
   162				}
   163			}
   164		}
   165	
   166		return 0;
   167	}
   168	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
