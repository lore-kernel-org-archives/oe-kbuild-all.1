Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1AFD44E040
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 20:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774989585; cv=none; b=JtThJwamRwaTmzPPMeoeASLrGPJiVWjA6tG8KnhXxrNcjaeDSm78Nx2aQCuh7ya2dqqsCCGcDjKj5Xng4v492Y/VJsSgifrrpOtlHehEhQqULN6OS2vKuRrplOXlrimWuCIvSX9YRXUUGSaNAMs0OHcRmbhBieksakdeuI+CV1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774989585; c=relaxed/simple;
	bh=XVYrBtNQErbS3+ls5570Ug3eVYHZehZ3HzSR0sgLwt4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mUBio86VCLgw+7CIHV1+g2jWDpMj6S2Ol3p9+E/J5yv4ELiMkMrYL0jxArTFRkBj49VzjMvcyCvrvv9DQpI6JbpmotkVij4GEvRaavgEpMTV/wdjC7rjv+LFDCcgrKTULi0Of793gug2tfRdj6AGrYiuSL9W2zmhRAZslTw6K9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e4vQf5bT; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e4vQf5bT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774989583; x=1806525583;
  h=date:from:to:cc:subject:message-id;
  bh=XVYrBtNQErbS3+ls5570Ug3eVYHZehZ3HzSR0sgLwt4=;
  b=e4vQf5bTxnUv2sqTlROby0a8730uS/fBt33HzdEJQeq6+Xl7BZ/FyHpc
   X6f87oDGDH+7Wfry6ZbiKCPd61OpNcfUFLj3lUoOhbLgZzaYVDt8latEB
   d+zYkj7Cu18Y2eHu0fyzQw7so6m06FtZQ7FeDBVBwF6B4vUbq1003qbQj
   fV9nn/XV5kdKqAJmsc4B7Gkn+3iebsR2N1aRJb73y/Z5zR88tq9GJ4g7/
   +mOLdW0Hhzn3C6Pv66fsu0q+5d3AizlU3RpjXFyacmjGkqlYfXLCSzJQ3
   0rSnD+VKhAWKLuxTjDO8agt+ZkzMuItICb5m/cgE7zm3D2//F3oIiTV1i
   A==;
X-CSE-ConnectionGUID: U31zQbJbRd6AbO4FA2VEgQ==
X-CSE-MsgGUID: zm4QW9ZTTzy6dIXdndgGpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="75978330"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="75978330"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 13:39:43 -0700
X-CSE-ConnectionGUID: NdtrmQonTYSLNY0GWa1cdA==
X-CSE-MsgGUID: Dh1TGMSCQDO9IIMsEz+R8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="249687555"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 31 Mar 2026 13:39:42 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7fsB-000000004El-0OXk;
	Tue, 31 Mar 2026 20:39:39 +0000
Date: Wed, 01 Apr 2026 04:39:38 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 2/2]
 arch/arm64/kvm/ptdump.c:263:9: warning: variable 'mc_pages' set but not used
Message-ID: <202604010440.92qtfIvt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Sebastian,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   cebae8e8f6b662df743cb2de67532e375b92ec50
commit: d83ecb7039ab24325e4c10c8dd01556cd8e20f5f [2/2] ANDROID: KVM: arm64: Add ptdump support for host stage-2
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260401/202604010440.92qtfIvt-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260401/202604010440.92qtfIvt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604010440.92qtfIvt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/ptdump.c:10:
   In file included from include/linux/kvm_host.h:16:
   In file included from include/linux/mm.h:2180:
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
>> arch/arm64/kvm/ptdump.c:263:9: warning: variable 'mc_pages' set but not used [-Wunused-but-set-variable]
     263 |         size_t mc_pages, pgd_pages;
         |                ^
   6 warnings generated.


vim +/mc_pages +263 arch/arm64/kvm/ptdump.c

   260	
   261	static struct kvm_pgtable_snapshot *kvm_ptdump_get_host_snapshot(void *data)
   262	{
 > 263		size_t mc_pages, pgd_pages;
   264		mc_pages = (size_t)data;
   265		pgd_pages = host_stage2_get_pgd_size() >> PAGE_SHIFT;
   266		return kvm_ptdump_get_snapshot(0, (size_t)data, pgd_pages);
   267	}
   268	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
