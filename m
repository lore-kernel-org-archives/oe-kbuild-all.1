Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4E7260569
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 23:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765495799; cv=none; b=tSspZVtqlRaYbd8tk648rVBB9XwG4sER6M2QR+HcFFxGJcIPmD/qKBNk4s9IaPaq+QY7iS3Txx8D2UGr9xJoHRALbwYRBl/MIlykx/A5OOcLWI9wIBOPIrwalxQpBsPhn69ve6OJvO762FxB/5N6Co/OBI9zoda8RKTyWaBuoxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765495799; c=relaxed/simple;
	bh=vkD4fMgO38t2X80tLft+Ez3OnSgPTRskfuemej3RN/k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YQECczvsvRL4gU4pNnint60nelDkapBTqWn4j0IFe67Xu1PBshnduLX78mrQYri9X+ws97fNwknLALo2JvSONjZHV2GMuxuVwJT/DjdnYvlOegHi+1BHHqCSTTxLN+2V1AxFz4aljps/9c4/CWJr+tAD4ehvsvPsTYQFr+Sn1MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZJZwfYFF; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZJZwfYFF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765495796; x=1797031796;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vkD4fMgO38t2X80tLft+Ez3OnSgPTRskfuemej3RN/k=;
  b=ZJZwfYFFOMy54PKYsA7x5wIO5If5j7USkCp2K9WuFzMUJmWvKIVsyQqK
   pAIJQeBYG3t+sirGbXm55OLYvPJ15prTOYB8qPmQTUPOBMQt3Zngne7Fg
   j59JMOMr4qB+is5EAdkhmTE+TR/qwiRN0qnv/jYHm95g1+qK0eNyX8Yjo
   hVmMePTIahfbXxl+pwqxp/E103vmZNx+sco/G2CP23GxImQaFy8cczEFV
   FxFtk5foTMFUT2P92DlHanEYBc75yjLRDtStHQKHENNX+Vh9Edy8tE8Gh
   CilL/BrNaCxchqFaOkpDeMwmd1A/R0/sYg19/ssme7+SehaoPkGKmNoSz
   A==;
X-CSE-ConnectionGUID: BJoY3jnoSEWE1zB7t4PBVQ==
X-CSE-MsgGUID: q6O1o/0ZS52dtMC0GHh7Yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67528569"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="67528569"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 15:29:55 -0800
X-CSE-ConnectionGUID: 40UEUHUbR8e6oKWzomflTw==
X-CSE-MsgGUID: jF6XZIOnRROIHrdX5Rxu0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="234320725"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 11 Dec 2025 15:29:55 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTq6a-000000005CF-066O;
	Thu, 11 Dec 2025 23:29:52 +0000
Date: Fri, 12 Dec 2025 07:29:20 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, yanhaitao <yanhaitao2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3536/3536] kernel/sched/core.c:11374:5: warning:
 no previous prototype for function 'tg_set_dynamic_affinity_mode'
Message-ID: <202512120744.b8phlWWR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   5930fa3740c518a9f6ba688fd0c1873d6f3adbce
commit: 6eb07f9925a906d81f328c808ba25f7800888dce [3536/3536] sched: Introduce smart grid scheduling strategy for cfs
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20251212/202512120744.b8phlWWR-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512120744.b8phlWWR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512120744.b8phlWWR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/core.c:9:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   In file included from include/linux/mm.h:2181:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/core.c:11374:5: warning: no previous prototype for function 'tg_set_dynamic_affinity_mode' [-Wmissing-prototypes]
    11374 | int tg_set_dynamic_affinity_mode(struct task_group *tg, u64 mode)
          |     ^
   kernel/sched/core.c:11374:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    11374 | int tg_set_dynamic_affinity_mode(struct task_group *tg, u64 mode)
          | ^
          | static 
>> kernel/sched/core.c:11415:5: warning: no previous prototype for function 'tg_set_affinity_period' [-Wmissing-prototypes]
    11415 | int tg_set_affinity_period(struct task_group *tg, u64 period_ms)
          |     ^
   kernel/sched/core.c:11415:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    11415 | int tg_set_affinity_period(struct task_group *tg, u64 period_ms)
          | ^
          | static 
>> kernel/sched/core.c:11429:5: warning: no previous prototype for function 'tg_get_affinity_period' [-Wmissing-prototypes]
    11429 | u64 tg_get_affinity_period(struct task_group *tg)
          |     ^
   kernel/sched/core.c:11429:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    11429 | u64 tg_get_affinity_period(struct task_group *tg)
          | ^
          | static 
   8 warnings generated.


vim +/tg_set_dynamic_affinity_mode +11374 kernel/sched/core.c

 11372	
 11373	#ifdef CONFIG_QOS_SCHED_SMART_GRID
 11374	int tg_set_dynamic_affinity_mode(struct task_group *tg, u64 mode)
 11375	{
 11376		struct auto_affinity *auto_affi = tg->auto_affinity;
 11377	
 11378		if (unlikely(!auto_affi))
 11379			return -EPERM;
 11380	
 11381		/* auto mode */
 11382		if (mode == 1)
 11383			start_auto_affinity(auto_affi);
 11384		else if (mode == 0)
 11385			stop_auto_affinity(auto_affi);
 11386		else
 11387			return -EINVAL;
 11388	
 11389		return 0;
 11390	}
 11391	
 11392	static u64 cpu_affinity_mode_read_u64(struct cgroup_subsys_state *css,
 11393						      struct cftype *cft)
 11394	{
 11395		struct task_group *tg = css_tg(css);
 11396	
 11397		if (!dynamic_affinity_enabled())
 11398			return -EPERM;
 11399	
 11400		if (unlikely(!tg->auto_affinity))
 11401			return -EPERM;
 11402	
 11403		return tg->auto_affinity->mode;
 11404	}
 11405	
 11406	static int cpu_affinity_mode_write_u64(struct cgroup_subsys_state *css,
 11407					   struct cftype *cftype, u64 mode)
 11408	{
 11409		if (!dynamic_affinity_enabled())
 11410			return -EPERM;
 11411	
 11412		return tg_set_dynamic_affinity_mode(css_tg(css), mode);
 11413	}
 11414	
 11415	int tg_set_affinity_period(struct task_group *tg, u64 period_ms)
 11416	{
 11417		if (unlikely(!tg->auto_affinity))
 11418			return -EPERM;
 11419	
 11420		if (!period_ms || period_ms > U64_MAX / NSEC_PER_MSEC)
 11421			return -EINVAL;
 11422	
 11423		raw_spin_lock_irq(&tg->auto_affinity->lock);
 11424		tg->auto_affinity->period = ms_to_ktime(period_ms);
 11425		raw_spin_unlock_irq(&tg->auto_affinity->lock);
 11426		return 0;
 11427	}
 11428	
 11429	u64 tg_get_affinity_period(struct task_group *tg)
 11430	{
 11431		if (unlikely(!tg->auto_affinity))
 11432			return -EPERM;
 11433	
 11434		return ktime_to_ms(tg->auto_affinity->period);
 11435	}
 11436	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
