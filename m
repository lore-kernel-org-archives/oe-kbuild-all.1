Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D036915A0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Aug 2023 05:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693373537; x=1724909537;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8tREY7aQ/zshwdZJ2jXu8UcapSgvHULn2p5TqqugSRM=;
  b=hyHeNZkwGCPRGj77aSHCa2B2Ukv+HVPZMN+Vow66GaxVX4FR6D8m+E2Y
   Ku6MS0ip75Yd+PPWHT/u2G3HKYMuQYLj8zumWZ8OteB7tJqR8l4KKg6Go
   khMuovKbd4FlZbyhVqdRDvWRCZ/8HzFQ2qA8QGYsBWfohqBcjOcdaBkXH
   47sJ5j3dsmFpA9zgZlrjJSBvc9K+b7bccsGiPP6qYdSerFrh2Mme9vOxK
   jC3AiqN4qky2kkUFf+JPvCMcfXzZG9D3eKuxmJNcrqOblTIcQxAQxXkei
   V4hmOoJbzdyzXj5SeVOGFrNXlKaE6AoeLkkTlKCy5QcD1Mffc0TXvossd
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="360551155"
X-IronPort-AV: E=Sophos;i="6.02,212,1688454000"; 
   d="scan'208";a="360551155"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2023 22:32:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="1069716107"
X-IronPort-AV: E=Sophos;i="6.02,212,1688454000"; 
   d="scan'208";a="1069716107"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 29 Aug 2023 22:32:15 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbDoM-0009SZ-3B;
	Wed, 30 Aug 2023 05:32:14 +0000
Date: Wed, 30 Aug 2023 13:31:54 +0800
From: kernel test robot <lkp@intel.com>
To: SeongJae Park <sj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sj:damon/next 33/46] mm/damon/core.c:1612: warning: Function
 parameter or member 'r' not described in 'damon_update_region_access_rate'
Message-ID: <202308301305.GdlrAUWM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
head:   15d82784a3f9e2e8a4c635de097a86ddc744845d
commit: 2ca3eed468aa3862415dc3fee90bba1b46f7cc2b [33/46] mm/damon/core: define and use dedicated function for region access rate update
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230830/202308301305.GdlrAUWM-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230830/202308301305.GdlrAUWM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308301305.GdlrAUWM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/damon/core.c:1612: warning: Function parameter or member 'r' not described in 'damon_update_region_access_rate'
>> mm/damon/core.c:1612: warning: Excess function parameter 'region' description in 'damon_update_region_access_rate'


vim +1612 mm/damon/core.c

  1600	
  1601	/**
  1602	 * damon_update_region_access_rate() - Update the access rate of a region.
  1603	 * @region:    The DAMON region to update for its access check result.
  1604	 * @accessed:  Whether the region has accessed during last sampling interval.
  1605	 *
  1606	 * Update the access rate of a region with the region's last sampling interval
  1607	 * access check result.
  1608	 *
  1609	 * Usually this will be called by &damon_operations->check_accesses callback.
  1610	 */
  1611	void damon_update_region_access_rate(struct damon_region *r, bool accessed)
> 1612	{
  1613		if (accessed)
  1614			r->nr_accesses++;
  1615	}
  1616	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
