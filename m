Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49399DF57
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Oct 2023 08:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OvgJLCEE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697702525; x=1729238525;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qDuM08Cvo72704x04lnUo+dlxxmWWhAMQ07xKq6/6aE=;
  b=OvgJLCEEhRk4YA6FpjknxNBcDgvF8dwhdoG9vQivkOLcCcxGsAWG4fQ9
   b1zOOVvGmsVLRyffJcW0FWLeX/vHYdbHsuVzoJuv4fPBgEKdD+wMM/58X
   vUxy05sfua58NnLs6t8UjEuRUJo6E0rdnfs0gdZ5zU51xK1qKcU5XN88Y
   82Bk+RdQMZaqQGp8NNCx1u6VZO2VYOvFvpTc9Lykxu54NzKL2IR3mBTP6
   mEr+RRsawuKM6sPwgFBcbSKL0fJYTuf8RwOA/EPKCrj7gaooAZ8rB5cUV
   MgKCDq4dTPuMvu/qgflWk2XgKCoBNn9dYSj5YJRy167LJp0YbKdPl1+Q/
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="386024179"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="386024179"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 01:02:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="4868384"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 19 Oct 2023 01:02:02 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtNyf-0001qM-1d;
	Thu, 19 Oct 2023 08:01:57 +0000
Date: Thu, 19 Oct 2023 16:01:53 +0800
From: kernel test robot <lkp@intel.com>
To: Fuad Tabba <tabba@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Will Deacon <willdeacon@google.com>
Subject: [sudeep-holla:android13-5.15/ffa 2699/4062]
 arch/arm64/kvm/hyp/nvhe/pkvm.c:273:16: warning: array subscript vcpu_idx is
 outside array bounds of 'struct shadow_vcpu_state[0]'
Message-ID: <202310191508.wfZeqwgM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git android13-5.15/ffa
head:   c6013f50f1ae0e42d14d51a06118779ead3047ef
commit: 1669999c8da7c94717f1490a2069dc5866b09096 [2699/4062] ANDROID: KVM: arm64: Shadow table for KVM EL2 state
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20231019/202310191508.wfZeqwgM-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231019/202310191508.wfZeqwgM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310191508.wfZeqwgM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/hyp/nvhe/pkvm.c: In function 'hyp_get_shadow_vcpu':
>> arch/arm64/kvm/hyp/nvhe/pkvm.c:273:16: warning: array subscript vcpu_idx is outside array bounds of 'struct shadow_vcpu_state[0]' [-Warray-bounds=]
     273 |         return &shadow_vcpu_state->vcpu;
         |                ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/arm64/kvm/hyp/nvhe/pkvm.c:17:
   arch/arm64/kvm/hyp/include/nvhe/pkvm.h:43:34: note: while referencing 'shadow_vcpus'
      43 |         struct shadow_vcpu_state shadow_vcpus[0];
         |                                  ^~~~~~~~~~~~
   In function 'init_shadow_structs',
       inlined from '__pkvm_init_shadow' at arch/arm64/kvm/hyp/nvhe/pkvm.c:506:2:
>> arch/arm64/kvm/hyp/nvhe/pkvm.c:327:48: warning: array subscript i is outside array bounds of 'struct shadow_vcpu_state[0]' [-Warray-bounds=]
     327 |                 struct kvm_vcpu *shadow_vcpu = &shadow_state->vcpu;
         |                                                ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/pkvm.h: In function '__pkvm_init_shadow':
   arch/arm64/kvm/hyp/include/nvhe/pkvm.h:43:34: note: while referencing 'shadow_vcpus'
      43 |         struct shadow_vcpu_state shadow_vcpus[0];
         |                                  ^~~~~~~~~~~~
   In function 'init_shadow_structs',
       inlined from '__pkvm_init_shadow' at arch/arm64/kvm/hyp/nvhe/pkvm.c:506:2:
   arch/arm64/kvm/hyp/nvhe/pkvm.c:326:75: warning: array subscript i is outside array bounds of 'struct shadow_vcpu_state[0]' [-Warray-bounds=]
     326 |                 struct shadow_vcpu_state *shadow_state = &vm->shadow_vcpus[i];
         |                                                           ~~~~~~~~~~~~~~~~^~~
   arch/arm64/kvm/hyp/include/nvhe/pkvm.h: In function '__pkvm_init_shadow':
   arch/arm64/kvm/hyp/include/nvhe/pkvm.h:43:34: note: while referencing 'shadow_vcpus'
      43 |         struct shadow_vcpu_state shadow_vcpus[0];
         |                                  ^~~~~~~~~~~~
   In function 'init_shadow_structs',
       inlined from '__pkvm_init_shadow' at arch/arm64/kvm/hyp/nvhe/pkvm.c:506:2:
   arch/arm64/kvm/hyp/nvhe/pkvm.c:326:75: warning: array subscript i is outside array bounds of 'struct shadow_vcpu_state[0]' [-Warray-bounds=]
     326 |                 struct shadow_vcpu_state *shadow_state = &vm->shadow_vcpus[i];
         |                                                           ~~~~~~~~~~~~~~~~^~~
   arch/arm64/kvm/hyp/include/nvhe/pkvm.h: In function '__pkvm_init_shadow':
   arch/arm64/kvm/hyp/include/nvhe/pkvm.h:43:34: note: while referencing 'shadow_vcpus'
      43 |         struct shadow_vcpu_state shadow_vcpus[0];
         |                                  ^~~~~~~~~~~~
   In function 'init_shadow_structs',
       inlined from '__pkvm_init_shadow' at arch/arm64/kvm/hyp/nvhe/pkvm.c:506:2:
   arch/arm64/kvm/hyp/nvhe/pkvm.c:326:75: warning: array subscript i is outside array bounds of 'struct shadow_vcpu_state[0]' [-Warray-bounds=]
     326 |                 struct shadow_vcpu_state *shadow_state = &vm->shadow_vcpus[i];
         |                                                           ~~~~~~~~~~~~~~~~^~~
   arch/arm64/kvm/hyp/include/nvhe/pkvm.h: In function '__pkvm_init_shadow':
   arch/arm64/kvm/hyp/include/nvhe/pkvm.h:43:34: note: while referencing 'shadow_vcpus'
      43 |         struct shadow_vcpu_state shadow_vcpus[0];
         |                                  ^~~~~~~~~~~~
   In function 'init_shadow_structs',
       inlined from '__pkvm_init_shadow' at arch/arm64/kvm/hyp/nvhe/pkvm.c:506:2:
   arch/arm64/kvm/hyp/nvhe/pkvm.c:326:75: warning: array subscript i is outside array bounds of 'struct shadow_vcpu_state[0]' [-Warray-bounds=]
     326 |                 struct shadow_vcpu_state *shadow_state = &vm->shadow_vcpus[i];
         |                                                           ~~~~~~~~~~~~~~~~^~~
   arch/arm64/kvm/hyp/include/nvhe/pkvm.h: In function '__pkvm_init_shadow':
   arch/arm64/kvm/hyp/include/nvhe/pkvm.h:43:34: note: while referencing 'shadow_vcpus'
      43 |         struct shadow_vcpu_state shadow_vcpus[0];
         |                                  ^~~~~~~~~~~~
   In function 'init_shadow_structs',
       inlined from '__pkvm_init_shadow' at arch/arm64/kvm/hyp/nvhe/pkvm.c:506:2:
   arch/arm64/kvm/hyp/nvhe/pkvm.c:326:75: warning: array subscript i is outside array bounds of 'struct shadow_vcpu_state[0]' [-Warray-bounds=]
     326 |                 struct shadow_vcpu_state *shadow_state = &vm->shadow_vcpus[i];
         |                                                           ~~~~~~~~~~~~~~~~^~~
   arch/arm64/kvm/hyp/include/nvhe/pkvm.h: In function '__pkvm_init_shadow':
   arch/arm64/kvm/hyp/include/nvhe/pkvm.h:43:34: note: while referencing 'shadow_vcpus'
      43 |         struct shadow_vcpu_state shadow_vcpus[0];
         |                                  ^~~~~~~~~~~~
   In function 'init_shadow_structs',
       inlined from '__pkvm_init_shadow' at arch/arm64/kvm/hyp/nvhe/pkvm.c:506:2:
   arch/arm64/kvm/hyp/nvhe/pkvm.c:326:75: warning: array subscript i is outside array bounds of 'struct shadow_vcpu_state[0]' [-Warray-bounds=]
     326 |                 struct shadow_vcpu_state *shadow_state = &vm->shadow_vcpus[i];
         |                                                           ~~~~~~~~~~~~~~~~^~~
   arch/arm64/kvm/hyp/include/nvhe/pkvm.h: In function '__pkvm_init_shadow':
   arch/arm64/kvm/hyp/include/nvhe/pkvm.h:43:34: note: while referencing 'shadow_vcpus'
      43 |         struct shadow_vcpu_state shadow_vcpus[0];
         |                                  ^~~~~~~~~~~~
   In function 'init_shadow_structs',
       inlined from '__pkvm_init_shadow' at arch/arm64/kvm/hyp/nvhe/pkvm.c:506:2:
   arch/arm64/kvm/hyp/nvhe/pkvm.c:326:75: warning: array subscript i is outside array bounds of 'struct shadow_vcpu_state[0]' [-Warray-bounds=]
     326 |                 struct shadow_vcpu_state *shadow_state = &vm->shadow_vcpus[i];
         |                                                           ~~~~~~~~~~~~~~~~^~~
   arch/arm64/kvm/hyp/include/nvhe/pkvm.h: In function '__pkvm_init_shadow':
   arch/arm64/kvm/hyp/include/nvhe/pkvm.h:43:34: note: while referencing 'shadow_vcpus'
      43 |         struct shadow_vcpu_state shadow_vcpus[0];
         |                                  ^~~~~~~~~~~~
   In function 'init_shadow_structs',
       inlined from '__pkvm_init_shadow' at arch/arm64/kvm/hyp/nvhe/pkvm.c:506:2:
   arch/arm64/kvm/hyp/nvhe/pkvm.c:326:75: warning: array subscript i is outside array bounds of 'struct shadow_vcpu_state[0]' [-Warray-bounds=]
     326 |                 struct shadow_vcpu_state *shadow_state = &vm->shadow_vcpus[i];
         |                                                           ~~~~~~~~~~~~~~~~^~~
   arch/arm64/kvm/hyp/include/nvhe/pkvm.h: In function '__pkvm_init_shadow':
   arch/arm64/kvm/hyp/include/nvhe/pkvm.h:43:34: note: while referencing 'shadow_vcpus'
      43 |         struct shadow_vcpu_state shadow_vcpus[0];
         |                                  ^~~~~~~~~~~~
   In function 'init_shadow_structs',
       inlined from '__pkvm_init_shadow' at arch/arm64/kvm/hyp/nvhe/pkvm.c:506:2:
   arch/arm64/kvm/hyp/nvhe/pkvm.c:326:75: warning: array subscript i is outside array bounds of 'struct shadow_vcpu_state[0]' [-Warray-bounds=]
     326 |                 struct shadow_vcpu_state *shadow_state = &vm->shadow_vcpus[i];
         |                                                           ~~~~~~~~~~~~~~~~^~~
   arch/arm64/kvm/hyp/include/nvhe/pkvm.h: In function '__pkvm_init_shadow':
   arch/arm64/kvm/hyp/include/nvhe/pkvm.h:43:34: note: while referencing 'shadow_vcpus'
      43 |         struct shadow_vcpu_state shadow_vcpus[0];
         |                                  ^~~~~~~~~~~~
   In function 'init_shadow_structs',
       inlined from '__pkvm_init_shadow' at arch/arm64/kvm/hyp/nvhe/pkvm.c:506:2:
   arch/arm64/kvm/hyp/nvhe/pkvm.c:326:75: warning: array subscript i is outside array bounds of 'struct shadow_vcpu_state[0]' [-Warray-bounds=]
     326 |                 struct shadow_vcpu_state *shadow_state = &vm->shadow_vcpus[i];
         |                                                           ~~~~~~~~~~~~~~~~^~~
   arch/arm64/kvm/hyp/include/nvhe/pkvm.h: In function '__pkvm_init_shadow':
   arch/arm64/kvm/hyp/include/nvhe/pkvm.h:43:34: note: while referencing 'shadow_vcpus'
      43 |         struct shadow_vcpu_state shadow_vcpus[0];
         |                                  ^~~~~~~~~~~~
   In function 'init_shadow_structs',
       inlined from '__pkvm_init_shadow' at arch/arm64/kvm/hyp/nvhe/pkvm.c:506:2:
   arch/arm64/kvm/hyp/nvhe/pkvm.c:326:75: warning: array subscript i is outside array bounds of 'struct shadow_vcpu_state[0]' [-Warray-bounds=]
     326 |                 struct shadow_vcpu_state *shadow_state = &vm->shadow_vcpus[i];


vim +273 arch/arm64/kvm/hyp/nvhe/pkvm.c

   252	
   253	/*
   254	 * Returns the hyp shadow vcpu for the corresponding host vcpu,
   255	 * or NULL if it fails.
   256	 */
   257	struct kvm_vcpu *hyp_get_shadow_vcpu(const struct kvm_vcpu *vcpu)
   258	{
   259		struct shadow_vcpu_state *shadow_vcpu_state;
   260		struct kvm_shadow_vm *vm;
   261		int vcpu_idx;
   262		int shadow_handle;
   263	
   264		shadow_handle = vcpu->arch.pkvm.shadow_handle;
   265		vm = find_shadow_by_handle(shadow_handle);
   266		vcpu_idx = vcpu->vcpu_idx;
   267	
   268		if (unlikely(!vm || vcpu_idx < 0 || vcpu_idx >= vm->created_vcpus))
   269			return NULL;
   270	
   271		shadow_vcpu_state = &vm->shadow_vcpus[vcpu_idx];
   272	
 > 273		return &shadow_vcpu_state->vcpu;
   274	}
   275	
   276	/* Copy the supported features for the vcpu from the host. */
   277	static void copy_features(struct kvm_vcpu *shadow_vcpu, struct kvm_vcpu *host_vcpu)
   278	{
   279		DECLARE_BITMAP(allowed_features, KVM_VCPU_MAX_FEATURES);
   280	
   281		bitmap_zero(allowed_features, KVM_VCPU_MAX_FEATURES);
   282	
   283		/*
   284		 * Always allowed:
   285		 * - CPU starting in poweroff state
   286		 * - PSCI v0.2
   287		 */
   288		set_bit(KVM_ARM_VCPU_POWER_OFF, allowed_features);
   289		set_bit(KVM_ARM_VCPU_PSCI_0_2, allowed_features);
   290	
   291		/*
   292		 * Check if remaining features are allowed:
   293		 * - Performance Monitoring
   294		 * - Scalable Vectors
   295		 * - Pointer Authentication
   296		 */
   297		if (FIELD_GET(ARM64_FEATURE_MASK(ID_AA64DFR0_PMUVER), PVM_ID_AA64DFR0_ALLOW))
   298		        set_bit(KVM_ARM_VCPU_PMU_V3, allowed_features);
   299	
   300		if (FIELD_GET(ARM64_FEATURE_MASK(ID_AA64PFR0_SVE), PVM_ID_AA64PFR0_ALLOW))
   301		        set_bit(KVM_ARM_VCPU_SVE, allowed_features);
   302	
   303		if (FIELD_GET(ARM64_FEATURE_MASK(ID_AA64ISAR1_API), PVM_ID_AA64ISAR1_ALLOW) &&
   304		    FIELD_GET(ARM64_FEATURE_MASK(ID_AA64ISAR1_APA), PVM_ID_AA64ISAR1_ALLOW))
   305		        set_bit(KVM_ARM_VCPU_PTRAUTH_ADDRESS, allowed_features);
   306	
   307		if (FIELD_GET(ARM64_FEATURE_MASK(ID_AA64ISAR1_GPI), PVM_ID_AA64ISAR1_ALLOW) &&
   308		    FIELD_GET(ARM64_FEATURE_MASK(ID_AA64ISAR1_GPA), PVM_ID_AA64ISAR1_ALLOW))
   309		        set_bit(KVM_ARM_VCPU_PTRAUTH_GENERIC, allowed_features);
   310	
   311		bitmap_and(shadow_vcpu->arch.features, host_vcpu->arch.features,
   312			allowed_features, KVM_VCPU_MAX_FEATURES);
   313	}
   314	
   315	static void init_shadow_structs(struct kvm *kvm, struct kvm_shadow_vm *vm, int nr_vcpus)
   316	{
   317		int i;
   318	
   319		/* TODO: initialize the protected MMU. For now, use the host's. */
   320		vm->mmu = &kvm->arch.mmu;
   321		vm->host_kvm = kvm;
   322		vm->created_vcpus = 0;
   323	
   324		for (i = 0; i < nr_vcpus; i++) {
   325			struct kvm_vcpu *host_vcpu = kern_hyp_va(kvm->vcpus[i]);
   326			struct shadow_vcpu_state *shadow_state = &vm->shadow_vcpus[i];
 > 327			struct kvm_vcpu *shadow_vcpu = &shadow_state->vcpu;
   328	
   329			shadow_vcpu->kvm = kvm;
   330			shadow_vcpu->vcpu_id = host_vcpu->vcpu_id;
   331			shadow_vcpu->vcpu_idx = i;
   332	
   333			vcpu_gp_regs(shadow_vcpu)->pstate = VCPU_RESET_PSTATE_EL1;
   334			*vcpu_pc(shadow_vcpu) = *vcpu_pc(host_vcpu);
   335			vcpu_set_reg(shadow_vcpu, 0, vcpu_get_reg(host_vcpu, 0));
   336	
   337			kvm_reset_pvm_sys_regs(shadow_vcpu);
   338	
   339			copy_features(shadow_vcpu, host_vcpu);
   340	
   341			vm->vcpus[i] = shadow_vcpu;
   342			shadow_state->vm = vm;
   343	
   344			/* TODO - use &vm->arch.mmu when setup properly */
   345			shadow_vcpu->arch.hw_mmu = host_vcpu->arch.hw_mmu;
   346			shadow_vcpu->arch.pkvm.shadow_handle = vm->shadow_handle;
   347			shadow_vcpu->arch.pkvm.host_vcpu = host_vcpu;
   348			shadow_vcpu->arch.pkvm.shadow_vm = vm;
   349	
   350			vm->created_vcpus++;
   351		}
   352	}
   353	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
