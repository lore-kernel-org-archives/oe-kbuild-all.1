Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2FCE81C
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Oct 2023 01:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696384094; x=1727920094;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7Wulz3pNrx8vrZLqxnJYUa0Tn5SCrOB2S7jq+Wj15mM=;
  b=f8cB0GKMDRvVdfU8pv4op++r0cNfIC3u3LYchmWyyJ2RIqVA/gG4IW2f
   LnIezd11uCT8umL5qlixeS4skslzyaS7gsOn+5vYtXiFFdKUXjs3n4Rzb
   42lNMruqTdNaMdgAP7/1OxumxRj1DKl8BPU1hUh9P3nTAtU326rX5Vniy
   HLxee1PDjO218SbUt0cN1nr34QvBd5O4EZ3/KoyVlvp6pbFA7cgguq90c
   GRLP/AM3KKm3/yOSALs95wONqe/lGIddPFhwVY2Lta6LUL+Fvw5/kqdl2
   onB0YCfIDU0gqw2ZrTi48Pko2lBJydqtHiuw4Zyt7FQT2KQp/083erWI2
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="382930850"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; 
   d="scan'208";a="382930850"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 18:48:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="751103486"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; 
   d="scan'208";a="751103486"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 03 Oct 2023 18:48:12 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qnqzi-000AGb-16;
	Wed, 04 Oct 2023 01:48:10 +0000
Date: Wed, 4 Oct 2023 09:47:47 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-trc-11b 36/52] lib/dynamic_debug.c:1430:13: warning:
 'dd_clear_range' defined but not used
Message-ID: <202310040909.XS3yCd2P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-trc-11b
head:   ca5b494a434f7c552232a27b5f601a9d9a1c6e25
commit: 21a6ac01841fb3fb3e6b5dd778ff9de3a947af91 [36/52] dyndbg: add dd_clear_range to prune mtrees
config: loongarch-randconfig-001-20231004 (https://download.01.org/0day-ci/archive/20231004/202310040909.XS3yCd2P-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231004/202310040909.XS3yCd2P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310040909.XS3yCd2P-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/dynamic_debug.c:1430:13: warning: 'dd_clear_range' defined but not used [-Wunused-function]
    1430 | static void dd_clear_range(const struct _ddebug *start)
         |             ^~~~~~~~~~~~~~


vim +/dd_clear_range +1430 lib/dynamic_debug.c

  1429	
> 1430	static void dd_clear_range(const struct _ddebug *start)
  1431	{
  1432		v3pr_info("clearing %px\n", start);
  1433		mtree_erase(&mt_funcs, (unsigned long)start);
  1434		mtree_erase(&mt_files, (unsigned long)start);
  1435		mtree_erase(&mt_mods, (unsigned long)start);
  1436	}
  1437	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
