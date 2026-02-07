Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969E2353EFC
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Feb 2026 15:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770477590; cv=none; b=M21f0oIr8Ujbh1N6hgtm+Y0gcCYka+fST3W5BGXQAhxbM9x0JnQWzOddkxscCXLhQgKHizs/h2EEJpBV5pXP1Uk31Pd8dUBXuixzZtFCqQwKlqPYSYTsBqtxKedVNunnHE8ysdiwcQFhue1UG4hlPk6JTkFE8HiDaTexNW5OaWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770477590; c=relaxed/simple;
	bh=8rRnCGDAe04fhEVt0imVHecHhfWhz0zlAJHYKfZKQpg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SO5bWHuoAoiqMAoRucU3np3ezrHbk/YeU2z/UIz7XfLyI6hv6l3wAt5dzrvZsmhPTppzx5daeG8/0IG8E2WXOIQig+AxsGwqkkB04hR+nAWafao3ps+/C+qDZvvrj5XePgXkYeU94z30WA8iVkYrjzgoNwq2tKnKWDh+5dVNnZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=An9bIPYl; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="An9bIPYl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770477589; x=1802013589;
  h=date:from:to:cc:subject:message-id;
  bh=8rRnCGDAe04fhEVt0imVHecHhfWhz0zlAJHYKfZKQpg=;
  b=An9bIPYlb5siSVRSHwFwEFDoGmOlrGgkpLyhC9gNDMP1/Rg0/fw0UcIR
   x2+Bf+lBtFyvYpWavMH/EOyuE/IYiqZxF0vGEEnGRpNAX+uPt4bFxue7y
   AviihS+F+5nx5fSb5DuPcVE/Ee7ZurMs7bdV3o0rYNUdzfuHwosTIVEw0
   txFAWNeUhiKaIzCDQVrPMHQMq/r4U60HiUy8NPEyVb7G/1+tbLF2jWOiU
   C7drNj8XOu1aLqzms3MqmK2Pl9hW1H0QoK4D7AZGJFp3X9xtLaKgaml/W
   Zf6bkVUg5wixeWm6DJydqbUk1pHnd3UZH6hwWjZvniqOO7zcUx9U9KCJ6
   w==;
X-CSE-ConnectionGUID: mCNRHya8SlaAfH9Vx2fm8w==
X-CSE-MsgGUID: sDeRmJdgR8mFxH0/ecJ4GQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11694"; a="71761021"
X-IronPort-AV: E=Sophos;i="6.21,278,1763452800"; 
   d="scan'208";a="71761021"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2026 07:19:49 -0800
X-CSE-ConnectionGUID: /yJeD39DStuYpE2NAZQQDw==
X-CSE-MsgGUID: TjC8CJWfSsS9Hwpq+uBsjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,278,1763452800"; 
   d="scan'208";a="210230874"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 07 Feb 2026 07:19:48 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vok65-00000000liC-0k8K;
	Sat, 07 Feb 2026 15:19:45 +0000
Date: Sat, 07 Feb 2026 23:19:43 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 0/2]
 arch/x86/include/asm/kvm_pkvm.h:115:30: error: expected identifier or '('
Message-ID: <202602072333.YI9uMqX7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   057ef31ac12837dabdac1d890cecba0b55ff87c0
commit: abdc5cb643ed7b6ad635e08a9284ad59bc643ba5 [0/2] ANDROID: pKVM: x86: Add __cpu_possible_mask and nr_cpu_ids symbols
config: x86_64-randconfig-123-20260207 (https://download.01.org/0day-ci/archive/20260207/202602072333.YI9uMqX7-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602072333.YI9uMqX7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602072333.YI9uMqX7-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kvm/pkvm/early_alloc.c:3:
>> arch/x86/include/asm/kvm_pkvm.h:115:30: error: expected identifier or '('
     115 | extern unsigned int pkvm_sym(nr_cpu_ids);
         |                              ^
   include/linux/cpumask.h:28:22: note: expanded from macro 'nr_cpu_ids'
      28 | #define nr_cpu_ids ((unsigned int)NR_CPUS)
         |                      ^
   In file included from arch/x86/kvm/pkvm/early_alloc.c:3:
>> arch/x86/include/asm/kvm_pkvm.h:115:30: error: expected ')'
   include/linux/cpumask.h:28:22: note: expanded from macro 'nr_cpu_ids'
      28 | #define nr_cpu_ids ((unsigned int)NR_CPUS)
         |                      ^
   arch/x86/include/asm/kvm_pkvm.h:115:30: note: to match this '('
   include/linux/cpumask.h:28:21: note: expanded from macro 'nr_cpu_ids'
      28 | #define nr_cpu_ids ((unsigned int)NR_CPUS)
         |                     ^
   In file included from arch/x86/kvm/pkvm/early_alloc.c:3:
>> arch/x86/include/asm/kvm_pkvm.h:115:30: error: expected ')'
     115 | extern unsigned int pkvm_sym(nr_cpu_ids);
         |                              ^
   include/linux/cpumask.h:28:35: note: expanded from macro 'nr_cpu_ids'
      28 | #define nr_cpu_ids ((unsigned int)NR_CPUS)
         |                                   ^
   include/linux/threads.h:21:18: note: expanded from macro 'NR_CPUS'
      21 | #define NR_CPUS         CONFIG_NR_CPUS
         |                         ^
   ./include/generated/autoconf.h:380:24: note: expanded from macro 'CONFIG_NR_CPUS'
     380 | #define CONFIG_NR_CPUS 1
         |                        ^
   arch/x86/include/asm/kvm_pkvm.h:115:30: note: to match this '('
   include/linux/cpumask.h:28:20: note: expanded from macro 'nr_cpu_ids'
      28 | #define nr_cpu_ids ((unsigned int)NR_CPUS)
         |                    ^
   3 errors generated.
--
   In file included from arch/x86/kvm/pkvm/cpu.c:4:
>> arch/x86/include/asm/kvm_pkvm.h:115:30: error: expected identifier or '('
     115 | extern unsigned int pkvm_sym(nr_cpu_ids);
         |                              ^
   include/linux/cpumask.h:28:22: note: expanded from macro 'nr_cpu_ids'
      28 | #define nr_cpu_ids ((unsigned int)NR_CPUS)
         |                      ^
   In file included from arch/x86/kvm/pkvm/cpu.c:4:
>> arch/x86/include/asm/kvm_pkvm.h:115:30: error: expected ')'
   include/linux/cpumask.h:28:22: note: expanded from macro 'nr_cpu_ids'
      28 | #define nr_cpu_ids ((unsigned int)NR_CPUS)
         |                      ^
   arch/x86/include/asm/kvm_pkvm.h:115:30: note: to match this '('
   include/linux/cpumask.h:28:21: note: expanded from macro 'nr_cpu_ids'
      28 | #define nr_cpu_ids ((unsigned int)NR_CPUS)
         |                     ^
   In file included from arch/x86/kvm/pkvm/cpu.c:4:
>> arch/x86/include/asm/kvm_pkvm.h:115:30: error: expected ')'
     115 | extern unsigned int pkvm_sym(nr_cpu_ids);
         |                              ^
   include/linux/cpumask.h:28:35: note: expanded from macro 'nr_cpu_ids'
      28 | #define nr_cpu_ids ((unsigned int)NR_CPUS)
         |                                   ^
   include/linux/threads.h:21:18: note: expanded from macro 'NR_CPUS'
      21 | #define NR_CPUS         CONFIG_NR_CPUS
         |                         ^
   ./include/generated/autoconf.h:380:24: note: expanded from macro 'CONFIG_NR_CPUS'
     380 | #define CONFIG_NR_CPUS 1
         |                        ^
   arch/x86/include/asm/kvm_pkvm.h:115:30: note: to match this '('
   include/linux/cpumask.h:28:20: note: expanded from macro 'nr_cpu_ids'
      28 | #define nr_cpu_ids ((unsigned int)NR_CPUS)
         |                    ^
>> arch/x86/kvm/pkvm/cpu.c:20:14: error: expected identifier or '('
      20 | unsigned int nr_cpu_ids;
         |              ^
   include/linux/cpumask.h:28:22: note: expanded from macro 'nr_cpu_ids'
      28 | #define nr_cpu_ids ((unsigned int)NR_CPUS)
         |                      ^
>> arch/x86/kvm/pkvm/cpu.c:20:14: error: expected ')'
   include/linux/cpumask.h:28:22: note: expanded from macro 'nr_cpu_ids'
      28 | #define nr_cpu_ids ((unsigned int)NR_CPUS)
         |                      ^
   arch/x86/kvm/pkvm/cpu.c:20:14: note: to match this '('
   include/linux/cpumask.h:28:21: note: expanded from macro 'nr_cpu_ids'
      28 | #define nr_cpu_ids ((unsigned int)NR_CPUS)
         |                     ^
>> arch/x86/kvm/pkvm/cpu.c:20:14: error: expected ')'
      20 | unsigned int nr_cpu_ids;
         |              ^
   include/linux/cpumask.h:28:35: note: expanded from macro 'nr_cpu_ids'
      28 | #define nr_cpu_ids ((unsigned int)NR_CPUS)
         |                                   ^
   include/linux/threads.h:21:18: note: expanded from macro 'NR_CPUS'
      21 | #define NR_CPUS         CONFIG_NR_CPUS
         |                         ^
   ./include/generated/autoconf.h:380:24: note: expanded from macro 'CONFIG_NR_CPUS'
     380 | #define CONFIG_NR_CPUS 1
         |                        ^
   arch/x86/kvm/pkvm/cpu.c:20:14: note: to match this '('
   include/linux/cpumask.h:28:20: note: expanded from macro 'nr_cpu_ids'
      28 | #define nr_cpu_ids ((unsigned int)NR_CPUS)
         |                    ^
   6 errors generated.

Kconfig warnings: (for reference only)
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
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=y] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]


vim +115 arch/x86/include/asm/kvm_pkvm.h

    99	
   100	extern unsigned long pkvm_sym(page_offset_base);
   101	extern unsigned long pkvm_sym(phys_base);
   102	extern struct pkvm_hyp *pkvm_sym(pkvm_hyp);
   103	extern struct memblock_region pkvm_sym(pkvm_memory)[];
   104	extern unsigned int pkvm_sym(pkvm_memblock_nr);
   105	extern struct cpuinfo_x86 pkvm_sym(boot_cpu_data);
   106	#ifdef CONFIG_DYNAMIC_PHYSICAL_MASK
   107	extern phys_addr_t pkvm_sym(physical_mask);
   108	#endif
   109	extern pteval_t pkvm_sym(__default_kernel_pte_mask);
   110	#ifdef CONFIG_AMD_MEM_ENCRYPT
   111	extern u64 pkvm_sym(sme_me_mask);
   112	#endif
   113	extern struct pkvm_init_ops *pkvm_sym(init_ops);
   114	extern struct cpumask pkvm_sym(__cpu_possible_mask);
 > 115	extern unsigned int pkvm_sym(nr_cpu_ids);
   116	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
