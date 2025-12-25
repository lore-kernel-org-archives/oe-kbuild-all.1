Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC202FF14C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Dec 2025 08:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766651577; cv=none; b=Kr1kXO1hWSTCyCV3IOp7GqWo49LC7E56esZQ3dTL2PrAO8qbMl5/AFgK254IhAvncZELUIFb1j2N1VPkZcTz9sXSfAe+8n6oWsAusP1ug8p6ekGrYK8QNxV7c7XFd5yXLFqccpIMEk0tx0a5PvSO7Vrw28V3zqwPGhQ06/m/r2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766651577; c=relaxed/simple;
	bh=4zrLJehejRHxGU4jz//hw6gby809g8kz1qj3suCqp0I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sd386S8qIq7cDgZSZKv4z0fGbAsolAdqXcXVAx9/8e66q4r3ADVIROVLcDwVyT9CPhVWaNPTy7xfRtiKDEg1HSEmIT0Hm/YydG5s6R1UDpJvqGwxbRvSuo2xwhphTPzShSKcuHT9SXcmmZ5RJjRhQYcRl2hj2nAD7MSg/GJsp9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S6CTAQUL; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S6CTAQUL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766651576; x=1798187576;
  h=date:from:to:cc:subject:message-id;
  bh=4zrLJehejRHxGU4jz//hw6gby809g8kz1qj3suCqp0I=;
  b=S6CTAQULpdmOUN9YLhuFEB8lW4MiOgmuU0ZoC9UN7WqAChkqBqe5qruu
   ajeZlbaR4+snrY5T5FKoL5Sz/51B8X4g1vFD49e4bRp8qH+fYLIH1bRSe
   Pb7wjiL+ta1lbrZQUBYSWk1pe3MHjvS0fCK0DM9MqV8ypEtxQOSvGCHpK
   br6cOEuGOIpSX4YgdwgraRJRTz9vKkt58cK1XPtxeg+2wApUQs523Tw4F
   jfK35QzhvAgOpZ64bb7K1AFXNwwdd4Tnhla3tavO/jWd+U6eb75VkUK3x
   ykbvUMoYJHsSZpvmWVE5f1lAMPrSCX3wTgviALQeqO2ITT/XhiQYmHKT1
   w==;
X-CSE-ConnectionGUID: ElQgw9nKSqa13CedteJdCA==
X-CSE-MsgGUID: loB/Hw/MQoWn0nI/Ic4JAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="85878863"
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; 
   d="scan'208";a="85878863"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2025 00:32:55 -0800
X-CSE-ConnectionGUID: KbYMmSWIRWe0bu12+ISyrQ==
X-CSE-MsgGUID: MEcpVEZlQMear08EQX9R3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; 
   d="scan'208";a="204714463"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 25 Dec 2025 00:32:53 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYgm6-000000003uH-403W;
	Thu, 25 Dec 2025 08:32:47 +0000
Date: Thu, 25 Dec 2025 16:31:49 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Ze Zuo <zuoze1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 10/10] mm/page_cache_limit.c:35:5:
 warning: no previous prototype for function 'cache_reclaim_enable_handler'
Message-ID: <202512251637.3XaOXOTN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Ze,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   610575a82bdf3c3be06ce9559609d5bfa65472e8
commit: 621647ce254f1d347ae9bc3d328c09cbb2732487 [10/10] mm: support periodical memory reclaim
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20251225/202512251637.3XaOXOTN-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251225/202512251637.3XaOXOTN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512251637.3XaOXOTN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/page_cache_limit.c:6:
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
>> mm/page_cache_limit.c:35:5: warning: no previous prototype for function 'cache_reclaim_enable_handler' [-Wmissing-prototypes]
      35 | int cache_reclaim_enable_handler(struct ctl_table *table, int write,
         |     ^
   mm/page_cache_limit.c:35:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      35 | int cache_reclaim_enable_handler(struct ctl_table *table, int write,
         | ^
         | static 
>> mm/page_cache_limit.c:51:5: warning: no previous prototype for function 'cache_reclaim_sysctl_handler' [-Wmissing-prototypes]
      51 | int cache_reclaim_sysctl_handler(struct ctl_table *table, int write,
         |     ^
   mm/page_cache_limit.c:51:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      51 | int cache_reclaim_sysctl_handler(struct ctl_table *table, int write,
         | ^
         | static 
   7 warnings generated.


vim +/cache_reclaim_enable_handler +35 mm/page_cache_limit.c

    34	
  > 35	int cache_reclaim_enable_handler(struct ctl_table *table, int write,
    36				void *buffer, size_t *length, loff_t *ppos)
    37	{
    38		int ret;
    39	
    40		ret = proc_dointvec_minmax(table, write, buffer, length, ppos);
    41		if (ret || !write)
    42			return ret;
    43	
    44		if (should_periodical_reclaim())
    45			schedule_delayed_work(&shepherd, round_jiffies_relative(
    46				(unsigned long)vm_cache_reclaim_s * HZ));
    47	
    48		return 0;
    49	}
    50	
  > 51	int cache_reclaim_sysctl_handler(struct ctl_table *table, int write,
    52			void *buffer, size_t *length, loff_t *ppos)
    53	{
    54		int ret;
    55	
    56		ret = proc_dointvec_minmax(table, write, buffer, length, ppos);
    57		if (ret || !write)
    58			return ret;
    59	
    60		if (should_periodical_reclaim())
    61			mod_delayed_work(system_unbound_wq, &shepherd,
    62					round_jiffies_relative(
    63					(unsigned long)vm_cache_reclaim_s * HZ));
    64	
    65		return ret;
    66	}
    67	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
