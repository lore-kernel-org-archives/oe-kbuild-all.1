Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844306AC0
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Oct 2023 08:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696320246; x=1727856246;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n4F2wOOLBDJFMpc46JnAr3q6a4EW3ZBgtsu9aRYjZfE=;
  b=CApZHGLnRMknS743SLXvQRVH0ezP/eLrs6JV/3Njf//kfz/BO/nhl1vl
   LSzg4ja35uRFcD3CcEI5BqyiW8WUfDgZpMrKYhUP3axvYhcnWDTUsG61m
   oxuM4LqXsfyXH3Gm18WrHBQ0n1eFc0iHHPhxoR2MUgbDHADB1vrZlJH3j
   AzS2SCsWsP5Tjx29FVl/M9p2zqEiYF49pBGzCkboMQhaVwFxJcWxfpYOv
   qoLsyyuaaOXtyOpORuoLYRdrAUeoet5NuirZ5g86+o73ylBVwPH7j+aIT
   zdZTJhQ0pBcxtTmR89FZDiO63oxXcKG81xBqJ2yhrZRZk4GfdvBzmClUK
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="1408386"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="1408386"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 01:04:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="866781969"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="866781969"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 03 Oct 2023 01:04:03 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qnaNt-0006uP-18;
	Tue, 03 Oct 2023 08:04:01 +0000
Date: Tue, 3 Oct 2023 16:03:13 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-shrink-2e 36/37] lib/dynamic_debug.c:1430:6: warning: no
 previous prototype for function 'dd_clear_range'
Message-ID: <202310031624.xCencTRY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-shrink-2e
head:   71a19a8b881bc14025717ba9993f8efcd5e6a44b
commit: 7e48ff541ca0f9ab2496cfbd54976e38ee8910e8 [36/37] dyndbg: add dd_clear_range to prune mtrees
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20231003/202310031624.xCencTRY-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231003/202310031624.xCencTRY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310031624.xCencTRY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   lib/dynamic_debug.c:1408:6: warning: no previous prototype for function 'dd_store_range' [-Wmissing-prototypes]
   void dd_store_range(struct maple_tree *mt, const struct _ddebug *start, const struct _ddebug *next,
        ^
   lib/dynamic_debug.c:1408:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void dd_store_range(struct maple_tree *mt, const struct _ddebug *start, const struct _ddebug *next,
   ^
   static 
>> lib/dynamic_debug.c:1430:6: warning: no previous prototype for function 'dd_clear_range' [-Wmissing-prototypes]
   void dd_clear_range(const struct _ddebug *start)
        ^
   lib/dynamic_debug.c:1430:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void dd_clear_range(const struct _ddebug *start)
   ^
   static 
   2 warnings generated.


vim +/dd_clear_range +1430 lib/dynamic_debug.c

  1429	
> 1430	void dd_clear_range(const struct _ddebug *start)
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
