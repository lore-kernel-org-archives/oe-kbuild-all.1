Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0DE33BBBD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Jan 2026 23:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769644675; cv=none; b=OJ4jaiMyXIreZ0tS+IpxyqZAee402S1KfWjUjrWCqormnAk62rMfZV9JPBB6Eov2By6EE2YXhYvG8HLmv3ltSK+gqWG6tcRQj2bWXZqowwdb2jpR43j4ntvMENkvE5ggMeId6Dcwd3UB/q7k6v25zJB5wqRhzavD2PtQ3Pc0BRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769644675; c=relaxed/simple;
	bh=HOLbuArSe4mtfQDwMPsKzFLaDT6He5EDymTrxGuDoGo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rWykP31AHrFpNQX3M5d9VbJVoPcjyICPgrq2Q8vNdrWo5YIW0UJNcNTlP4faNmKjAxqsJLucYcnONHI8gnI6CYy8vuO8gMtxEW2a6LTQbwT/BqVVRnfFsYETA5UfKn5D18ZNP+PecXS1TGT7dAHMIdLuySUxMBt+lX5bH2FsT/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YqRNUdiZ; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YqRNUdiZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769644674; x=1801180674;
  h=date:from:to:cc:subject:message-id;
  bh=HOLbuArSe4mtfQDwMPsKzFLaDT6He5EDymTrxGuDoGo=;
  b=YqRNUdiZg8wkQehRMTm5xL0bRZz/WPnMAq2+mktxrF80Z+/jnemLJxTx
   vi+5aVTea7gYN8ieR4I83L2LribHNg5QOCMCVGpzu0HWxkKo3U2XK+9rA
   gj5qcEgwcK/wdRwrXTMJuHLN4FO7gL/0BEQmb7UrrP5rVOF3/SIqgGm2W
   936w7AGcqvQ8HnmLR1igfD19/tCsoinUraRj+KXrCBrmkXZGiaLTRnEvy
   77Qw1O5FcXYhYiE/UJkF+bciOiyhGYSIx2V27C1bhyaUhV4GAsS8DBIAs
   8qq5lo2fhZHrXHKUxtuK5Ja5aEBYKqL8pOZwkM7jfORB+hDgWW7PLkr2u
   A==;
X-CSE-ConnectionGUID: TcRtWZXzTu6wEwwBSdxlYg==
X-CSE-MsgGUID: YxP6jl6GQgebMMHMgpcPOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="81600614"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="81600614"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 15:57:53 -0800
X-CSE-ConnectionGUID: ARFzvBDQT56DBfVPu9ujUg==
X-CSE-MsgGUID: 8kecZzWNT9CReucbQDU11Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="231341542"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 28 Jan 2026 15:57:52 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlFPx-00000000avC-2NwB;
	Wed, 28 Jan 2026 23:57:49 +0000
Date: Thu, 29 Jan 2026 07:56:49 +0800
From: kernel test robot <lkp@intel.com>
To: Kiryl Shutsemau <kas@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kas:compound_head 11/17] include/linux/mmzone.h:1565:23:
 error: size of array 'vmemmap_tails' is negative
Message-ID: <202601290752.Eg1DIO4s-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git compound_head
head:   6369fbab94308b760d36f19381acf4e2a6cc09a0
commit: 34b575dc7cb0df61385aa523418a315abb7815bd [11/17] mm/hugetlb: Remove fake head pages
config: powerpc64-randconfig-002-20260129 (https://download.01.org/0day-ci/archive/20260129/202601290752.Eg1DIO4s-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260129/202601290752.Eg1DIO4s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601290752.Eg1DIO4s-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/gfp.h:7,
                    from include/linux/xarray.h:16,
                    from include/linux/list_lru.h:14,
                    from include/linux/fs/super_types.h:7,
                    from include/linux/fs/super.h:5,
                    from include/linux/fs.h:5,
                    from include/linux/compat.h:17,
                    from arch/powerpc/kernel/asm-offsets.c:13:
>> include/linux/mmzone.h:1565:23: error: size of array 'vmemmap_tails' is negative
    1565 |         unsigned long vmemmap_tails[NR_VMEMMAP_TAILS];
         |                       ^~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:182: arch/powerpc/kernel/asm-offsets.s] Error 1 shuffle=3985168493
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1314: prepare0] Error 2 shuffle=3985168493
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=3985168493
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=3985168493
   make: Target 'prepare' not remade because of errors.


vim +/vmemmap_tails +1565 include/linux/mmzone.h

  1552	
  1553		CACHELINE_PADDING(_pad2_);
  1554	
  1555		/* Per-node vmstats */
  1556		struct per_cpu_nodestat __percpu *per_cpu_nodestats;
  1557		atomic_long_t		vm_stat[NR_VM_NODE_STAT_ITEMS];
  1558	#ifdef CONFIG_NUMA
  1559		struct memory_tier __rcu *memtier;
  1560	#endif
  1561	#ifdef CONFIG_MEMORY_FAILURE
  1562		struct memory_failure_stats mf_stats;
  1563	#endif
  1564	#ifdef CONFIG_SPARSEMEM_VMEMMAP
> 1565		unsigned long vmemmap_tails[NR_VMEMMAP_TAILS];
  1566	#endif
  1567	} pg_data_t;
  1568	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
