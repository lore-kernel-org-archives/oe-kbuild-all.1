Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E8E23A5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jun 2023 06:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686638382; x=1718174382;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eVy44c9wk3Ukqljb2SkA3VD8r2cw1smK5K4A4/zrRUA=;
  b=jwM3lgi8S4aXU678nSYT3jcigcqAOLEhstuf/cV9a393Aq99/HtWOj0l
   RdZ8V0sTLWDR7XbAqkOJVVCtMD204woykEHfS9iofxGOVgGaNVlD5+J3a
   2Bdf7LaUGxVWWuxivUrHaRoxsPoA7veN52DK0g1dMts2VwBQc+Dg07Z4n
   Dpr3+gNYsiSnB4+PJVnEKmI1Bsczt/OkUGgjzSWb/xDtyJ+GbDGItLRCJ
   56fH9fMHkga2ZSkzHsuLuMI76gZ3GcmkKZRROHM1eWStbAJ1cdUAQgwo9
   /3DU7sSqWVjh8pThGvg7NJcnmPdt9LRcM0Qc/bFpz/qSXNDxcNP3BCcrE
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="338603283"
X-IronPort-AV: E=Sophos;i="6.00,238,1681196400"; 
   d="scan'208";a="338603283"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2023 23:39:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="661896362"
X-IronPort-AV: E=Sophos;i="6.00,238,1681196400"; 
   d="scan'208";a="661896362"
Received: from lkp-server01.sh.intel.com (HELO 211f47bdb1cb) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 12 Jun 2023 23:39:40 -0700
Received: from kbuild by 211f47bdb1cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q8xgp-00014W-1q;
	Tue, 13 Jun 2023 06:39:39 +0000
Date: Tue, 13 Jun 2023 14:39:19 +0800
From: kernel test robot <lkp@intel.com>
To: Karolina Stolarek <karolina.stolarek@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 3/3] drm/ttm/tests: Add tests for ttm_pool
Message-ID: <202306131457.mchJMaiB-lkp@intel.com>
References: <042feb7cc902f7fd78daf131a691d4afc14d3d8c.1686563485.git.karolina.stolarek@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <042feb7cc902f7fd78daf131a691d4afc14d3d8c.1686563485.git.karolina.stolarek@intel.com>

Hi Karolina,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.4-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Karolina-Stolarek/drm-ttm-tests-Add-tests-for-ttm_device/20230612-210534
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/042feb7cc902f7fd78daf131a691d4afc14d3d8c.1686563485.git.karolina.stolarek%40intel.com
patch subject: [RFC PATCH 3/3] drm/ttm/tests: Add tests for ttm_pool
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230613/202306131457.mchJMaiB-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add drm-misc git://anongit.freedesktop.org/drm/drm-misc
        git fetch drm-misc drm-misc-next
        git checkout drm-misc/drm-misc-next
        b4 shazam https://lore.kernel.org/r/042feb7cc902f7fd78daf131a691d4afc14d3d8c.1686563485.git.karolina.stolarek@intel.com
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306131457.mchJMaiB-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: missing MODULE_LICENSE() in drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.o
ERROR: modpost: "ttm_kunit_helper_alloc_device" [drivers/gpu/drm/ttm/tests/ttm_device_test.ko] undefined!
ERROR: modpost: "ttm_dev_funcs" [drivers/gpu/drm/ttm/tests/ttm_device_test.ko] undefined!
ERROR: modpost: "ttm_test_devices_init" [drivers/gpu/drm/ttm/tests/ttm_device_test.ko] undefined!
ERROR: modpost: "ttm_test_devices_fini" [drivers/gpu/drm/ttm/tests/ttm_device_test.ko] undefined!
>> ERROR: modpost: "ttm_kunit_helper_ttm_bo_init" [drivers/gpu/drm/ttm/tests/ttm_pool_test.ko] undefined!
>> ERROR: modpost: "ttm_kunit_helper_ttm_bo_fini" [drivers/gpu/drm/ttm/tests/ttm_pool_test.ko] undefined!
>> ERROR: modpost: "ttm_pool_init" [drivers/gpu/drm/ttm/tests/ttm_pool_test.ko] undefined!
>> ERROR: modpost: "ttm_pool_fini" [drivers/gpu/drm/ttm/tests/ttm_pool_test.ko] undefined!
>> ERROR: modpost: "ttm_test_devices_init" [drivers/gpu/drm/ttm/tests/ttm_pool_test.ko] undefined!
>> ERROR: modpost: "ttm_test_devices_fini" [drivers/gpu/drm/ttm/tests/ttm_pool_test.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
