Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE6E1A680B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 May 2026 04:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778646584; cv=none; b=Ldgvq2C7XmmfswUDymgYj9PK07kdEA5MSkUF6ubwi/1gr/TmoH6TTr9eI4+1Qc+MIOWKXdw3oaLsSGfn1T/2BrGh9XIeLIWcWmvdktEIUWGBpLOt7BQ4V7teDisnZJO2MCT6cTvN3C1ifjPrxuE9fKa/bKAiquPF9qtgXYJzgAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778646584; c=relaxed/simple;
	bh=ft7wLEmV7B+bhM8iHiQllekvf9+BP4MUHDpRsRfwA7w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=my80VNdErnikeW+Kyrj7d7F01TkyNXYHuVfaXAuW+djo3peFn4On3o70oI6mUyfm9erZoMgFHN7eloHsmpDvidOcwu9AeB8mD5HeSI5EWgH6DcKkcLZea7iWG5jBOb/K1A0cM2WatvrIkitl9Uz0yWBJttDr1r3AtzTkhwIFh1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jGPcjJcy; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jGPcjJcy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778646583; x=1810182583;
  h=date:from:to:cc:subject:message-id;
  bh=ft7wLEmV7B+bhM8iHiQllekvf9+BP4MUHDpRsRfwA7w=;
  b=jGPcjJcyfib+dPJVC6HYfNRyoe9/GntHdDEjw/gC7qtiNnlQJzrkR/jz
   evnepr7hRsIN5kOTFxkybKPd50YRL/VvIAQLIx8avuN7peK/H1wA73MmO
   wKgD8sMTnyNAoC95IJiw9MyN5JVR5ZF9JkW+BSAECJVtOEn2n0nMfWQJQ
   fnLoDoK0WzNiMM21IPC5LO/3gvB2vnPJ0R9fxM07Bv+nlDrl8dJUz62IT
   FMEgUOe97W0UfsQOi0SRMOYXLaQcklOk3YsY7shkxVshbyIAxXPs63y/R
   yC7TtV6U7YqAF4kQAkDIuky+ht2iJNvOc7xcVdQL4xuNlO0uMG+724+hi
   g==;
X-CSE-ConnectionGUID: 57Sd8FBXTS6eW0rpa72Dww==
X-CSE-MsgGUID: xFEYms/JSY6xWKnAU1mTwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="83419109"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="83419109"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 21:29:43 -0700
X-CSE-ConnectionGUID: 2sh744w8QFSK5oXuboUJjQ==
X-CSE-MsgGUID: HhVsLdLeRciTMXvu89ey8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="233695943"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 12 May 2026 21:29:41 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wN1E3-000000003QB-1pop;
	Wed, 13 May 2026 04:29:39 +0000
Date: Wed, 13 May 2026 12:29:25 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2025-08 4/4]
 drivers/android/android_debug_symbols.c:49:31: error: use of undeclared
 identifier 'try_to_compact_pages'
Message-ID: <202605131207.Aby5bl67-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Guanshun,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6-2025-08
head:   cdf061093bae033e1da991839affc43338f53849
commit: 7d32bc386a2608acecce8a43089b169d2dad0e05 [4/4] ANDROID: android: Add symbols to debug_symbols driver
config: arm-randconfig-004-20260513 (https://download.01.org/0day-ci/archive/20260513/202605131207.Aby5bl67-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260513/202605131207.Aby5bl67-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605131207.Aby5bl67-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:150:
   include/linux/compiler-clang.h:33:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      33 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:367:9: note: previous definition is here
     367 | #define __SANITIZE_ADDRESS__ 1
         |         ^
   In file included from drivers/android/android_debug_symbols.c:14:
   In file included from include/linux/memblock.h:12:
   In file included from include/linux/mm.h:2224:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/android/android_debug_symbols.c:49:31: error: use of undeclared identifier 'try_to_compact_pages'
      49 |         ADS_ENTRY(ADS_COMPACT_PAGES, try_to_compact_pages),
         |                                      ^~~~~~~~~~~~~~~~~~~~
   2 warnings and 1 error generated.


vim +/try_to_compact_pages +49 drivers/android/android_debug_symbols.c

    33	
    34	/*
    35	 * This module maintains static array of symbol and address information.
    36	 * Add all required core kernel symbols and their addresses into ads_entries[] array,
    37	 * so that vendor modules can query and to find address of non-exported symbol.
    38	 */
    39	static const struct ads_entry ads_entries[ADS_END] = {
    40		ADS_ENTRY(ADS_PER_CPU_START, __per_cpu_start),
    41		ADS_ENTRY(ADS_PER_CPU_END, __per_cpu_end),
    42		ADS_ENTRY(ADS_TEXT, _text),
    43		ADS_ENTRY(ADS_SEND, _end),
    44		ADS_ENTRY(ADS_MEM_BLOCK, &memblock),
    45		ADS_ENTRY(ADS_INIT_MM, &init_mm),
    46		ADS_ENTRY(ADS_ITERATE_SUPERS, iterate_supers),
    47		ADS_ENTRY(ADS_DROP_SLAB, drop_slab),
    48		ADS_ENTRY(ADS_FREE_PAGES, try_to_free_pages),
  > 49		ADS_ENTRY(ADS_COMPACT_PAGES, try_to_compact_pages),
    50	};
    51	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
