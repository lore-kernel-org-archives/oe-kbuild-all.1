Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AFF733F3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Oct 2025 02:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761014341; cv=none; b=jkRn0hC1Dj8raPuRS7u7Dxxttm14ZaW59QB3jesMsckjH2/M6ILxKfyL12BhmAc6X/v+E/KYPL9ZEc+muPZfd6IziPsgnYxsZ5XBQI48iUbBG6Nd6S4T/GIqbF9HmISeQdBBD6844d5C5XoSkkczYNNkANDECpqxG4wMt8VPXnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761014341; c=relaxed/simple;
	bh=abYChvNVpXb3fl1uDs0zBbmqIo/T4X9dkX7NDp3VIUA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HcMeIEL1iaJz8m/KdBddDxeiX7awvw8t37Nm6j1ZS5ersWJ2l+18lGELxOZ7XP9bzlapP4LxykoUxTAgrka+/d0oda8pNuH0Mv+mVE97JLk8vmhjPKtZXcEHATbMtw6hyxYEBzWPLWm8Nz1dD5Q3E5D+jsmw/cWDh8rG5MWnT20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LLJNWQCG; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LLJNWQCG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761014339; x=1792550339;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=abYChvNVpXb3fl1uDs0zBbmqIo/T4X9dkX7NDp3VIUA=;
  b=LLJNWQCGGGK5qKsPafSy3U4UpXKO/PaqXu/mJyQ5las23rVzpTmcJEoq
   yj5cgtobFlvsAoHUM7PRhVux0DWN1m210K02BRzysKzbcUXExFlPzD0BM
   jEID5+F8mC33EZNAwpz6txMFvCRIZzx6LUG6w7pKrlQrqD4xxyqSQuBxh
   1Uw37yuz9S58etDReaRcfYFCkG/AduqEPFUioRH+PVVXLOlMUsZLOge2s
   f7Pn+nrKkhKlNJ/NGeNpzkAcMrTutyUsis0vramEeuPI7YqUTe6XejXwN
   m9H465F0f49bkVTJPMC2NlBxKRy/JHIrNlEJSIvCnKf017/4DYq+ysBWp
   g==;
X-CSE-ConnectionGUID: 97r9rXFQSW+i6Y6UZFGh0g==
X-CSE-MsgGUID: mX5v/2rpTNW/RzTTgzI5Kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62169137"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; 
   d="scan'208";a="62169137"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 19:38:59 -0700
X-CSE-ConnectionGUID: 9RWXKSL7S7i8p56SWbcwMQ==
X-CSE-MsgGUID: DUCHAJ4EQda8xELchwNXVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; 
   d="scan'208";a="187506005"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 20 Oct 2025 19:38:57 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vB2H1-000AOR-1l;
	Tue, 21 Oct 2025 02:38:55 +0000
Date: Tue, 21 Oct 2025 10:38:34 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 2/2] kernel/sched/fair.c:2387:6:
 warning: no previous prototype for 'is_sys_aware_enabled'
Message-ID: <202510211059.H1i23P5a-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   a1cc3a9146f3d41cb08ad29f0a66b8187d1a1e62
commit: d12b433d563a1e7e7c65311baa5ffbc94c247d0d [2/2] anolis: sched: add sys tracking state and aware sys mode when scheduling
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20251021/202510211059.H1i23P5a-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251021/202510211059.H1i23P5a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510211059.H1i23P5a-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/fair.c:2387:6: warning: no previous prototype for 'is_sys_aware_enabled' [-Wmissing-prototypes]
    2387 | bool is_sys_aware_enabled(void)
         |      ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:2600:22: warning: no previous prototype for '__pick_first_entity' [-Wmissing-prototypes]
    2600 | struct sched_entity *__pick_first_entity(struct cfs_rq *cfs_rq)
         |                      ^~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c: In function 'update_stats_wait_start':
   kernel/sched/fair.c:2901:42: warning: variable 'parent_wait_sum' set but not used [-Wunused-but-set-variable]
    2901 |         u64 wait_start, prev_wait_start, parent_wait_sum, delta;
         |                                          ^~~~~~~~~~~~~~~
   kernel/sched/fair.c: In function 'update_stats_wait_end':
   kernel/sched/fair.c:2939:29: warning: variable 'wait_sibling_delta' set but not used [-Wunused-but-set-variable]
    2939 |         u64 wait_sum_delta, wait_sibling_delta;
         |                             ^~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c: At top level:
   kernel/sched/fair.c:8185:6: warning: no previous prototype for 'init_cfs_bandwidth' [-Wmissing-prototypes]
    8185 | void init_cfs_bandwidth(struct cfs_bandwidth *cfs_b, struct cfs_bandwidth *parent) {}
         |      ^~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:14862:6: warning: no previous prototype for 'free_fair_sched_group' [-Wmissing-prototypes]
   14862 | void free_fair_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:14864:5: warning: no previous prototype for 'alloc_fair_sched_group' [-Wmissing-prototypes]
   14864 | int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:14869:6: warning: no previous prototype for 'online_fair_sched_group' [-Wmissing-prototypes]
   14869 | void online_fair_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:14871:6: warning: no previous prototype for 'unregister_fair_sched_group' [-Wmissing-prototypes]
   14871 | void unregister_fair_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/is_sys_aware_enabled +2387 kernel/sched/fair.c

  2381	
  2382	static inline bool
  2383	id_wake_affine(struct task_struct *p, int this_cpu, int prev_cpu)
  2384	{
  2385		return true;
  2386	}
> 2387	bool is_sys_aware_enabled(void)
  2388	{
  2389		return false;
  2390	}
  2391	static inline bool is_cpu_in_sys_mode(int cpu)
  2392	{
  2393		return false;
  2394	}
  2395	static inline bool
  2396	id_idle_cpu(struct task_struct *p, int cpu, bool expellee, bool *idle)
  2397	{
  2398		bool is_idle = available_idle_cpu(cpu);
  2399	
  2400		if (idle)
  2401			*idle = is_idle;
  2402	
  2403		return is_idle;
  2404	}
  2405	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
