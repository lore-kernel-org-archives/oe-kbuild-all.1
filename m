Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E4D14BF8B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Sep 2024 21:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727474328; cv=none; b=BpLckWYF5dgK40N0npbeUyHqiAH2TwoDEtYfidQPO/EMD4s0k1MNmSEmeVq1gIq2TBoJzXzd8TgjJrZpPng3WkgqRmfvjvWKCxN2wm9APHL9vF2Nd+jot+dmzJZinMID1AMPbJPzw2q8o1omeQFxB2D6exQemKP6JH6wzBzEoPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727474328; c=relaxed/simple;
	bh=h6zjR3JaVYXiZnGBwrQz3xeNzfAtEveuQfz6P/uk8us=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xw1gEGREv/eomMJugGnxlWu9jvO4wGtoagEwMEmVnHz2HKq6QSsGKDEC/QwK/LwAffYN5sOir4dLEtg0ny9f7BPrECWHs4scpZRydkFTtZ+BP+k9EA2ffcE7jIUZxAs3Gr015S4oqEYQmsnL/eew3O2m39lu38X3Yr/CfZ6f/Ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TvchE9sa; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TvchE9sa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727474326; x=1759010326;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h6zjR3JaVYXiZnGBwrQz3xeNzfAtEveuQfz6P/uk8us=;
  b=TvchE9saE+IHHmemdevrzvPDTQf6QzE+8t9R4pqZ8HjOaRtGxveLe1Xj
   ICA0sH1YfrjYVmcnI1HoUTfknI+gCxh3PyOhOzJv08aIW76qnOw5LfcgF
   BffIhdfPkGRSHZiFN6krFa/YFFkoOwxcaLmHxfcAFYuSPSOCSCNHUtSWv
   ktjNc7helSHVxEa8oZ83egfDhBB6SYxAld9F8ChARpqME4N8oc5DOkiRH
   bI08j/nKfwTZtLaiG7aFa48VSnoWz+IzNaULpUOsMnhdhHtjMjRcq3zbj
   Pv27W6dOmnmrvZs89xu4EbyqUX7TcgWkduFg/hrXOGIjrQS9+G6rQCVJs
   w==;
X-CSE-ConnectionGUID: epFKyIqKQui9ZMCPBkCi2g==
X-CSE-MsgGUID: UpChfGXsRD2FXLO7Pwj/Uw==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="44153628"
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; 
   d="scan'208";a="44153628"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 14:58:45 -0700
X-CSE-ConnectionGUID: P+fKyzADTvyUFUNuLHUy5w==
X-CSE-MsgGUID: bSTnrlgEQf+6Xfi6i/2InA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; 
   d="scan'208";a="73452892"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 27 Sep 2024 14:58:44 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suIz3-000Mfb-33;
	Fri, 27 Sep 2024 21:58:41 +0000
Date: Sat, 28 Sep 2024 05:57:47 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wupeng Ma <mawupeng1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2413/14216] mm/mem_reliable.c:345:2: error: call
 to undeclared function 'mem_reliable_ctrl_bit_disable'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202409280502.YvJdfMQd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ma,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   c9fe32fed709da98069e8215f6ecf39ea63f5355
commit: 425771499c0742a996ab28df143d7a5123102686 [2413/14216] mm: mem_reliable: Introduce proc interface to disable memory reliable features
config: arm64-randconfig-003-20240928 (https://download.01.org/0day-ci/archive/20240928/202409280502.YvJdfMQd-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 7773243d9916f98ba0ffce0c3a960e4aa9f03e81)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409280502.YvJdfMQd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409280502.YvJdfMQd-lkp@intel.com/

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
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
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
   7 warnings and 1 error generated.


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
