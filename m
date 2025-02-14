Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87DC825A627
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Feb 2025 12:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739536639; cv=none; b=H2g38UYluqHoC4nlSJhNqKx8bHadeTJGCI9KRYLca0L9hnu15Jnl9Dyd3agrjrIMdVmAOC0BbRDovCcT9flREFfpjE18Eao3jHkFC+Ifm12rdhoVU7gZY8h3HSaCatEwWtGpEjR4WEP3MdkpBajWM3B8+j90cfrOe1c+wARSQ+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739536639; c=relaxed/simple;
	bh=dgZSa9sENfnuGY8FEBF12KAZ1TW/qhYveDfgrivlUT8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ABzwgJCN6D3Ts/74htuz0MlPa0a8pi9u9tdszzoIUvVc1wj4ZLXJ78wQtvINkfw/3FeH9VYZ1A/54AEvu/+KscZQb8odu2GBFBoc7CL5HPJJjeWwC9MxDUAp1fX6IH5M/PnfewZ5jB2xk4Vtz49YOb1HbZKJUC78JZ5MwXX7/nE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PNFCL9xm; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PNFCL9xm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739536637; x=1771072637;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dgZSa9sENfnuGY8FEBF12KAZ1TW/qhYveDfgrivlUT8=;
  b=PNFCL9xmQ0cI1xln0z+ChT2fJ4K/i6vII+xXosj8h7KxarwDpKEn5PIE
   FZyuFdysJsa4lGePize66iRoCTfEqo6I6I5ZEIjhBLZMfpC+Bp0mrmImq
   D1BqginhqI4oSWfuBF4oB54N4WVCgbz0UFYxffemtwKSUN2tWy10K4eSL
   IE89/Q5dno5yFd/VU9KdWEavp0kZG0yUwL9I4uhYYcz2/ZvQvS8vd6iDM
   rEE3scj3BbApgdrNE7awOJPXU6by8d2IUP282F/zNYCfbyE/UDuSYUHWL
   2wxcTnDNDFqBNCDFAx0TilW5rlJMyRbyEFDiAVYg5/04xXWeqO27zhXW2
   w==;
X-CSE-ConnectionGUID: sJTxxS4lSGyd2gyZungLqA==
X-CSE-MsgGUID: 3XFA51PfSxOStlF3tCIZWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="39991249"
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; 
   d="scan'208";a="39991249"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 04:37:17 -0800
X-CSE-ConnectionGUID: VzZ685RdSe60HU6ke8y7SA==
X-CSE-MsgGUID: tEJdoo14QkGVJYfPvBgKyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; 
   d="scan'208";a="118555316"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 14 Feb 2025 04:37:11 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tiuwP-0019Xl-0Q;
	Fri, 14 Feb 2025 12:37:09 +0000
Date: Fri, 14 Feb 2025 20:36:22 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Ze Zuo <zuoze1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1924/1924] mm/page_cache_limit.c:35:5: warning:
 no previous prototype for function 'cache_reclaim_enable_handler'
Message-ID: <202502142012.QOB8Lff2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ze,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   254b433462607f511039b75693d9314822538f20
commit: 621647ce254f1d347ae9bc3d328c09cbb2732487 [1924/1924] mm: support periodical memory reclaim
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250214/202502142012.QOB8Lff2-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250214/202502142012.QOB8Lff2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502142012.QOB8Lff2-lkp@intel.com/

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
