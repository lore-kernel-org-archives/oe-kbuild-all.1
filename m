Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9BC37646B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 03:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775534378; cv=none; b=kCqhwa03B9V4vpYtuawdhLmm65gvKdTRgHbXgAg+SBia0mge5ic2MnKdvQaoCY/L0Rk1YYpK6TLjWxlo+WqLszfhcnDLXq6u6c4vxuELKu/wMa6+8e6IMlKxy8L5+u/ycnu+XI1shWT4gX2AdZAwgmhHmaJswFc5fUbfYtXr05s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775534378; c=relaxed/simple;
	bh=SC6DDLLgRjaUNtQN51SGKp6mhALL5is5J5x1AYgfJhQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=r1IFWUo4GVivTj2SGogZAuLceUmh2FhDEBTnY9jXDIWXpxpnsySHOenofxtj2ftC+PxULRfIwV8xF6lReARIwEBAv/qtZaa4d/+sSSVaOSiiQ2p625RWPuCrMA+Iugk96DlN6w9VOj5IJvSZYXmof2GR+Waudh92ScFb1K3g1uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mzwemvuz; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mzwemvuz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775534377; x=1807070377;
  h=date:from:to:cc:subject:message-id;
  bh=SC6DDLLgRjaUNtQN51SGKp6mhALL5is5J5x1AYgfJhQ=;
  b=Mzwemvuzbumo5/K3ZnbMrl+HOFfBqPnFHy+TbiYFCgVurE1V8mzkj/vh
   YGddlUOS3VIB5XiJ9+kncGZpVNl1TBZWj6F23fuZhg9d0D0Ne6DMZpE/N
   pA66aJXuYfrMds5qwnKTkHXyzPMLyH3RaQlUJN63piX7gMf321hPOsqsh
   qccDzSwvKNlQ0CDa7ojw62G/4Xfxg03yz5uPoXe9Xd60IIZcZTd1zWxmw
   7g6MxywaPXMPfG/Olm5ajOGLbwRT49czVmsldxAA33/ekjZOE2sq0wK6n
   w/H6pz8tau6gHUp8yuNSrbdGQzx0ePEzynnF7rua/G4R1bszU9RLKftbO
   Q==;
X-CSE-ConnectionGUID: iH+SZ/8BTMufeMoNxqb6lg==
X-CSE-MsgGUID: gpi2hIViRL+wHA2q56A0Gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76369610"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="76369610"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 20:59:37 -0700
X-CSE-ConnectionGUID: wRGoRpC0RLmMJpMXkCLO3Q==
X-CSE-MsgGUID: Wc+4PaPOS1GZafYafS7PKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="232091428"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 06 Apr 2026 20:59:35 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xbB-0000000006j-1FBn;
	Tue, 07 Apr 2026 03:59:33 +0000
Date: Tue, 07 Apr 2026 11:59:08 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 2/2]
 arch/arm64/include/asm/../../../../drivers/misc/pkvm-smc/pkvm/events.h:9:1:
 warning: no previous prototype for function 'hyp_event_trace_filtered_smc'
Message-ID: <202604051758.14CUPhfa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Mostafa,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   efe16a3021b9f95eb1cb83e98d0d1db9bff94ce4
commit: eea6841a3b9606ed64907c77030b1d50ebdd56fe [2/2] ANDROID: misc: pkvm_smc: Trace denied SMCs.
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260405/202604051758.14CUPhfa-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260405/202604051758.14CUPhfa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604051758.14CUPhfa-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/misc/pkvm-smc/pkvm-smc.c:10:
   In file included from arch/arm64/include/asm/kvm_pkvm_module.h:6:
   In file included from arch/arm64/include/asm/kvm_pgtable.h:11:
   In file included from include/linux/kvm_host.h:16:
   In file included from include/linux/mm.h:2191:
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
   In file included from drivers/misc/pkvm-smc/pkvm-smc.c:13:
   In file included from arch/arm64/include/asm/kvm_define_hypevents.h:27:
>> arch/arm64/include/asm/../../../../drivers/misc/pkvm-smc/pkvm/events.h:9:1: warning: no previous prototype for function 'hyp_event_trace_filtered_smc' [-Wmissing-prototypes]
       9 | HYP_EVENT(filtered_smc,
         | ^
   arch/arm64/include/asm/kvm_define_hypevents.h:17:7: note: expanded from macro 'HYP_EVENT'
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |              ^
   <scratch space>:126:1: note: expanded from here
     126 | hyp_event_trace_filtered_smc
         | ^
   arch/arm64/include/asm/../../../../drivers/misc/pkvm-smc/pkvm/events.h:9:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   arch/arm64/include/asm/kvm_define_hypevents.h:17:2: note: expanded from macro 'HYP_EVENT'
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |         ^
   6 warnings generated.


vim +/hyp_event_trace_filtered_smc +9 arch/arm64/include/asm/../../../../drivers/misc/pkvm-smc/pkvm/events.h

     8	
   > 9	HYP_EVENT(filtered_smc,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
