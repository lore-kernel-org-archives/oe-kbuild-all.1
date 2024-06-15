Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDC710F7
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Jun 2024 01:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718415215; cv=none; b=My55AVZkEWwIcMWUJ+y3l+SxUQsIjmd9k4S+TnTDrhUKI0DEV7BMzB49+SylrErZ2wPEmJlY/J5/lWlGeC0rBb5ZNcqGce3l1T8nMldzO6d+EtrPa9no/SDwpTjxJE8wRPpJ97d7aMTIwdCM/FdZrUsdY7s+ChDHflZi5tenvlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718415215; c=relaxed/simple;
	bh=FrltJEgGMyP2nGeM2sIi3gH5ig6wu4gRNmfCQsEzI1w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hSOTct9TR1qUviW60nAIbej4BIjQxOQ8XjI3DOxV+R0A/STBEsipR4etuDr+S27qa0c+2/9YOVmlBIWCYVpVP3Auitc4ZGaiPynQG+KsuDsv5UltqxXc9D0F+K2lMuRp6BtaYR6RjkLVC0s3ghh/0bteUhdV5ZlCyP3V+kVMZNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VukRrtJY; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VukRrtJY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718415214; x=1749951214;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FrltJEgGMyP2nGeM2sIi3gH5ig6wu4gRNmfCQsEzI1w=;
  b=VukRrtJYxSV1jzVsWFM33lB+xYn9fka83L80P//NjRf8u49/Hj1Zrv/i
   5El+rpA45hByvZ2BDBey7+Rzxq1boBp91JocDon0gl5K8IeIZslYOaw1j
   XiijTjJ2xoLNk3UGKOhV0P/EoG5imxmzOIxOFwr9BnCR51eX2I7rk8NGp
   ZWjZt2Op5Lxw7UfxmL9Qm0c38wdHGlFCTt6dv2WNFzhEpxttFBtQ2axVy
   PNHX8Y9YwAkS71C/1Ybioo6nZJVudicE9vrzAp/uAB3A/skEpbimUfdUI
   Z07cQt/9pVdA06puP44azaehFwTjdo1LKjQ+NqW5rsRdDuyTvLu2AZjnF
   g==;
X-CSE-ConnectionGUID: OPhCxRIEQ9yZJr8BcpiUmg==
X-CSE-MsgGUID: PcGav4b8Q06xjouzwyIKyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="15483390"
X-IronPort-AV: E=Sophos;i="6.08,239,1712646000"; 
   d="scan'208";a="15483390"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 18:33:33 -0700
X-CSE-ConnectionGUID: sNwbo6DeTl+9DoE2fOIgWQ==
X-CSE-MsgGUID: L5DWgHq8QnOTaSw8V0LN1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,239,1712646000"; 
   d="scan'208";a="63881157"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 14 Jun 2024 18:33:32 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIIIL-0001z9-2u;
	Sat, 15 Jun 2024 01:33:29 +0000
Date: Sat, 15 Jun 2024 09:32:50 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 5/6]
 arch/arm64/include/asm/kvm_hypevents.h:133:1: warning: no previous prototype
 for function 'hyp_event_trace_iommu_idmap'
Message-ID: <202406150941.QDMhAFB9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   2dd2a189c633601de50fb3d81c7ee8ac55c15133
commit: abd6c25f0d5feba7e4ad7717cf38275c2fcfac76 [5/6] ANDROID: KVM: arm64: iommu: Add idmap trace point
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240615/202406150941.QDMhAFB9-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 78ee473784e5ef6f0b19ce4cb111fb6e4d23c6b2)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240615/202406150941.QDMhAFB9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406150941.QDMhAFB9-lkp@intel.com/

All warnings (new ones prefixed by >>):

         |              ^
   <scratch space>:90:1: note: expanded from here
      90 | hyp_event_trace_hyp_exit
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
   <scratch space>:95:1: note: expanded from here
      95 | hyp_event_trace_host_hcall
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
   <scratch space>:100:1: note: expanded from here
     100 | hyp_event_trace_host_smc
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
   <scratch space>:105:1: note: expanded from here
     105 | hyp_event_trace_host_mem_abort
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
   <scratch space>:110:1: note: expanded from here
     110 | hyp_event_trace___hyp_printk
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
   <scratch space>:115:1: note: expanded from here
     115 | hyp_event_trace_host_ffa_call
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
   <scratch space>:120:1: note: expanded from here
     120 | hyp_event_trace_psci_mem_protect
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
   <scratch space>:125:1: note: expanded from here
     125 | hyp_event_trace_iommu_idmap
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
