Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6223C139B
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Nov 2024 04:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730437032; cv=none; b=nB/7ptIzqcgOuDz3csEg4+5s/8MDbnrJ0a1k/9pdBavDYw3ur/dOQah1rv8dtRTEsMGJLvRAbwv4IjypWULDrEXpGBb7CNLtLQ7DmvruKTs0zVnUpPNfuPMqB6YmhuVyhToAFVSPWx6py0Q9ov0CLPWB1bLmASSM3NMONk6Vwvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730437032; c=relaxed/simple;
	bh=RMPYIJX+BZ1lsaEtBrhJkCm83bneNJYAcHv2UzSObUU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LBUgmkam/IXwBlbkbuAktcTM0arHqfPNPqBSzqwe/Rp72RmfwewICTdWXLqDyju5viYmc3ERaj0mMIXNl5x9gm4jkmCxTM/aYwyQyy8vNkYXiOornv6ucwSyxWt0rBdLWNaYOzhMmhT9hmPTJgXwCojPJuPdXoH/l6pFSnSpEtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jVlN1DW2; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jVlN1DW2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730437029; x=1761973029;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RMPYIJX+BZ1lsaEtBrhJkCm83bneNJYAcHv2UzSObUU=;
  b=jVlN1DW2Yo9uZO2ZJV6ghzsXqGZ5RaGcGo6rxdGe+I2xkznZ2AgURHOc
   Do9WvdOGzJSNtXkOEPc6mwN0hQYo0RUIFJWQ2Bp6HkzVQps+1/sCBU6Z/
   G3fJ5oSXDnhd8vbXp8siIB886gIIlUSDUZx+ACq9PvxOvnn40UAwoHgue
   Mefve6ujFkMfsYmIv2NRu6X5ulNUb8GQ/0xuHUQPMuLAo9jPwIgn5WDcT
   SS7rBsyI9l5c5VHNB1DucrZ3KeV/VjDR9WXA8hXC2fVRMsBLFZVRdewUk
   Srug0TlOCrRn4eS/RnYC3J/pWZr2A9hztanZupVkm3BvlCk/pnjqe/L9k
   Q==;
X-CSE-ConnectionGUID: sQReMUGORkiiUgIpurRn2A==
X-CSE-MsgGUID: PXEtyH3+R5umF6+CJJsy7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="17835760"
X-IronPort-AV: E=Sophos;i="6.11,248,1725346800"; 
   d="scan'208";a="17835760"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 21:57:09 -0700
X-CSE-ConnectionGUID: 72bQCVUWRNGIxFtAPmfvag==
X-CSE-MsgGUID: uEBirk58Try5CaTYGvPaJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,248,1725346800"; 
   d="scan'208";a="82964576"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 31 Oct 2024 21:57:08 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6jib-000h9J-28;
	Fri, 01 Nov 2024 04:57:05 +0000
Date: Fri, 1 Nov 2024 12:56:34 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 15/16]
 drivers/gpu/drm/i915/gt/intel_rps.c:2735:2: error: "Use of GKI forbidden
 symbol_get/symbol_put symbols, please refactor code first"
Message-ID: <202411011223.rWW3gXuE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   81bd1eb3862e37f2ce6e1148ed51ac214ab5c007
commit: 1e38a98e8350cd5437a2479854dc4d2ef034ddde [15/16] ANDROID: i915: Provide workaround to build i915 as vendor module
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241101/202411011223.rWW3gXuE-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241101/202411011223.rWW3gXuE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411011223.rWW3gXuE-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/gt/intel_rps.c:10:
   In file included from drivers/gpu/drm/i915/display/intel_display.h:28:
   In file included from include/drm/drm_util.h:36:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2253:
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
>> drivers/gpu/drm/i915/gt/intel_rps.c:2735:2: error: "Use of GKI forbidden symbol_get/symbol_put symbols, please refactor code first"
    2735 | #error "Use of GKI forbidden symbol_get/symbol_put symbols, please refactor code first"
         |  ^
   5 warnings and 1 error generated.


vim +2735 drivers/gpu/drm/i915/gt/intel_rps.c

  2717	
  2718	/*
  2719	 * Tells the intel_ips driver that the i915 driver is now loaded, if
  2720	 * IPS got loaded first.
  2721	 *
  2722	 * This awkward dance is so that neither module has to depend on the
  2723	 * other in order for IPS to do the appropriate communication of
  2724	 * GPU turbo limits to i915.
  2725	 */
  2726	static void
  2727	ips_ping_for_i915_load(void)
  2728	{
  2729	#if IS_ENABLED(CONFIG_INTEL_IPS)
  2730		/*
  2731		 * (b/352497771): GKI does not allow to build any vendor module which
  2732		 * uses symbol_get/symbol_put as symbol lookup circumvents all ABI
  2733		 * checking.
  2734		 */
> 2735	#error "Use of GKI forbidden symbol_get/symbol_put symbols, please refactor code first"
  2736		void (*link)(void);
  2737	
  2738		link = symbol_get(ips_link_to_i915_driver);
  2739		if (link) {
  2740			link();
  2741			symbol_put(ips_link_to_i915_driver);
  2742		}
  2743	#endif
  2744	}
  2745	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
