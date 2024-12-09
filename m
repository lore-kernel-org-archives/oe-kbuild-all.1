Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F7615E5BB
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 04:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733719666; cv=none; b=cK8YNnQydlHg6ehAI2P1s02UeLITQy0kv6kvm6LmQoMZ7BA/LM3BVYcMqTSJG23/1kn93qSEHQOFb9Q7Hbe+kCqETFV5XY4iiZqXb3ynR50hnF0MLFNvhYj5psogWrndB+JDjYODc3nFizuDcbYmeZqiuTL67Fl00QGHqIUghGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733719666; c=relaxed/simple;
	bh=ui55O3msYADFIzUT6zTIgxhOYmb94gvKSS6soHlx3q0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ud1ODmUN6ZrzWbbE0XCnKEZgzmzucUpqiZDbHTb9qgII7hObNlmk8W95o/APPm6MLThTFuLKEv3eNC+c3K4ebS9YEqaAflw7hyMC3O8Ocd6xte4QW9CodMtxSopgSQJqcxD5mvOSsByrveBMg9ha0wTT3k2QENX4+QixCsve83o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bKciFzH7; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bKciFzH7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733719665; x=1765255665;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ui55O3msYADFIzUT6zTIgxhOYmb94gvKSS6soHlx3q0=;
  b=bKciFzH7yGDywL1fqhUu4Fcmb2RVLShdiFXIJ/Bj4bHadjMkS5aiC+VK
   k6JTGuZqThNlNeOt5/uAUJtoldtg1ZYn6sqlJ2/8cbTBnn7BlkEKN6wB8
   1KtoYFjjcx0bgLlPy+63+NqdZA1n/WQ0wrlghWa6CPkcLsKOoTwYMvzaE
   DhbLk4oJbwb0EL++ley1UufFToflUBtCf+jXjn4GW50E/dHohHM4SxPeu
   8pgGu3DoRnl0y98yRjGMo3V56jKc/PfeQq7yLMvPvSbZ2+uVRWrqQ+zwJ
   VFUrYs0Ia0+ft51q6IyqGD+IrLyGXlzMQBqVpT1y7DRNYRGibwOk+aUZS
   w==;
X-CSE-ConnectionGUID: M01hca4CS8CcOlI7/7026Q==
X-CSE-MsgGUID: hztDxFfKTvyGfgTwtMD35Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="34060168"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="34060168"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:47:41 -0800
X-CSE-ConnectionGUID: PMWSuzA4TqWYMwXX9HVACw==
X-CSE-MsgGUID: Js4t0n5ESMSlO+YZqEX9Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="99012424"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 08 Dec 2024 20:47:39 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKVgG-0003v1-39;
	Mon, 09 Dec 2024 04:47:36 +0000
Date: Mon, 9 Dec 2024 12:47:29 +0800
From: kernel test robot <lkp@intel.com>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>
Subject: arch/arm64/kvm/arm.c:204:16: sparse: sparse: incompatible types in
 comparison expression (different address spaces):
Message-ID: <202412081814.ZLkp3NHX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7503345ac5f5e82fd9a36d6e6b447c016376403a
commit: ce5d2448eb8fe83aed331db53a08612286a137dd KVM: arm64: Destroy mpidr_data for 'late' vCPU creation
date:   7 months ago
config: arm64-randconfig-r133-20241208 (https://download.01.org/0day-ci/archive/20241208/202412081814.ZLkp3NHX-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce: (https://download.01.org/0day-ci/archive/20241208/202412081814.ZLkp3NHX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412081814.ZLkp3NHX-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/arm64/kvm/arm.c:52:1: sparse: sparse: symbol '__pcpu_scope_kvm_arm_hyp_stack_page' was not declared. Should it be static?
>> arch/arm64/kvm/arm.c:204:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   arch/arm64/kvm/arm.c:204:16: sparse:    struct kvm_mpidr_data [noderef] __rcu *
   arch/arm64/kvm/arm.c:204:16: sparse:    struct kvm_mpidr_data *
   arch/arm64/kvm/arm.c:207:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   arch/arm64/kvm/arm.c:207:17: sparse:    struct kvm_mpidr_data [noderef] __rcu *
   arch/arm64/kvm/arm.c:207:17: sparse:    struct kvm_mpidr_data *
   arch/arm64/kvm/arm.c:622:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   arch/arm64/kvm/arm.c:622:13: sparse:    struct kvm_mpidr_data [noderef] __rcu *
   arch/arm64/kvm/arm.c:622:13: sparse:    struct kvm_mpidr_data *
   arch/arm64/kvm/arm.c:660:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   arch/arm64/kvm/arm.c:660:9: sparse:    struct kvm_mpidr_data [noderef] __rcu *
   arch/arm64/kvm/arm.c:660:9: sparse:    struct kvm_mpidr_data *
   arch/arm64/kvm/arm.c:2506:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   arch/arm64/kvm/arm.c:2506:16: sparse:    struct kvm_mpidr_data [noderef] __rcu *
   arch/arm64/kvm/arm.c:2506:16: sparse:    struct kvm_mpidr_data *

vim +204 arch/arm64/kvm/arm.c

    51	
  > 52	DEFINE_PER_CPU(unsigned long, kvm_arm_hyp_stack_page);
    53	DECLARE_KVM_NVHE_PER_CPU(struct kvm_nvhe_init_params, kvm_init_params);
    54	
    55	DECLARE_KVM_NVHE_PER_CPU(struct kvm_cpu_context, kvm_hyp_ctxt);
    56	
    57	static bool vgic_present, kvm_arm_initialised;
    58	
    59	static DEFINE_PER_CPU(unsigned char, kvm_hyp_initialized);
    60	DEFINE_STATIC_KEY_FALSE(userspace_irqchip_in_use);
    61	
    62	bool is_kvm_arm_initialised(void)
    63	{
    64		return kvm_arm_initialised;
    65	}
    66	
    67	int kvm_arch_vcpu_should_kick(struct kvm_vcpu *vcpu)
    68	{
    69		return kvm_vcpu_exiting_guest_mode(vcpu) == IN_GUEST_MODE;
    70	}
    71	
    72	int kvm_vm_ioctl_enable_cap(struct kvm *kvm,
    73				    struct kvm_enable_cap *cap)
    74	{
    75		int r;
    76		u64 new_cap;
    77	
    78		if (cap->flags)
    79			return -EINVAL;
    80	
    81		switch (cap->cap) {
    82		case KVM_CAP_ARM_NISV_TO_USER:
    83			r = 0;
    84			set_bit(KVM_ARCH_FLAG_RETURN_NISV_IO_ABORT_TO_USER,
    85				&kvm->arch.flags);
    86			break;
    87		case KVM_CAP_ARM_MTE:
    88			mutex_lock(&kvm->lock);
    89			if (!system_supports_mte() || kvm->created_vcpus) {
    90				r = -EINVAL;
    91			} else {
    92				r = 0;
    93				set_bit(KVM_ARCH_FLAG_MTE_ENABLED, &kvm->arch.flags);
    94			}
    95			mutex_unlock(&kvm->lock);
    96			break;
    97		case KVM_CAP_ARM_SYSTEM_SUSPEND:
    98			r = 0;
    99			set_bit(KVM_ARCH_FLAG_SYSTEM_SUSPEND_ENABLED, &kvm->arch.flags);
   100			break;
   101		case KVM_CAP_ARM_EAGER_SPLIT_CHUNK_SIZE:
   102			new_cap = cap->args[0];
   103	
   104			mutex_lock(&kvm->slots_lock);
   105			/*
   106			 * To keep things simple, allow changing the chunk
   107			 * size only when no memory slots have been created.
   108			 */
   109			if (!kvm_are_all_memslots_empty(kvm)) {
   110				r = -EINVAL;
   111			} else if (new_cap && !kvm_is_block_size_supported(new_cap)) {
   112				r = -EINVAL;
   113			} else {
   114				r = 0;
   115				kvm->arch.mmu.split_page_chunk_size = new_cap;
   116			}
   117			mutex_unlock(&kvm->slots_lock);
   118			break;
   119		default:
   120			r = -EINVAL;
   121			break;
   122		}
   123	
   124		return r;
   125	}
   126	
   127	static int kvm_arm_default_max_vcpus(void)
   128	{
   129		return vgic_present ? kvm_vgic_get_max_vcpus() : KVM_MAX_VCPUS;
   130	}
   131	
   132	/**
   133	 * kvm_arch_init_vm - initializes a VM data structure
   134	 * @kvm:	pointer to the KVM struct
   135	 */
   136	int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
   137	{
   138		int ret;
   139	
   140		mutex_init(&kvm->arch.config_lock);
   141	
   142	#ifdef CONFIG_LOCKDEP
   143		/* Clue in lockdep that the config_lock must be taken inside kvm->lock */
   144		mutex_lock(&kvm->lock);
   145		mutex_lock(&kvm->arch.config_lock);
   146		mutex_unlock(&kvm->arch.config_lock);
   147		mutex_unlock(&kvm->lock);
   148	#endif
   149	
   150		ret = kvm_share_hyp(kvm, kvm + 1);
   151		if (ret)
   152			return ret;
   153	
   154		ret = pkvm_init_host_vm(kvm);
   155		if (ret)
   156			goto err_unshare_kvm;
   157	
   158		if (!zalloc_cpumask_var(&kvm->arch.supported_cpus, GFP_KERNEL_ACCOUNT)) {
   159			ret = -ENOMEM;
   160			goto err_unshare_kvm;
   161		}
   162		cpumask_copy(kvm->arch.supported_cpus, cpu_possible_mask);
   163	
   164		ret = kvm_init_stage2_mmu(kvm, &kvm->arch.mmu, type);
   165		if (ret)
   166			goto err_free_cpumask;
   167	
   168		kvm_vgic_early_init(kvm);
   169	
   170		kvm_timer_init_vm(kvm);
   171	
   172		/* The maximum number of VCPUs is limited by the host's GIC model */
   173		kvm->max_vcpus = kvm_arm_default_max_vcpus();
   174	
   175		kvm_arm_init_hypercalls(kvm);
   176	
   177		bitmap_zero(kvm->arch.vcpu_features, KVM_VCPU_MAX_FEATURES);
   178	
   179		return 0;
   180	
   181	err_free_cpumask:
   182		free_cpumask_var(kvm->arch.supported_cpus);
   183	err_unshare_kvm:
   184		kvm_unshare_hyp(kvm, kvm + 1);
   185		return ret;
   186	}
   187	
   188	vm_fault_t kvm_arch_vcpu_fault(struct kvm_vcpu *vcpu, struct vm_fault *vmf)
   189	{
   190		return VM_FAULT_SIGBUS;
   191	}
   192	
   193	void kvm_arch_create_vm_debugfs(struct kvm *kvm)
   194	{
   195		kvm_sys_regs_create_debugfs(kvm);
   196	}
   197	
   198	static void kvm_destroy_mpidr_data(struct kvm *kvm)
   199	{
   200		struct kvm_mpidr_data *data;
   201	
   202		mutex_lock(&kvm->arch.config_lock);
   203	
 > 204		data = rcu_dereference_protected(kvm->arch.mpidr_data,
   205						 lockdep_is_held(&kvm->arch.config_lock));
   206		if (data) {
   207			rcu_assign_pointer(kvm->arch.mpidr_data, NULL);
   208			synchronize_rcu();
   209			kfree(data);
   210		}
   211	
   212		mutex_unlock(&kvm->arch.config_lock);
   213	}
   214	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
