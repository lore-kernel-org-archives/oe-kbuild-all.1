Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B285A20B3E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Sep 2023 18:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695493379; x=1727029379;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S3Ot8SQuWbZMRELZNgaSFASxCdDppivlLNmrqz6+f3M=;
  b=gvq/lkjb/35L2kCooqbclG4nHtjQ2B/ChWE+WHF5axSzIZ4R+1yNld0r
   IPWPqL3cU8JgaAfAsMS0X5rC1Qs21XJiWSb2PWev4Qyx6TiRj9d+dEP9Y
   p0C1izNLlvVfl78V6IViFN4aFwELJAn4CO6KNDCuozuxwj2pIlhYs5PfR
   5R5+DxrvwuqOQMXiwTkdkok+rkKRGbEe7yxkLpucR2NEo72O+wV1NVXc6
   3mfwKM3cAMWDi7vHZ64BrVLe8JPzV3msBL7QNgt7bDtVBSumLwrX93nFt
   1w8+ADTMeJn8E/UjCS1u913IhMeKsQpRPFPnZ1VSV70Bs+00aiWR9YhaZ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="383796812"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="383796812"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2023 11:22:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="838133901"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="838133901"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 23 Sep 2023 11:22:57 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qk7HL-0002if-1S;
	Sat, 23 Sep 2023 18:22:55 +0000
Date: Sun, 24 Sep 2023 02:21:51 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, Shaopeng Tan <tan.shaopeng@fujitsu.com>
Subject: [morse:mpam/monitors_and_locking/v6 21/24]
 arch/x86/kernel/cpu/resctrl/monitor.c:827: warning: Function parameter or
 member 'dom' not described in 'cqm_setup_limbo_handler'
Message-ID: <202309240222.Du2vE4wV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/monitors_and_locking/v6
head:   60cd5a617cf6d65701aa6a1d75435b9c05ee7e7b
commit: e3bb28ee91bd7e6450f4f1dfc4a0de78005018aa [21/24] x86/resctrl: Allow overflow/limbo handlers to be scheduled on any-but cpu
config: i386-randconfig-012-20230923 (https://download.01.org/0day-ci/archive/20230924/202309240222.Du2vE4wV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230924/202309240222.Du2vE4wV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309240222.Du2vE4wV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kernel/cpu/resctrl/monitor.c:48: warning: Cannot understand  * @rmid_free_lru    A least recently used list of free RMIDs
    on line 48 - I thought it was a doc line
   arch/x86/kernel/cpu/resctrl/monitor.c:55: warning: Cannot understand  * @closid_num_dirty_rmid    The number of dirty RMID each CLOSID has.
    on line 55 - I thought it was a doc line
   arch/x86/kernel/cpu/resctrl/monitor.c:62: warning: Cannot understand  * @rmid_limbo_count     count of currently unused but (potentially)
    on line 62 - I thought it was a doc line
   arch/x86/kernel/cpu/resctrl/monitor.c:71: warning: Cannot understand  * @rmid_entry - The entry in the limbo and free lists.
    on line 71 - I thought it was a doc line
>> arch/x86/kernel/cpu/resctrl/monitor.c:827: warning: Function parameter or member 'dom' not described in 'cqm_setup_limbo_handler'
>> arch/x86/kernel/cpu/resctrl/monitor.c:890: warning: Function parameter or member 'dom' not described in 'mbm_setup_overflow_handler'


vim +827 arch/x86/kernel/cpu/resctrl/monitor.c

24247aeeabe99e arch/x86/kernel/cpu/intel_rdt_monitor.c Vikas Shivappa  2017-08-15  817  
e3bb28ee91bd7e arch/x86/kernel/cpu/resctrl/monitor.c   James Morse     2019-03-19  818  /**
e3bb28ee91bd7e arch/x86/kernel/cpu/resctrl/monitor.c   James Morse     2019-03-19  819   * cqm_setup_limbo_handler() - Schedule the limbo handler to run for this
e3bb28ee91bd7e arch/x86/kernel/cpu/resctrl/monitor.c   James Morse     2019-03-19  820   *                             domain.
e3bb28ee91bd7e arch/x86/kernel/cpu/resctrl/monitor.c   James Morse     2019-03-19  821   * @delay_ms:      How far in the future the handler should run.
e3bb28ee91bd7e arch/x86/kernel/cpu/resctrl/monitor.c   James Morse     2019-03-19  822   * @exclude_cpu:   Which CPU the handler should not run on,
e3bb28ee91bd7e arch/x86/kernel/cpu/resctrl/monitor.c   James Morse     2019-03-19  823   *		   RESCTRL_PICK_ANY_CPU to pick any CPU.
e3bb28ee91bd7e arch/x86/kernel/cpu/resctrl/monitor.c   James Morse     2019-03-19  824   */
e3bb28ee91bd7e arch/x86/kernel/cpu/resctrl/monitor.c   James Morse     2019-03-19  825  void cqm_setup_limbo_handler(struct rdt_domain *dom, unsigned long delay_ms,
e3bb28ee91bd7e arch/x86/kernel/cpu/resctrl/monitor.c   James Morse     2019-03-19  826  			     int exclude_cpu)
24247aeeabe99e arch/x86/kernel/cpu/intel_rdt_monitor.c Vikas Shivappa  2017-08-15 @827  {
24247aeeabe99e arch/x86/kernel/cpu/intel_rdt_monitor.c Vikas Shivappa  2017-08-15  828  	unsigned long delay = msecs_to_jiffies(delay_ms);
24247aeeabe99e arch/x86/kernel/cpu/intel_rdt_monitor.c Vikas Shivappa  2017-08-15  829  	int cpu;
24247aeeabe99e arch/x86/kernel/cpu/intel_rdt_monitor.c Vikas Shivappa  2017-08-15  830  
e3bb28ee91bd7e arch/x86/kernel/cpu/resctrl/monitor.c   James Morse     2019-03-19  831  	cpu = cpumask_any_housekeeping(&dom->cpu_mask, exclude_cpu);
24247aeeabe99e arch/x86/kernel/cpu/intel_rdt_monitor.c Vikas Shivappa  2017-08-15  832  	dom->cqm_work_cpu = cpu;
24247aeeabe99e arch/x86/kernel/cpu/intel_rdt_monitor.c Vikas Shivappa  2017-08-15  833  
e3bb28ee91bd7e arch/x86/kernel/cpu/resctrl/monitor.c   James Morse     2019-03-19  834  	if (cpu < nr_cpu_ids)
24247aeeabe99e arch/x86/kernel/cpu/intel_rdt_monitor.c Vikas Shivappa  2017-08-15  835  		schedule_delayed_work_on(cpu, &dom->cqm_limbo, delay);
24247aeeabe99e arch/x86/kernel/cpu/intel_rdt_monitor.c Vikas Shivappa  2017-08-15  836  }
24247aeeabe99e arch/x86/kernel/cpu/intel_rdt_monitor.c Vikas Shivappa  2017-08-15  837  
e33026831bdb5f arch/x86/kernel/cpu/intel_rdt_monitor.c Vikas Shivappa  2017-07-25  838  void mbm_handle_overflow(struct work_struct *work)
e33026831bdb5f arch/x86/kernel/cpu/intel_rdt_monitor.c Vikas Shivappa  2017-07-25  839  {
e33026831bdb5f arch/x86/kernel/cpu/intel_rdt_monitor.c Vikas Shivappa  2017-07-25  840  	unsigned long delay = msecs_to_jiffies(MBM_OVERFLOW_INTERVAL);
e33026831bdb5f arch/x86/kernel/cpu/intel_rdt_monitor.c Vikas Shivappa  2017-07-25  841  	struct rdtgroup *prgrp, *crgrp;
e33026831bdb5f arch/x86/kernel/cpu/intel_rdt_monitor.c Vikas Shivappa  2017-07-25  842  	struct list_head *head;
46637d4570e108 arch/x86/kernel/cpu/resctrl/monitor.c   Reinette Chatre 2020-05-05  843  	struct rdt_resource *r;
e33026831bdb5f arch/x86/kernel/cpu/intel_rdt_monitor.c Vikas Shivappa  2017-07-25  844  	struct rdt_domain *d;
c60e11a84887dc arch/x86/kernel/cpu/resctrl/monitor.c   James Morse     2023-03-02  845  	int cpu;
e33026831bdb5f arch/x86/kernel/cpu/intel_rdt_monitor.c Vikas Shivappa  2017-07-25  846  
e33026831bdb5f arch/x86/kernel/cpu/intel_rdt_monitor.c Vikas Shivappa  2017-07-25  847  	mutex_lock(&rdtgroup_mutex);
e33026831bdb5f arch/x86/kernel/cpu/intel_rdt_monitor.c Vikas Shivappa  2017-07-25  848  
90345d8da89883 arch/x86/kernel/cpu/resctrl/monitor.c   James Morse     2019-03-19  849  	/*
90345d8da89883 arch/x86/kernel/cpu/resctrl/monitor.c   James Morse     2019-03-19  850  	 * If the filesystem has been unmounted this work no longer needs to
90345d8da89883 arch/x86/kernel/cpu/resctrl/monitor.c   James Morse     2019-03-19  851  	 * run.
90345d8da89883 arch/x86/kernel/cpu/resctrl/monitor.c   James Morse     2019-03-19  852  	 */
4a0167b632eca2 arch/x86/kernel/cpu/resctrl/monitor.c   James Morse     2019-03-19  853  	if (!resctrl_mounted || !resctrl_arch_mon_capable())
e33026831bdb5f arch/x86/kernel/cpu/intel_rdt_monitor.c Vikas Shivappa  2017-07-25  854  		goto out_unlock;
e33026831bdb5f arch/x86/kernel/cpu/intel_rdt_monitor.c Vikas Shivappa  2017-07-25  855  
63c8b1231929b8 arch/x86/kernel/cpu/resctrl/monitor.c   James Morse     2021-07-28  856  	r = &rdt_resources_all[RDT_RESOURCE_L3].r_resctrl;
f995801ba3a066 arch/x86/kernel/cpu/resctrl/monitor.c   James Morse     2020-07-08  857  	d = container_of(work, struct rdt_domain, mbm_over.work);
e33026831bdb5f arch/x86/kernel/cpu/intel_rdt_monitor.c Vikas Shivappa  2017-07-25  858  
e33026831bdb5f arch/x86/kernel/cpu/intel_rdt_monitor.c Vikas Shivappa  2017-07-25  859  	list_for_each_entry(prgrp, &rdt_all_groups, rdtgroup_list) {
ff44b5dd6d1d3a arch/x86/kernel/cpu/resctrl/monitor.c   James Morse     2020-10-13  860  		mbm_update(r, d, prgrp->closid, prgrp->mon.rmid);
e33026831bdb5f arch/x86/kernel/cpu/intel_rdt_monitor.c Vikas Shivappa  2017-07-25  861  
e33026831bdb5f arch/x86/kernel/cpu/intel_rdt_monitor.c Vikas Shivappa  2017-07-25  862  		head = &prgrp->mon.crdtgrp_list;
e33026831bdb5f arch/x86/kernel/cpu/intel_rdt_monitor.c Vikas Shivappa  2017-07-25  863  		list_for_each_entry(crgrp, head, mon.crdtgrp_list)
ff44b5dd6d1d3a arch/x86/kernel/cpu/resctrl/monitor.c   James Morse     2020-10-13  864  			mbm_update(r, d, crgrp->closid, crgrp->mon.rmid);
de73f38f768021 arch/x86/kernel/cpu/intel_rdt_monitor.c Vikas Shivappa  2018-04-20  865  
de73f38f768021 arch/x86/kernel/cpu/intel_rdt_monitor.c Vikas Shivappa  2018-04-20  866  		if (is_mba_sc(NULL))
de73f38f768021 arch/x86/kernel/cpu/intel_rdt_monitor.c Vikas Shivappa  2018-04-20  867  			update_mba_bw(prgrp, d);
e33026831bdb5f arch/x86/kernel/cpu/intel_rdt_monitor.c Vikas Shivappa  2017-07-25  868  	}
e33026831bdb5f arch/x86/kernel/cpu/intel_rdt_monitor.c Vikas Shivappa  2017-07-25  869  
c60e11a84887dc arch/x86/kernel/cpu/resctrl/monitor.c   James Morse     2023-03-02  870  	/*
c60e11a84887dc arch/x86/kernel/cpu/resctrl/monitor.c   James Morse     2023-03-02  871  	 * Re-check for housekeeping CPUs. This allows the overflow handler to
c60e11a84887dc arch/x86/kernel/cpu/resctrl/monitor.c   James Morse     2023-03-02  872  	 * move off a nohz_full CPU quickly.
c60e11a84887dc arch/x86/kernel/cpu/resctrl/monitor.c   James Morse     2023-03-02  873  	 */
e3bb28ee91bd7e arch/x86/kernel/cpu/resctrl/monitor.c   James Morse     2019-03-19  874  	cpu = cpumask_any_housekeeping(&d->cpu_mask, RESCTRL_PICK_ANY_CPU);
e33026831bdb5f arch/x86/kernel/cpu/intel_rdt_monitor.c Vikas Shivappa  2017-07-25  875  	schedule_delayed_work_on(cpu, &d->mbm_over, delay);
24247aeeabe99e arch/x86/kernel/cpu/intel_rdt_monitor.c Vikas Shivappa  2017-08-15  876  
e33026831bdb5f arch/x86/kernel/cpu/intel_rdt_monitor.c Vikas Shivappa  2017-07-25  877  out_unlock:
e33026831bdb5f arch/x86/kernel/cpu/intel_rdt_monitor.c Vikas Shivappa  2017-07-25  878  	mutex_unlock(&rdtgroup_mutex);
e33026831bdb5f arch/x86/kernel/cpu/intel_rdt_monitor.c Vikas Shivappa  2017-07-25  879  }
e33026831bdb5f arch/x86/kernel/cpu/intel_rdt_monitor.c Vikas Shivappa  2017-07-25  880  
e3bb28ee91bd7e arch/x86/kernel/cpu/resctrl/monitor.c   James Morse     2019-03-19  881  /**
e3bb28ee91bd7e arch/x86/kernel/cpu/resctrl/monitor.c   James Morse     2019-03-19  882   * mbm_setup_overflow_handler() - Schedule the overflow handler to run for this
e3bb28ee91bd7e arch/x86/kernel/cpu/resctrl/monitor.c   James Morse     2019-03-19  883   *                                domain.
e3bb28ee91bd7e arch/x86/kernel/cpu/resctrl/monitor.c   James Morse     2019-03-19  884   * @delay_ms:      How far in the future the handler should run.
e3bb28ee91bd7e arch/x86/kernel/cpu/resctrl/monitor.c   James Morse     2019-03-19  885   * @exclude_cpu:   Which CPU the handler should not run on,
e3bb28ee91bd7e arch/x86/kernel/cpu/resctrl/monitor.c   James Morse     2019-03-19  886   *		   RESCTRL_PICK_ANY_CPU to pick any CPU.
e3bb28ee91bd7e arch/x86/kernel/cpu/resctrl/monitor.c   James Morse     2019-03-19  887   */
e3bb28ee91bd7e arch/x86/kernel/cpu/resctrl/monitor.c   James Morse     2019-03-19  888  void mbm_setup_overflow_handler(struct rdt_domain *dom, unsigned long delay_ms,
e3bb28ee91bd7e arch/x86/kernel/cpu/resctrl/monitor.c   James Morse     2019-03-19  889  				int exclude_cpu)
e33026831bdb5f arch/x86/kernel/cpu/intel_rdt_monitor.c Vikas Shivappa  2017-07-25 @890  {
bbc4615e0b7df5 arch/x86/kernel/cpu/intel_rdt_monitor.c Vikas Shivappa  2017-08-15  891  	unsigned long delay = msecs_to_jiffies(delay_ms);
e33026831bdb5f arch/x86/kernel/cpu/intel_rdt_monitor.c Vikas Shivappa  2017-07-25  892  	int cpu;
e33026831bdb5f arch/x86/kernel/cpu/intel_rdt_monitor.c Vikas Shivappa  2017-07-25  893  
90345d8da89883 arch/x86/kernel/cpu/resctrl/monitor.c   James Morse     2019-03-19  894  	/*
90345d8da89883 arch/x86/kernel/cpu/resctrl/monitor.c   James Morse     2019-03-19  895  	 * When a domain comes online there is no guarantee the filesystem is
90345d8da89883 arch/x86/kernel/cpu/resctrl/monitor.c   James Morse     2019-03-19  896  	 * mounted. If not, there is no need to catch counter overflow.
90345d8da89883 arch/x86/kernel/cpu/resctrl/monitor.c   James Morse     2019-03-19  897  	 */
4a0167b632eca2 arch/x86/kernel/cpu/resctrl/monitor.c   James Morse     2019-03-19  898  	if (!resctrl_mounted || !resctrl_arch_mon_capable())
e33026831bdb5f arch/x86/kernel/cpu/intel_rdt_monitor.c Vikas Shivappa  2017-07-25  899  		return;
e3bb28ee91bd7e arch/x86/kernel/cpu/resctrl/monitor.c   James Morse     2019-03-19  900  	cpu = cpumask_any_housekeeping(&dom->cpu_mask, exclude_cpu);
e33026831bdb5f arch/x86/kernel/cpu/intel_rdt_monitor.c Vikas Shivappa  2017-07-25  901  	dom->mbm_work_cpu = cpu;
e3bb28ee91bd7e arch/x86/kernel/cpu/resctrl/monitor.c   James Morse     2019-03-19  902  
e3bb28ee91bd7e arch/x86/kernel/cpu/resctrl/monitor.c   James Morse     2019-03-19  903  	if (cpu < nr_cpu_ids)
e33026831bdb5f arch/x86/kernel/cpu/intel_rdt_monitor.c Vikas Shivappa  2017-07-25  904  		schedule_delayed_work_on(cpu, &dom->mbm_over, delay);
e33026831bdb5f arch/x86/kernel/cpu/intel_rdt_monitor.c Vikas Shivappa  2017-07-25  905  }
e33026831bdb5f arch/x86/kernel/cpu/intel_rdt_monitor.c Vikas Shivappa  2017-07-25  906  

:::::: The code at line 827 was first introduced by commit
:::::: 24247aeeabe99eab13b798ccccc2dec066dd6f07 x86/intel_rdt/cqm: Improve limbo list processing

:::::: TO: Vikas Shivappa <vikas.shivappa@linux.intel.com>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
