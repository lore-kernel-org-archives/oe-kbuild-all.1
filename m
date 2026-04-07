Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0561C30F927
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 04:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775534440; cv=none; b=AjM+z2Qg6D0z3CZCeAoOR7e3Lkm6BEIVc+v7E1bIPBAvz3q98hN9XwdnyGMEsOs8x9wvhEQNBUE2MCAaV01zeFR8AWAZpPmulx7abhNpQyjKYAg/2mlVJu7ucX/H1KIPN+fv6KFYSuywG7y6sFiuwcf67mstAXTrupMAZRpuL0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775534440; c=relaxed/simple;
	bh=o6C2iFa+SE56G+gFmflYUmEe5m/T8dG3xuKEGJY7Xx0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Tjy74yUXiOFRxmDjQj+22SwXN6jp0S0xClArnO6MslGuV+isj5iKiOOFJWq70TbfWhruhCG/aUk+pVlnBG+iBL30gK6pvARLN/mJwr4/bMavWngB+jVLVAAt2gNn6YXAh8xWWuaBqBM/wgxrxU/x8L15f1NmcwolVQNG2/ZpelE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g153BhXS; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g153BhXS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775534439; x=1807070439;
  h=date:from:to:cc:subject:message-id;
  bh=o6C2iFa+SE56G+gFmflYUmEe5m/T8dG3xuKEGJY7Xx0=;
  b=g153BhXSl5PVEkckl4UKovyqW+kFMxJPtyuH3QmC9L/gpUiwrylwEZhh
   lPannPF7OdUuxW7z1LO/o2Wi8aTwJDWkFNEn/+MUHEsObde9x8JY7re32
   a6cdTR4QCW7LeOCTmwOwI2n7k8SuIWTMD+Ex35aYL8EoTLXp27TUK6miV
   5oxNbVuJeqEhKEmK6zDzq1+bhbtUs03j9Y8WUUiIWxScp4hzLxacV36qN
   ankLdUn8TYot0QXRlUfM+RlI7LeNVgVF8YYJEBTP29HotKOKjDVgqHvMk
   CW0/625VIR5gpvPF45ox4JM4Z47Wv0khLEk1FMij8e7D9j4jm4wWDgnzh
   A==;
X-CSE-ConnectionGUID: bXg4XXUVRVmtWzWx26mNjA==
X-CSE-MsgGUID: ThjByCN/Rl++h/PUjMseGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="86782251"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="86782251"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 21:00:37 -0700
X-CSE-ConnectionGUID: 7jXQ5ZkYRPuFWL7+Wt7SzA==
X-CSE-MsgGUID: lSIxvpakQd6cdjgUKG+eFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="225304369"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 06 Apr 2026 21:00:36 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xc9-0000000007L-26SB;
	Tue, 07 Apr 2026 04:00:33 +0000
Date: Tue, 07 Apr 2026 12:00:29 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 2/2]
 arch/arm64/include/asm/kvm_hypevents.h:133:1: warning: no previous prototype
 for function 'hyp_event_trace_iommu_idmap'
Message-ID: <202604051952.6JqRAl2c-lkp@intel.com>
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
commit: abd6c25f0d5feba7e4ad7717cf38275c2fcfac76 [2/2] ANDROID: KVM: arm64: iommu: Add idmap trace point
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260405/202604051952.6JqRAl2c-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260405/202604051952.6JqRAl2c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604051952.6JqRAl2c-lkp@intel.com/

All warnings (new ones prefixed by >>):

         |              ^
   <scratch space>:79:1: note: expanded from here
      79 | hyp_event_trace_hyp_exit
         | ^
   arch/arm64/include/asm/kvm_hypevents.h:23:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   arch/arm64/include/asm/kvm_define_hypevents.h:17:2: note: expanded from macro 'HYP_EVENT'
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |         ^
   In file included from arch/arm64/kvm/hyp_events.c:14:
   In file included from arch/arm64/include/asm/kvm_define_hypevents.h:27:
   arch/arm64/include/asm/kvm_hypevents.h:32:1: warning: no previous prototype for function 'hyp_event_trace_host_hcall' [-Wmissing-prototypes]
      32 | HYP_EVENT(host_hcall,
         | ^
   arch/arm64/include/asm/kvm_define_hypevents.h:17:7: note: expanded from macro 'HYP_EVENT'
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |              ^
   <scratch space>:84:1: note: expanded from here
      84 | hyp_event_trace_host_hcall
         | ^
   arch/arm64/include/asm/kvm_hypevents.h:32:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   arch/arm64/include/asm/kvm_define_hypevents.h:17:2: note: expanded from macro 'HYP_EVENT'
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |         ^
   In file included from arch/arm64/kvm/hyp_events.c:14:
   In file included from arch/arm64/include/asm/kvm_define_hypevents.h:27:
   arch/arm64/include/asm/kvm_hypevents.h:46:1: warning: no previous prototype for function 'hyp_event_trace_host_smc' [-Wmissing-prototypes]
      46 | HYP_EVENT(host_smc,
         | ^
   arch/arm64/include/asm/kvm_define_hypevents.h:17:7: note: expanded from macro 'HYP_EVENT'
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |              ^
   <scratch space>:89:1: note: expanded from here
      89 | hyp_event_trace_host_smc
         | ^
   arch/arm64/include/asm/kvm_hypevents.h:46:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   arch/arm64/include/asm/kvm_define_hypevents.h:17:2: note: expanded from macro 'HYP_EVENT'
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |         ^
   In file included from arch/arm64/kvm/hyp_events.c:14:
   In file included from arch/arm64/include/asm/kvm_define_hypevents.h:27:
   arch/arm64/include/asm/kvm_hypevents.h:61:1: warning: no previous prototype for function 'hyp_event_trace_host_mem_abort' [-Wmissing-prototypes]
      61 | HYP_EVENT(host_mem_abort,
         | ^
   arch/arm64/include/asm/kvm_define_hypevents.h:17:7: note: expanded from macro 'HYP_EVENT'
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |              ^
   <scratch space>:94:1: note: expanded from here
      94 | hyp_event_trace_host_mem_abort
         | ^
   arch/arm64/include/asm/kvm_hypevents.h:61:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   arch/arm64/include/asm/kvm_define_hypevents.h:17:2: note: expanded from macro 'HYP_EVENT'
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |         ^
   In file included from arch/arm64/kvm/hyp_events.c:14:
   In file included from arch/arm64/include/asm/kvm_define_hypevents.h:27:
   arch/arm64/include/asm/kvm_hypevents.h:75:1: warning: no previous prototype for function 'hyp_event_trace___hyp_printk' [-Wmissing-prototypes]
      75 | HYP_EVENT(__hyp_printk,
         | ^
   arch/arm64/include/asm/kvm_define_hypevents.h:17:7: note: expanded from macro 'HYP_EVENT'
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |              ^
   <scratch space>:99:1: note: expanded from here
      99 | hyp_event_trace___hyp_printk
         | ^
   arch/arm64/include/asm/kvm_hypevents.h:75:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   arch/arm64/include/asm/kvm_define_hypevents.h:17:2: note: expanded from macro 'HYP_EVENT'
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |         ^
   In file included from arch/arm64/kvm/hyp_events.c:14:
   In file included from arch/arm64/include/asm/kvm_define_hypevents.h:27:
   arch/arm64/include/asm/kvm_hypevents.h:95:1: warning: no previous prototype for function 'hyp_event_trace_host_ffa_call' [-Wmissing-prototypes]
      95 | HYP_EVENT(host_ffa_call,
         | ^
   arch/arm64/include/asm/kvm_define_hypevents.h:17:7: note: expanded from macro 'HYP_EVENT'
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |              ^
   <scratch space>:104:1: note: expanded from here
     104 | hyp_event_trace_host_ffa_call
         | ^
   arch/arm64/include/asm/kvm_hypevents.h:95:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   arch/arm64/include/asm/kvm_define_hypevents.h:17:2: note: expanded from macro 'HYP_EVENT'
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |         ^
   In file included from arch/arm64/kvm/hyp_events.c:14:
   In file included from arch/arm64/include/asm/kvm_define_hypevents.h:27:
   arch/arm64/include/asm/kvm_hypevents.h:120:1: warning: no previous prototype for function 'hyp_event_trace_psci_mem_protect' [-Wmissing-prototypes]
     120 | HYP_EVENT(psci_mem_protect,
         | ^
   arch/arm64/include/asm/kvm_define_hypevents.h:17:7: note: expanded from macro 'HYP_EVENT'
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |              ^
   <scratch space>:109:1: note: expanded from here
     109 | hyp_event_trace_psci_mem_protect
         | ^
   arch/arm64/include/asm/kvm_hypevents.h:120:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   arch/arm64/include/asm/kvm_define_hypevents.h:17:2: note: expanded from macro 'HYP_EVENT'
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |         ^
   In file included from arch/arm64/kvm/hyp_events.c:14:
   In file included from arch/arm64/include/asm/kvm_define_hypevents.h:27:
>> arch/arm64/include/asm/kvm_hypevents.h:133:1: warning: no previous prototype for function 'hyp_event_trace_iommu_idmap' [-Wmissing-prototypes]
     133 | HYP_EVENT(iommu_idmap,
         | ^
   arch/arm64/include/asm/kvm_define_hypevents.h:17:7: note: expanded from macro 'HYP_EVENT'
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |              ^
   <scratch space>:114:1: note: expanded from here
     114 | hyp_event_trace_iommu_idmap
         | ^
   arch/arm64/include/asm/kvm_hypevents.h:133:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   arch/arm64/include/asm/kvm_define_hypevents.h:17:2: note: expanded from macro 'HYP_EVENT'
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |         ^
   arch/arm64/kvm/hyp_events.c:217:6: warning: no previous prototype for function 'hyp_trace_init_event_early' [-Wmissing-prototypes]
     217 | bool hyp_trace_init_event_early(void)
         |      ^
   arch/arm64/kvm/hyp_events.c:217:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     217 | bool hyp_trace_init_event_early(void)
         | ^
         | static 
   arch/arm64/kvm/hyp_events.c:267:19: warning: no previous prototype for function 'hyp_trace_find_event' [-Wmissing-prototypes]
     267 | struct hyp_event *hyp_trace_find_event(int id)
         |                   ^
   arch/arm64/kvm/hyp_events.c:267:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     267 | struct hyp_event *hyp_trace_find_event(int id)
         | ^
         | static 
   arch/arm64/kvm/hyp_events.c:341:6: warning: no previous prototype for function 'hyp_trace_init_event_tracefs' [-Wmissing-prototypes]
     341 | void hyp_trace_init_event_tracefs(struct dentry *parent)
         |      ^
   arch/arm64/kvm/hyp_events.c:341:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     341 | void hyp_trace_init_event_tracefs(struct dentry *parent)
         | ^
         | static 
   arch/arm64/kvm/hyp_events.c:363:5: warning: no previous prototype for function 'hyp_trace_init_events' [-Wmissing-prototypes]
     363 | int hyp_trace_init_events(void)
         |     ^
   arch/arm64/kvm/hyp_events.c:363:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     363 | int hyp_trace_init_events(void)
         | ^
         | static 
   arch/arm64/kvm/hyp_events.c:378:5: warning: no previous prototype for function 'hyp_trace_init_mod_events' [-Wmissing-prototypes]
     378 | int hyp_trace_init_mod_events(struct hyp_event *event,
         |     ^
   arch/arm64/kvm/hyp_events.c:378:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     378 | int hyp_trace_init_mod_events(struct hyp_event *event,
         | ^
         | static 
   19 warnings generated.


vim +/hyp_event_trace_iommu_idmap +133 arch/arm64/include/asm/kvm_hypevents.h

   132	
 > 133	HYP_EVENT(iommu_idmap,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
