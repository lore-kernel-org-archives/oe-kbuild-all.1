Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE711865ED
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Oct 2024 19:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729107464; cv=none; b=HqcN8MFSVE+zI3w0XTjGfTN1kYihUJyPaLXc4tu7jIuwn7MmmlkdkGG1CshzG6gqudXV1ALCIMMBZNcl6XNby7wt4iGogG66qstMbznqdNPoBz1y7PUyd4PUVKBXRwkbsnH/kZ/OEZjHSbxuXSOL/zqhdwedKcHOzZqvI3A2k2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729107464; c=relaxed/simple;
	bh=mV2eeH6l862a2COoG7che1QQKIl6OeLME2pPntm/7j0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eW6rlv+huWekdiMoQFDU8MzeJENQwAdPCC8AxEE7b7FYnT+zeED+EdtEJc9zCTr9lT/ilrGaNGXUesfFmW104cOG6fi8hh3hAQEXxs9EhX9hIP/o2eU7yiTUjlwQI1JDIOptQaAhfVqI/fdNtjuWsj7SRQ2kBcmE2eZUEdkr2o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e2GOupSy; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e2GOupSy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729107462; x=1760643462;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mV2eeH6l862a2COoG7che1QQKIl6OeLME2pPntm/7j0=;
  b=e2GOupSy7+6DqxHRhmXP7aT1TQ45S0hnlJdISUZcEaoLW5Y6I+Hd5ZwG
   cms42pcjNjCxjswxZfeTpiFDTL3JGdjz8eRMhiLGi9ckPdzAuVcT20XZ7
   ElkSdRnqZjiQ/JZGVd1DyqNo6Aa3WGR2RSm9ahdFY4Fq6gTprqvTZ/ajc
   QVWCusi/o11cYrPhkrCTjMzGxsyP3mJvX1njYhmZTctkgzaJCKMya/QXF
   5yDGdKc3gjnABxd1NQXvhPtdn5/pyRYsVH256uixSsqc9u2Dy8NYMWHbS
   lOQzFBOeYg8JHW6BBbc3i4EEVbHU1WFPkWiJiD9ea3+c6G5SjSqNTLyBC
   w==;
X-CSE-ConnectionGUID: rz48TLgCRjWRQZAZjqe8KQ==
X-CSE-MsgGUID: 4phIbiJWSjC6IDZrUcAp6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11226"; a="28454097"
X-IronPort-AV: E=Sophos;i="6.11,209,1725346800"; 
   d="scan'208";a="28454097"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 12:37:41 -0700
X-CSE-ConnectionGUID: I3JvfvsISFiWrR3ekuWZUQ==
X-CSE-MsgGUID: YJPXZIQ1SpeIaSAqqKBgBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,209,1725346800"; 
   d="scan'208";a="82862993"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 16 Oct 2024 12:37:40 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t19py-000LKd-2C;
	Wed, 16 Oct 2024 19:37:38 +0000
Date: Thu, 17 Oct 2024 03:37:08 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/3]
 arch/arm64/kvm/hyp/nvhe/hyp-main.c:770:6: warning: unused variable 'zcr_el2'
Message-ID: <202410170317.6aHxroAa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   111f59eeb19a4ccdd7b6f5e2596b009520109e29
commit: 2b5e5cbdf01152384c781bb7edd7a778c1419b3a [1/3] ANDROID: KVM: arm64: Use active guest SVE vector length on save/restore
config: arm64-randconfig-002-20241016 (https://download.01.org/0day-ci/archive/20241017/202410170317.6aHxroAa-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project bfe84f7085d82d06d61c632a7bad1e692fd159e4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241017/202410170317.6aHxroAa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410170317.6aHxroAa-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp/nvhe/hyp-main.c:7:
   In file included from include/kvm/arm_hypercalls.h:7:
   In file included from arch/arm64/include/asm/kvm_emulate.h:14:
   In file included from include/linux/kvm_host.h:16:
   In file included from include/linux/mm.h:2180:
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
   In file included from arch/arm64/kvm/hyp/nvhe/hyp-main.c:23:
   In file included from arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:14:
   In file included from arch/arm64/kvm/hyp/include/nvhe/memory.h:9:
   arch/arm64/kvm/hyp/include/nvhe/refcount.h:35:15: error: expected string literal in 'asm'
      35 |         asm volatile(__LSE_PREAMBLE
         |                      ^
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:88:6: warning: no previous prototype for function '__pkvm_unmask_serror' [-Wmissing-prototypes]
      88 | void __pkvm_unmask_serror(void)
         |      ^
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:88:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      88 | void __pkvm_unmask_serror(void)
         | ^
         | static 
>> arch/arm64/kvm/hyp/nvhe/hyp-main.c:770:6: warning: unused variable 'zcr_el2' [-Wunused-variable]
     770 |         u64 zcr_el2 = min(zcr_el1, vcpu_sve_max_vq(vcpu) - 1ULL);
         |             ^~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:799:8: warning: unused variable 'vq_len' [-Wunused-variable]
     799 |                         u64 vq_len = sve_vq_from_vl(kvm_host_sve_max_vl) - 1;
         |                             ^~~~~~
   8 warnings and 1 error generated.
--
   In file included from arch/arm64/kvm/hyp/nvhe/switch.c:7:
   In file included from arch/arm64/kvm/hyp/include/hyp/switch.h:10:
   In file included from arch/arm64/kvm/hyp/include/hyp/adjust_pc.h:13:
   In file included from arch/arm64/include/asm/kvm_emulate.h:14:
   In file included from include/linux/kvm_host.h:16:
   In file included from include/linux/mm.h:2180:
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
   In file included from arch/arm64/kvm/hyp/nvhe/switch.c:7:
>> arch/arm64/kvm/hyp/include/hyp/switch.h:265:6: warning: unused variable 'zcr_el2' [-Wunused-variable]
     265 |         u64 zcr_el2 = min(zcr_el1, vcpu_sve_max_vq(vcpu) - 1ULL);
         |             ^~~~~~~
   In file included from arch/arm64/kvm/hyp/nvhe/switch.c:29:
   In file included from arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:14:
   In file included from arch/arm64/kvm/hyp/include/nvhe/memory.h:9:
   arch/arm64/kvm/hyp/include/nvhe/refcount.h:35:15: error: expected string literal in 'asm'
      35 |         asm volatile(__LSE_PREAMBLE
         |                      ^
   arch/arm64/kvm/hyp/nvhe/switch.c:216:7: warning: unused variable 'vq_len' [-Wunused-variable]
     216 |                 u64 vq_len = sve_vq_from_vl(kvm_host_sve_max_vl) - 1;
         |                     ^~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:414:5: warning: no previous prototype for function '__pkvm_register_hyp_panic_notifier' [-Wmissing-prototypes]
     414 | int __pkvm_register_hyp_panic_notifier(void (*cb)(struct user_pt_regs *regs))
         |     ^
   arch/arm64/kvm/hyp/nvhe/switch.c:414:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     414 | int __pkvm_register_hyp_panic_notifier(void (*cb)(struct user_pt_regs *regs))
         | ^
         | static 
   8 warnings and 1 error generated.
--
   In file included from arch/arm64/kvm/hyp/vhe/switch.c:7:
   In file included from arch/arm64/kvm/hyp/include/hyp/switch.h:10:
   In file included from arch/arm64/kvm/hyp/include/hyp/adjust_pc.h:13:
   In file included from arch/arm64/include/asm/kvm_emulate.h:14:
   In file included from include/linux/kvm_host.h:16:
   In file included from include/linux/mm.h:2180:
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
   In file included from arch/arm64/kvm/hyp/vhe/switch.c:7:
>> arch/arm64/kvm/hyp/include/hyp/switch.h:265:6: warning: unused variable 'zcr_el2' [-Wunused-variable]
     265 |         u64 zcr_el2 = min(zcr_el1, vcpu_sve_max_vq(vcpu) - 1ULL);
         |             ^~~~~~~
   6 warnings generated.


vim +/zcr_el2 +770 arch/arm64/kvm/hyp/nvhe/hyp-main.c

   765	
   766	static void __hyp_sve_save_guest(struct pkvm_hyp_vcpu *hyp_vcpu)
   767	{
   768		struct kvm_vcpu *vcpu = &hyp_vcpu->vcpu;
   769		u64 zcr_el1 = read_sysreg_el1(SYS_ZCR);
 > 770		u64 zcr_el2 = min(zcr_el1, vcpu_sve_max_vq(vcpu) - 1ULL);
   771	
   772		__vcpu_sys_reg(vcpu, ZCR_EL1) = zcr_el1;
   773		sve_cond_update_zcr_vq(zcr_el2, SYS_ZCR_EL2);
   774		__sve_save_state(vcpu_sve_pffr(vcpu), &vcpu->arch.ctxt.fp_regs.fpsr);
   775		sve_cond_update_zcr_vq(ZCR_ELx_LEN_MASK, SYS_ZCR_EL2);
   776	}
   777	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
