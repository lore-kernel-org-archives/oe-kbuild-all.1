Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A825F288C3D
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Apr 2026 02:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775009729; cv=none; b=IMrDZlKcxAbNdAasp+T4e2mEcKSNDGF66HkvvY8JEZOl+OW3vdC0eLOERdt3JX3ddqGsGf4oEfgLnW3JXw2MbuVI4p+PJs/EXuZIEsDfiZ60HekaZZLNT6k839mgiYQ3iWuCnvq4xrHR98oTZ4KXOUQGpi/BLJCnw6unqFGfcbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775009729; c=relaxed/simple;
	bh=39vQoms5mSHWqdsWQw0fqr+OdOVZJ+Sgui2jaTuXwc8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VpYHYUBn5y8UYUOPEAPjU+5VWnYTHsPR6zUX1wBeFJw2QbeJC3hQcOKXremXYngtpNcDVE4DllvlT16WwlYBIY1QtfBsyDSqpY0f32ugUZooLQGQEQcY/7RMdR/v157ipNZnDc/uvdFVZu7taJcD76Np+hPfXLsLJLh22Q0k2dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jWq08gWr; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jWq08gWr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775009728; x=1806545728;
  h=date:from:to:cc:subject:message-id;
  bh=39vQoms5mSHWqdsWQw0fqr+OdOVZJ+Sgui2jaTuXwc8=;
  b=jWq08gWrRrWznTKICj33Gtr/OPnufDFwE/L2ZKJJbLan360f1DbxhebO
   cQrxXhYMoP32O3omATN2OEEhbShcZWNzetyYzSDwE41T9wgfrRzfr0J9i
   r0QzLC4ZlMW7wyU2nGZnv3rnyl5ma4GW7sbiHhl+pk/qB2dKwxIl7tRwf
   gw1T/xZ0rBaPOcWWWwEq72EVpG8zDdNWfzFnOoA0HppKgNCgHNF2xD8SW
   0hVFgakPcQy9YdxmB0N+tA65ddy9cXFP31q/kmTbY/Dm5t23398/gBxJg
   SSAi19hpYcfxUKTbMphmur428Vg/yH9PnMJGKFPLvsZ1pl8se3i9fTLLJ
   A==;
X-CSE-ConnectionGUID: EL/Fdh2mRLuN63WbS8zSUA==
X-CSE-MsgGUID: nsB0oovDRo2Kv2YiAshfpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="86341400"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="86341400"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 19:15:27 -0700
X-CSE-ConnectionGUID: nLQVM/4sRUeiB1ywVehSFA==
X-CSE-MsgGUID: iScPP1/OSpqbbpYkhUvV9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="223651228"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 31 Mar 2026 19:15:26 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7l75-000000004cY-24iW;
	Wed, 01 Apr 2026 02:15:23 +0000
Date: Wed, 01 Apr 2026 10:14:27 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2025-05 0/2]
 mm/page_alloc.c:327:15: sparse: sparse: symbol 'nr_free_highatomic' was not
 declared. Should it be static?
Message-ID: <202604011007.llcDN5Su-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Kalesh,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android15-6.6-2025-05
head:   b3fc1858b36caef7f14dd6d6ec611eba4d5eee85
commit: 7b1f522c80c811c59e056b899b26c684780442fd [0/2] ANDROID: GKI: deferred split queue corruption - ABI fixup
config: x86_64-randconfig-122-20260401 (https://download.01.org/0day-ci/archive/20260401/202604011007.llcDN5Su-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260401/202604011007.llcDN5Su-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604011007.llcDN5Su-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/page_alloc.c:195:1: sparse: sparse: symbol 'restrict_cma_redirect' was not declared. Should it be static?
   mm/page_alloc.c:1384:25: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted int flags @@     got restricted fpi_t [usertype] fpi_flags @@
   mm/page_alloc.c:1384:25: sparse:     expected restricted int flags
   mm/page_alloc.c:1384:25: sparse:     got restricted fpi_t [usertype] fpi_flags
   mm/page_alloc.c:1392:25: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted int flags @@     got restricted fpi_t [usertype] fpi_flags @@
   mm/page_alloc.c:1392:25: sparse:     expected restricted int flags
   mm/page_alloc.c:1392:25: sparse:     got restricted fpi_t [usertype] fpi_flags
>> mm/page_alloc.c:327:15: sparse: sparse: symbol 'nr_free_highatomic' was not declared. Should it be static?
   mm/page_alloc.c:915:31: sparse: sparse: cast from restricted fpi_t
   mm/page_alloc.c:915:31: sparse: sparse: cast from restricted fpi_t
   mm/page_alloc.c:915:31: sparse: sparse: cast from restricted fpi_t
   mm/page_alloc.c:2738:6: sparse: sparse: context imbalance in 'free_unref_page' - different lock contexts for basic block
   mm/page_alloc.c:2835:33: sparse: sparse: context imbalance in 'free_unref_folios' - unexpected unlock
   mm/page_alloc.c:915:31: sparse: sparse: cast from restricted fpi_t
   mm/page_alloc.c:3137:20: sparse: sparse: context imbalance in 'rmqueue_pcplist' - different lock contexts for basic block
   mm/page_alloc.c:4890:9: sparse: sparse: context imbalance in '__alloc_pages_bulk' - different lock contexts for basic block

vim +/nr_free_highatomic +327 mm/page_alloc.c

60f30350fd69a3 Vlastimil Babka 2016-03-15  326  
d5ace9d4dd020b Kalesh Singh    2025-05-28 @327  unsigned long nr_free_highatomic[MAX_NR_ZONES] = {0};
d5ace9d4dd020b Kalesh Singh    2025-05-28  328  

:::::: The code at line 327 was first introduced by commit
:::::: d5ace9d4dd020b31be684cfd095e876fe59ae65f ANDROID: GKI: page_alloc ABI fixup

:::::: TO: Kalesh Singh <kaleshsingh@google.com>
:::::: CC: Kalesh Singh <kaleshsingh@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
