Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C9315A5
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Jul 2023 16:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688230578; x=1719766578;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xFjJrhB0mYv7/ZKDvGgkaqyFh6q6bLQSuMIBQgQF00w=;
  b=RrdB6I4Xcf4aQ84xeunJcttA43knokiwzXfD5Beguo3OqG6sd7H0zayB
   kOhqmS+EODktpJj4QxCPT8PgXO/lgTz+DeMK0115KZM0gQROcu44x7ZHJ
   hh4jUn39pAOjozcOsQskloqyJcgpQRHdFum6YKyradarAUggF44NNYOR9
   rTFaKt8k3xcCt0Eq5s4TmoPocyTTJzPQQ0iAhRomfOxhBFovjRseS1D8V
   xUp3Pfz9zxX6SGj5y/R2uvputot7Hh+8YXgMPm9lFJ+62Ws7u5Z4aT6aN
   vrVDXfgE7J/tUe1PQZ7JcDm9NSi1+bmDoe8ohPComBjMsVPOOri2ZcGcz
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10758"; a="347387893"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200"; 
   d="scan'208";a="347387893"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2023 09:56:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10758"; a="668317532"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200"; 
   d="scan'208";a="668317532"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 01 Jul 2023 09:56:16 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qFdtP-000G9B-30;
	Sat, 01 Jul 2023 16:56:15 +0000
Date: Sun, 2 Jul 2023 00:55:44 +0800
From: kernel test robot <lkp@intel.com>
To: SeongJae Park <sj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sj:damon/next 33/35] mm/damon/core.c:290:1: error: function
 declaration isn't a prototype
Message-ID: <202307020030.tSDmtlai-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
head:   b5a2d90d9d7d15714ca1dfb7bb74043ebd2a28d0
commit: 0389f4cef6f76094d3b2aed5bece0a4036dd859c [33/35] mm/damon/core: Implement moving_nr_accesses update function
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230702/202307020030.tSDmtlai-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230702/202307020030.tSDmtlai-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307020030.tSDmtlai-lkp@intel.com/

Note: the sj/damon/next HEAD b5a2d90d9d7d15714ca1dfb7bb74043ebd2a28d0 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> mm/damon/core.c:290:1: error: function declaration isn't a prototype [-Werror=strict-prototypes]
     290 | static unsigned int damon_pseudo_moving_average_add(unsigned int current,
         | ^~~~~~
   mm/damon/core.c: In function 'damon_record_access_to_region':
>> mm/damon/core.c:320:25: error: 'max_nr_accesses' undeclared (first use in this function)
     320 |                         max_nr_accesses);
         |                         ^~~~~~~~~~~~~~~
   mm/damon/core.c:320:25: note: each undeclared identifier is reported only once for each function it appears in
   mm/damon/core.c:318:31: warning: passing argument 1 of 'damon_pseudo_moving_average_add' makes pointer from integer without a cast [-Wint-conversion]
     318 |                         region->moving_accesses_bp,
         |                         ~~~~~~^~~~~~~~~~~~~~~~~~~~
         |                               |
         |                               unsigned int
   In file included from include/linux/sched.h:12,
                    from include/linux/cgroup.h:12,
                    from include/linux/memcontrol.h:13,
                    from include/linux/damon.h:11,
                    from mm/damon/core.c:10:
   arch/x86/include/asm/current.h:44:17: note: expected 'unsigned int (*)()' but argument is of type 'unsigned int'
      44 | #define current get_current()
   mm/damon/core.c:290:66: note: in expansion of macro 'current'
     290 | static unsigned int damon_pseudo_moving_average_add(unsigned int current,
         |                                                                  ^~~~~~~
   cc1: some warnings being treated as errors


vim +290 mm/damon/core.c

   276	
   277	/*
   278	 * damon_pseudo_moving_average_add() - Return pseudo-moving average value.
   279	 * @current:	Current value of the pseudo moving average.
   280	 * @delta:	New value that will be added to the pseudo moving average/
   281	 * @len_widnow:	The length of the window of the moving average.
   282	 *
   283	 * Moving average is good for handling noise, but the cost of keeping the past
   284	 * window values can be high for arbitrary window size.  This function
   285	 * implements lightweight pseudo moving average function, which doesn't keep
   286	 * the past window values, but assumes the there was no noise in the past.
   287	 *
   288	 * Return: Pseudo-moving average after getting the @delta.
   289	 */
 > 290	static unsigned int damon_pseudo_moving_average_add(unsigned int current,
   291			unsigned int delta, unsigned int len_window)
   292	{
   293		return current - current / len_window + delta;
   294	}
   295	
   296	/**
   297	 * damon_record_access_to_region() - Apply access finding for a region.
   298	 * @region:	The DAMON region to update its access frequency.
   299	 * @accessed:	Whether the region has accessed.
   300	 * @attrs:	The monitoring attributes.
   301	 *
   302	 * Apply found access or idleness to a region by updating the access rate
   303	 * fields of the region.  Normally called by underlying operations set to apply
   304	 * each of their access check results to a each region.
   305	 */
   306	void damon_record_access_to_region(struct damon_region *region, bool accessed,
   307			struct damon_attrs *attrs)
   308	{
   309		unsigned int len_window = 1;
   310	
   311		/*
   312		 * sample_interval can be zero, but cannot be larger than
   313		 * aggr_interval, owing to validation of damon_set_attrs().
   314		 */
   315		if (attrs->sample_interval)
   316			len_window = attrs->aggr_interval / attrs->sample_interval;
   317		region->moving_accesses_bp = damon_pseudo_moving_average_add(
   318				region->moving_accesses_bp,
   319				accessed ? 10000 / len_window : 0,
 > 320				max_nr_accesses);
   321	
   322		region->nr_accesses += accessed ? 1 : 0;
   323	}
   324	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
