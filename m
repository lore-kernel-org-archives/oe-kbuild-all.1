Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76BFD17CA1A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 May 2024 17:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717177990; cv=none; b=UshDy1F6M72MK3ijER+LR4580WJAUjW4wElUSfpBo2lBa8sYAV3f26uPCxjPZTRpdi9Y3DcH+QOI0Cwa1MHYgGoZj7MgRkvtdDAh/IQKE+0NeFMpSLUhHvYxdFBLyni1hbhv1HPkZDhh9vmTpnTz/HeUPVG3e4jx+M0XACbD7oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717177990; c=relaxed/simple;
	bh=PElD6fMTQXiL9zLRZOJ9nArnUU6IzbyFxW3USV5K2Y0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U5bCnNaho01eUuizyBqABt/XSmXCPz6SX4spBMjarftIw1na8rf9Q1zCiQyME2ymqu/ln/C/YAFy14WbefeunJl/+huxZ5RhmdC7DHu0lmvD7Jfa6LRPvs7mzOMpsBaTRKEfN+lIgTQjhjCM3pZADnhb8hBuES6dysiKLIqGo44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ED7jQXAs; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ED7jQXAs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717177989; x=1748713989;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PElD6fMTQXiL9zLRZOJ9nArnUU6IzbyFxW3USV5K2Y0=;
  b=ED7jQXAsEEUE2000506yxUwHq3/vFBCcXqwusRLsfLf65VUGNWUrqxle
   131EHWdOB1/+xgRx7NyrwdZgBPKZqLulJAyS2SKuRb/un8CvPX3eMujyB
   JUALkFF7DMNpqJ9RLyqAeH+sMBF2zsOICnf/KSCQPT1sCKUklOMjP4EX4
   V6jBMoTHUfpAIs6QlTa+q/u5EyrbfHb05HrV45r8P7I7+QhKcwDA9dPr5
   qLpKsWPawcG3c8wPbeTK8EOC6735OYaQBvMT1ZTfRsFvWgAltArBl+5LR
   Ijl6suGDRdBlSe/LggHOdvkmWLTINUxsI2+ufLDPXONs4NsqxuBCb551I
   g==;
X-CSE-ConnectionGUID: 68DITR5LQpmXyS4rp1cZdg==
X-CSE-MsgGUID: eALkC6YGR1+BjoQcI+zXtg==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="24853826"
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000"; 
   d="scan'208";a="24853826"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 10:53:08 -0700
X-CSE-ConnectionGUID: ZUg+ZabaT6quLqGKYcY+jg==
X-CSE-MsgGUID: lHzDZ5CAQgCfd2zznO2kgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000"; 
   d="scan'208";a="40666894"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 31 May 2024 10:53:07 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sD6R6-000Hch-2V;
	Fri, 31 May 2024 17:53:04 +0000
Date: Sat, 1 Jun 2024 01:52:49 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wupeng Ma <mawupeng1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2413/9806] mm/mem_reliable.c:345:2: error: call
 to undeclared function 'mem_reliable_ctrl_bit_disable'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202406010127.vZOEmkxm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   735f0ab7121a98dd501241bd147c5c95e6e0b38c
commit: 425771499c0742a996ab28df143d7a5123102686 [2413/9806] mm: mem_reliable: Introduce proc interface to disable memory reliable features
config: arm64-randconfig-003-20240601 (https://download.01.org/0day-ci/archive/20240601/202406010127.vZOEmkxm-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project bafda89a0944d947fc4b3b5663185e07a397ac30)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240601/202406010127.vZOEmkxm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406010127.vZOEmkxm-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/mem_reliable.c:5:
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
>> mm/mem_reliable.c:345:2: error: call to undeclared function 'mem_reliable_ctrl_bit_disable'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     345 |         mem_reliable_ctrl_bit_disable(idx);
         |         ^
   mm/mem_reliable.c:345:2: note: did you mean 'mem_reliable_ctrl_bit_disabled'?
   mm/mem_reliable.c:320:13: note: 'mem_reliable_ctrl_bit_disabled' declared here
     320 | static void mem_reliable_ctrl_bit_disabled(int idx) {}
         |             ^
   mm/mem_reliable.c:376:45: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     376 |                 num += global_node_page_state(NR_LRU_BASE + LRU_ACTIVE_FILE);
         |                                               ~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~
   mm/mem_reliable.c:377:45: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     377 |                 num += global_node_page_state(NR_LRU_BASE + LRU_INACTIVE_FILE);
         |                                               ~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~
   6 warnings and 1 error generated.


vim +/mem_reliable_ctrl_bit_disable +345 mm/mem_reliable.c

   322	
   323	static void mem_reliable_feature_disable(int idx)
   324	{
   325		char *str = NULL;
   326	
   327		switch (idx) {
   328		case MEM_RELIABLE_FALLBACK:
   329			reliable_allow_fallback = false;
   330			str = "fallback";
   331			break;
   332		case MEM_RELIABLE_SHMEM:
   333			shmem_reliable = false;
   334			str = "shmem";
   335			break;
   336		case MEM_RELIABLE_PAGECACHE:
   337			pagecache_reliable = false;
   338			str = "pagecache";
   339			break;
   340		default:
   341			pr_err("unknown index: %d", idx);
   342			return;
   343		}
   344	
 > 345		mem_reliable_ctrl_bit_disable(idx);
   346		pr_info("%s is disabled\n", str);
   347	}
   348	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
