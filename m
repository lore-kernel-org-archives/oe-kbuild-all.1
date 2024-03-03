Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F32B28E7
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Mar 2024 12:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709469113; cv=none; b=BEyCCn6gOKCyrZXqEF9DJi182Zpda0j9mto7Uuo4/KeN7HECaUOTHyZ0ZOjUbkaBCgOp9FzG9haZJv84DWAbfMv5oncLTwvelptVU56lv3r+N7nLANf6BDfJcvfcpHGmYyu4XHocLwitSVlHPbyCQkU8Q9YXVknuXdx34Onw5jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709469113; c=relaxed/simple;
	bh=kQF3d3dPi7g6TAPJDmp0J1HA61sRtsFr7fXKDIUL23Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lcRFwjMkxk7agyGwyKud1gT7NktM6V52U2jc01xfNXJ8GfqlPzPRwMXFhTa7yvCqdTbvzlxEKtzRcqNz4u6cGRsGZLxMWCvwYIrIhffbv57dwvF1ypmz6R3FWuXiQ3opYwZeV9zXTvn2UA69QtIIjznIGcyHF2Bwebei4kpX+H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZD7vuLAv; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZD7vuLAv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709469111; x=1741005111;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kQF3d3dPi7g6TAPJDmp0J1HA61sRtsFr7fXKDIUL23Q=;
  b=ZD7vuLAv3A9zJJdAWfzi4lIB7Uc6NI/HpBrqmXF2mx7SlyAU7G+dsuCw
   R+yLswMTcRA5WpW3hC6scMw+OiWEX3bmOOnS23TKRkokyByMCjq1+WSGT
   nXoSm1y2Y2rdB5Y8/AWnJCOxshk/KYRs8uJo6HfpW8dbrHSol++4kV0sA
   1JqDidPNdTGMX09AxJGJQ51TgezECLJnP+CPAwUi9QxgtrV+cYpI6rfxO
   JnY+pT8H1UlmUSknrvcePcsKvjI3L/crSFsyL7o8TxP39jFQrBlNo71oQ
   9wIBXAtI6y2Hd7kxRnlkTSM5MVPZgLL0U1m4HPSHEqQuY2ddiUD3sKus3
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11001"; a="14610411"
X-IronPort-AV: E=Sophos;i="6.06,200,1705392000"; 
   d="scan'208";a="14610411"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2024 04:31:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,200,1705392000"; 
   d="scan'208";a="8629151"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 03 Mar 2024 04:31:48 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgl0L-0001lI-0X;
	Sun, 03 Mar 2024 12:31:45 +0000
Date: Sun, 3 Mar 2024 20:31:01 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yuan Can <yuancan@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1683/3769] mm/memcontrol.c:3147:6: sparse:
 sparse: symbol 'hisi_oom_recover' was not declared. Should it be static?
Message-ID: <202403032008.Rzqq5udk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   fbcd4a3032a53350f6d182c9daeaa4c46e65d964
commit: b498d9f1bacd40d583c0970cab02ad522127a7e7 [1683/3769] arm64/ascend: Add new enable_oom_killer interface for oom contrl
config: arm64-randconfig-r111-20240227 (https://download.01.org/0day-ci/archive/20240303/202403032008.Rzqq5udk-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240303/202403032008.Rzqq5udk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403032008.Rzqq5udk-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/memcontrol.c:3147:6: sparse: sparse: symbol 'hisi_oom_recover' was not declared. Should it be static?
   mm/memcontrol.c:4228:21: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/memcontrol.c:4228:21: sparse:    struct mem_cgroup_threshold_ary [noderef] __rcu *
   mm/memcontrol.c:4228:21: sparse:    struct mem_cgroup_threshold_ary *
   mm/memcontrol.c:4230:21: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/memcontrol.c:4230:21: sparse:    struct mem_cgroup_threshold_ary [noderef] __rcu *
   mm/memcontrol.c:4230:21: sparse:    struct mem_cgroup_threshold_ary *
   mm/memcontrol.c:4386:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/memcontrol.c:4386:9: sparse:    struct mem_cgroup_threshold_ary [noderef] __rcu *
   mm/memcontrol.c:4386:9: sparse:    struct mem_cgroup_threshold_ary *
   mm/memcontrol.c:4480:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/memcontrol.c:4480:9: sparse:    struct mem_cgroup_threshold_ary [noderef] __rcu *
   mm/memcontrol.c:4480:9: sparse:    struct mem_cgroup_threshold_ary *
   mm/memcontrol.c:6198:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/memcontrol.c:6198:23: sparse:    struct task_struct [noderef] __rcu *
   mm/memcontrol.c:6198:23: sparse:    struct task_struct *
   mm/memcontrol.c: note: in included file (through include/linux/rculist.h, include/linux/pid.h, include/linux/sched.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   mm/memcontrol.c: note: in included file:
   include/linux/memcontrol.h:751:9: sparse: sparse: context imbalance in 'folio_lruvec_lock' - wrong count at exit
   include/linux/memcontrol.h:751:9: sparse: sparse: context imbalance in 'folio_lruvec_lock_irq' - wrong count at exit
   include/linux/memcontrol.h:751:9: sparse: sparse: context imbalance in 'folio_lruvec_lock_irqsave' - wrong count at exit
   mm/memcontrol.c:2111:6: sparse: sparse: context imbalance in 'folio_memcg_lock' - wrong count at exit
   mm/memcontrol.c:2158:17: sparse: sparse: context imbalance in '__folio_memcg_unlock' - unexpected unlock
   mm/memcontrol.c: note: in included file (through include/linux/rculist.h, include/linux/pid.h, include/linux/sched.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   mm/memcontrol.c: note: in included file (through include/linux/rculist.h, include/linux/pid.h, include/linux/sched.h, ...):
   include/linux/rcupdate.h:780:9: sparse: sparse: context imbalance in 'mem_cgroup_count_precharge_pte_range' - unexpected unlock
   include/linux/rcupdate.h:780:9: sparse: sparse: context imbalance in 'mem_cgroup_move_charge_pte_range' - unexpected unlock

vim +/hisi_oom_recover +3147 mm/memcontrol.c

  3145	
  3146	#ifdef CONFIG_ASCEND_OOM
> 3147	void hisi_oom_recover(struct obj_cgroup *objcg)
  3148	{
  3149		struct mem_cgroup *memcg;
  3150	
  3151		memcg = get_mem_cgroup_from_objcg(objcg);
  3152		if (!mem_cgroup_is_root(memcg))
  3153			memcg_oom_recover(memcg);
  3154		css_put(&memcg->css);
  3155	}
  3156	#else
  3157	static inline void hisi_oom_recover(struct obj_cgroup *objcg) { }
  3158	#endif
  3159	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
