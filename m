Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3238657
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jun 2023 22:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686868918; x=1718404918;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E8m9Ql+5H4cmvm0n+ojwRuz8qg1lvzTcaEyEv5qKSA8=;
  b=lT7v+hO5npEFmR1Y2r1LfzMMIBZrpoXRZDZnvwOjt534glIMLRLnVsNY
   hNP4atoDdCXIJEcTC5ihhgs63vXEXugdBwd3XZTutVzhdkcDCaVsO4PS7
   ZYKYCud+zvEdXNkiaDLNN1NQHWmY6KlY4J/r0CG5HTEnRiEVcD2rDCUCF
   dqSOstoRGtBDg//RcsF1cVdJbhOtKymbPVNzh+FYY6bWydOe6CaDVbpAF
   t9hja80GngwHfie0Tc2985QRNfWJ4nzxcXr9NQYtcF3WnaFBsr3B+NHcv
   T2HcblnlOcyh0v0RF6rgNuoRwskdDTdij+UalAP80IOciTJpns1KEh7qU
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="361575781"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; 
   d="scan'208";a="361575781"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2023 15:41:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="662943105"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; 
   d="scan'208";a="662943105"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 15 Jun 2023 15:41:54 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9vf7-0000U5-1c;
	Thu, 15 Jun 2023 22:41:53 +0000
Date: Fri, 16 Jun 2023 06:40:54 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 1925/27674]
 include/trace/hooks/mm.h:17:1: sparse: sparse: incorrect type in assignment
 (different address spaces)
Message-ID: <202306160602.XWou9Qe4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   31e1367ff78eb68e54a2025e9c6601e3fa6c6312
commit: 62e32cf8f39709054e9dc0308e2c103e433b7f20 [1925/27674] ANDROID: mm: Create vendor hooks to control ZONE_MOVABLE allocations
config: x86_64-randconfig-s021-20230614 (https://download.01.org/0day-ci/archive/20230616/202306160602.XWou9Qe4-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common mirror-chromeos-5.10-arcvm
        git checkout 62e32cf8f39709054e9dc0308e2c103e433b7f20
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306160602.XWou9Qe4-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/memory.c:5202:22: sparse: sparse: cast removes address space '__user' of expression
   mm/memory.c:957:17: sparse: sparse: context imbalance in 'copy_pte_range' - different lock contexts for basic block
   mm/memory.c:1626:16: sparse: sparse: context imbalance in '__get_locked_pte' - different lock contexts for basic block
   mm/memory.c:1675:9: sparse: sparse: context imbalance in 'insert_page' - different lock contexts for basic block
   mm/memory.c:2177:17: sparse: sparse: context imbalance in 'remap_pte_range' - different lock contexts for basic block
   mm/memory.c:2422:17: sparse: sparse: context imbalance in 'apply_to_pte_range' - unexpected unlock
   mm/memory.c:2679:9: sparse: sparse: context imbalance in 'wp_page_copy' - different lock contexts for basic block
   mm/memory.c:3023:17: sparse: sparse: context imbalance in 'wp_pfn_shared' - unexpected unlock
   mm/memory.c:3086:19: sparse: sparse: context imbalance in 'do_wp_page' - different lock contexts for basic block
   mm/memory.c: note: in included file:
>> include/trace/hooks/mm.h:17:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mm.h:17:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mm.h:17:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   mm/memory.c:3660:19: sparse: sparse: context imbalance in 'pte_alloc_one_map' - different lock contexts for basic block
   mm/memory.c:3887:17: sparse: sparse: context imbalance in 'finish_fault' - unexpected unlock
   mm/memory.c:3996:9: sparse: sparse: context imbalance in 'do_fault_around' - unexpected unlock
   mm/memory.c:4715:12: sparse: sparse: context imbalance in '__follow_pte_pmd' - different lock contexts for basic block
   mm/memory.c:4801:16: sparse: sparse: context imbalance in 'follow_pte_pmd' - different lock contexts for basic block
   mm/memory.c:4861:9: sparse: sparse: context imbalance in 'follow_phys' - unexpected unlock

vim +17 include/trace/hooks/mm.h

    16	
  > 17	DECLARE_RESTRICTED_HOOK(android_rvh_set_skip_swapcache_flags,
    18				TP_PROTO(gfp_t *flags),
    19				TP_ARGS(flags), 1);
    20	DECLARE_RESTRICTED_HOOK(android_rvh_set_gfp_zone_flags,
    21				TP_PROTO(gfp_t *flags),
    22				TP_ARGS(flags), 1);
    23	DECLARE_RESTRICTED_HOOK(android_rvh_set_readahead_gfp_mask,
    24				TP_PROTO(gfp_t *flags),
    25				TP_ARGS(flags), 1);
    26	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
