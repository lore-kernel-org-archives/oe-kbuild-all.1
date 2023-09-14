Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57128ED9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Sep 2023 06:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694674703; x=1726210703;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8vedmYXU1hL+rLYQXYwSyVor1LSA/qKNDfFa1UOetpM=;
  b=RTib416rze3kZI/5sLtqalmnaqqn2L51blSpjLC3SVCRCM63fwUop4PL
   8oGnpDw43Omj+ZN6aTI5H3R0b5px2carGgkA/F4iumK5D5YktJMzwHtgU
   5DwIyaYcwLh0qpohNlEejNn6sgBihjVui3rqFxMJ3oukk5/7zxkeYGGTl
   +f4SjGkIuq1a2Ath/kukhXo5XP1kdqcb4kp8VMkkfze6Xmaaql8RbAry2
   CqPs73imGMy9rGxQ7QdYHF1WhWHLEFBbllqWHToDbluIhguvviDZEs8Jx
   vmbhj63+Ze/nJ7baPOGyFrSEV9XKb5m+SlaCGrowC+pq8CuEnQ+BN7u3V
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="359132459"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; 
   d="scan'208";a="359132459"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 23:58:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="737813328"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; 
   d="scan'208";a="737813328"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 13 Sep 2023 23:58:16 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qggIo-0001IL-0u;
	Thu, 14 Sep 2023 06:58:14 +0000
Date: Thu, 14 Sep 2023 14:58:11 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morse:mpam/snapshot/v6.5-rc1 52/154] fs/resctrl/monitor.c:584:30:
 warning: variable 'r' set but not used
Message-ID: <202309141401.jwoof029-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi James,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.5-rc1
head:   47a123f932a23dc3eff4110197949d418914a4ac
commit: eb73c346f06a1570cd8a6791164482440dafc0fc [52/154] x86/resctrl: Move all the filesystem code to /fs/resctrl
config: i386-randconfig-011-20230914 (https://download.01.org/0day-ci/archive/20230914/202309141401.jwoof029-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230914/202309141401.jwoof029-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309141401.jwoof029-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/resctrl/monitor.c: In function 'cqm_handle_limbo':
>> fs/resctrl/monitor.c:584:30: warning: variable 'r' set but not used [-Wunused-but-set-variable]
     584 |         struct rdt_resource *r;
         |                              ^


vim +/r +584 fs/resctrl/monitor.c

   576	
   577	/*
   578	 * Handler to scan the limbo list and move the RMIDs
   579	 * to free list whose occupancy < threshold_occupancy.
   580	 */
   581	void cqm_handle_limbo(struct work_struct *work)
   582	{
   583		unsigned long delay = msecs_to_jiffies(CQM_LIMBOCHECK_INTERVAL);
 > 584		struct rdt_resource *r;
   585		struct rdt_domain *d;
   586		int cpu;
   587	
   588		mutex_lock(&rdtgroup_mutex);
   589	
   590		r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
   591		d = container_of(work, struct rdt_domain, cqm_limbo.work);
   592	
   593		__check_limbo(d, false);
   594	
   595		if (has_busy_rmid(d)) {
   596			cpu = cpumask_any_housekeeping(&d->cpu_mask);
   597			schedule_delayed_work_on(cpu, &d->cqm_limbo, delay);
   598		}
   599	
   600		mutex_unlock(&rdtgroup_mutex);
   601	}
   602	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
