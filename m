Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FCEB21C9E7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Aug 2025 16:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755187312; cv=none; b=kG8Qro46F9XHQ9ePRgfJ3/T7RNaGDTYp/MNKCdpkwubvsocwIsPq/2FO793hMF6e7zWrkCahqH7g1NpxFxgmoFnwJKkfzS8k2GqqFWs1Xsl29uipj/bwZfbi6bqrQUAzBSy3k7gZNoJqLmK6iV6+i6/HvGL1wng46VXCce1PAGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755187312; c=relaxed/simple;
	bh=WvTiOzRVZJDTVNP4z1vZHAAdKVDuPADLMrFsxOSObI8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GNI6E2OB+sLZjv53jz7cxdI33Se218Cpf61r3hoCmhn8bhzeOPB5Jceoad/YFcOwlgs7zp6g08vKZD75z0h4FtxVzdmTDtbdwFeUNnnL6hxrKWDhAMx6P/2In5/g7EwJy5c35Id+ULi55JNbssL63RWE89+ETPej8M+DO6I5AGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EF4/SHaw; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EF4/SHaw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755187311; x=1786723311;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WvTiOzRVZJDTVNP4z1vZHAAdKVDuPADLMrFsxOSObI8=;
  b=EF4/SHawTRcuhTpq59GzmropdzS8O0AWx9ybqqKbNl2DJ8qxomcdFLVs
   R/Jo9DlGMA2tH8dgRV+hcKPvGIDMRg6GKZEJNxYnU4L6q5s+WAEWVaH84
   5d3B+TS3IkoYOT9RpKJgmyqkeK+oxJ8Z9S9gDTwI9Cgo3lh+sDmPCGD/O
   i0VdZgtDTrNjkIWLODIJmEOC94XMFMvaVzS1jhUatfn1EkH/ePrryV4bv
   ngXQV0yB+pM/KkaRd1geDSu5m8zy4Xk2tRpTmDuKgt4v+ts1057qmRyPY
   JEFO1qhVMCpvBXR+cXDsAoorsSp2IhOtMQgGXhhVmzr/Z/kpscdmDIuz3
   A==;
X-CSE-ConnectionGUID: fPz4iJfiT0KxDZp5xBu6/w==
X-CSE-MsgGUID: J2iuhdBGTOKAWvczOXE+UA==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="68961396"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="68961396"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 09:01:50 -0700
X-CSE-ConnectionGUID: uJaEBVRWSICTFqS8Lyvwtw==
X-CSE-MsgGUID: eDeK1pdjRMeMo4BGIN8U/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="167165183"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by fmviesa008.fm.intel.com with ESMTP; 14 Aug 2025 09:01:48 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umaOg-0000IV-1Y;
	Thu, 14 Aug 2025 16:01:46 +0000
Date: Thu, 14 Aug 2025 18:00:52 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 4/4]
 arch/arm64/kvm/hyp/nvhe/psci-relay.c:29:58: error: variable has incomplete
 type 'enum pkvm_psci_notification'
Message-ID: <202508141838.6AmdbNXK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   125206b4d7d6898a8a5d0c088a5ba75114266b81
commit: 68d457650f79d4b9f8f23b82a8d0a06c4c74419d [4/4] ANDROID: KVM: arm64: Notify pKVM modules of PSCI events
config: arm64-randconfig-2002-20250814 (https://download.01.org/0day-ci/archive/20250814/202508141838.6AmdbNXK-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7d886fab74d4037d654d02bed24dd97c0ba863d6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250814/202508141838.6AmdbNXK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508141838.6AmdbNXK-lkp@intel.com/

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
>> arch/arm64/kvm/hyp/nvhe/psci-relay.c:35:5: warning: no previous prototype for function '__pkvm_register_psci_notifier' [-Wmissing-prototypes]
      35 | int __pkvm_register_psci_notifier(void (*cb)(enum pkvm_psci_notification, struct user_pt_regs *))
         |     ^
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:35:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      35 | int __pkvm_register_psci_notifier(void (*cb)(enum pkvm_psci_notification, struct user_pt_regs *))
         | ^
         | static 
>> arch/arm64/kvm/hyp/nvhe/psci-relay.c:191:19: error: use of undeclared identifier 'PKVM_PSCI_CPU_SUSPEND'
     191 |         pkvm_psci_notify(PKVM_PSCI_CPU_SUSPEND, host_ctxt);
         |                          ^~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/hyp/nvhe/psci-relay.c:222:19: error: use of undeclared identifier 'PKVM_PSCI_SYSTEM_SUSPEND'
     222 |         pkvm_psci_notify(PKVM_PSCI_SYSTEM_SUSPEND, host_ctxt);
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/hyp/nvhe/psci-relay.c:249:19: error: use of undeclared identifier 'PKVM_PSCI_CPU_ENTRY'
     249 |         pkvm_psci_notify(PKVM_PSCI_CPU_ENTRY, host_ctxt);
         |                          ^~~~~~~~~~~~~~~~~~~
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
   192	
   193		/*
   194		 * Will either return if shallow sleep state, or wake up into the entry
   195		 * point if it is a deep sleep state.
   196		 */
   197		ret = psci_call(func_id, power_state,
   198				__hyp_pa(&kvm_hyp_cpu_resume),
   199				__hyp_pa(init_params));
   200	
   201		return ret;
   202	}
   203	
   204	static int psci_system_suspend(u64 func_id, struct kvm_cpu_context *host_ctxt)
   205	{
   206		DECLARE_REG(unsigned long, pc, host_ctxt, 1);
   207		DECLARE_REG(unsigned long, r0, host_ctxt, 2);
   208	
   209		struct psci_boot_args *boot_args;
   210		struct kvm_nvhe_init_params *init_params;
   211	
   212		boot_args = this_cpu_ptr(&suspend_args);
   213		init_params = this_cpu_ptr(&kvm_init_params);
   214	
   215		/*
   216		 * No need to acquire a lock before writing to boot_args because a core
   217		 * can only suspend itself. Racy CPU_ON calls use a separate struct.
   218		 */
   219		boot_args->pc = pc;
   220		boot_args->r0 = r0;
   221	
 > 222		pkvm_psci_notify(PKVM_PSCI_SYSTEM_SUSPEND, host_ctxt);
   223	
   224		/* Will only return on error. */
   225		return psci_call(func_id,
   226				 __hyp_pa(&kvm_hyp_cpu_resume),
   227				 __hyp_pa(init_params), 0);
   228	}
   229	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
