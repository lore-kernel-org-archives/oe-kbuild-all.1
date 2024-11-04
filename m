Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A658D224F0
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Nov 2024 18:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730743352; cv=none; b=Kw+o39Jy6zAttqLl8zsGxyB/9RrfuVmCXTYXoymotm3EGfjVZ6KXmpFOcsuWOLPIQqYPWMasqd1qgp7p0WIJtnSI5kMNGYvJZzlfpwMwF7k9BK5q4cxZ+wxj4EtHmHhr9gTDucGge8QDU3g7BVjJJ3HD8KO0vLowMphKQp30gZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730743352; c=relaxed/simple;
	bh=dMJ/MQ5iqsnhu6Jl2i/4xO9+vPn8Gzt3b2D6YluZYco=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BjbmDLx0gRnb6YvtOi84gKhFoox6zAiiYXDSFz7n3X0e2FTRLkTu2AtMBzqvjC5ik7g82LkL/DCevgjDK/L/tSj90kZ3V/NJS/78sCNZ98CE1LBpXrGsKBkHASARKeKrZ+t1Ia9134fbV3iP4xiCS7WfjiZ7eTmmszVVRJ5pKkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nbq5D9vM; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nbq5D9vM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730743351; x=1762279351;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dMJ/MQ5iqsnhu6Jl2i/4xO9+vPn8Gzt3b2D6YluZYco=;
  b=Nbq5D9vMeqR6DQzxMtOGO+gv9h1DGngX/IHVyHc7QDeOiK/ZyD0WhPjM
   TZelqxPPP0NN1eF7P9mCdxB2N/XOoAoF7AGmWhd85ZT6zYjlgcWzGku0h
   /7gm69vAiULEC/kt2KbzGt20IDaQ36002sxDoBM6kBmUezPHWIcgJfGdZ
   XjvPHQJknmy3HXAxWGPlN/0bzjmHcK8/mpSPHc93L/i4YGytofc2UhOHh
   zaiDVKdptTGh0vg4xLhGE3JW+0K7huCsvTGU+IzP8v/m9o02zp/soR8nu
   xMIN/uN2334omwD1DgLNPGLPf4JpBEmymGSjkA7xqNF65+YY2YB23MmyD
   w==;
X-CSE-ConnectionGUID: /slL1KKkRP64Vs93N/1isw==
X-CSE-MsgGUID: okAufPA5S42wnkHPltNSnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30307899"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30307899"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 10:02:31 -0800
X-CSE-ConnectionGUID: h57X2HS0QEeOGzY6XYgcXg==
X-CSE-MsgGUID: /3+PobrKQ/WFTLa5s+6CXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; 
   d="scan'208";a="87669008"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 04 Nov 2024 10:02:29 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t81PG-000l67-1s;
	Mon, 04 Nov 2024 18:02:26 +0000
Date: Tue, 5 Nov 2024 02:01:36 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, leoliu-oc <leoliu-oc@zhaoxin.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 10691/16090]
 arch/x86/events/zhaoxin/uncore.c:2828:6: warning: no previous prototype for
 function 'kx7000_uncore_cpu_init'
Message-ID: <202411050150.UNuEIvNX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   ab4fcabb7d813ddd7a455c85557f8d0891df4c41
commit: 25fd62f6e8c9636272009dfcbe04fb1a260cbf8d [10691/16090] perf/x86/zhaoxin/uncore: update KX-7000 support
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241105/202411050150.UNuEIvNX-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241105/202411050150.UNuEIvNX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411050150.UNuEIvNX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/events/zhaoxin/uncore.c:3:
   In file included from arch/x86/events/zhaoxin/uncore.h:3:
   In file included from include/linux/pci.h:1666:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2235:
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
   arch/x86/events/zhaoxin/uncore.c:2798:6: warning: no previous prototype for function 'kx5000_uncore_cpu_init' [-Wmissing-prototypes]
    2798 | void kx5000_uncore_cpu_init(void)
         |      ^
   arch/x86/events/zhaoxin/uncore.c:2798:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2798 | void kx5000_uncore_cpu_init(void)
         | ^
         | static 
   arch/x86/events/zhaoxin/uncore.c:2807:6: warning: no previous prototype for function 'kh40000_uncore_cpu_init' [-Wmissing-prototypes]
    2807 | void kh40000_uncore_cpu_init(void)
         |      ^
   arch/x86/events/zhaoxin/uncore.c:2807:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2807 | void kh40000_uncore_cpu_init(void)
         | ^
         | static 
   arch/x86/events/zhaoxin/uncore.c:2812:5: warning: no previous prototype for function 'kh40000_uncore_pci_init' [-Wmissing-prototypes]
    2812 | int kh40000_uncore_pci_init(void)
         |     ^
   arch/x86/events/zhaoxin/uncore.c:2812:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2812 | int kh40000_uncore_pci_init(void)
         | ^
         | static 
>> arch/x86/events/zhaoxin/uncore.c:2828:6: warning: no previous prototype for function 'kx7000_uncore_cpu_init' [-Wmissing-prototypes]
    2828 | void kx7000_uncore_cpu_init(void)
         |      ^
   arch/x86/events/zhaoxin/uncore.c:2828:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2828 | void kx7000_uncore_cpu_init(void)
         | ^
         | static 
>> arch/x86/events/zhaoxin/uncore.c:2843:5: warning: no previous prototype for function 'kx7000_uncore_pci_init' [-Wmissing-prototypes]
    2843 | int kx7000_uncore_pci_init(void)
         |     ^
   arch/x86/events/zhaoxin/uncore.c:2843:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2843 | int kx7000_uncore_pci_init(void)
         | ^
         | static 
>> arch/x86/events/zhaoxin/uncore.c:2851:6: warning: no previous prototype for function 'kx7000_uncore_mmio_init' [-Wmissing-prototypes]
    2851 | void kx7000_uncore_mmio_init(void)
         |      ^
   arch/x86/events/zhaoxin/uncore.c:2851:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2851 | void kx7000_uncore_mmio_init(void)
         | ^
         | static 
   11 warnings generated.


vim +/kx7000_uncore_cpu_init +2828 arch/x86/events/zhaoxin/uncore.c

  2827	
> 2828	void kx7000_uncore_cpu_init(void)
  2829	{
  2830		u64 val;
  2831		int cpu;
  2832	
  2833		uncore_msr_uncores = kx7000_msr_uncores;
  2834	
  2835		/* clear bit 16 of MSR 0x1877 so that HIF can work normally */
  2836		for_each_present_cpu(cpu) {
  2837			rdmsrl_on_cpu(cpu, 0x1877, &val);
  2838			val = val & 0xfffffffffffeffffULL;
  2839			wrmsrl_on_cpu(cpu, 0x1877, val);
  2840		}
  2841	}
  2842	
> 2843	int kx7000_uncore_pci_init(void)
  2844	{
  2845		uncore_pci_uncores = kx7000_pci_uncores;
  2846		uncore_pci_driver = &kx7000_uncore_pci_driver;
  2847	
  2848		return 0;
  2849	}
  2850	
> 2851	void kx7000_uncore_mmio_init(void)
  2852	{
  2853		uncore_mmio_uncores = kx7000_mmio_uncores;
  2854	}
  2855	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
