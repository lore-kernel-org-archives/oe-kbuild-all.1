Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C0418EFCC
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Sep 2024 00:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726966335; cv=none; b=W0dP2gB8pjF5rxnKt/miUKbDRpNCN2c9J9FdnKTUxi8Z0cyE8Y9tbhLdPMwOt/y6Vvx1QbOMLHTFTNaGc2VG/9DVoXdz+du0gkgT66YIOjTFa/mAHKVSuywPIuWFX38UMAw6aTpJtnlORb5BNDRlbH8f8HbMHs/n3Mu6wrwuEJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726966335; c=relaxed/simple;
	bh=ksU3ftA7bitSW26BG0ohKw6FXbsJVPMiS2b4BQ+uDOw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fKeYgcAEo6BT87PeFGqmc14tjEUhXZB6Sc+QSCOkjaZPKCq+pcavQ2rGXyzjTvMLU98RIkJGPcoUocjrU8Viiqps5fkIW86evZKS74M2Vzk03hFvICk0fvpMji60ij66TYVwz95W556cPrsAjk6Z9RsLYjEGiUVtvmlkxJSKcKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PQjoYlQM; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PQjoYlQM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726966333; x=1758502333;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ksU3ftA7bitSW26BG0ohKw6FXbsJVPMiS2b4BQ+uDOw=;
  b=PQjoYlQM5quyGegACRU6LTWoqGJ8qmcYP4jM/cBze0D3S+AeR+QhGj3V
   0/hZsAB66CQh9d/Ys8QAlWRjqcct1THqNqabYPMRrhE+7e0sjGtWwcqp1
   BMo55VeXeedqFHz2f4X7XXE/PLctFK2hL3B1kpNcVEsAvj48gSNLtOLEb
   vHYG18GdDi9SnZKU1c9IhrkHuqRonMbswTlcswaiwX/2/6T+iPcOm+zrg
   VzoZWmB0azeJzWJd8xS4l1sb30Y/8gfTDh0bvz5R30aCt1+XZ7e2ORuiq
   92L9oSi7YYqJn6oCJ9ya1hZk1dN1R5TH/pHSL43RXAK8IrPP7FC0f4qxc
   A==;
X-CSE-ConnectionGUID: E5RWx2pnSZqP/QJrdMnxbg==
X-CSE-MsgGUID: 2+ulMrONQcOOEeO0wlSA8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="29729695"
X-IronPort-AV: E=Sophos;i="6.10,248,1719903600"; 
   d="scan'208";a="29729695"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2024 17:52:12 -0700
X-CSE-ConnectionGUID: wqxEvKsNTPK8qiC6F4xbDQ==
X-CSE-MsgGUID: GhnoOq2FSnqjj9JSvyJFAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,248,1719903600"; 
   d="scan'208";a="71129979"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 21 Sep 2024 17:52:11 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssApc-000FuY-1K;
	Sun, 22 Sep 2024 00:52:08 +0000
Date: Sun, 22 Sep 2024 08:51:21 +0800
From: kernel test robot <lkp@intel.com>
To: kaiyang2@cs.cmu.edu
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 3/4] use memory.low local node protection for local
 node reclaim
Message-ID: <202409221032.DoTv9B0p-lkp@intel.com>
References: <20240920221202.1734227-4-kaiyang2@cs.cmu.edu>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240920221202.1734227-4-kaiyang2@cs.cmu.edu>

Hi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master next-20240920]
[cannot apply to tip/sched/core v6.11]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/kaiyang2-cs-cmu-edu/Add-get_cgroup_local_usage-for-estimating-the-top-tier-memory-usage/20240921-061404
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20240920221202.1734227-4-kaiyang2%40cs.cmu.edu
patch subject: [RFC PATCH 3/4] use memory.low local node protection for local node reclaim
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20240922/202409221032.DoTv9B0p-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240922/202409221032.DoTv9B0p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409221032.DoTv9B0p-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/memcontrol.c:4499: warning: Function parameter or struct member 'is_local' not described in 'mem_cgroup_calculate_protection'


vim +4499 mm/memcontrol.c

c077719be8e9e6 KAMEZAWA Hiroyuki   2009-01-07  4488  
241994ed8649f7 Johannes Weiner     2015-02-11  4489  /**
05395718b2fe48 Mel Gorman          2021-06-30  4490   * mem_cgroup_calculate_protection - check if memory consumption is in the normal range
34c81057927311 Sean Christopherson 2017-07-10  4491   * @root: the top ancestor of the sub-tree being checked
241994ed8649f7 Johannes Weiner     2015-02-11  4492   * @memcg: the memory cgroup to check
241994ed8649f7 Johannes Weiner     2015-02-11  4493   *
230671533d6463 Roman Gushchin      2018-06-07  4494   * WARNING: This function is not stateless! It can only be used as part
230671533d6463 Roman Gushchin      2018-06-07  4495   *          of a top-down tree iteration, not for isolated queries.
241994ed8649f7 Johannes Weiner     2015-02-11  4496   */
45c7f7e1ef17f0 Chris Down          2020-08-06  4497  void mem_cgroup_calculate_protection(struct mem_cgroup *root,
3ebe5883ec39d9 Kaiyang Zhao        2024-09-20  4498  				     struct mem_cgroup *memcg, int is_local)
241994ed8649f7 Johannes Weiner     2015-02-11 @4499  {
a8585ac6862198 Maarten Lankhorst   2024-07-03  4500  	bool recursive_protection =
a8585ac6862198 Maarten Lankhorst   2024-07-03  4501  		cgrp_dfl_root.flags & CGRP_ROOT_MEMORY_RECURSIVE_PROT;
230671533d6463 Roman Gushchin      2018-06-07  4502  
241994ed8649f7 Johannes Weiner     2015-02-11  4503  	if (mem_cgroup_disabled())
45c7f7e1ef17f0 Chris Down          2020-08-06  4504  		return;
241994ed8649f7 Johannes Weiner     2015-02-11  4505  
34c81057927311 Sean Christopherson 2017-07-10  4506  	if (!root)
34c81057927311 Sean Christopherson 2017-07-10  4507  		root = root_mem_cgroup;
22f7496f0b9012 Yafang Shao         2020-08-06  4508  
6f4c005a5f8b8f Kaiyang Zhao        2024-09-20  4509  	page_counter_calculate_protection(&root->memory, &memcg->memory,
3ebe5883ec39d9 Kaiyang Zhao        2024-09-20  4510  					recursive_protection, is_local);
241994ed8649f7 Johannes Weiner     2015-02-11  4511  }
241994ed8649f7 Johannes Weiner     2015-02-11  4512  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
