Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60E136B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Nov 2023 00:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UvejQzi1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700355565; x=1731891565;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Pbf5bjSXH9S9BeKa0XAWshh8bN6iYo1416hY+iTMM/Y=;
  b=UvejQzi1qqGmmqIePl1vd9Ffr/nZk1qgPP4/g7S/MYvptOXBtQTBQbjT
   Kzv9i8vPetmzzzjZfbCICJlKWp6/fv+b0ysBCks2gTrwpntpyTTFyAN2Y
   aRRMjksW8G9Jw+TVBYUBV9Dx8YwAgslR56P4cIMJP1T+osV3iQEcEz/kY
   NzOKDIdSkU66TQowskDRyoP4qoVENobgHTSITY2wdYlO7/uTIkX7qaT2N
   X5yqtcd8DNnsg3OEMyLPDmB2xXh3IvuUNIv8b8Lg2RmcqJuSavFM/gr2K
   5rIHCH1SJef5a9vXuDAv3G7w9jPqvw9SqWDpFz2YSdTWw1SGc4DX9arYW
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10898"; a="376505138"
X-IronPort-AV: E=Sophos;i="6.04,209,1695711600"; 
   d="scan'208";a="376505138"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2023 16:59:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10898"; a="909748652"
X-IronPort-AV: E=Sophos;i="6.04,209,1695711600"; 
   d="scan'208";a="909748652"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 18 Nov 2023 16:59:24 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4W9h-0004Ug-39;
	Sun, 19 Nov 2023 00:59:21 +0000
Date: Sun, 19 Nov 2023 08:59:05 +0800
From: kernel test robot <lkp@intel.com>
To: SeongJae Park <sj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sj:damon/next 7/40] mm/damon/core-test.h:301:43: warning: large
 integer implicitly truncated to unsigned type
Message-ID: <202311190815.NSeoMUOt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
head:   8dbdd274afed68979a606009d184cc9fd9dcc48c
commit: c5b4cd2968f94e487351a07c141023e44a2e9d3d [7/40] mm/damon/core-test: test overflow-causing divide-by-zero
config: i386-buildonly-randconfig-001-20231119 (https://download.01.org/0day-ci/archive/20231119/202311190815.NSeoMUOt-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231119/202311190815.NSeoMUOt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311190815.NSeoMUOt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/damon/core.c:1689:0:
   mm/damon/core-test.h: In function 'damon_test_nr_accesses_to_accesses_bp':
>> mm/damon/core-test.h:301:43: warning: large integer implicitly truncated to unsigned type [-Woverflow]
      .sample_interval = 10, .aggr_interval = 42949672960,};
                                              ^~~~~~~~~~~


vim +301 mm/damon/core-test.h

   297	
   298	static void damon_test_nr_accesses_to_accesses_bp(struct kunit *test)
   299	{
   300		struct damon_attrs attrs = {
 > 301			.sample_interval = 10, .aggr_interval = 42949672960,};
   302	
   303		KUNIT_EXPECT_EQ(test, damon_nr_accesses_to_accesses_bp(123, &attrs), 0);
   304	}
   305	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
