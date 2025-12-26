Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C82B1C5F27
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Dec 2025 05:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766727640; cv=none; b=ZSQpbHPBGQO1D+laihUmv4wmT5/NuMm19o8LznxgDEcLygGc/dEUvImj3X05hEFDrDJUYbg8ZPUrFAXLZG7Ygly4d/oPVmT8jrmk68+vJzw+N3kgWhDuciEPa+3mga/EAZRH7oHkjVtRbxDObiln6PlraF+lMmrzJpRTKtwGexM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766727640; c=relaxed/simple;
	bh=BZcCydSqcIvXgVm5ROvloFQD/QJQnHspoyfcRXOolg8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LMJHg4yPMU2RBV7lHEfOcTCgiFa7bua+sopas9npuyhyGvvtk+tbniohTL2Lmg/P8lduR9V5eXgEEhgQOpfR8QJpssJ+khdyyKUxoC3aE1h5Qvs/eis/Kui6aNPtBu+uEAYJSD3YBeWuYAikwTcMJ1fL5YunkyEf34wIY6o7RJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mjd24xqJ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mjd24xqJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766727638; x=1798263638;
  h=date:from:to:cc:subject:message-id;
  bh=BZcCydSqcIvXgVm5ROvloFQD/QJQnHspoyfcRXOolg8=;
  b=Mjd24xqJo1Qduy0zlpfWNN9NNhXvu5UOCCkMfwwAYgSPcTKestod3umz
   CbHYfBHxn+nWOn+Avx7hqMesDskh8gNTXPd+rKLzDjQYRyHV7X8BwbpIF
   T8+t1gH6tWt6iCzRGtF9drDwMo4tnoqKtoBD7mBEz/29pAkOfjs3TGZvO
   0BXaYVbPGpdnuOU4G6PKmyMMSccu2qSXMbHQbCJjZTh3RBsRicmiZT8Ae
   uAmqMT2ZYPWRxQtGrQpwEnlDIoz9mktjdqnK7+98mxow9ha3ggTB5ptvU
   oDCTcsmsc+WZ+DwhsPgOBWnYq/qDAYpV7C3SXxtzToJySmjkFt+FXZtq4
   w==;
X-CSE-ConnectionGUID: jd8/XS4lTdqIgVFMczSBOw==
X-CSE-MsgGUID: ziKJo7r6QBOqPoaUOSQXAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="56062727"
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="56062727"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2025 21:40:35 -0800
X-CSE-ConnectionGUID: QE2ncq8kRXierYjZ+0utUQ==
X-CSE-MsgGUID: O85GGb9UR3+w9DuOAS7uDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="237727732"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 25 Dec 2025 21:40:33 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZ0Yx-000000004jP-2GYK;
	Fri, 26 Dec 2025 05:40:31 +0000
Date: Fri, 26 Dec 2025 13:39:36 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 2/2]
 arch/arm64/include/asm/kvm_hypevents.h:133:1: warning: no previous prototype
 for function 'hyp_event_trace_iommu_idmap'
Message-ID: <202512261319.bsvppgIJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Mostafa,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   30a5c216991a5dd3eed018653101c71e1e657af8
commit: abd6c25f0d5feba7e4ad7717cf38275c2fcfac76 [2/2] ANDROID: KVM: arm64: iommu: Add idmap trace point
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251226/202512261319.bsvppgIJ-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251226/202512261319.bsvppgIJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512261319.bsvppgIJ-lkp@intel.com/

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
