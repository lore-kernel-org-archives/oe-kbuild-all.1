Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB25156E8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Aug 2023 16:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692202508; x=1723738508;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YbZiJjmmMMgr9fn7DmpZ5mfZfDGwQRdrsMpMTyk12vE=;
  b=gKH7jHjm4RlXythTmOsvRnOxZ1+EPy8X6NOCBbcBfAnX2/cZc6i+SIUG
   ZAf7cOan4b2jbCvWptMHPQDLgvVrR9c5eX1pQ6YrpZ+rifGQiaLGrTJCx
   9Xx0EvJUWGdxxwVJ0XsXXzSxN/XiUqhdrJlaGVz8m6UM9C+OfKvBMzjdl
   vsFMyIN14qaMK+9e+L2pwxlOq6cY6cZqSfrJ+fYt5qU2icGO/rHt5AVUp
   rWttvQUJe88AT4QvkUO6cpQIQZQdqXSJmA55xBf7SVFeuc8Zv9EyzdaXh
   TRO/PO9jC+3/bbD3bZ7DcQcRDXavADeHJlxpBOnL95vPYoulJ01DrVnaZ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="370046363"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; 
   d="scan'208";a="370046363"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 09:15:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="763687436"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; 
   d="scan'208";a="763687436"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 16 Aug 2023 09:15:04 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWJAl-0000Qp-18;
	Wed, 16 Aug 2023 16:15:03 +0000
Date: Thu, 17 Aug 2023 00:14:33 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morse:mpam/snapshot/v6.5-rc1 52/147] fs/resctrl/monitor.c:584:30:
 warning: variable 'r' set but not used
Message-ID: <202308170003.cBa2aq5w-lkp@intel.com>
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
head:   d2210e80c29bdd622cb88af630aa4de57a01181c
commit: eb73c346f06a1570cd8a6791164482440dafc0fc [52/147] x86/resctrl: Move all the filesystem code to /fs/resctrl
config: x86_64-randconfig-r031-20230816 (https://download.01.org/0day-ci/archive/20230817/202308170003.cBa2aq5w-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308170003.cBa2aq5w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308170003.cBa2aq5w-lkp@intel.com/

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
