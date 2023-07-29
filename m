Received: from mgamail.intel.com (unknown [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA1938D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Jul 2023 02:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690599167; x=1722135167;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wRmWlmnkYcMm0KElku8rjGAQywsH03gzV7Z18mWXGxw=;
  b=Z9nzMjQ6X3GoJK3iXvkWwrDB7Riyf+YaTgEB2oRmCHIKCV511AfPV0Up
   jtEwNfs1QkZ1Ck+orKwM/v6Qi5T0FZOtYd5zR7rmFdC4tQTpXzD73iPbU
   DUiPZ1c2Lqq0RX9uaePFLCJLy1a3O71Id6DoARnNjFOwP+oAwsZntr2y2
   hkoDr1B20V1POipciJAmgbC2lO3wgF0RZalwlC04gKCot5RcZ8kFswWLP
   O5Di5JGpQy2T6WgO3R+R/QvapkneesYq3UJAo5e20x+eGf8KYG1tOPZm/
   Wh/qJ3cDc8BrTgQ+6QNn2AOaYDd8wuE3oHfZi8GtIYFA/H3CjU88pFYX2
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="366191987"
X-IronPort-AV: E=Sophos;i="6.01,239,1684825200"; 
   d="scan'208";a="366191987"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2023 19:52:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="841531418"
X-IronPort-AV: E=Sophos;i="6.01,239,1684825200"; 
   d="scan'208";a="841531418"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 28 Jul 2023 19:52:45 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPa4T-0003mJ-0H;
	Sat, 29 Jul 2023 02:52:45 +0000
Date: Sat, 29 Jul 2023 10:51:59 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morse:mpam/snapshot/v6.5-rc1 52/146] fs/resctrl/monitor.c:584:30:
 warning: variable 'r' set but not used
Message-ID: <202307291025.HuS34MEi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.5-rc1
head:   8a35b09275f16d009ed31e93b8b4b3004b04bceb
commit: eb73c346f06a1570cd8a6791164482440dafc0fc [52/146] x86/resctrl: Move all the filesystem code to /fs/resctrl
config: i386-randconfig-i001-20230728 (https://download.01.org/0day-ci/archive/20230729/202307291025.HuS34MEi-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230729/202307291025.HuS34MEi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307291025.HuS34MEi-lkp@intel.com/

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
