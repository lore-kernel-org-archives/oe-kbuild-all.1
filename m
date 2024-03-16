Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F70717BA6
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Mar 2024 15:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710604557; cv=none; b=U1MFYMo0u4zRPwhpafL/Hrgdi2fdj9/RdtRN3e0ZSWXswlR8Uv3+bd7x3oQ2eoBmFXv4YRmQY0g9zEHFucBJ3gJzq67G5U6XWw4c8qQlvE9JJE2EjPDwhaJ85qMenuw6D9HBD2f4qz4+2+hZoREYOyhbDRhGgMFkheQ/OeJXxGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710604557; c=relaxed/simple;
	bh=uKOypq3ObO12JopNaCp/9FD9sebHSRuu0A9JcsDFijQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OK8TGvcbTDMn6fMmjkTm6tn5uFzNhoAalkq/pHHknlh4FZsiMl8o3vEcftAh/nY6coWg/gKIeMRGw0a3KLJvoeZOKaxMleuV4MM47xDmrITBy3+ztT1yC0GTkPWiCOfCSd36kQe6NxrRyD+Ct/FyPuY7Z1i/XPl7k/YITyXwnSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I211fD1C; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I211fD1C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710604554; x=1742140554;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uKOypq3ObO12JopNaCp/9FD9sebHSRuu0A9JcsDFijQ=;
  b=I211fD1Cmnk8D/ypI7WBUU8x6JB4uaTG8/n0zReFv6R/mIdu9AAw8uel
   pjUpUoNDOhJgkRI6q5ShMqjMrnPABh9Kn/fCm7R/7bCI21hq9VeZHkxMg
   3ilhh8OLd7kqxHLHK8NIAut884P8RtgjWkuOCzpXAXmfTbfQ6UJWTFbpk
   sFn0IW9Hc/Wy6+DoJz+BivKpfpKdH7gatVgmlJVbg1r2nDXeew1lPvxNc
   fDI+s7JhcOuybUx43+mmVl9dkZ8ryqxHpdg/nFghiOkdeN3eRBr4AZlt3
   sZ23O64qM9x01fNSo7OWI1eKB2qpV/43sl2fjnI/AkqVZY+Vax+GDP4MN
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11015"; a="5594126"
X-IronPort-AV: E=Sophos;i="6.07,130,1708416000"; 
   d="scan'208";a="5594126"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2024 08:55:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,130,1708416000"; 
   d="scan'208";a="13071954"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 16 Mar 2024 08:55:51 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rlWNw-000FXd-1x;
	Sat, 16 Mar 2024 15:55:48 +0000
Date: Sat, 16 Mar 2024 23:55:16 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/next 26636/27507] mm/memcontrol.c:123:25:
 sparse: sparse: symbol 'memcg_async_reclaim_wq' was not declared. Should it
 be static?
Message-ID: <202403162323.Jdiaw64F-lkp@intel.com>
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
commit: 896f68ef437a5b4b559249d5b172a17aa4b839d5 [26636/27507] rue/mm: add memory cgroup async page reclaim mechanism
config: x86_64-randconfig-121-20240312 (https://download.01.org/0day-ci/archive/20240316/202403162323.Jdiaw64F-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240316/202403162323.Jdiaw64F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403162323.Jdiaw64F-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/memcontrol.c:123:25: sparse: sparse: symbol 'memcg_async_reclaim_wq' was not declared. Should it be static?
   mm/memcontrol.c:3334:15: sparse: sparse: symbol 'prio_reclaim_bytes' was not declared. Should it be static?
   mm/memcontrol.c:5327:21: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/memcontrol.c:5327:21: sparse:    struct mem_cgroup_threshold_ary [noderef] __rcu *
   mm/memcontrol.c:5327:21: sparse:    struct mem_cgroup_threshold_ary *
   mm/memcontrol.c:5329:21: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/memcontrol.c:5329:21: sparse:    struct mem_cgroup_threshold_ary [noderef] __rcu *
   mm/memcontrol.c:5329:21: sparse:    struct mem_cgroup_threshold_ary *
   mm/memcontrol.c:5486:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/memcontrol.c:5486:9: sparse:    struct mem_cgroup_threshold_ary [noderef] __rcu *
   mm/memcontrol.c:5486:9: sparse:    struct mem_cgroup_threshold_ary *
   mm/memcontrol.c:5580:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/memcontrol.c:5580:9: sparse:    struct mem_cgroup_threshold_ary [noderef] __rcu *
   mm/memcontrol.c:5580:9: sparse:    struct mem_cgroup_threshold_ary *
   mm/memcontrol.c:7773:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/memcontrol.c:7773:23: sparse:    struct task_struct [noderef] __rcu *
   mm/memcontrol.c:7773:23: sparse:    struct task_struct *
   mm/memcontrol.c:1587:28: sparse: sparse: context imbalance in 'priority_kill_process' - unexpected unlock
   mm/memcontrol.c: note: in included file:
   include/linux/memcontrol.h:827:9: sparse: sparse: context imbalance in 'lock_page_lruvec' - wrong count at exit
   include/linux/memcontrol.h:827:9: sparse: sparse: context imbalance in 'lock_page_lruvec_irq' - wrong count at exit
   include/linux/memcontrol.h:827:9: sparse: sparse: context imbalance in 'lock_page_lruvec_irqsave' - wrong count at exit
   mm/memcontrol.c:1947:13: sparse: sparse: context imbalance in 'mem_cgroup_mst_has_lmt_init' - different lock contexts for basic block
   mm/memcontrol.c:2738:19: sparse: sparse: context imbalance in 'lock_page_memcg' - wrong count at exit
   mm/memcontrol.c:2800:17: sparse: sparse: context imbalance in '__unlock_page_memcg' - unexpected unlock
   mm/memcontrol.c:7620:28: sparse: sparse: context imbalance in 'mem_cgroup_count_precharge_pte_range' - unexpected unlock
   mm/memcontrol.c:7821:36: sparse: sparse: context imbalance in 'mem_cgroup_move_charge_pte_range' - unexpected unlock

vim +/memcg_async_reclaim_wq +123 mm/memcontrol.c

   112	
   113	static unsigned long rmem_wmark_limit;
   114	static unsigned long rmem_wmark_setpoint;
   115	static unsigned long rmem_wmark_freerun;
   116	static long memcg_pos_ratio;
   117	static atomic_long_t memcg_allocated_count;
   118	static atomic_long_t memcg_reclaimed_count;
   119	static unsigned long memcg_reclaim_goal;
   120	static int memcg_cur_reclaim_prio = CGROUP_PRIORITY_MAX;
   121	static DEFINE_SPINLOCK(memcg_reclaim_prio_lock);
   122	/* workqueue for async reclaim */
 > 123	struct workqueue_struct *memcg_async_reclaim_wq;
   124	#define ASYNC_DISTANCE_DIV	1000000
   125	#define ASYNC_RATIO_DIV		100
   126	#define ASYNC_DISTANCE_DEF	1
   127	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
