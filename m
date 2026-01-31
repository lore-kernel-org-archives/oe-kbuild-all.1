Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA951284B36
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Jan 2026 10:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769853858; cv=none; b=PFDDWceXNkHxEb6QzpVpgoXGj6Bc8EbIeGooJxsDJT15RqEXMS6rSOtTnFYelq/mjqQMDpXBqhX8yGCUe8pbW8GWaV+AO6b5wCpZy7KmglKgG48ZCj5UUMVrH2GysSqXGL+pfHNHj2R1oCEjJslQ58/RKdnFTQnMEyvZPOBcuwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769853858; c=relaxed/simple;
	bh=GsVy/3ZwmbwvL5T/j3GTgXD+/Dq2xlZ8nyEQC6IUMpY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=frNgH///M13CJ5rAns7AucEdJ2QP8kdbqQyvFhnu36rEX3iRVAksg+9hsQu2j/EDzyeS8s0madPT+AhZETeLl4H0CwH7pM48QeYfAEafIBZp1afCehfmp3kAO2XlA87+F6xv4a2HHIa6kbNrDH4OxG4K9lx4URqNZT0TACXXycY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LWB7Skyg; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LWB7Skyg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769853857; x=1801389857;
  h=date:from:to:cc:subject:message-id;
  bh=GsVy/3ZwmbwvL5T/j3GTgXD+/Dq2xlZ8nyEQC6IUMpY=;
  b=LWB7Skyg1hs8dVeymZHHVJhQjdn7ZKMe2dDF18fA0UH/nzqZhseR91Bo
   n6RQCt0rZuPBIdhIT6ScsdAlaOsKkenNx9GAzn9K/Eegstn9A4rKR4EcJ
   WURk6k0VFA+NWISwK1bX1qrBKw+SPtF5/+9G+SWfTXfhbIg19Iqr78Puv
   m4vOfajs6iPhEN+vdd8PmWDE/W/895DbxJ5YcRm1t/VUZJEVVxSbPkpr1
   HKP/BQVARZrj9WAQ91H1GsbxfVBC6pXB6cda+ETiIxLU1ZjdViJ53zvr1
   wOBfySrBZZeLxBGxv31Il4fW+Tr4NPbuBZeWJwvcu/jSc6/3UqmVrwZw5
   g==;
X-CSE-ConnectionGUID: ktBShobpRGOzWHuBAE9XRg==
X-CSE-MsgGUID: XYXQSZbbSPGX9+236jQv1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="82199943"
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="82199943"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2026 02:04:17 -0800
X-CSE-ConnectionGUID: USa8PPtRT+ukDH5ecQwCog==
X-CSE-MsgGUID: JGduAqN5TIKKaombPwzUiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="246669208"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 31 Jan 2026 02:04:15 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vm7ps-000000002gT-2Huk;
	Sat, 31 Jan 2026 10:04:12 +0000
Date: Sat, 31 Jan 2026 11:03:34 +0100
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_9 6/12] ld.lld: error:
 duplicate symbol: bpf_tracing_multi_attach
Message-ID: <202601311105.cdTRlX33-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi_9
head:   4a1d38e3df06743886a06b547187aec8023ef27d
commit: 43cf4edef3aa5c2d42fff08ce0a553010aae6a11 [6/12] bpf: Add support to create tracing multi link
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260131/202601311105.cdTRlX33-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260131/202601311105.cdTRlX33-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601311105.cdTRlX33-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/arm64/kernel/asm-offsets.c:16:
   In file included from ./include/linux/kvm_host.h:5:
   In file included from ./include/linux/entry-virt.h:7:
   In file included from ./include/linux/syscalls.h:96:
   In file included from ./include/trace/syscall.h:7:
>> ./include/linux/trace_events.h:834:5: warning: no previous prototype for function 'bpf_tracing_multi_attach' [-Wmissing-prototypes]
     834 | int bpf_tracing_multi_attach(struct bpf_prog *prog, const union bpf_attr *attr)
         |     ^
   ./include/linux/trace_events.h:834:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     834 | int bpf_tracing_multi_attach(struct bpf_prog *prog, const union bpf_attr *attr)
         | ^
         | static 
   1 warning generated.
--
   In file included from arch/arm64/kernel/sys.c:16:
   In file included from ./include/linux/syscalls.h:96:
   In file included from ./include/trace/syscall.h:7:
>> ./include/linux/trace_events.h:834:5: warning: no previous prototype for function 'bpf_tracing_multi_attach' [-Wmissing-prototypes]
     834 | int bpf_tracing_multi_attach(struct bpf_prog *prog, const union bpf_attr *attr)
         |     ^
   ./include/linux/trace_events.h:834:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     834 | int bpf_tracing_multi_attach(struct bpf_prog *prog, const union bpf_attr *attr)
         | ^
         | static 
   In file included from arch/arm64/kernel/sys.c:62:
   ./arch/arm64/include/generated/asm/syscall_table_64.h:1:1: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
       1 | __SYSCALL_WITH_COMPAT(0, sys_io_setup, compat_sys_io_setup)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/sys.c:51:52: note: expanded from macro '__SYSCALL_WITH_COMPAT'
      51 | #define __SYSCALL_WITH_COMPAT(nr, native, compat)  __SYSCALL(nr, native)
         |                                                    ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/sys.c:58:35: note: expanded from macro '__SYSCALL'
      58 | #define __SYSCALL(nr, sym)      [nr] = __arm64_##sym,
         |                                        ^~~~~~~~~~~~~
   <scratch space>:73:1: note: expanded from here
      73 | __arm64_sys_io_setup
         | ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/sys.c:61:30: note: previous initialization is here
      61 |         [0 ... __NR_syscalls - 1] = __arm64_sys_ni_syscall,
         |                                     ^~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/arm64/kernel/sys.c:62:
   ./arch/arm64/include/generated/asm/syscall_table_64.h:2:1: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
       2 | __SYSCALL(1, sys_io_destroy)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/sys.c:58:35: note: expanded from macro '__SYSCALL'
      58 | #define __SYSCALL(nr, sym)      [nr] = __arm64_##sym,
         |                                        ^~~~~~~~~~~~~
   <scratch space>:74:1: note: expanded from here
      74 | __arm64_sys_io_destroy
         | ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/sys.c:61:30: note: previous initialization is here
      61 |         [0 ... __NR_syscalls - 1] = __arm64_sys_ni_syscall,
         |                                     ^~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/arm64/kernel/sys.c:62:
   ./arch/arm64/include/generated/asm/syscall_table_64.h:3:1: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
       3 | __SYSCALL_WITH_COMPAT(2, sys_io_submit, compat_sys_io_submit)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/sys.c:51:52: note: expanded from macro '__SYSCALL_WITH_COMPAT'
      51 | #define __SYSCALL_WITH_COMPAT(nr, native, compat)  __SYSCALL(nr, native)
         |                                                    ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/sys.c:58:35: note: expanded from macro '__SYSCALL'
      58 | #define __SYSCALL(nr, sym)      [nr] = __arm64_##sym,
         |                                        ^~~~~~~~~~~~~
   <scratch space>:75:1: note: expanded from here
      75 | __arm64_sys_io_submit
         | ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/sys.c:61:30: note: previous initialization is here
      61 |         [0 ... __NR_syscalls - 1] = __arm64_sys_ni_syscall,
         |                                     ^~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/arm64/kernel/sys.c:62:
   ./arch/arm64/include/generated/asm/syscall_table_64.h:4:1: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
       4 | __SYSCALL(3, sys_io_cancel)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/sys.c:58:35: note: expanded from macro '__SYSCALL'
      58 | #define __SYSCALL(nr, sym)      [nr] = __arm64_##sym,
         |                                        ^~~~~~~~~~~~~
   <scratch space>:76:1: note: expanded from here
      76 | __arm64_sys_io_cancel
         | ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/sys.c:61:30: note: previous initialization is here
      61 |         [0 ... __NR_syscalls - 1] = __arm64_sys_ni_syscall,
         |                                     ^~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/arm64/kernel/sys.c:62:
   ./arch/arm64/include/generated/asm/syscall_table_64.h:5:1: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
       5 | __SYSCALL(4, sys_io_getevents)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/sys.c:58:35: note: expanded from macro '__SYSCALL'
      58 | #define __SYSCALL(nr, sym)      [nr] = __arm64_##sym,
         |                                        ^~~~~~~~~~~~~
   <scratch space>:77:1: note: expanded from here
      77 | __arm64_sys_io_getevents
         | ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/sys.c:61:30: note: previous initialization is here
      61 |         [0 ... __NR_syscalls - 1] = __arm64_sys_ni_syscall,
         |                                     ^~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/arm64/kernel/sys.c:62:
   ./arch/arm64/include/generated/asm/syscall_table_64.h:6:1: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
       6 | __SYSCALL(5, sys_setxattr)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/sys.c:58:35: note: expanded from macro '__SYSCALL'
      58 | #define __SYSCALL(nr, sym)      [nr] = __arm64_##sym,
         |                                        ^~~~~~~~~~~~~
   <scratch space>:78:1: note: expanded from here
      78 | __arm64_sys_setxattr
         | ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/sys.c:61:30: note: previous initialization is here
      61 |         [0 ... __NR_syscalls - 1] = __arm64_sys_ni_syscall,
         |                                     ^~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/arm64/kernel/sys.c:62:
   ./arch/arm64/include/generated/asm/syscall_table_64.h:7:1: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
       7 | __SYSCALL(6, sys_lsetxattr)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/sys.c:58:35: note: expanded from macro '__SYSCALL'
      58 | #define __SYSCALL(nr, sym)      [nr] = __arm64_##sym,
         |                                        ^~~~~~~~~~~~~
   <scratch space>:79:1: note: expanded from here
      79 | __arm64_sys_lsetxattr
         | ^~~~~~~~~~~~~~~~~~~~~
--
   In file included from arch/arm64/kernel/traps.c:27:
   In file included from ./include/linux/syscalls.h:96:
   In file included from ./include/trace/syscall.h:7:
>> ./include/linux/trace_events.h:834:5: warning: no previous prototype for function 'bpf_tracing_multi_attach' [-Wmissing-prototypes]
     834 | int bpf_tracing_multi_attach(struct bpf_prog *prog, const union bpf_attr *attr)
         |     ^
   ./include/linux/trace_events.h:834:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     834 | int bpf_tracing_multi_attach(struct bpf_prog *prog, const union bpf_attr *attr)
         | ^
         | static 
   arch/arm64/kernel/traps.c:834:26: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     834 |         [ESR_ELx_EC_UNKNOWN]            = "Unknown/Uncategorized",
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:833:28: note: previous initialization is here
     833 |         [0 ... ESR_ELx_EC_MAX]          = "UNRECOGNIZED EC",
         |                                           ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:835:22: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     835 |         [ESR_ELx_EC_WFx]                = "WFI/WFE",
         |                                           ^~~~~~~~~
   arch/arm64/kernel/traps.c:833:28: note: previous initialization is here
     833 |         [0 ... ESR_ELx_EC_MAX]          = "UNRECOGNIZED EC",
         |                                           ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:836:26: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     836 |         [ESR_ELx_EC_CP15_32]            = "CP15 MCR/MRC",
         |                                           ^~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:833:28: note: previous initialization is here
     833 |         [0 ... ESR_ELx_EC_MAX]          = "UNRECOGNIZED EC",
         |                                           ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:837:26: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     837 |         [ESR_ELx_EC_CP15_64]            = "CP15 MCRR/MRRC",
         |                                           ^~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:833:28: note: previous initialization is here
     833 |         [0 ... ESR_ELx_EC_MAX]          = "UNRECOGNIZED EC",
         |                                           ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:838:26: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     838 |         [ESR_ELx_EC_CP14_MR]            = "CP14 MCR/MRC",
         |                                           ^~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:833:28: note: previous initialization is here
     833 |         [0 ... ESR_ELx_EC_MAX]          = "UNRECOGNIZED EC",
         |                                           ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:839:26: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     839 |         [ESR_ELx_EC_CP14_LS]            = "CP14 LDC/STC",
         |                                           ^~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:833:28: note: previous initialization is here
     833 |         [0 ... ESR_ELx_EC_MAX]          = "UNRECOGNIZED EC",
         |                                           ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:840:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     840 |         [ESR_ELx_EC_FP_ASIMD]           = "ASIMD",
         |                                           ^~~~~~~
   arch/arm64/kernel/traps.c:833:28: note: previous initialization is here
     833 |         [0 ... ESR_ELx_EC_MAX]          = "UNRECOGNIZED EC",
         |                                           ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:841:26: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     841 |         [ESR_ELx_EC_CP10_ID]            = "CP10 MRC/VMRS",
         |                                           ^~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:833:28: note: previous initialization is here
     833 |         [0 ... ESR_ELx_EC_MAX]          = "UNRECOGNIZED EC",
         |                                           ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:842:22: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     842 |         [ESR_ELx_EC_PAC]                = "PAC",
         |                                           ^~~~~
   arch/arm64/kernel/traps.c:833:28: note: previous initialization is here
     833 |         [0 ... ESR_ELx_EC_MAX]          = "UNRECOGNIZED EC",
         |                                           ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:843:26: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     843 |         [ESR_ELx_EC_CP14_64]            = "CP14 MCRR/MRRC",
         |                                           ^~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:833:28: note: previous initialization is here
     833 |         [0 ... ESR_ELx_EC_MAX]          = "UNRECOGNIZED EC",
         |                                           ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:844:22: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     844 |         [ESR_ELx_EC_BTI]                = "BTI",
         |                                           ^~~~~
   arch/arm64/kernel/traps.c:833:28: note: previous initialization is here
     833 |         [0 ... ESR_ELx_EC_MAX]          = "UNRECOGNIZED EC",
         |                                           ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:845:22: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     845 |         [ESR_ELx_EC_ILL]                = "PSTATE.IL",
         |                                           ^~~~~~~~~~~
   arch/arm64/kernel/traps.c:833:28: note: previous initialization is here
     833 |         [0 ... ESR_ELx_EC_MAX]          = "UNRECOGNIZED EC",
         |                                           ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:846:24: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     846 |         [ESR_ELx_EC_SVC32]              = "SVC (AArch32)",
         |                                           ^~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:833:28: note: previous initialization is here
     833 |         [0 ... ESR_ELx_EC_MAX]          = "UNRECOGNIZED EC",
         |                                           ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:847:24: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     847 |         [ESR_ELx_EC_HVC32]              = "HVC (AArch32)",
         |                                           ^~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:833:28: note: previous initialization is here
     833 |         [0 ... ESR_ELx_EC_MAX]          = "UNRECOGNIZED EC",
         |                                           ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:848:24: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     848 |         [ESR_ELx_EC_SMC32]              = "SMC (AArch32)",
         |                                           ^~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:833:28: note: previous initialization is here
     833 |         [0 ... ESR_ELx_EC_MAX]          = "UNRECOGNIZED EC",
         |                                           ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:849:24: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     849 |         [ESR_ELx_EC_SVC64]              = "SVC (AArch64)",
         |                                           ^~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:833:28: note: previous initialization is here
--
>> ld.lld: error: duplicate symbol: bpf_tracing_multi_attach
   >>> defined at trace_events.h:835 (./include/linux/trace_events.h:835)
   >>>            fs/xfs/xfs_trace.o:(bpf_tracing_multi_attach)
   >>> defined at trace_events.h:835 (./include/linux/trace_events.h:835)
   >>>            fs/xfs/scrub/trace.o:(.text+0xcbc8)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
