Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13A31D7984
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Aug 2025 19:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755200645; cv=none; b=mx31OFNFQgAnImjIMDjDsBTO4xQtv5UQVa6ndovI9kl4hEE0fpBtMu0H4HccUWfX5etKD6obEb/8TTLQJ6puI7LN1T3PKAG81/CgzfPaU93QiINVpfDnweSl2SwmFbD6UHs4POhAK+JZ7dE46YcjYlmHQoe+A+7Q+IwS3AC6gUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755200645; c=relaxed/simple;
	bh=KIdB62J12ZZRBbwwZhFW/Se5cq+d2pkS/4XcpSsj+Hs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ez6+9XMezbrq152AyaYjaGHXYEEswQMT/Qa5XBd+0qE4HpKeoZJp5BptPRr9LQJLL2XByxU0fYt2qIgtCskiJNVpmF8IWQpBMh75fJmMy9+Cl6u0MOKnKIqp4HU4MWLfKDtDRURLvvzUlq3Q5nOksIM571Lf5anIvdTQxUDGnls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JMhxDdxi; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JMhxDdxi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755200643; x=1786736643;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KIdB62J12ZZRBbwwZhFW/Se5cq+d2pkS/4XcpSsj+Hs=;
  b=JMhxDdxiL9425dyA2uNkDgQ/XzgUQspNmuRJijGDQphHMt9OkmPwbo97
   4FhkyLj35iUMqxZI4VAp0LOIplVQFGnZAR+lhhhlvI7+nruppbNFtzLcG
   wCDZl1p2BNHoEqbUHqFxKzKByC++WZ+cxNsno6i8lhs94pnNgEpATOjAl
   ye6KeOdXKOMT6TvMdFROEaUp6H6vc/6iKFj3UZQHsglzPIM7RTSutX+mO
   PWUxxM2cvd8IzK2gD6h18h3IR+veNBIOtOQ2LL76Iah79++DR084s5CIx
   bxqMqSoX84l85L4SCWl5q6j0qVQ1JQLT7VgspNy583r3CCHRgLxhpSfCS
   g==;
X-CSE-ConnectionGUID: oD734zTFRzOLza9dsq+zLw==
X-CSE-MsgGUID: UCxjwSIiQGiTUCRUVVFJ6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="61335963"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="61335963"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 12:44:03 -0700
X-CSE-ConnectionGUID: voQlEpMhQoqfs5KR3dsQOA==
X-CSE-MsgGUID: vlK1C2F5TkWLSrRXneY7Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="166025563"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by orviesa006.jf.intel.com with ESMTP; 14 Aug 2025 12:44:02 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umdrj-0000KB-22;
	Thu, 14 Aug 2025 19:43:59 +0000
Date: Thu, 14 Aug 2025 21:43:52 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 4/4]
 arch/arm64/kvm/hyp/nvhe/hyp-main.c:56:6: warning: no previous prototype for
 function '__pkvm_unmask_serror'
Message-ID: <202508142137.nFPBCY1e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   125206b4d7d6898a8a5d0c088a5ba75114266b81
commit: a08dde8a50c098a8002175044a68f63a9de16a53 [4/4] ANDROID: KVM: arm64: Add pKVM module register_unmask_serror
config: arm64-randconfig-2002-20250814 (https://download.01.org/0day-ci/archive/20250814/202508142137.nFPBCY1e-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7d886fab74d4037d654d02bed24dd97c0ba863d6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250814/202508142137.nFPBCY1e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508142137.nFPBCY1e-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/hyp/nvhe/hyp-main.c:56:6: warning: no previous prototype for function '__pkvm_unmask_serror' [-Wmissing-prototypes]
      56 | void __pkvm_unmask_serror(void)
         |      ^
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:56:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      56 | void __pkvm_unmask_serror(void)
         | ^
         | static 
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:455:22: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     455 |         [ESR_ELx_EC_WFx]                = handle_pvm_entry_wfx,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:454:28: note: previous initialization is here
     454 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:456:24: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     456 |         [ESR_ELx_EC_HVC64]              = handle_pvm_entry_hvc64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:454:28: note: previous initialization is here
     454 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:457:24: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     457 |         [ESR_ELx_EC_SYS64]              = handle_pvm_entry_sys64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:454:28: note: previous initialization is here
     454 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:458:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     458 |         [ESR_ELx_EC_IABT_LOW]           = handle_pvm_entry_iabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:454:28: note: previous initialization is here
     454 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:459:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     459 |         [ESR_ELx_EC_DABT_LOW]           = handle_pvm_entry_dabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:454:28: note: previous initialization is here
     454 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:464:22: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     464 |         [ESR_ELx_EC_WFx]                = handle_pvm_exit_wfx,
         |                                           ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:463:28: note: previous initialization is here
     463 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:465:24: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     465 |         [ESR_ELx_EC_HVC64]              = handle_pvm_exit_hvc64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:463:28: note: previous initialization is here
     463 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:466:24: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     466 |         [ESR_ELx_EC_SYS64]              = handle_pvm_exit_sys64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:463:28: note: previous initialization is here
     463 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:467:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     467 |         [ESR_ELx_EC_IABT_LOW]           = handle_pvm_exit_iabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:463:28: note: previous initialization is here
     463 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:468:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     468 |         [ESR_ELx_EC_DABT_LOW]           = handle_pvm_exit_dabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:463:28: note: previous initialization is here
     463 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:477:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     477 |         [ESR_ELx_EC_IABT_LOW]           = handle_vm_exit_abt,
         |                                           ^~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:476:28: note: previous initialization is here


vim +/__pkvm_unmask_serror +56 arch/arm64/kvm/hyp/nvhe/hyp-main.c

    55	
  > 56	void __pkvm_unmask_serror(void)
    57	{
    58		u64 hcr = read_sysreg(HCR_EL2);
    59	
    60		if (!unmask_serror || !unmask_serror())
    61			return;
    62	
    63		write_sysreg(hcr | HCR_AMO, HCR_EL2);
    64		asm volatile("msr daifclr, #4");
    65		isb();
    66	}
    67	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
