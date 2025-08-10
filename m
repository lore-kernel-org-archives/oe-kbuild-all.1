Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047C72E36F9
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Aug 2025 01:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754788316; cv=none; b=OMXFuJIas8+ayJwJimUQ9/oANp67biFkMjZXNjObVaaVNYOqc2AFk3NTyUP7j1qsxD3lfLPhFBlmU24+WnWouWI/5rlyhDyr+4bM6n3itptmT4EXrOC2GTleS8zs4RUlZ68ADZkD61xI+TwagIuY705QKQGluqTRo5jPcq1FMrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754788316; c=relaxed/simple;
	bh=+m+9rJeXT6qe6ISTLKYrJd/E1LMpsQr2UUbQJrfcqjw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Vddpy2mP94tDQ5OUGOG+oHsWqKSStlBgzqRWhojQz09edm3F6zw2b8niz21ueZs0l4N6i3xC6Kl6cWyWEmVUBwc3s3LBs0DaN3LSGZzu/0Ee/+/IReZnZJjXdBqgH3C058fpzcKnl/KMmQTJhdsWOwxDz29MOweONb/+BXJpBYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i6kq+vwM; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i6kq+vwM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754788314; x=1786324314;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+m+9rJeXT6qe6ISTLKYrJd/E1LMpsQr2UUbQJrfcqjw=;
  b=i6kq+vwM2EfQL8vYzwuVyEfH+5tQcMAv+nkublA4JoPZV+CuG5zw39qJ
   onNnQ1MOn0Am3VFKcthp0LQ3pJEoqNl6bmlJKFoeZij5bsj0L0mofqGO2
   0ou1xlvklq3FcrATX28IzPgjyOxuPuaooBbRKA8MvMCJcY+C49GrGbQ2N
   YFIqoV89J4Ooc5PEZzuqQ4ZFB0EycSerh1PjaV0Vz63Skn1ztDnShIycW
   S35nww9yvWHOjaOp/m6f7+/5Ly8hVwgSt1FEsCCUrKINV66ssoge6Z4bF
   kITRuCj5ZxsPn0CMt88pOZogkb2XEorQLD4AkXYMvI7bRrxTPOXMu1Jpe
   Q==;
X-CSE-ConnectionGUID: O+nm4MQvRh+EHkaeblcLpw==
X-CSE-MsgGUID: D2QDicj3StCUDxtD8Xx0yA==
X-IronPort-AV: E=McAfee;i="6800,10657,11516"; a="74537632"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="74537632"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2025 18:11:53 -0700
X-CSE-ConnectionGUID: bLluVhJYR0SKoDM1dGXi/A==
X-CSE-MsgGUID: 7xEXDZ0rRcmRejBkMA2vcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="189308836"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 09 Aug 2025 18:11:52 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukubG-00056k-1z;
	Sun, 10 Aug 2025 01:11:50 +0000
Date: Sun, 10 Aug 2025 09:11:38 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.1.6 5/15] mm/bpf_memcontrol.c:45:27: sparse:
 sparse: symbol 'bpf_mem_cgroup_events' was not declared. Should it be
 static?
Message-ID: <202508100917.DoB0QKxp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git bpfoom.1.6
head:   4449fabc436d3de0b6d9ba42227e052e65bbcc97
commit: f7034fc1e787ba50200ff0b3c5d41582e95f7983 [5/15] mm: introduce bpf kfuncs to deal with memcg pointers
config: openrisc-randconfig-r121-20250810 (https://download.01.org/0day-ci/archive/20250810/202508100917.DoB0QKxp-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.3.0
reproduce: (https://download.01.org/0day-ci/archive/20250810/202508100917.DoB0QKxp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508100917.DoB0QKxp-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/bpf_memcontrol.c:45:27: sparse: sparse: symbol 'bpf_mem_cgroup_events' was not declared. Should it be static?
>> mm/bpf_memcontrol.c:67:18: sparse: sparse: symbol 'bpf_mem_cgroup_flush_stats' was not declared. Should it be static?
   mm/bpf_memcontrol.c:37:9: sparse: sparse: context imbalance in 'bpf_get_mem_cgroup' - different lock contexts for basic block

vim +/bpf_mem_cgroup_events +45 mm/bpf_memcontrol.c

    44	
  > 45	__bpf_kfunc unsigned long bpf_mem_cgroup_events(struct mem_cgroup *memcg, int event)
    46	{
    47	
    48		if (event < 0 || event >= NR_VM_EVENT_ITEMS)
    49			return (unsigned long)-1;
    50	
    51		return memcg_events(memcg, event);
    52	}
    53	
    54	__bpf_kfunc unsigned long bpf_mem_cgroup_usage(struct mem_cgroup *memcg, bool swap)
    55	{
    56		return mem_cgroup_usage(memcg, swap);
    57	}
    58	
    59	__bpf_kfunc unsigned long bpf_mem_cgroup_page_state(struct mem_cgroup *memcg, int idx)
    60	{
    61		if (idx < 0 || idx >= MEMCG_NR_STAT)
    62			return (unsigned long)-1;
    63	
    64		return memcg_page_state(memcg, idx);
    65	}
    66	
  > 67	__bpf_kfunc void bpf_mem_cgroup_flush_stats(struct mem_cgroup *memcg)
    68	{
    69		mem_cgroup_flush_stats(memcg);
    70	}
    71	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
