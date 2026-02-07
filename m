Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B03227E05A
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Feb 2026 17:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770485695; cv=none; b=FB8UZeHBWqYcrCexySKTwh55M4vHgOqm8XfOaXkE0HN7f7xBt800rwYh1oOQxcsC0rn8IAFjPtYrZPkQapMG8nYalxl9hnjhfkZreFH8eGUmvIMjzlOIzjXW1REaSyAJ4Ve2r6hObXt1PPVqoZ8JmgFK16efFj7e8QQoIn00gUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770485695; c=relaxed/simple;
	bh=yH5zNBGYD2oUN8FH0B6mq6AXhhBppXzybAsVqDDZyXU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=p5s+LjJDu8mEJG4Ts/rIS2ajQbOVAbmC3peaWNsxmpBnedzvOlDmC4tvWynHYgTlfrjPwkhOBU3QF5kh+ACDD8d4pvcxV1Qi27ysrCiSqIe3SoTsT08/QezcGVgdwJ8omc+x08yuZigSQ/n9kMGdSk2TARB+RtJRpDNxIQ/uUTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ezTqaKrz; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ezTqaKrz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770485694; x=1802021694;
  h=date:from:to:cc:subject:message-id;
  bh=yH5zNBGYD2oUN8FH0B6mq6AXhhBppXzybAsVqDDZyXU=;
  b=ezTqaKrzTm1/HqtW1SHx22ACb7IGZ/Gnw/hGqkldJ3BAOwoVPJWOfZgg
   dAp17bYZU67cLrOMZfU7Kmd/Y/mAHJ8iCXq4H53NdGJwEEuaWvfGK4Ok7
   DxODQ8lWFIR7xHz4VmPczKyHmQ1QW4L1Muh946+V2n341uZ7zIwDvWCNx
   W93UzWXJHqx23LOOtgxaYagK0tr43397/L9B8cWPI/dcYdoq3TLvlC0YS
   WVie9p1jnCTATPB3Ozelh7jNMdDfwiBmefywGNSsEcXufDXVk5k/axFvP
   1nIDUxz46WvNuKHgclOue7cIs5fu6pso2sVx9mC0bS/iiJezNV5GxBw2/
   g==;
X-CSE-ConnectionGUID: o7jgXbu3SLSwkoMbQRSBdw==
X-CSE-MsgGUID: g/1Jh17CSPyZAP59bTAA/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11694"; a="71701331"
X-IronPort-AV: E=Sophos;i="6.21,278,1763452800"; 
   d="scan'208";a="71701331"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2026 09:34:54 -0800
X-CSE-ConnectionGUID: A6uyoqJOTnSZDeDvIwoVbg==
X-CSE-MsgGUID: LLXo8DGYSBuUUQc4oywqQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,278,1763452800"; 
   d="scan'208";a="215344887"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 07 Feb 2026 09:34:52 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vomCn-00000000lnm-3yu2;
	Sat, 07 Feb 2026 17:34:49 +0000
Date: Sun, 08 Feb 2026 01:34:21 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/tdx_huge_sept 56/56]
 include/linux/static_call_types.h:58:2: error: too few arguments to function
 '(({...}))'
Message-ID: <202602080139.KNmQY5T0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/sean-jc/linux x86/tdx_huge_sept
head:   c86be62d601ede14cbad1d0fb5af9b67d4172342
commit: c86be62d601ede14cbad1d0fb5af9b67d4172342 [56/56] FIXUPS
config: x86_64-randconfig-011-20260207 (https://download.01.org/0day-ci/archive/20260208/202602080139.KNmQY5T0-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260208/202602080139.KNmQY5T0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602080139.KNmQY5T0-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/bug.h:141,
                    from arch/x86/include/asm/alternative.h:9,
                    from arch/x86/include/asm/page_64.h:9,
                    from arch/x86/include/asm/page.h:12,
                    from include/linux/mm_types_task.h:14,
                    from include/linux/mm_types.h:5,
                    from arch/x86/kvm/irq.h:13,
                    from arch/x86/kvm/mmu/mmu.c:19:
   arch/x86/kvm/mmu/mmu.c: In function 'mmu_topup_memory_caches':
>> include/linux/static_call_types.h:58:2: error: too few arguments to function '(({...}))'
      58 | ({                                                                      \
         | ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      59 |         __STATIC_CALL_ADDRESSABLE(name);                                \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      60 |         __raw_static_call(name);                                        \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      61 | })
         | ~~
   include/linux/static_call_types.h:92:33: note: in expansion of macro '__static_call'
      92 | #define static_call(name)       __static_call(name)
         |                                 ^~~~~~~~~~~~~
   arch/x86/include/asm/kvm_host.h:2002:28: note: in expansion of macro 'static_call'
    2002 | #define kvm_x86_call(func) static_call(kvm_x86_##func)
         |                            ^~~~~~~~~~~
   arch/x86/kvm/mmu/mmu.c:609:21: note: in expansion of macro 'kvm_x86_call'
     609 |                 r = kvm_x86_call(topup_external_cache)(vcpu->kvm, vcpu);
         |                     ^~~~~~~~~~~~
--
   In file included from include/linux/entry-virt.h:5,
                    from include/linux/kvm_host.h:5,
                    from arch/x86/kvm/mmu.h:5,
                    from arch/x86/kvm/mmu/tdp_mmu.c:4:
   arch/x86/kvm/mmu/tdp_mmu.c: In function 'tdp_mmu_alloc_sp_for_split':
>> include/linux/static_call_types.h:58:2: error: too few arguments to function '(({...}))'
      58 | ({                                                                      \
         | ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      59 |         __STATIC_CALL_ADDRESSABLE(name);                                \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      60 |         __raw_static_call(name);                                        \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      61 | })
         | ~~
   include/linux/static_call_types.h:92:33: note: in expansion of macro '__static_call'
      92 | #define static_call(name)       __static_call(name)
         |                                 ^~~~~~~~~~~~~
   arch/x86/include/asm/kvm_host.h:2002:28: note: in expansion of macro 'static_call'
    2002 | #define kvm_x86_call(func) static_call(kvm_x86_##func)
         |                            ^~~~~~~~~~~
   arch/x86/kvm/mmu/tdp_mmu.c:1468:21: note: in expansion of macro 'kvm_x86_call'
    1468 |                 if (kvm_x86_call(topup_external_cache)(kvm, kvm_get_running_vcpu()))
         |                     ^~~~~~~~~~~~
--
   In file included from arch/x86/include/asm/bug.h:141,
                    from arch/x86/include/asm/alternative.h:9,
                    from arch/x86/include/asm/page_64.h:9,
                    from arch/x86/include/asm/page.h:12,
                    from include/linux/mm_types_task.h:14,
                    from include/linux/mm_types.h:5,
                    from arch/x86/kvm/irq.h:13,
                    from mmu/mmu.c:19:
   mmu/mmu.c: In function 'mmu_topup_memory_caches':
>> include/linux/static_call_types.h:58:2: error: too few arguments to function '(({...}))'
      58 | ({                                                                      \
         | ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      59 |         __STATIC_CALL_ADDRESSABLE(name);                                \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      60 |         __raw_static_call(name);                                        \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      61 | })
         | ~~
   include/linux/static_call_types.h:92:33: note: in expansion of macro '__static_call'
      92 | #define static_call(name)       __static_call(name)
         |                                 ^~~~~~~~~~~~~
   arch/x86/include/asm/kvm_host.h:2002:28: note: in expansion of macro 'static_call'
    2002 | #define kvm_x86_call(func) static_call(kvm_x86_##func)
         |                            ^~~~~~~~~~~
   mmu/mmu.c:609:21: note: in expansion of macro 'kvm_x86_call'
     609 |                 r = kvm_x86_call(topup_external_cache)(vcpu->kvm, vcpu);
         |                     ^~~~~~~~~~~~
--
   In file included from include/linux/entry-virt.h:5,
                    from include/linux/kvm_host.h:5,
                    from arch/x86/kvm/mmu.h:5,
                    from mmu/tdp_mmu.c:4:
   mmu/tdp_mmu.c: In function 'tdp_mmu_alloc_sp_for_split':
>> include/linux/static_call_types.h:58:2: error: too few arguments to function '(({...}))'
      58 | ({                                                                      \
         | ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      59 |         __STATIC_CALL_ADDRESSABLE(name);                                \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      60 |         __raw_static_call(name);                                        \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      61 | })
         | ~~
   include/linux/static_call_types.h:92:33: note: in expansion of macro '__static_call'
      92 | #define static_call(name)       __static_call(name)
         |                                 ^~~~~~~~~~~~~
   arch/x86/include/asm/kvm_host.h:2002:28: note: in expansion of macro 'static_call'
    2002 | #define kvm_x86_call(func) static_call(kvm_x86_##func)
         |                            ^~~~~~~~~~~
   mmu/tdp_mmu.c:1468:21: note: in expansion of macro 'kvm_x86_call'
    1468 |                 if (kvm_x86_call(topup_external_cache)(kvm, kvm_get_running_vcpu()))
         |                     ^~~~~~~~~~~~


vim +58 include/linux/static_call_types.h

73f44fe19d3596 Josh Poimboeuf 2021-01-27  48  
880cfed3a012d7 Peter Zijlstra 2021-01-18  49  /*
880cfed3a012d7 Peter Zijlstra 2021-01-18  50   * __ADDRESSABLE() is used to ensure the key symbol doesn't get stripped from
880cfed3a012d7 Peter Zijlstra 2021-01-18  51   * the symbol table so that objtool can reference it when it generates the
880cfed3a012d7 Peter Zijlstra 2021-01-18  52   * .static_call_sites section.
880cfed3a012d7 Peter Zijlstra 2021-01-18  53   */
73f44fe19d3596 Josh Poimboeuf 2021-01-27  54  #define __STATIC_CALL_ADDRESSABLE(name) \
73f44fe19d3596 Josh Poimboeuf 2021-01-27  55  	__ADDRESSABLE(STATIC_CALL_KEY(name))
73f44fe19d3596 Josh Poimboeuf 2021-01-27  56  
880cfed3a012d7 Peter Zijlstra 2021-01-18  57  #define __static_call(name)						\
880cfed3a012d7 Peter Zijlstra 2021-01-18 @58  ({									\
73f44fe19d3596 Josh Poimboeuf 2021-01-27  59  	__STATIC_CALL_ADDRESSABLE(name);				\
73f44fe19d3596 Josh Poimboeuf 2021-01-27  60  	__raw_static_call(name);					\
880cfed3a012d7 Peter Zijlstra 2021-01-18  61  })
880cfed3a012d7 Peter Zijlstra 2021-01-18  62  

:::::: The code at line 58 was first introduced by commit
:::::: 880cfed3a012d7863f42251791cea7fe78c39390 static_call: Pull some static_call declarations to the type headers

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
