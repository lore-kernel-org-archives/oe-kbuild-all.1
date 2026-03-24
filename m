Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C28388E60
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Mar 2026 02:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774321070; cv=none; b=fr2JrPuyc707fz56Oa8bL90+DYJ9ip+4V5gva+yvoujfh4sAIKpmlHMZAMxdtLod4Rh4PS4TH6Z1fs29f3Z8GoZzMKnoNUHC8GupHpkxG8Jr+VlGMxTtKgDpLW90eZrxQUBSa/eJIoHqV0WcEg4Vt4wMGvzENKP4j8+y4BbcoUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774321070; c=relaxed/simple;
	bh=t0Z19M9YDuibNjuPsExxildQT7Zl3GZfi7fwjyxgqzA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ttdl7eYenZGiHlwBlTCeM6AAI74a/7WTzuMoOaqFvlvypcnB6tTE1WF/wgHjPkm9/kJwPd/N+wgI8M5Zmdq+IKZV52yXF+7rf4vgQxPefiBzqZdTTIbh+RRdiPsx5uVEsruVosnj3IWBplWLMPAHtZOCArC2WOnoeN/s0WanwWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kGfCC4Gv; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kGfCC4Gv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774321068; x=1805857068;
  h=date:from:to:cc:subject:message-id;
  bh=t0Z19M9YDuibNjuPsExxildQT7Zl3GZfi7fwjyxgqzA=;
  b=kGfCC4Gv8VJoSZqnDEnOTk3vbmfGvbRX47ocR8uUILJuH0U6900PpyCM
   DOJX/fUdO/9wCwFwCU04QbMfQwXSVWfuo+rLtd14wQD8Z2mYuu6WtCzsu
   41mDImoSFFlH8g9xLrkLFGf0BxBZqxLMktpt2Bf7/hvAXQclr+lYeAkm8
   7WMCWE6fEINciw1uTl73zbLc2QWvsHBwe0ijA1JP8WEG0rdTB5N9flOnZ
   vXpTdiT5eCqYmUOPOT9/Qya4I8ancGrA5Llig7dn8XC2qQvHZMiR8Cxrt
   x4MA3APPDaEHEs6nD4HVRxaZTFCteK70vrC7cx5D4HJG0djM6+1pf7Ffu
   w==;
X-CSE-ConnectionGUID: 7aj+P8GpQxuVcpqNlh1zzQ==
X-CSE-MsgGUID: f45Tnv1dT4Gd0ROKdgC3MQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="86024693"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="86024693"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 19:57:47 -0700
X-CSE-ConnectionGUID: V3YQBHVrS4yfagSKMmbTqQ==
X-CSE-MsgGUID: 9FfdjQ9gSUqO4V478VY80g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="219340733"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 23 Mar 2026 19:57:46 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4rxf-000000003hJ-1gmc;
	Tue, 24 Mar 2026 02:57:43 +0000
Date: Tue, 24 Mar 2026 10:57:42 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 0/1]
 kernel/cgroup/cpuset.c:3826: warning: Excess function parameter 'work'
 description in 'cpuset_handle_hotplug'
Message-ID: <202603241045.ZyIQK5yk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Kaiqian,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   3a8949cdc45bfeb1a68ac0e70e90909c13d3910e
commit: 0b74ac200f7764c7eae335774f70c6c9f014c132 [0/1] BACKPORT: FROMGIT: cgroup/cpuset: Make cpuset hotplug processing synchronous
config: i386-buildonly-randconfig-004-20260324 (https://download.01.org/0day-ci/archive/20260324/202603241045.ZyIQK5yk-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260324/202603241045.ZyIQK5yk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603241045.ZyIQK5yk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/cgroup/cpuset.c:3826: warning: Excess function parameter 'work' description in 'cpuset_handle_hotplug'


vim +3826 kernel/cgroup/cpuset.c

b1aac8bb824c658 kernel/cpuset.c        Paul Jackson     2006-09-29  3805  
deb7aa308ea264b kernel/cpuset.c        Tejun Heo        2013-01-07  3806  /**
0b74ac200f7764c kernel/cgroup/cpuset.c Kaiqian Zhu      2025-02-27  3807   * cpuset_handle_hotplug - handle CPU/memory hot{,un}plug for a cpuset
05f76ae95e71149 kernel/cgroup/cpuset.c Cai Xinchen      2023-08-02  3808   * @work: unused
956db3ca0606e78 kernel/cpuset.c        Cliff Wickman    2008-02-07  3809   *
deb7aa308ea264b kernel/cpuset.c        Tejun Heo        2013-01-07  3810   * This function is called after either CPU or memory configuration has
deb7aa308ea264b kernel/cpuset.c        Tejun Heo        2013-01-07  3811   * changed and updates cpuset accordingly.  The top_cpuset is always
deb7aa308ea264b kernel/cpuset.c        Tejun Heo        2013-01-07  3812   * synchronized to cpu_active_mask and N_MEMORY, which is necessary in
deb7aa308ea264b kernel/cpuset.c        Tejun Heo        2013-01-07  3813   * order to make cpusets transparent (of no affect) on systems that are
deb7aa308ea264b kernel/cpuset.c        Tejun Heo        2013-01-07  3814   * actively using CPU hotplug but making no active use of cpusets.
956db3ca0606e78 kernel/cpuset.c        Cliff Wickman    2008-02-07  3815   *
deb7aa308ea264b kernel/cpuset.c        Tejun Heo        2013-01-07  3816   * Non-root cpusets are only affected by offlining.  If any CPUs or memory
388afd8549dc8be kernel/cpuset.c        Li Zefan         2013-06-09  3817   * nodes have been taken down, cpuset_hotplug_update_tasks() is invoked on
388afd8549dc8be kernel/cpuset.c        Li Zefan         2013-06-09  3818   * all descendants.
7ddf96b02fe8dd4 kernel/cpuset.c        Srivatsa S. Bhat 2012-05-24  3819   *
deb7aa308ea264b kernel/cpuset.c        Tejun Heo        2013-01-07  3820   * Note that CPU offlining during suspend is ignored.  We don't modify
deb7aa308ea264b kernel/cpuset.c        Tejun Heo        2013-01-07  3821   * cpusets across suspend/resume cycles at all.
0b74ac200f7764c kernel/cgroup/cpuset.c Kaiqian Zhu      2025-02-27  3822   *
0b74ac200f7764c kernel/cgroup/cpuset.c Kaiqian Zhu      2025-02-27  3823   * CPU / memory hotplug is handled synchronously.
956db3ca0606e78 kernel/cpuset.c        Cliff Wickman    2008-02-07  3824   */
0b74ac200f7764c kernel/cgroup/cpuset.c Kaiqian Zhu      2025-02-27  3825  static void cpuset_handle_hotplug(void)
b1aac8bb824c658 kernel/cpuset.c        Paul Jackson     2006-09-29 @3826  {
5c5cc62321d9df7 kernel/cpuset.c        Li Zefan         2013-06-09  3827  	static cpumask_t new_cpus;
5c5cc62321d9df7 kernel/cpuset.c        Li Zefan         2013-06-09  3828  	static nodemask_t new_mems;
deb7aa308ea264b kernel/cpuset.c        Tejun Heo        2013-01-07  3829  	bool cpus_updated, mems_updated;
b8d1b8ee93df8ff kernel/cgroup/cpuset.c Waiman Long      2017-08-17  3830  	bool on_dfl = is_in_v2_mode();
4b842da276a8a10 kernel/cgroup/cpuset.c Waiman Long      2018-11-08  3831  	struct tmpmasks tmp, *ptmp = NULL;
4b842da276a8a10 kernel/cgroup/cpuset.c Waiman Long      2018-11-08  3832  
4b842da276a8a10 kernel/cgroup/cpuset.c Waiman Long      2018-11-08  3833  	if (on_dfl && !alloc_cpumasks(NULL, &tmp))
4b842da276a8a10 kernel/cgroup/cpuset.c Waiman Long      2018-11-08  3834  		ptmp = &tmp;
b1aac8bb824c658 kernel/cpuset.c        Paul Jackson     2006-09-29  3835  
0b74ac200f7764c kernel/cgroup/cpuset.c Kaiqian Zhu      2025-02-27  3836  	lockdep_assert_cpus_held();
111cd11bbc54850 kernel/cgroup/cpuset.c Juri Lelli       2023-05-08  3837  	mutex_lock(&cpuset_mutex);
956db3ca0606e78 kernel/cpuset.c        Cliff Wickman    2008-02-07  3838  
deb7aa308ea264b kernel/cpuset.c        Tejun Heo        2013-01-07  3839  	/* fetch the available cpus/mems and find out which changed how */
deb7aa308ea264b kernel/cpuset.c        Tejun Heo        2013-01-07  3840  	cpumask_copy(&new_cpus, cpu_active_mask);
deb7aa308ea264b kernel/cpuset.c        Tejun Heo        2013-01-07  3841  	new_mems = node_states[N_MEMORY];
b450129554213a4 kernel/cpuset.c        Paul Jackson     2008-02-07  3842  
4b842da276a8a10 kernel/cgroup/cpuset.c Waiman Long      2018-11-08  3843  	/*
4b842da276a8a10 kernel/cgroup/cpuset.c Waiman Long      2018-11-08  3844  	 * If subparts_cpus is populated, it is likely that the check below
4b842da276a8a10 kernel/cgroup/cpuset.c Waiman Long      2018-11-08  3845  	 * will produce a false positive on cpus_updated when the cpu list
4b842da276a8a10 kernel/cgroup/cpuset.c Waiman Long      2018-11-08  3846  	 * isn't changed. It is extra work, but it is better to be safe.
4b842da276a8a10 kernel/cgroup/cpuset.c Waiman Long      2018-11-08  3847  	 */
7e88291beefbb75 kernel/cpuset.c        Li Zefan         2014-07-09  3848  	cpus_updated = !cpumask_equal(top_cpuset.effective_cpus, &new_cpus);
7e88291beefbb75 kernel/cpuset.c        Li Zefan         2014-07-09  3849  	mems_updated = !nodes_equal(top_cpuset.effective_mems, new_mems);
b450129554213a4 kernel/cpuset.c        Paul Jackson     2008-02-07  3850  
15d428e6fe77fff kernel/cgroup/cpuset.c Waiman Long      2021-07-20  3851  	/*
15d428e6fe77fff kernel/cgroup/cpuset.c Waiman Long      2021-07-20  3852  	 * In the rare case that hotplug removes all the cpus in subparts_cpus,
15d428e6fe77fff kernel/cgroup/cpuset.c Waiman Long      2021-07-20  3853  	 * we assumed that cpus are updated.
15d428e6fe77fff kernel/cgroup/cpuset.c Waiman Long      2021-07-20  3854  	 */
15d428e6fe77fff kernel/cgroup/cpuset.c Waiman Long      2021-07-20  3855  	if (!cpus_updated && top_cpuset.nr_subparts_cpus)
15d428e6fe77fff kernel/cgroup/cpuset.c Waiman Long      2021-07-20  3856  		cpus_updated = true;
15d428e6fe77fff kernel/cgroup/cpuset.c Waiman Long      2021-07-20  3857  
deb7aa308ea264b kernel/cpuset.c        Tejun Heo        2013-01-07  3858  	/* synchronize cpus_allowed to cpu_active_mask */
deb7aa308ea264b kernel/cpuset.c        Tejun Heo        2013-01-07  3859  	if (cpus_updated) {
8447a0fee974433 kernel/cpuset.c        Vladimir Davydov 2014-10-20  3860  		spin_lock_irq(&callback_lock);
7e88291beefbb75 kernel/cpuset.c        Li Zefan         2014-07-09  3861  		if (!on_dfl)
deb7aa308ea264b kernel/cpuset.c        Tejun Heo        2013-01-07  3862  			cpumask_copy(top_cpuset.cpus_allowed, &new_cpus);
4b842da276a8a10 kernel/cgroup/cpuset.c Waiman Long      2018-11-08  3863  		/*
4b842da276a8a10 kernel/cgroup/cpuset.c Waiman Long      2018-11-08  3864  		 * Make sure that CPUs allocated to child partitions
4b842da276a8a10 kernel/cgroup/cpuset.c Waiman Long      2018-11-08  3865  		 * do not show up in effective_cpus. If no CPU is left,
4b842da276a8a10 kernel/cgroup/cpuset.c Waiman Long      2018-11-08  3866  		 * we clear the subparts_cpus & let the child partitions
4b842da276a8a10 kernel/cgroup/cpuset.c Waiman Long      2018-11-08  3867  		 * fight for the CPUs again.
4b842da276a8a10 kernel/cgroup/cpuset.c Waiman Long      2018-11-08  3868  		 */
4b842da276a8a10 kernel/cgroup/cpuset.c Waiman Long      2018-11-08  3869  		if (top_cpuset.nr_subparts_cpus) {
4b842da276a8a10 kernel/cgroup/cpuset.c Waiman Long      2018-11-08  3870  			if (cpumask_subset(&new_cpus,
4b842da276a8a10 kernel/cgroup/cpuset.c Waiman Long      2018-11-08  3871  					   top_cpuset.subparts_cpus)) {
4b842da276a8a10 kernel/cgroup/cpuset.c Waiman Long      2018-11-08  3872  				top_cpuset.nr_subparts_cpus = 0;
4b842da276a8a10 kernel/cgroup/cpuset.c Waiman Long      2018-11-08  3873  				cpumask_clear(top_cpuset.subparts_cpus);
4b842da276a8a10 kernel/cgroup/cpuset.c Waiman Long      2018-11-08  3874  			} else {
4b842da276a8a10 kernel/cgroup/cpuset.c Waiman Long      2018-11-08  3875  				cpumask_andnot(&new_cpus, &new_cpus,
4b842da276a8a10 kernel/cgroup/cpuset.c Waiman Long      2018-11-08  3876  					       top_cpuset.subparts_cpus);
4b842da276a8a10 kernel/cgroup/cpuset.c Waiman Long      2018-11-08  3877  			}
4b842da276a8a10 kernel/cgroup/cpuset.c Waiman Long      2018-11-08  3878  		}
1344ab9c2991b45 kernel/cpuset.c        Li Zefan         2014-07-09  3879  		cpumask_copy(top_cpuset.effective_cpus, &new_cpus);
8447a0fee974433 kernel/cpuset.c        Vladimir Davydov 2014-10-20  3880  		spin_unlock_irq(&callback_lock);
deb7aa308ea264b kernel/cpuset.c        Tejun Heo        2013-01-07  3881  		/* we don't mess with cpumasks of tasks in top_cpuset */
7ddf96b02fe8dd4 kernel/cpuset.c        Srivatsa S. Bhat 2012-05-24  3882  	}
7ddf96b02fe8dd4 kernel/cpuset.c        Srivatsa S. Bhat 2012-05-24  3883  
deb7aa308ea264b kernel/cpuset.c        Tejun Heo        2013-01-07  3884  	/* synchronize mems_allowed to N_MEMORY */
deb7aa308ea264b kernel/cpuset.c        Tejun Heo        2013-01-07  3885  	if (mems_updated) {
8447a0fee974433 kernel/cpuset.c        Vladimir Davydov 2014-10-20  3886  		spin_lock_irq(&callback_lock);
7e88291beefbb75 kernel/cpuset.c        Li Zefan         2014-07-09  3887  		if (!on_dfl)
deb7aa308ea264b kernel/cpuset.c        Tejun Heo        2013-01-07  3888  			top_cpuset.mems_allowed = new_mems;
1344ab9c2991b45 kernel/cpuset.c        Li Zefan         2014-07-09  3889  		top_cpuset.effective_mems = new_mems;
8447a0fee974433 kernel/cpuset.c        Vladimir Davydov 2014-10-20  3890  		spin_unlock_irq(&callback_lock);
d66393e54e0a9dc kernel/cpuset.c        Tejun Heo        2014-02-13  3891  		update_tasks_nodemask(&top_cpuset);
b1aac8bb824c658 kernel/cpuset.c        Paul Jackson     2006-09-29  3892  	}
deb7aa308ea264b kernel/cpuset.c        Tejun Heo        2013-01-07  3893  
111cd11bbc54850 kernel/cgroup/cpuset.c Juri Lelli       2023-05-08  3894  	mutex_unlock(&cpuset_mutex);
388afd8549dc8be kernel/cpuset.c        Li Zefan         2013-06-09  3895  
5c5cc62321d9df7 kernel/cpuset.c        Li Zefan         2013-06-09  3896  	/* if cpus or mems changed, we need to propagate to descendants */
5c5cc62321d9df7 kernel/cpuset.c        Li Zefan         2013-06-09  3897  	if (cpus_updated || mems_updated) {
deb7aa308ea264b kernel/cpuset.c        Tejun Heo        2013-01-07  3898  		struct cpuset *cs;
492eb21b98f88e4 kernel/cpuset.c        Tejun Heo        2013-08-08  3899  		struct cgroup_subsys_state *pos_css;
deb7aa308ea264b kernel/cpuset.c        Tejun Heo        2013-01-07  3900  
fc560a26accea95 kernel/cpuset.c        Tejun Heo        2013-01-07  3901  		rcu_read_lock();
492eb21b98f88e4 kernel/cpuset.c        Tejun Heo        2013-08-08  3902  		cpuset_for_each_descendant_pre(cs, pos_css, &top_cpuset) {
ec903c0c858e496 kernel/cpuset.c        Tejun Heo        2014-05-13  3903  			if (cs == &top_cpuset || !css_tryget_online(&cs->css))
388afd8549dc8be kernel/cpuset.c        Li Zefan         2013-06-09  3904  				continue;
fc560a26accea95 kernel/cpuset.c        Tejun Heo        2013-01-07  3905  			rcu_read_unlock();
b1aac8bb824c658 kernel/cpuset.c        Paul Jackson     2006-09-29  3906  
4b842da276a8a10 kernel/cgroup/cpuset.c Waiman Long      2018-11-08  3907  			cpuset_hotplug_update_tasks(cs, ptmp);
7ddf96b02fe8dd4 kernel/cpuset.c        Srivatsa S. Bhat 2012-05-24  3908  
388afd8549dc8be kernel/cpuset.c        Li Zefan         2013-06-09  3909  			rcu_read_lock();
388afd8549dc8be kernel/cpuset.c        Li Zefan         2013-06-09  3910  			css_put(&cs->css);
388afd8549dc8be kernel/cpuset.c        Li Zefan         2013-06-09  3911  		}
388afd8549dc8be kernel/cpuset.c        Li Zefan         2013-06-09  3912  		rcu_read_unlock();
388afd8549dc8be kernel/cpuset.c        Li Zefan         2013-06-09  3913  	}
8d03394877ecdf8 kernel/cpuset.c        Tejun Heo        2013-01-07  3914  
deb7aa308ea264b kernel/cpuset.c        Tejun Heo        2013-01-07  3915  	/* rebuild sched domains if cpus_allowed has changed */
50e76632339d465 kernel/cgroup/cpuset.c Peter Zijlstra   2017-09-07  3916  	if (cpus_updated || force_rebuild) {
50e76632339d465 kernel/cgroup/cpuset.c Peter Zijlstra   2017-09-07  3917  		force_rebuild = false;
0b74ac200f7764c kernel/cgroup/cpuset.c Kaiqian Zhu      2025-02-27  3918  		rebuild_sched_domains_cpuslocked();
deb7aa308ea264b kernel/cpuset.c        Tejun Heo        2013-01-07  3919  	}
4b842da276a8a10 kernel/cgroup/cpuset.c Waiman Long      2018-11-08  3920  
4b842da276a8a10 kernel/cgroup/cpuset.c Waiman Long      2018-11-08  3921  	free_cpumasks(NULL, ptmp);
50e76632339d465 kernel/cgroup/cpuset.c Peter Zijlstra   2017-09-07  3922  }
deb7aa308ea264b kernel/cpuset.c        Tejun Heo        2013-01-07  3923  

:::::: The code at line 3826 was first introduced by commit
:::::: b1aac8bb824c658ddebd296b088a8bff5029c288 [PATCH] cpuset: hotunplug cpus and mems in all cpusets

:::::: TO: Paul Jackson <pj@sgi.com>
:::::: CC: Linus Torvalds <torvalds@g5.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
