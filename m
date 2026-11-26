Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795693669;
	b=0LNVUY3Rhvs5Db7wGNibgPVa1nG4OK4Aa5b4dUW7td/0/SBdOeSxXuk0I8qfU/CKASgX
	 DFSvNBxytVHa1RCm66XDzlY0XcWCN+UIut/mquJxt/t70cw+Rq5mUDCnelzdsL0ij42Oz
	 6jtugiSsvlNLuCzPehrN596+k4WkAirY5+xNyMQGdhQpZ5zpHEDLPs3QpjimFvGdeYAKV
	 dE10MJJrDeCWv9rDLZBtUlk97Uv0bQx0xTkKJt0RtlUtHT6fp9r0PmskZv/Nvb8zoeqxS
	 86PEN4GzqjoUpdCNZ5x/KVV5r67ZefvqdbpVsn+XJAgN6+oKNLwoq9IEmc0qXTQdWFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795693669;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=uOeLknQsOE3eakLY7h7YKB6ViZUPOGNbogpP73zngWo=;
	b=tF3WqC20cnlgiP0SkkWrcqXaQy65YAg22kmPnTDwoOq/d7+gCbmBKMBcA2MGARB096GR
	 AQ42zvx4dse69wZEdCMghriHZIfdisg75gnSUNR1wOaMCrHBueIKHC8WFoEDu39rYEsur
	 ez71VzFlmyG+w7TyUxlcy7t70wYoaBFn3Vkkau2aqL7fax8eK58K+zIeJvVVjrgHPxwVm
	 b4oDXazakR/GnBjLlFjI4tDtMAW/ExjNCIbvGhh2FwFnQceZ41leOobiMf+bBf22H7PNZ
	 XxWmSYEyXN6nF3dnvW9K0pqMem8CJLkT1nn5/O/QcA4UppEUtNUiPC8wSbyJUgn1oDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YHwHLPFP;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747FF606A31E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Nov 2026 11:47:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 747FF606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YHwHLPFP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795693669; x=1827229669;
  h=date:from:to:cc:subject:message-id;
  bh=ZMnJBdKItCvYwIX6+/l1FBXoEkxbYgdy5bhlCoTZXTo=;
  b=YHwHLPFPK57Gj0J4ANHLbKv4s1/9yrPuGSah/feFpqL4adx7l9XPSyh7
   omSKPMC13hSKctT4cBa33iKjwA0uPqYp2KgnwBJUx2E+jPXpyNM3MIjev
   CGHb9rO+Xus7/8j0bGrBH7W9XOk4Cr5Qk99hzCL4698SBsFyz6yZxDdtr
   k3Ln+olYSx0UqtoQ8QwxbNZVHOfXSmWbshZjqc555C1ltPgGmPnBLtl0K
   tO3USLUsINDSpuZwfSW1Y79wrEIIL/x52vwrKvaZUDOoeN3LcKEmUJH9b
   Q59xrJ0lNM9QhQ28UAc6S1zW8fQovij2W44oFBjxixaxHsp6wqxy2RidD
   w==;
X-CSE-ConnectionGUID: o9WVxaHGTO+Nas6cilNSHw==
X-CSE-MsgGUID: 2FcB1epiTmCzO0JmljhzNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4525664"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4525664"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 03:47:48 -0800
X-CSE-ConnectionGUID: chMCDk1CQZ+Ln4mVUgAi+A==
X-CSE-MsgGUID: Rngfrgv+Q2Ok+do6f+j6Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="11939490"
Received: from igk-lkp-server01.igk.intel.com (HELO 800201f3098f) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 26 Nov 2026 03:47:45 -0800
Received: from kbuild by 800201f3098f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWXwx-0000000002g-2kAU;
	Thu, 26 Nov 2026 11:47:39 +0000
Date: Thu, 26 Nov 2026 12:47:24 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 3/3]
 include/uapi/linux/bits.h:9:19: warning: right shift count is negative
Message-ID: <20261126124106.ruSaURzZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Sebastian,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   062f50e2f6f1479285e1f7a82e3b30115d4f5ab0
commit: 7aae9422d19a266194ce4db6f81bb23b686e1ed3 [3/3] BACKPORT: FROMLIST: irqchip/gic-v3-its: Prepare shadow structures for KVM host deprivilege
config: arm-randconfig-2002-20261126 (https://download.01.org/0day-ci/archive/20261126/20261126124106.ruSaURzZ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261126/20261126124106.ruSaURzZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261126124106.ruSaURzZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/bits.h:7,
                    from include/linux/ioport.h:13,
                    from include/linux/acpi.h:12,
                    from drivers/irqchip/irq-gic-v3-its.c:7:
   drivers/irqchip/irq-gic-v3-its.c: In function 'its_switch_to_shadow_locked':
>> include/uapi/linux/bits.h:9:19: warning: right shift count is negative [-Wshift-count-negative]
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^~
   include/linux/bits.h:69:38: note: in expansion of macro '__GENMASK'
      69 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/irqchip/irq-gic-v3-its.c:5317:40: note: in expansion of macro 'GENMASK'
    5317 |                 its->tables[i].val &= ~GENMASK(47, 12);
         |                                        ^~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_COMPRESS_ACCEL
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=y] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]


vim +9 include/uapi/linux/bits.h

3c7a8e190bc580 Paolo Bonzini 2023-12-12   6  
3c7a8e190bc580 Paolo Bonzini 2023-12-12   7  #define __GENMASK(h, l) \
3c7a8e190bc580 Paolo Bonzini 2023-12-12   8          (((~_UL(0)) - (_UL(1) << (l)) + 1) & \
3c7a8e190bc580 Paolo Bonzini 2023-12-12  @9           (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
3c7a8e190bc580 Paolo Bonzini 2023-12-12  10  

:::::: The code at line 9 was first introduced by commit
:::::: 3c7a8e190bc580813ddd9259f62971c8d2a6b5ad uapi: introduce uapi-friendly macros for GENMASK

:::::: TO: Paolo Bonzini <pbonzini@redhat.com>
:::::: CC: Paolo Bonzini <pbonzini@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
