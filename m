Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98752D0C78
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Sep 2025 09:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757495158; cv=none; b=M7JD2lgacygT1Y8dWeTuL1MfpDZ53jrgCxaNvaL84hv/nnreIsL/kQdjjy+zTwYDKHEXeKpFMUWa1JEuMjB7y9rwdafzqa1Zo+7f8vjMdQek1a6zzwyRrjVcO1jSV//6mXb7NzuY0jgQYnI3+DjSkB+7y947z6XXht0yRaFHa5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757495158; c=relaxed/simple;
	bh=ctmHmHxHr6R+QGSnsg2F0QyRE/RywMnM9XxN5gPb1aE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Eab7S7lj5WXwsvSnItjhILeav1kNtsRMgVZ7ulSbgCu4ImTkM/jGxrk/wWbwWk2HL4995+tXu3SD1SYybpTdHQH0hccbruFavzkbBhp5PkmLtwgQ5Uf1iHPkjLiTRNpujYde9IsIO1M1ntQuTVhq/oRHkhRfxa6ZZtChIwuORSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LWTLsRd2; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LWTLsRd2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757495157; x=1789031157;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ctmHmHxHr6R+QGSnsg2F0QyRE/RywMnM9XxN5gPb1aE=;
  b=LWTLsRd2P82PK5rN4QtDW9aOCGcyqd6G90tcI9oDjklOp9e6+CJRxf/6
   RQaMNRhP8YBVn5puUOtTGyq7eP/rxnHxhQ50/PJsrsFjqvIpoQ/NM6aIB
   4YFRZjkbFojS3cbgsoxldEXDfLXz16tDxOnE9Hp9sxltsdlEo/UftBzUn
   iIHg1srPdWGGbszmpCqcsFDxe2aZWGFmEC7UtngcKDmnjgaT+v4CpOIVp
   NTiMESmoa+ggKQo+VNNCwMY7Qi0wzApAZ96vUGTd/l1TGsfWXqTs1H53b
   k8YHlDzyjpY5ezT67uM16k1isKAb4q0RmyqDR1+jzHqE/AsS3L034u5Ux
   g==;
X-CSE-ConnectionGUID: VQbgdGFcT7uSgfqvk1wlCA==
X-CSE-MsgGUID: 5vY/WURiTdyEIlchc83pmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="82389290"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="82389290"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 02:05:56 -0700
X-CSE-ConnectionGUID: q9nU4ZPdR4KkSREBWZM/1w==
X-CSE-MsgGUID: l+B5FMRtSPasfTT3bcAQLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; 
   d="scan'208";a="178553306"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 Sep 2025 02:05:55 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uwGm0-0005jV-04;
	Wed, 10 Sep 2025 09:05:52 +0000
Date: Wed, 10 Sep 2025 17:05:39 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yuan Can <yuancan@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2871/2871] mm/memcontrol.c:3147:6: warning: no
 previous prototype for function 'hisi_oom_recover'
Message-ID: <202509101646.6hsrX8dz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Weilong,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   935ce5f701cad04fd0633c36012e5876ba0e4b37
commit: b498d9f1bacd40d583c0970cab02ad522127a7e7 [2871/2871] arm64/ascend: Add new enable_oom_killer interface for oom contrl
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250910/202509101646.6hsrX8dz-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250910/202509101646.6hsrX8dz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509101646.6hsrX8dz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/memcontrol.c:29:
   In file included from include/linux/memcontrol.h:20:
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
   In file included from mm/memcontrol.c:57:
   include/linux/mm_inline.h:46:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      46 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:48:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      48 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
>> mm/memcontrol.c:3147:6: warning: no previous prototype for function 'hisi_oom_recover' [-Wmissing-prototypes]
    3147 | void hisi_oom_recover(struct obj_cgroup *objcg)
         |      ^
   mm/memcontrol.c:3147:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3147 | void hisi_oom_recover(struct obj_cgroup *objcg)
         | ^
         | static 
   mm/memcontrol.c:4007:48: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
    4007 |                         nr += lruvec_page_state(lruvec, NR_LRU_BASE + lru);
         |                                                         ~~~~~~~~~~~ ^ ~~~
   mm/memcontrol.c:4009:54: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
    4009 |                         nr += lruvec_page_state_local(lruvec, NR_LRU_BASE + lru);
         |                                                               ~~~~~~~~~~~ ^ ~~~
   mm/memcontrol.c:4025:46: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
    4025 |                         nr += memcg_page_state(memcg, NR_LRU_BASE + lru);
         |                                                       ~~~~~~~~~~~ ^ ~~~
   mm/memcontrol.c:4027:52: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
    4027 |                         nr += memcg_page_state_local(memcg, NR_LRU_BASE + lru);
         |                                                             ~~~~~~~~~~~ ^ ~~~
   12 warnings generated.


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
