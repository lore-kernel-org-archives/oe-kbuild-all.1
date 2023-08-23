Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3CCC131
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Aug 2023 13:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692798738; x=1724334738;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ccRGj4JDzPDlov4pIdHbIkTOQDKcVms/N0XZd4Tge4w=;
  b=RpfxucLRvxcKhR1EMZmedylff57f2R/yrbSWte2QttE7dG2kKofeOfom
   5d/Q4yFeLAMBu/g03pyxrApJjglAvZPZiSuaIDhgB+Nz+g0RMxXw4+qaI
   Mpgwb7hyqJkivci/5813jwJCfLCv/mKy9TyEO+CZTyy+X6aQfnLlntREy
   ZwaqXl9gZpKEcExdkWSxqTEvXCXRfTILjtKjZXCyScwHjQluFLQCxBiGN
   pLpJeCIlH2wuNXnilHJMC5Y1x9MJX1e6EyYNHJtMES1hWSQn4i7YRnHTu
   9TeFpkUtCnb1dcpzA3mnLBY2mCEMOldJ3w/b6fsFRvVMW+rXl0N09rJs7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="405166150"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="405166150"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 06:52:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="826734543"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="826734543"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 23 Aug 2023 06:52:15 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYoHO-0001FQ-2c;
	Wed, 23 Aug 2023 13:52:14 +0000
Date: Wed, 23 Aug 2023 21:51:47 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:maph 6/7] lib/test_map_h.c:32:13: warning: 'MAPH_BUILD_BUG'
 defined but not used
Message-ID: <202308232127.6vsYZhdm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git maph
head:   7f5a5e57c1ce6971acdfa13d3e177b14fe615838
commit: 3acf936f65d59ef4588b1c10924acc77c157b205 [6/7] strip-used-MAPH-BB
config: arm-randconfig-001-20230822 (https://download.01.org/0day-ci/archive/20230823/202308232127.6vsYZhdm-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308232127.6vsYZhdm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308232127.6vsYZhdm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/test_map_h.c:32:13: warning: 'MAPH_BUILD_BUG' defined but not used [-Wunused-function]
      32 | static void MAPH_BUILD_BUG(void)
         |             ^~~~~~~~~~~~~~


vim +/MAPH_BUILD_BUG +32 lib/test_map_h.c

    25	
    26	#define BUILD_BUG_STREQ(_var, ref)					\
    27		BUILD_BUG_ON(__builtin_memcmp(_var, ref, __builtin_strlen(ref)))
    28	#define BUILD_BUG_STREQ_VI(_vec_, idx, ref)		\
    29		BUILD_BUG_STREQ(_vec_##_names[idx], ref)
    30	
    31	/* force compile, even if its not called */
  > 32	static void MAPH_BUILD_BUG(void)
    33	{
    34		BUILD_BUG_ON(sum != 6);
    35		BUILD_BUG_STREQ(caten, "YESNOMAYBE");
    36	
    37		BUILD_BUG_STREQ_VI(debug_cats, 0, "DRMx_CORE");
    38		BUILD_BUG_STREQ_VI(debug_cats, 1, "DRMx_DRIVER");
    39		BUILD_BUG_STREQ_VI(debug_cats, 2, "DRMx_KMS");
    40	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
