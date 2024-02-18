Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7D665BAA
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Feb 2024 14:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708265588; cv=none; b=cVwu4d6TES8RuqQC97nLXsszfoV+4shZ8pJcqfGmBXDamm5Y1ABdOLwwnopfSd3OGYlPfWcaBWhY9ukCHJTgID30G5KJmwj9yDt1un/ydr2NgU7t6JN+0l4F82XA4u6ppOyuz1BbuTx5aphklYajmA8O/i/96p2TjP7HiLRo3gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708265588; c=relaxed/simple;
	bh=b9G8Y8199rQFPA9ssHig36NrTHE+5x5HD4yhtBn7jh4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n4pM9zIbGp1uEngTjnCihCNt9xUm8TSVUwHDaHkQt3wluq3JKCLCmU4KvrVP35pfeblPCrEPa97QsC7ByVfcl4ygdNpb+vcqWuHE6LYG7Y5ZACRFmetoiwMrgs/pM8sC8UZaUXlaCI36oij8Kb4jri5y//zS+jRcXvKgSxnVcKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KszlJczV; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KszlJczV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708265586; x=1739801586;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b9G8Y8199rQFPA9ssHig36NrTHE+5x5HD4yhtBn7jh4=;
  b=KszlJczVE4tQz3mQkQSuYaBLYOt5ChYmLpGpDwhOszUtguTT2J2RRsAP
   N5BX6GM38cRN2Gzxfk/q1nhu6T5JsSc8m3h7bj/LMQfHguKX8NVBk6N6e
   FCykKuK18e06B7oKL7D3DpVBekkk4FTgqK33okweoK6l7W/ig1v5dtaP3
   GXi6LDUaAu5xA0BrWpQfJojLyus4T3Xk4M7lo9pdps31ckDB7lx3RppbV
   VT7E8osKhWwdZKf4P+7mbtY4Lz+bbHBI+aOS8rr1SmXIRYpP2PxTuBTua
   N68E3sXZSbaybLAK+271xhJUWL2GmF+aiYm716SWaYYWvH5nAvLtd6hAz
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10987"; a="13055120"
X-IronPort-AV: E=Sophos;i="6.06,168,1705392000"; 
   d="scan'208";a="13055120"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2024 06:13:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,168,1705392000"; 
   d="scan'208";a="4232941"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 18 Feb 2024 06:13:04 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rbhuf-00034M-2M;
	Sun, 18 Feb 2024 14:13:01 +0000
Date: Sun, 18 Feb 2024 22:12:41 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 24/64]
 arch/arm64/kvm/hyp/nvhe/psci-relay.c:29:58: error: variable has incomplete
 type 'enum pkvm_psci_notification'
Message-ID: <202402182209.KovZsIIV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   b1661c9e45f69f710f14b71da7c91fd38f63b19a
commit: a6f552f0abf27513c692c5dcd8e470c9dbea8b53 [24/64] ANDROID: KVM: arm64: Notify pKVM modules of PSCI events
config: arm64-randconfig-001-20240218 (https://download.01.org/0day-ci/archive/20240218/202402182209.KovZsIIV-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 36adfec155de366d722f2bac8ff9162289dcf06c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240218/202402182209.KovZsIIV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402182209.KovZsIIV-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> arch/arm64/kvm/hyp/nvhe/psci-relay.c:28:40: warning: declaration of 'enum pkvm_psci_notification' will not be visible outside of this function [-Wvisibility]
      28 | static void (*pkvm_psci_notifier)(enum pkvm_psci_notification, struct user_pt_regs *);
         |                                        ^
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:29:35: warning: declaration of 'enum pkvm_psci_notification' will not be visible outside of this function [-Wvisibility]
      29 | static void pkvm_psci_notify(enum pkvm_psci_notification notif, struct kvm_cpu_context *host_ctxt)
         |                                   ^
>> arch/arm64/kvm/hyp/nvhe/psci-relay.c:29:58: error: variable has incomplete type 'enum pkvm_psci_notification'
      29 | static void pkvm_psci_notify(enum pkvm_psci_notification notif, struct kvm_cpu_context *host_ctxt)
         |                                                          ^
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:29:35: note: forward declaration of 'enum pkvm_psci_notification'
      29 | static void pkvm_psci_notify(enum pkvm_psci_notification notif, struct kvm_cpu_context *host_ctxt)
         |                                   ^
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:35:51: warning: declaration of 'enum pkvm_psci_notification' will not be visible outside of this function [-Wvisibility]
      35 | int __pkvm_register_psci_notifier(void (*cb)(enum pkvm_psci_notification, struct user_pt_regs *))
         |                                                   ^
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:35:5: warning: no previous prototype for function '__pkvm_register_psci_notifier' [-Wmissing-prototypes]
      35 | int __pkvm_register_psci_notifier(void (*cb)(enum pkvm_psci_notification, struct user_pt_regs *))
         |     ^
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:35:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      35 | int __pkvm_register_psci_notifier(void (*cb)(enum pkvm_psci_notification, struct user_pt_regs *))
         | ^
         | static 
>> arch/arm64/kvm/hyp/nvhe/psci-relay.c:191:19: error: use of undeclared identifier 'PKVM_PSCI_CPU_SUSPEND'
     191 |         pkvm_psci_notify(PKVM_PSCI_CPU_SUSPEND, host_ctxt);
         |                          ^
>> arch/arm64/kvm/hyp/nvhe/psci-relay.c:223:19: error: use of undeclared identifier 'PKVM_PSCI_SYSTEM_SUSPEND'
     223 |         pkvm_psci_notify(PKVM_PSCI_SYSTEM_SUSPEND, host_ctxt);
         |                          ^
>> arch/arm64/kvm/hyp/nvhe/psci-relay.c:251:19: error: use of undeclared identifier 'PKVM_PSCI_CPU_ENTRY'
     251 |         pkvm_psci_notify(PKVM_PSCI_CPU_ENTRY, host_ctxt);
         |                          ^
   4 warnings and 4 errors generated.


vim +29 arch/arm64/kvm/hyp/nvhe/psci-relay.c

    27	
  > 28	static void (*pkvm_psci_notifier)(enum pkvm_psci_notification, struct user_pt_regs *);
  > 29	static void pkvm_psci_notify(enum pkvm_psci_notification notif, struct kvm_cpu_context *host_ctxt)
    30	{
    31		if (smp_load_acquire(&pkvm_psci_notifier))
    32			pkvm_psci_notifier(notif, &host_ctxt->regs);
    33	}
    34	
  > 35	int __pkvm_register_psci_notifier(void (*cb)(enum pkvm_psci_notification, struct user_pt_regs *))
    36	{
    37		/*
    38		 * Paired with smp_load_acquire(&pkvm_psci_notifier) in
    39		 * pkvm_psci_notify(). Ensure memory stores hapenning during a pKVM module
    40		 * init are observed before executing the callback.
    41		 */
    42		return cmpxchg_release(&pkvm_psci_notifier, NULL, cb) ? -EBUSY : 0;
    43	}
    44	
    45	#define INVALID_CPU_ID	UINT_MAX
    46	
    47	struct psci_boot_args {
    48		atomic_t lock;
    49		unsigned long pc;
    50		unsigned long r0;
    51	};
    52	
    53	#define PSCI_BOOT_ARGS_UNLOCKED		0
    54	#define PSCI_BOOT_ARGS_LOCKED		1
    55	
    56	#define PSCI_BOOT_ARGS_INIT					\
    57		((struct psci_boot_args){				\
    58			.lock = ATOMIC_INIT(PSCI_BOOT_ARGS_UNLOCKED),	\
    59		})
    60	
    61	static DEFINE_PER_CPU(struct psci_boot_args, cpu_on_args) = PSCI_BOOT_ARGS_INIT;
    62	static DEFINE_PER_CPU(struct psci_boot_args, suspend_args) = PSCI_BOOT_ARGS_INIT;
    63	
    64	#define	is_psci_0_1(what, func_id)					\
    65		(kvm_host_psci_config.psci_0_1_ ## what ## _implemented &&	\
    66		 (func_id) == kvm_host_psci_config.function_ids_0_1.what)
    67	
    68	static bool is_psci_0_1_call(u64 func_id)
    69	{
    70		return (is_psci_0_1(cpu_suspend, func_id) ||
    71			is_psci_0_1(cpu_on, func_id) ||
    72			is_psci_0_1(cpu_off, func_id) ||
    73			is_psci_0_1(migrate, func_id));
    74	}
    75	
    76	static bool is_psci_0_2_call(u64 func_id)
    77	{
    78		/* SMCCC reserves IDs 0x00-1F with the given 32/64-bit base for PSCI. */
    79		return (PSCI_0_2_FN(0) <= func_id && func_id <= PSCI_0_2_FN(31)) ||
    80		       (PSCI_0_2_FN64(0) <= func_id && func_id <= PSCI_0_2_FN64(31));
    81	}
    82	
    83	static unsigned long psci_call(unsigned long fn, unsigned long arg0,
    84				       unsigned long arg1, unsigned long arg2)
    85	{
    86		struct arm_smccc_res res;
    87	
    88		arm_smccc_1_1_smc(fn, arg0, arg1, arg2, &res);
    89		return res.a0;
    90	}
    91	
    92	static unsigned long psci_forward(struct kvm_cpu_context *host_ctxt)
    93	{
    94		return psci_call(cpu_reg(host_ctxt, 0), cpu_reg(host_ctxt, 1),
    95				 cpu_reg(host_ctxt, 2), cpu_reg(host_ctxt, 3));
    96	}
    97	
    98	static unsigned int find_cpu_id(u64 mpidr)
    99	{
   100		unsigned int i;
   101	
   102		/* Reject invalid MPIDRs */
   103		if (mpidr & ~MPIDR_HWID_BITMASK)
   104			return INVALID_CPU_ID;
   105	
   106		for (i = 0; i < NR_CPUS; i++) {
   107			if (cpu_logical_map(i) == mpidr)
   108				return i;
   109		}
   110	
   111		return INVALID_CPU_ID;
   112	}
   113	
   114	static __always_inline bool try_acquire_boot_args(struct psci_boot_args *args)
   115	{
   116		return atomic_cmpxchg_acquire(&args->lock,
   117					      PSCI_BOOT_ARGS_UNLOCKED,
   118					      PSCI_BOOT_ARGS_LOCKED) ==
   119			PSCI_BOOT_ARGS_UNLOCKED;
   120	}
   121	
   122	static __always_inline void release_boot_args(struct psci_boot_args *args)
   123	{
   124		atomic_set_release(&args->lock, PSCI_BOOT_ARGS_UNLOCKED);
   125	}
   126	
   127	static int psci_cpu_on(u64 func_id, struct kvm_cpu_context *host_ctxt)
   128	{
   129		DECLARE_REG(u64, mpidr, host_ctxt, 1);
   130		DECLARE_REG(unsigned long, pc, host_ctxt, 2);
   131		DECLARE_REG(unsigned long, r0, host_ctxt, 3);
   132	
   133		unsigned int cpu_id;
   134		struct psci_boot_args *boot_args;
   135		struct kvm_nvhe_init_params *init_params;
   136		int ret;
   137	
   138		/*
   139		 * Find the logical CPU ID for the given MPIDR. The search set is
   140		 * the set of CPUs that were online at the point of KVM initialization.
   141		 * Booting other CPUs is rejected because their cpufeatures were not
   142		 * checked against the finalized capabilities. This could be relaxed
   143		 * by doing the feature checks in hyp.
   144		 */
   145		cpu_id = find_cpu_id(mpidr);
   146		if (cpu_id == INVALID_CPU_ID)
   147			return PSCI_RET_INVALID_PARAMS;
   148	
   149		boot_args = per_cpu_ptr(&cpu_on_args, cpu_id);
   150		init_params = per_cpu_ptr(&kvm_init_params, cpu_id);
   151	
   152		/* Check if the target CPU is already being booted. */
   153		if (!try_acquire_boot_args(boot_args))
   154			return PSCI_RET_ALREADY_ON;
   155	
   156		boot_args->pc = pc;
   157		boot_args->r0 = r0;
   158		wmb();
   159	
   160		ret = psci_call(func_id, mpidr,
   161				__hyp_pa(&kvm_hyp_cpu_entry),
   162				__hyp_pa(init_params));
   163	
   164		/* If successful, the lock will be released by the target CPU. */
   165		if (ret != PSCI_RET_SUCCESS)
   166			release_boot_args(boot_args);
   167	
   168		return ret;
   169	}
   170	
   171	static int psci_cpu_suspend(u64 func_id, struct kvm_cpu_context *host_ctxt)
   172	{
   173		DECLARE_REG(u64, power_state, host_ctxt, 1);
   174		DECLARE_REG(unsigned long, pc, host_ctxt, 2);
   175		DECLARE_REG(unsigned long, r0, host_ctxt, 3);
   176		int ret;
   177	
   178		struct psci_boot_args *boot_args;
   179		struct kvm_nvhe_init_params *init_params;
   180	
   181		boot_args = this_cpu_ptr(&suspend_args);
   182		init_params = this_cpu_ptr(&kvm_init_params);
   183	
   184		/*
   185		 * No need to acquire a lock before writing to boot_args because a core
   186		 * can only suspend itself. Racy CPU_ON calls use a separate struct.
   187		 */
   188		boot_args->pc = pc;
   189		boot_args->r0 = r0;
   190	
 > 191		pkvm_psci_notify(PKVM_PSCI_CPU_SUSPEND, host_ctxt);
   192		trace_hyp_exit();
   193	
   194		/*
   195		 * Will either return if shallow sleep state, or wake up into the entry
   196		 * point if it is a deep sleep state.
   197		 */
   198		ret = psci_call(func_id, power_state,
   199				__hyp_pa(&kvm_hyp_cpu_resume),
   200				__hyp_pa(init_params));
   201	
   202		return ret;
   203	}
   204	
   205	static int psci_system_suspend(u64 func_id, struct kvm_cpu_context *host_ctxt)
   206	{
   207		DECLARE_REG(unsigned long, pc, host_ctxt, 1);
   208		DECLARE_REG(unsigned long, r0, host_ctxt, 2);
   209	
   210		struct psci_boot_args *boot_args;
   211		struct kvm_nvhe_init_params *init_params;
   212	
   213		boot_args = this_cpu_ptr(&suspend_args);
   214		init_params = this_cpu_ptr(&kvm_init_params);
   215	
   216		/*
   217		 * No need to acquire a lock before writing to boot_args because a core
   218		 * can only suspend itself. Racy CPU_ON calls use a separate struct.
   219		 */
   220		boot_args->pc = pc;
   221		boot_args->r0 = r0;
   222	
 > 223		pkvm_psci_notify(PKVM_PSCI_SYSTEM_SUSPEND, host_ctxt);
   224	
   225		/* Will only return on error. */
   226		return psci_call(func_id,
   227				 __hyp_pa(&kvm_hyp_cpu_resume),
   228				 __hyp_pa(init_params), 0);
   229	}
   230	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
