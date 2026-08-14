Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD403612D8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Aug 2026 01:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786672495; cv=none; b=toDuqCzg5gkDmaJuiJn5ji8VbrBkCZ0n+vzDV6yCwdvMDZ1Lrk5NR1FP9GuR2K35wcsl7CtgQjmRW/Zo/PvzTNKGNgnwdzawvwWkT+ExOdpv0K1IKejw38bBLZuhODEL4QnncaL79dkxRPUI3dLKt4/t3vgbSfWO8xyKFy8uMEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786672495; c=relaxed/simple;
	bh=31S/7jeXa1QZw6/kqS6GVY1ehU0XJ4hxy8yICHOi2Xo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pr7gK33v+F6Cdc20HUhfsFoMBYdsJLIn8oLM8GXfDoTcNv21MPefBNvBZBSxyKuwyZSE8O6pasY2fc+29aoeYWKrdPsAROiGYqctCcwzfrPJlzBp+YRU1+Zd0KmIlxm71KDRbCVl5LDbrbTuD4IgEag6WrVa20zmyK0JemiP86Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IWSqXJeQ; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IWSqXJeQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786672493; x=1818208493;
  h=date:from:to:cc:subject:message-id;
  bh=31S/7jeXa1QZw6/kqS6GVY1ehU0XJ4hxy8yICHOi2Xo=;
  b=IWSqXJeQsclY+JPsr2TpHSdajUyzKXFyi5VpMLqVA1NKXu7VL7ukI7Tk
   j8Jsc2QiQ0BYms3H+6rnBXeVtPQuEGe/JDOLIBl2f8L1X+2HFsCCuWlS+
   94JRp4V4NJtsWFlK3MMsdmWJ/PrmHuijpXZLUWu/T3u7Tfn1zH8nH8WsX
   wXKEgFZ6OUT0tj2X8Xk21VDnAixC72Jtw0coEY+ucaoA9zfRNPVZKnxae
   xr6Hfkdb/8L12Xx34ntS2tVrtZSQj3qMi5Pt0gYmEqz2KzKG4KrZ8sVk/
   g9ueG6yQ88Zt04Z5voJju6vUwSE9/2pzDuHiDTMR+7TIPtS7yUjLlkYCj
   w==;
X-CSE-ConnectionGUID: IliisIpZTYGW2bVIU6jXvg==
X-CSE-MsgGUID: pvAejc0VQIqGesxNFAaxqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="91064554"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="91064554"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 18:54:52 -0700
X-CSE-ConnectionGUID: 7wT4cvQ1QMWkSOXM0hP+Zg==
X-CSE-MsgGUID: umUljUQ8QxeZ3c94U9PVPA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 13 Aug 2026 18:54:50 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuh8B-00000000XMk-43Mu;
	Fri, 14 Aug 2026 01:54:47 +0000
Date: Fri, 14 Aug 2026 09:54:03 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2026-04 0/7]
 include/trace/hooks/swapfile.h:16:1: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202608140944.jb3z4NbH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android15-6.6-2026-04
head:   94ba6cba4be120105fa6919c2279fc8e0efe174e
commit: a402d311bb6a70f790ec81024488326277d1ba75 [0/7] ANDROID: vendor hooks: add hooks to support the functionality and management of multiple swap devices.
config: i386-randconfig-062-20260814 (https://download.01.org/0day-ci/archive/20260814/202608140944.jb3z4NbH-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260814/202608140944.jb3z4NbH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608140944.jb3z4NbH-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/swapfile.c:628:13: sparse: sparse: context imbalance in 'cluster_reclaim_range' - unexpected unlock
   mm/swapfile.c:765:23: sparse: sparse: context imbalance in 'alloc_swap_scan_cluster' - different lock contexts for basic block
   mm/swapfile.c:784:31: sparse: sparse: context imbalance in 'swap_reclaim_full_clusters' - unexpected unlock
   mm/swapfile.c:1051:13: sparse: sparse: context imbalance in 'swap_offset_available_and_locked' - wrong count at exit
   mm/swapfile.c:1257:9: sparse: sparse: context imbalance in 'scan_swap_map_slots' - unexpected unlock
   mm/swapfile.c: note: in included file:
>> include/trace/hooks/swapfile.h:16:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/swapfile.h:16:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/swapfile.h:16:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   mm/swapfile.c:1414:36: sparse: sparse: context imbalance in 'swap_info_get_cont' - unexpected unlock
   mm/swapfile.c:458:9: sparse: sparse: context imbalance in '__swap_entry_free' - different lock contexts for basic block
   mm/swapfile.c:458:9: sparse: sparse: context imbalance in '__swap_entries_free' - different lock contexts for basic block
   mm/swapfile.c:1619:23: sparse: sparse: context imbalance in 'swap_entry_range_free' - different lock contexts for basic block
   mm/swapfile.c:458:9: sparse: sparse: context imbalance in 'cluster_swap_free_nr' - different lock contexts for basic block
   mm/swapfile.c:1699:38: sparse: sparse: context imbalance in 'put_swap_folio' - different lock contexts for basic block
   mm/swapfile.c:1743:28: sparse: sparse: context imbalance in 'swapcache_free_entries' - unexpected unlock
   mm/swapfile.c:458:9: sparse: sparse: context imbalance in 'swap_swapcount' - different lock contexts for basic block
   mm/swapfile.c:458:9: sparse: sparse: context imbalance in 'swp_swapcount' - different lock contexts for basic block
   mm/swapfile.c:458:9: sparse: sparse: context imbalance in 'swap_page_trans_huge_swapped' - different lock contexts for basic block
   mm/swapfile.c:2202:17: sparse: sparse: context imbalance in 'unuse_pte' - unexpected unlock
   mm/swapfile.c:2289:26: sparse: sparse: context imbalance in 'unuse_pte_range' - unexpected unlock
   mm/swapfile.c:458:9: sparse: sparse: context imbalance in '__swap_duplicate' - different lock contexts for basic block
   mm/swapfile.c:3972:23: sparse: sparse: context imbalance in 'add_swap_count_continuation' - different lock contexts for basic block

vim +16 include/trace/hooks/swapfile.h

    12	
    13	DECLARE_HOOK(android_vh_get_swap_pages_bypass,
    14		TP_PROTO(struct swap_info_struct *si, int entry_order, bool *skip),
    15		TP_ARGS(si, entry_order, skip));
  > 16	DECLARE_RESTRICTED_HOOK(android_rvh_get_swap_pages_bypass,
    17		TP_PROTO(struct swap_info_struct *si, int entry_order, bool *skip, swp_entry_t *entry),
    18		TP_ARGS(si, entry_order, skip, entry), 3);
    19	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
