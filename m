Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5084416EB7C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Aug 2024 22:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722896726; cv=none; b=LQa3mbCZGvWrV5HkD3u/rESGEH3b/w89xREx5Qq4tV2h9GIztgFc9bsQ4MyfmO9jvdVoE16+9aXNVI2lpAfL1M7gjP47Z+3JTA4KAFHb82azNa1uX/cMtco8mMqyPlf5vvRtfEYHyP9ewanhkTeUI/jhY8ah7aAEMQCoI6BEymk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722896726; c=relaxed/simple;
	bh=FJQ5LeKwTu8cQzLvPvYoBkHGtOiYMv3Qf5Ws00+T3ZM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lSj0PZbySy7jC+kWJGjSidln6Xb6WKrfFHBh34KgXO6+uP4wePv+OEx5JgZcm2hrLo2IHGSWrNJd5Y/ZDnzFLhELzFrrSUilX0/3HOjixzL7u1IZ966a7siWwrnbo6z5fSjNKL1L1VokETZSVfevBNrw1xYXBKqfB1AE3jrWGLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jpxyL942; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jpxyL942"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722896725; x=1754432725;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FJQ5LeKwTu8cQzLvPvYoBkHGtOiYMv3Qf5Ws00+T3ZM=;
  b=jpxyL942biif5/VTrbS5SP8HjCekFcy9nOP3qp5yNOGwuwQ/DZBz6jb/
   KlUtafdEhmUNjD4dHHbBGOYOHHn964S9oUvXJ1UxYssg9a7nBvXcC1Cwj
   /YqTpTjPIVA3mLPm1DMQ0zJe/N+Z3ptarI23MBM8BWBA6DQWd0bqW5y36
   Ck39qwfZNofxSUrNZBNTB+QuAQcgX96Yo41eZRSkpESfIomYGbTJpMYan
   nniPLq6PCZQ+YFG0DbEuLKVi9O2x9iiww3b9xqFnDBOqSbE8Y5rtefSm0
   wshjk0IZY8lRzDPA3WEGVHZDt1cvrd6alq+hwTazk4FWBMUo3ScuHfw1w
   Q==;
X-CSE-ConnectionGUID: 3EdVaVudQBq/VItvUbH3fQ==
X-CSE-MsgGUID: anPpfJgGQbmryfimjS00tQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="38340993"
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; 
   d="scan'208";a="38340993"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2024 15:25:24 -0700
X-CSE-ConnectionGUID: 6jcwg1jTTZeT8Inmypujow==
X-CSE-MsgGUID: Vd4gs+SpQiyAy2WJBvuKRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; 
   d="scan'208";a="56518881"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 05 Aug 2024 15:25:22 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sb68l-0003pL-2e;
	Mon, 05 Aug 2024 22:25:19 +0000
Date: Tue, 6 Aug 2024 06:25:18 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, hejingxian <hejingxian@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 12414/13217] arch/arm64/kvm/arm.c:138:7: warning:
 variable 'r' is used uninitialized whenever 'if' condition is false
Message-ID: <202408060639.d1BhjbnX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   d59a335bf0dd2aac9debe211a0a07fbeaf605fed
commit: 67e11ee6347c43a97e8987b03a5b3534cd8095d9 [12414/13217] kvm: add virtcca cvm host feature
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240806/202408060639.d1BhjbnX-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 423aec6573df4424f90555468128e17073ddc69e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240806/202408060639.d1BhjbnX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408060639.d1BhjbnX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/arm.c:9:
   In file included from include/linux/entry-kvm.h:6:
   In file included from include/linux/resume_user_mode.h:8:
   In file included from include/linux/memcontrol.h:20:
   In file included from include/linux/mm.h:2242:
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
>> arch/arm64/kvm/arm.c:138:7: warning: variable 'r' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     138 |                 if (static_branch_unlikely(&virtcca_cvm_is_available))
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/jump_label.h:504:40: note: expanded from macro 'static_branch_unlikely'
     504 | #define static_branch_unlikely(x)                                               \
         |                                                                                 ^
     505 | ({                                                                              \
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     506 |         bool branch;                                                            \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     507 |         if (__builtin_types_compatible_p(typeof(*x), struct static_key_true))   \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     508 |                 branch = arch_static_branch_jump(&(x)->key, false);             \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     509 |         else if (__builtin_types_compatible_p(typeof(*x), struct static_key_false)) \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     510 |                 branch = arch_static_branch(&(x)->key, false);                  \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     511 |         else                                                                    \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     512 |                 branch = ____wrong_branch_error();                              \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     513 |         unlikely_notrace(branch);                                                       \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     514 | })
         | ~~
   arch/arm64/kvm/arm.c:147:9: note: uninitialized use occurs here
     147 |         return r;
         |                ^
   arch/arm64/kvm/arm.c:138:3: note: remove the 'if' if its condition is always true
     138 |                 if (static_branch_unlikely(&virtcca_cvm_is_available))
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     139 |                         r = kvm_cvm_enable_cap(kvm, cap);
   arch/arm64/kvm/arm.c:92:7: note: initialize the variable 'r' to silence this warning
      92 |         int r;
         |              ^
         |               = 0
   6 warnings generated.
--
   In file included from arch/arm64/kvm/tmi.c:6:
   In file included from arch/arm64/include/asm/kvm_tmi.h:8:
   In file included from include/linux/kvm_host.h:16:
   In file included from include/linux/mm.h:2242:
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
>> arch/arm64/kvm/tmi.c:131:5: warning: no previous prototype for function 'tmi_tmm_inf_test' [-Wmissing-prototypes]
     131 | u64 tmi_tmm_inf_test(u64 x1, u64 x2, u64 x3, u64 x4, u64 x5)
         |     ^
   arch/arm64/kvm/tmi.c:131:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     131 | u64 tmi_tmm_inf_test(u64 x1, u64 x2, u64 x3, u64 x4, u64 x5)
         | ^
         | static 
   6 warnings generated.
--
   In file included from arch/arm64/kvm/virtcca_cvm.c:5:
   In file included from include/linux/kvm_host.h:16:
   In file included from include/linux/mm.h:2242:
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
>> arch/arm64/kvm/virtcca_cvm.c:70:6: warning: no previous prototype for function 'kvm_cvm_supports_sve' [-Wmissing-prototypes]
      70 | bool kvm_cvm_supports_sve(void)
         |      ^
   arch/arm64/kvm/virtcca_cvm.c:70:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      70 | bool kvm_cvm_supports_sve(void)
         | ^
         | static 
>> arch/arm64/kvm/virtcca_cvm.c:75:6: warning: no previous prototype for function 'kvm_cvm_supports_pmu' [-Wmissing-prototypes]
      75 | bool kvm_cvm_supports_pmu(void)
         |      ^
   arch/arm64/kvm/virtcca_cvm.c:75:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      75 | bool kvm_cvm_supports_pmu(void)
         | ^
         | static 
>> arch/arm64/kvm/virtcca_cvm.c:80:5: warning: no previous prototype for function 'kvm_cvm_ipa_limit' [-Wmissing-prototypes]
      80 | u32 kvm_cvm_ipa_limit(void)
         |     ^
   arch/arm64/kvm/virtcca_cvm.c:80:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      80 | u32 kvm_cvm_ipa_limit(void)
         | ^
         | static 
>> arch/arm64/kvm/virtcca_cvm.c:85:5: warning: no previous prototype for function 'kvm_cvm_get_num_brps' [-Wmissing-prototypes]
      85 | u32 kvm_cvm_get_num_brps(void)
         |     ^
   arch/arm64/kvm/virtcca_cvm.c:85:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      85 | u32 kvm_cvm_get_num_brps(void)
         | ^
         | static 
>> arch/arm64/kvm/virtcca_cvm.c:90:5: warning: no previous prototype for function 'kvm_cvm_get_num_wrps' [-Wmissing-prototypes]
      90 | u32 kvm_cvm_get_num_wrps(void)
         |     ^
   arch/arm64/kvm/virtcca_cvm.c:90:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      90 | u32 kvm_cvm_get_num_wrps(void)
         | ^
         | static 
>> arch/arm64/kvm/virtcca_cvm.c:244:5: warning: no previous prototype for function 'kvm_cvm_create_ttt_levels' [-Wmissing-prototypes]
     244 | int kvm_cvm_create_ttt_levels(struct kvm *kvm, struct virtcca_cvm *cvm,
         |     ^
   arch/arm64/kvm/virtcca_cvm.c:244:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     244 | int kvm_cvm_create_ttt_levels(struct kvm *kvm, struct virtcca_cvm *cvm,
         | ^
         | static 
>> arch/arm64/kvm/virtcca_cvm.c:311:5: warning: no previous prototype for function 'kvm_cvm_populate_par_region' [-Wmissing-prototypes]
     311 | int kvm_cvm_populate_par_region(struct kvm *kvm, u64 numa_set,
         |     ^
   arch/arm64/kvm/virtcca_cvm.c:311:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     311 | int kvm_cvm_populate_par_region(struct kvm *kvm, u64 numa_set,
         | ^
         | static 
   12 warnings generated.


vim +138 arch/arm64/kvm/arm.c

    88	
    89	int kvm_vm_ioctl_enable_cap(struct kvm *kvm,
    90				    struct kvm_enable_cap *cap)
    91	{
    92		int r;
    93		u64 new_cap;
    94	
    95		if (cap->flags)
    96			return -EINVAL;
    97	
    98		switch (cap->cap) {
    99		case KVM_CAP_ARM_NISV_TO_USER:
   100			r = 0;
   101			set_bit(KVM_ARCH_FLAG_RETURN_NISV_IO_ABORT_TO_USER,
   102				&kvm->arch.flags);
   103			break;
   104		case KVM_CAP_ARM_MTE:
   105			mutex_lock(&kvm->lock);
   106			if (!system_supports_mte() || kvm->created_vcpus) {
   107				r = -EINVAL;
   108			} else {
   109				r = 0;
   110				set_bit(KVM_ARCH_FLAG_MTE_ENABLED, &kvm->arch.flags);
   111			}
   112			mutex_unlock(&kvm->lock);
   113			break;
   114		case KVM_CAP_ARM_SYSTEM_SUSPEND:
   115			r = 0;
   116			set_bit(KVM_ARCH_FLAG_SYSTEM_SUSPEND_ENABLED, &kvm->arch.flags);
   117			break;
   118		case KVM_CAP_ARM_EAGER_SPLIT_CHUNK_SIZE:
   119			new_cap = cap->args[0];
   120	
   121			mutex_lock(&kvm->slots_lock);
   122			/*
   123			 * To keep things simple, allow changing the chunk
   124			 * size only when no memory slots have been created.
   125			 */
   126			if (!kvm_are_all_memslots_empty(kvm)) {
   127				r = -EINVAL;
   128			} else if (new_cap && !kvm_is_block_size_supported(new_cap)) {
   129				r = -EINVAL;
   130			} else {
   131				r = 0;
   132				kvm->arch.mmu.split_page_chunk_size = new_cap;
   133			}
   134			mutex_unlock(&kvm->slots_lock);
   135			break;
   136	#ifdef CONFIG_HISI_VIRTCCA_HOST
   137		case KVM_CAP_ARM_TMM:
 > 138			if (static_branch_unlikely(&virtcca_cvm_is_available))
   139				r = kvm_cvm_enable_cap(kvm, cap);
   140			break;
   141	#endif
   142		default:
   143			r = -EINVAL;
   144			break;
   145		}
   146	
   147		return r;
   148	}
   149	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
