Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B27E17983
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Nov 2023 10:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ngnepmHI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699268199; x=1730804199;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kUk/AHnQ1tdwexuTywx6eKDuJHxVESUVsU/KUnzZrIw=;
  b=ngnepmHINxRA/NueoKhEec2TC2LOF25X6K+ys7Ny6VC4G0XFeJjG4/Bm
   9UrPGPpu0hYPiLD1c3t4EdmE5lQzkB9lmr0/d5vOwg/P1nwAAZIqzijPY
   qOSggxFPYYyPAnpMt8mW3LBFZPrNsEE4SxfoLRDInsQBlqU/h8z/POSn/
   yJ3HfdnVRupXg5OV7zAWRi1gMooN7Q/lOKDNO6h/j9hiDy/yfBPYXk1kN
   +PUQDraP+o7QUCliUTjivXc/P/RnKC6MYmvHPgA3bzPO6tNxTqDiNme2k
   CQC279hwADt40k6Z03h2OQQQp9A2UlGXLcErmuOJCmZi1g1mOopEwKnEI
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="2240842"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="2240842"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 02:56:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="852950787"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="852950787"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 06 Nov 2023 02:56:36 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzxHW-0006Ls-1U;
	Mon, 06 Nov 2023 10:56:34 +0000
Date: Mon, 6 Nov 2023 18:55:34 +0800
From: kernel test robot <lkp@intel.com>
To: SeongJae Park <sj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sj:damon/next 42/42] mm/damon/sysfs-schemes.c:1869:15: warning: no
 previous prototype for 'damos_sysfs_get_quota_score'
Message-ID: <202311061837.b0wFOPEh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
head:   b00bae1288606fa36c98bfcb8400938c39c2bf5b
commit: b00bae1288606fa36c98bfcb8400938c39c2bf5b [42/42] mm/damon/sysfs-schemes: implement damos quota goal
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231106/202311061837.b0wFOPEh-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231106/202311061837.b0wFOPEh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311061837.b0wFOPEh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/damon/sysfs-schemes.c:1869:15: warning: no previous prototype for 'damos_sysfs_get_quota_score' [-Wmissing-prototypes]
    1869 | unsigned long damos_sysfs_get_quota_score(void *arg)
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/damos_sysfs_get_quota_score +1869 mm/damon/sysfs-schemes.c

  1868	
> 1869	unsigned long damos_sysfs_get_quota_score(void *arg)
  1870	{
  1871		struct damos_sysfs_quota_goal_values *values = arg;
  1872	
  1873		return values->current_value * 10000 / values->target_value;
  1874	}
  1875	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
