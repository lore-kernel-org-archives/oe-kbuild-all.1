Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFD938A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Jul 2023 07:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690615307; x=1722151307;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JwbFr9oDSyicgz2+nk5xaiKTl5fjsaGtSIGIRfwAflk=;
  b=RznmyKr08apKTj6s7BypuOCy7t5krF/vpux59v51NJV9PTTwf0qeb+TV
   8TLGl+gtPggroUxgaLXTZIX++L5F1SEeRp+4VVdTXIWc7mov7LISmSlnc
   pQS+KL4H8d2tTqIlUFtlgtr404rFWTezXW5Q9m+fKKAYZrlqcUzOLaRMi
   FbFtkBaIlcIe9kX7To7li5Hy7hoo6d3wanHblupF5dom7JY+9ly+zLBNP
   I5GBWtIav51ERJ2R09T8D8PnR5bppVHpD70yWwINqSNQwHXFegNhszFzy
   iv8MwoxPdE1rehHMkvTVXVYt66emtMDnK7tbVO/LrCOPazbZz1UfxJnCX
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="348343994"
X-IronPort-AV: E=Sophos;i="6.01,239,1684825200"; 
   d="scan'208";a="348343994"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2023 00:21:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="793144679"
X-IronPort-AV: E=Sophos;i="6.01,239,1684825200"; 
   d="scan'208";a="793144679"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 29 Jul 2023 00:21:44 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPeGm-0003tn-0T;
	Sat, 29 Jul 2023 07:21:44 +0000
Date: Sat, 29 Jul 2023 15:20:47 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morse:mpam/monitors_and_locking/v5 2/24]
 arch/x86/kernel/cpu/resctrl/monitor.c:684:30: warning: variable 'r' set but
 not used
Message-ID: <202307291548.IVY1Oqee-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/monitors_and_locking/v5
head:   562c8d6543a4f032152fa2f72fc36f65bd9dae42
commit: 0437b39583fbda0c114011e7cafda702009e6cc4 [2/24] x86/resctrl: Access per-rmid structures by index
config: i386-randconfig-i002-20230728 (https://download.01.org/0day-ci/archive/20230729/202307291548.IVY1Oqee-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230729/202307291548.IVY1Oqee-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307291548.IVY1Oqee-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kernel/cpu/resctrl/monitor.c: In function 'cqm_handle_limbo':
>> arch/x86/kernel/cpu/resctrl/monitor.c:684:30: warning: variable 'r' set but not used [-Wunused-but-set-variable]
     684 |         struct rdt_resource *r;
         |                              ^


vim +/r +684 arch/x86/kernel/cpu/resctrl/monitor.c

e33026831bdb5f arch/x86/kernel/cpu/intel_rdt_monitor.c Vikas Shivappa 2017-07-25  675  
24247aeeabe99e arch/x86/kernel/cpu/intel_rdt_monitor.c Vikas Shivappa 2017-08-15  676  /*
24247aeeabe99e arch/x86/kernel/cpu/intel_rdt_monitor.c Vikas Shivappa 2017-08-15  677   * Handler to scan the limbo list and move the RMIDs
24247aeeabe99e arch/x86/kernel/cpu/intel_rdt_monitor.c Vikas Shivappa 2017-08-15  678   * to free list whose occupancy < threshold_occupancy.
24247aeeabe99e arch/x86/kernel/cpu/intel_rdt_monitor.c Vikas Shivappa 2017-08-15  679   */
24247aeeabe99e arch/x86/kernel/cpu/intel_rdt_monitor.c Vikas Shivappa 2017-08-15  680  void cqm_handle_limbo(struct work_struct *work)
24247aeeabe99e arch/x86/kernel/cpu/intel_rdt_monitor.c Vikas Shivappa 2017-08-15  681  {
24247aeeabe99e arch/x86/kernel/cpu/intel_rdt_monitor.c Vikas Shivappa 2017-08-15  682  	unsigned long delay = msecs_to_jiffies(CQM_LIMBOCHECK_INTERVAL);
24247aeeabe99e arch/x86/kernel/cpu/intel_rdt_monitor.c Vikas Shivappa 2017-08-15  683  	int cpu = smp_processor_id();
24247aeeabe99e arch/x86/kernel/cpu/intel_rdt_monitor.c Vikas Shivappa 2017-08-15 @684  	struct rdt_resource *r;
24247aeeabe99e arch/x86/kernel/cpu/intel_rdt_monitor.c Vikas Shivappa 2017-08-15  685  	struct rdt_domain *d;
24247aeeabe99e arch/x86/kernel/cpu/intel_rdt_monitor.c Vikas Shivappa 2017-08-15  686  
24247aeeabe99e arch/x86/kernel/cpu/intel_rdt_monitor.c Vikas Shivappa 2017-08-15  687  	mutex_lock(&rdtgroup_mutex);
24247aeeabe99e arch/x86/kernel/cpu/intel_rdt_monitor.c Vikas Shivappa 2017-08-15  688  
63c8b1231929b8 arch/x86/kernel/cpu/resctrl/monitor.c   James Morse    2021-07-28  689  	r = &rdt_resources_all[RDT_RESOURCE_L3].r_resctrl;
f995801ba3a066 arch/x86/kernel/cpu/resctrl/monitor.c   James Morse    2020-07-08  690  	d = container_of(work, struct rdt_domain, cqm_limbo.work);
24247aeeabe99e arch/x86/kernel/cpu/intel_rdt_monitor.c Vikas Shivappa 2017-08-15  691  
24247aeeabe99e arch/x86/kernel/cpu/intel_rdt_monitor.c Vikas Shivappa 2017-08-15  692  	__check_limbo(d, false);
24247aeeabe99e arch/x86/kernel/cpu/intel_rdt_monitor.c Vikas Shivappa 2017-08-15  693  
0437b39583fbda arch/x86/kernel/cpu/resctrl/monitor.c   James Morse    2020-10-13  694  	if (has_busy_rmid(d))
24247aeeabe99e arch/x86/kernel/cpu/intel_rdt_monitor.c Vikas Shivappa 2017-08-15  695  		schedule_delayed_work_on(cpu, &d->cqm_limbo, delay);
24247aeeabe99e arch/x86/kernel/cpu/intel_rdt_monitor.c Vikas Shivappa 2017-08-15  696  
24247aeeabe99e arch/x86/kernel/cpu/intel_rdt_monitor.c Vikas Shivappa 2017-08-15  697  	mutex_unlock(&rdtgroup_mutex);
24247aeeabe99e arch/x86/kernel/cpu/intel_rdt_monitor.c Vikas Shivappa 2017-08-15  698  }
24247aeeabe99e arch/x86/kernel/cpu/intel_rdt_monitor.c Vikas Shivappa 2017-08-15  699  

:::::: The code at line 684 was first introduced by commit
:::::: 24247aeeabe99eab13b798ccccc2dec066dd6f07 x86/intel_rdt/cqm: Improve limbo list processing

:::::: TO: Vikas Shivappa <vikas.shivappa@linux.intel.com>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
