Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3BA314A60C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jan 2026 01:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768441601; cv=none; b=IU4afa4nii5ohgd3ltqdad7tijx4O5xkuUGr8ZhVyJlJ1eqq4+3jLMMy/SBk+mqSH4/VH2Fmuz69MlhC+c5oLgv6nd6n6AYoKpDuQs+gFBs8y4mtgoZ69lmNpZ32lKlDdv3nNmoZZa3VaJvQUIgZrQ7wcqukMlDP0gWG+uFl9Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768441601; c=relaxed/simple;
	bh=vHovPHTpImfpTS8peavIz10zOfLj+6oq6A+rQQJAu6c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Tv9Z7yMjZbbEuK/suZ5NbKLcyi4X6EfCsPt8e4vhrRlok3ttlYOH2Ixovh05pbF8yoMEfAMOPTmz9zLj5HS3aop4wV5fmw3jZnMfv7AbmZlDir9sbx3Zt62pSx31q/iu3jJyGkbzlffaqlw+x00GdwYAhtZIO1PFKoDY6+V9Vic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MPd+oYvl; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MPd+oYvl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768441600; x=1799977600;
  h=date:from:to:cc:subject:message-id;
  bh=vHovPHTpImfpTS8peavIz10zOfLj+6oq6A+rQQJAu6c=;
  b=MPd+oYvlUKpqFGiGah6LaG5sPJF6Tn+zODb6xzvzFqB0hy+fT8Nx+oL/
   Z9ZXa20V0wLeLm366Lu+s9yrZToeH7Rm8vesyU3AyORwKGeiPa21hPsKR
   1DQh615o01iwQAyQm34l5O2lUmASDw+Zb5JyFlti935XrhpE/6UCF5+Kd
   DA6F3NNIrsUpQzWkHGmNen8z4cM7fjuEg/DW2OHPG8CW/llripPI6zQNc
   pyAIIE9JOzC3imrgbsckF8zHeUWZklCu8lMSJ7h+pNDFiBTYlosB0dQMb
   cFyUQ92QfGEX/XBWZ3f/eK9MsAbGGICeK6GcNvXYvydO7sjN/Ll5LGyew
   Q==;
X-CSE-ConnectionGUID: qnJeGAfjRSKlxjj/oDov3w==
X-CSE-MsgGUID: y4sYE092T26id3uIw5Wjow==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="69483617"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="69483617"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 17:46:39 -0800
X-CSE-ConnectionGUID: QA/4JECDQOiicf7ZsItlRA==
X-CSE-MsgGUID: OynHo2XzSI6jV2Mw2LTnaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="208994897"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 14 Jan 2026 17:46:38 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgCRX-00000000HMC-1YiT;
	Thu, 15 Jan 2026 01:46:35 +0000
Date: Thu, 15 Jan 2026 09:45:36 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 81/81]
 include/trace/hooks/wqlockup.h:17:1: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202601151018.GF4FM3GL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   a62fd0551c62a282d1d60a0eb31e539cd533fa04
commit: 7be3f9b6e088adfc92d93c75d29079f9de2e4cff [81/81] ANDROID: vendor_hooks: add hook in create_worker()
config: x86_64-randconfig-r112-20260115 (https://download.01.org/0day-ci/archive/20260115/202601151018.GF4FM3GL-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260115/202601151018.GF4FM3GL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601151018.GF4FM3GL-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/workqueue.c: note: in included file:
>> include/trace/hooks/wqlockup.h:17:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/wqlockup.h:17:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/wqlockup.h:17:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   kernel/workqueue.c:3557:13: sparse: sparse: context imbalance in 'wq_manager_inactive' - different lock contexts for basic block
   kernel/workqueue.c:3612:9: sparse: sparse: context imbalance in 'put_unbound_pool' - unexpected unlock

vim +17 include/trace/hooks/wqlockup.h

     5	
     6	#if !defined(_TRACE_HOOK_WQLOCKUP_H) || defined(TRACE_HEADER_MULTI_READ)
     7	#define _TRACE_HOOK_WQLOCKUP_H
     8	#include <trace/hooks/vendor_hooks.h>
     9	/*
    10	 * Following tracepoints are not exported in tracefs and provide a
    11	 * mechanism for vendor modules to hook and extend functionality
    12	 */
    13	DECLARE_HOOK(android_vh_wq_lockup_pool,
    14		TP_PROTO(int cpu, unsigned long pool_ts),
    15		TP_ARGS(cpu, pool_ts));
    16	
  > 17	DECLARE_RESTRICTED_HOOK(android_rvh_create_worker,
    18		TP_PROTO(struct task_struct *p, struct workqueue_attrs *attrs),
    19		TP_ARGS(p, attrs), 1);
    20	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
