Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4246C12E68
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Mar 2024 09:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710668902; cv=none; b=ICpJboh5Fp71WkaW4BFid6ndWq/4q6uWGlZd84oZ3QDCO87vU47oTZkVNIxt7/C/OP8c7rvzmMmrogW1LlgHFffBfs6bgU9PT+z+/P3KD0p/W0nIEpF2VonY8tt2ffmcAl9PHl9hiRZzpgD523AKV1HMQ3vM3zeLxUMGz96ukbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710668902; c=relaxed/simple;
	bh=CATk1o/13/j/+9zo/rs/PruZsThZITEI0lkXdM5wNTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UzCTTUv0Um3aRTWVKtKlApoC83trCxr8bpYt+0E1uP/LzVmxyApNhmnVa78C3yac2v8dhhuN5RP75zzraugLWb8oTDuc90aTlko1bZbgNem09lGamAUrajynJdQeH1hFz2pqbDqX5hn//SHuSxaaEdzYwthsxislGG5EF5Tbob0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=deVHY+lP; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="deVHY+lP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710668899; x=1742204899;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CATk1o/13/j/+9zo/rs/PruZsThZITEI0lkXdM5wNTQ=;
  b=deVHY+lPm5L1kz+TOnYdikPuKYLt/VDApnI+A/8UHIjoisqMMM2OoMC8
   bUDLFAtGmytrabAwXEWgKnT4IpuR3GCKMlzOgaWAiJdhqJhcx3I+ZZcYn
   wQea8BkGdUbp/GKxxy1lYgBgkBzuS/RL6p8o52Dxh4w/xigNy+c00ICLC
   Pu+BGrn+3u0cmkxfdy+AwBll8kg9az1I99MzVVNXEehLq4hx4Umd1bVQ5
   m4CPFnMCNVjzKcHT/1opg6X2hve9NysH95UdTLocVh9kIaKXcSOAHiLGu
   yIQA3Jq5qJmFFqGA88FqHOcoZyehXDmiGiYaQUfkJzQvlClNQfZ3XYJoN
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11015"; a="16135360"
X-IronPort-AV: E=Sophos;i="6.07,132,1708416000"; 
   d="scan'208";a="16135360"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2024 02:48:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,132,1708416000"; 
   d="scan'208";a="13224578"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 17 Mar 2024 02:48:16 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rln7l-000G9z-29;
	Sun, 17 Mar 2024 09:48:13 +0000
Date: Sun, 17 Mar 2024 17:47:19 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/next 26642/27507] mm/memcontrol.c:116:1:
 sparse: sparse: symbol 'kclean_dying_memcg_wq' was not declared. Should it
 be static?
Message-ID: <202403171731.LfjyakB9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/next
head:   fdd5d0bfc620bd5147ff5b260822c7645aeddad6
commit: 68cbf3a984c5937a720ffa99c7e5a8b463a9c097 [26642/27507] rue/mm: introduce new feature to async clean dying memcgs
config: x86_64-randconfig-121-20240312 (https://download.01.org/0day-ci/archive/20240317/202403171731.LfjyakB9-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240317/202403171731.LfjyakB9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403171731.LfjyakB9-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/memcontrol.c:116:1: sparse: sparse: symbol 'kclean_dying_memcg_wq' was not declared. Should it be static?
   mm/memcontrol.c:132:25: sparse: sparse: symbol 'memcg_async_reclaim_wq' was not declared. Should it be static?
   mm/memcontrol.c:3327:15: sparse: sparse: symbol 'prio_reclaim_bytes' was not declared. Should it be static?
   mm/memcontrol.c:4695:15: sparse: sparse: symbol 'mem_cgroup_pagecache_get_reclaim_pages' was not declared. Should it be static?
   mm/memcontrol.c:5580:21: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/memcontrol.c:5580:21: sparse:    struct mem_cgroup_threshold_ary [noderef] __rcu *
   mm/memcontrol.c:5580:21: sparse:    struct mem_cgroup_threshold_ary *
   mm/memcontrol.c:5582:21: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/memcontrol.c:5582:21: sparse:    struct mem_cgroup_threshold_ary [noderef] __rcu *
   mm/memcontrol.c:5582:21: sparse:    struct mem_cgroup_threshold_ary *
   mm/memcontrol.c:5739:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/memcontrol.c:5739:9: sparse:    struct mem_cgroup_threshold_ary [noderef] __rcu *
   mm/memcontrol.c:5739:9: sparse:    struct mem_cgroup_threshold_ary *
   mm/memcontrol.c:5833:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/memcontrol.c:5833:9: sparse:    struct mem_cgroup_threshold_ary [noderef] __rcu *
   mm/memcontrol.c:5833:9: sparse:    struct mem_cgroup_threshold_ary *
>> mm/memcontrol.c:7554:6: sparse: sparse: symbol 'charge_dying_memcgs' was not declared. Should it be static?
   mm/memcontrol.c:8210:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/memcontrol.c:8210:23: sparse:    struct task_struct [noderef] __rcu *
   mm/memcontrol.c:8210:23: sparse:    struct task_struct *
>> mm/memcontrol.c:10230:6: sparse: sparse: symbol 'reap_slab' was not declared. Should it be static?
   mm/memcontrol.c:1588:28: sparse: sparse: context imbalance in 'priority_kill_process' - unexpected unlock
   mm/memcontrol.c: note: in included file:
   include/linux/memcontrol.h:864:9: sparse: sparse: context imbalance in 'lock_page_lruvec' - wrong count at exit
   include/linux/memcontrol.h:864:9: sparse: sparse: context imbalance in 'lock_page_lruvec_irq' - wrong count at exit
   include/linux/memcontrol.h:864:9: sparse: sparse: context imbalance in 'lock_page_lruvec_irqsave' - wrong count at exit
   mm/memcontrol.c:1948:13: sparse: sparse: context imbalance in 'mem_cgroup_mst_has_lmt_init' - different lock contexts for basic block
   mm/memcontrol.c:2731:19: sparse: sparse: context imbalance in 'lock_page_memcg' - wrong count at exit
   mm/memcontrol.c:2793:17: sparse: sparse: context imbalance in '__unlock_page_memcg' - unexpected unlock
   mm/memcontrol.c:8057:28: sparse: sparse: context imbalance in 'mem_cgroup_count_precharge_pte_range' - unexpected unlock
   mm/memcontrol.c:8258:36: sparse: sparse: context imbalance in 'mem_cgroup_move_charge_pte_range' - unexpected unlock

vim +/kclean_dying_memcg_wq +116 mm/memcontrol.c

   112	
   113	unsigned int sysctl_clean_dying_memcg_async;
   114	unsigned int sysctl_clean_dying_memcg_threshold = 100;
   115	static struct task_struct *kclean_dying_memcg;
 > 116	DECLARE_WAIT_QUEUE_HEAD(kclean_dying_memcg_wq);
   117	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
