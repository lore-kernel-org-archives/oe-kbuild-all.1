Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8166A31986E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Aug 2025 20:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755201666; cv=none; b=fQy8TVrrc/XzrvS7ufP1QZNZj2h73DNqqplG7jsu1LZeAC2fVinMzqptk/+fTlPjENUMxhAzSWT94Xnw7HtXO7GmMVDeg0vetznEtAKXffOLGPXCvZaVrYFn9ZgN3qiDcE3hMmhYHOvTJt6ivVfg4Tk8aMSjPdi2bJcFLVUtW+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755201666; c=relaxed/simple;
	bh=I2Fx2aJ+B8xinOcIVaA3lLc0m1mfMIML/wfXF1G2/9o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WE0XnYNzv8gaxruDubCBKHXDmjOcJdGdglAqJwKujm88Qc9W/thkK/mstWGYC7HK9uYy04odZL1k4W3jKuWyfcNiX8sTbAhMoDtXIvvQDYrtLzhWtoJBK2iI2zRjcJL8q9LYq2kxidCIUYkqHGSQQfjuAqmTg76dkiibUvFagtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c3oOeecL; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c3oOeecL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755201665; x=1786737665;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I2Fx2aJ+B8xinOcIVaA3lLc0m1mfMIML/wfXF1G2/9o=;
  b=c3oOeecLEWaV+ucZdpBHJJCp1ZqG2L97rHlGp90uhSXEbcGbzRin0HtE
   BHDRoLdgY67YuknHhVdOq2MOR4HY/gKoV19PHQGfeTOlx++QOUu1/Oh6M
   vbTKboIH54W7/c1kXKdNlIS1WRxlT7Z5pbBKeUto3VuB/tMIadOU4MUge
   rYvHCVAlE2EWE7fgQEDONJz9fIldKQBSu5l4GbiQFG3WY1gn/Wi+hg5JO
   L/ZO2O+CXxQl0Ndi5f+KNO936eXInf8o0lzbXDxK7eEEH1VRXWS+JyyHz
   5q4jxaYGSFuOP5PX1jmi9y4l/QFEPs7mMUZ/G4QeZTaktrX1ezvcO3lx+
   g==;
X-CSE-ConnectionGUID: VyT51w0fTSqRWxxErNzM/w==
X-CSE-MsgGUID: SZYtOHtmQJylx3bWmuq7kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="61370380"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="61370380"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 13:01:04 -0700
X-CSE-ConnectionGUID: gEZQOFu0RZy9WxqKcfUECQ==
X-CSE-MsgGUID: 9CmD5UeHRPG18S0kNLm3Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="172174863"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by orviesa005.jf.intel.com with ESMTP; 14 Aug 2025 13:01:03 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ume8C-0000KN-29;
	Thu, 14 Aug 2025 20:01:00 +0000
Date: Thu, 14 Aug 2025 22:00:20 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2025-07 2/2]
 arch/arm64/kvm/hyp/nvhe/psci-relay.c:29:58: error: parameter 1 ('notif') has
 incomplete type
Message-ID: <202508142203.bzfA4HOM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-2025-07
head:   824547fb5472b8b3280f20caf3a2206de307b3a6
commit: a6f552f0abf27513c692c5dcd8e470c9dbea8b53 [2/2] ANDROID: KVM: arm64: Notify pKVM modules of PSCI events
config: arm64-randconfig-2001-20250814 (https://download.01.org/0day-ci/archive/20250814/202508142203.bzfA4HOM-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250814/202508142203.bzfA4HOM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508142203.bzfA4HOM-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp/include/nvhe/memory.h:9,
                    from arch/arm64/kvm/hyp/include/nvhe/gfp.h:7,
                    from arch/arm64/kvm/hyp/include/nvhe/pkvm.h:12,
                    from arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:14,
                    from arch/arm64/kvm/hyp/nvhe/psci-relay.c:15:
   arch/arm64/kvm/hyp/include/nvhe/refcount.h: In function '__lse_refcount_fetch_add_16':
   arch/arm64/kvm/hyp/include/nvhe/refcount.h:35:15: error: expected string literal before '__LSE_PREAMBLE'
     asm volatile(__LSE_PREAMBLE
                  ^~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/psci-relay.c: At top level:
>> arch/arm64/kvm/hyp/nvhe/psci-relay.c:28:40: warning: 'enum pkvm_psci_notification' declared inside parameter list will not be visible outside of this definition or declaration
    static void (*pkvm_psci_notifier)(enum pkvm_psci_notification, struct user_pt_regs *);
                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:29:35: warning: 'enum pkvm_psci_notification' declared inside parameter list will not be visible outside of this definition or declaration
    static void pkvm_psci_notify(enum pkvm_psci_notification notif, struct kvm_cpu_context *host_ctxt)
                                      ^~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/hyp/nvhe/psci-relay.c:29:58: error: parameter 1 ('notif') has incomplete type
    static void pkvm_psci_notify(enum pkvm_psci_notification notif, struct kvm_cpu_context *host_ctxt)
                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
>> arch/arm64/kvm/hyp/nvhe/psci-relay.c:29:13: error: function declaration isn't a prototype [-Werror=strict-prototypes]
    static void pkvm_psci_notify(enum pkvm_psci_notification notif, struct kvm_cpu_context *host_ctxt)
                ^~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/psci-relay.c: In function 'pkvm_psci_notify':
>> arch/arm64/kvm/hyp/nvhe/psci-relay.c:32:22: error: type of formal parameter 1 is incomplete
      pkvm_psci_notifier(notif, &host_ctxt->regs);
                         ^~~~~
   arch/arm64/kvm/hyp/nvhe/psci-relay.c: At top level:
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:35:51: warning: 'enum pkvm_psci_notification' declared inside parameter list will not be visible outside of this definition or declaration
    int __pkvm_register_psci_notifier(void (*cb)(enum pkvm_psci_notification, struct user_pt_regs *))
                                                      ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:35:5: warning: no previous prototype for '__pkvm_register_psci_notifier' [-Wmissing-prototypes]
    int __pkvm_register_psci_notifier(void (*cb)(enum pkvm_psci_notification, struct user_pt_regs *))
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/psci-relay.c: In function 'psci_cpu_suspend':
>> arch/arm64/kvm/hyp/nvhe/psci-relay.c:191:19: error: 'PKVM_PSCI_CPU_SUSPEND' undeclared (first use in this function); did you mean 'KVM_PSCI_FN_CPU_SUSPEND'?
     pkvm_psci_notify(PKVM_PSCI_CPU_SUSPEND, host_ctxt);
                      ^~~~~~~~~~~~~~~~~~~~~
                      KVM_PSCI_FN_CPU_SUSPEND
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:191:19: note: each undeclared identifier is reported only once for each function it appears in
   arch/arm64/kvm/hyp/nvhe/psci-relay.c: In function 'psci_system_suspend':
>> arch/arm64/kvm/hyp/nvhe/psci-relay.c:223:19: error: 'PKVM_PSCI_SYSTEM_SUSPEND' undeclared (first use in this function); did you mean 'KVM_CAP_ARM_SYSTEM_SUSPEND'?
     pkvm_psci_notify(PKVM_PSCI_SYSTEM_SUSPEND, host_ctxt);
                      ^~~~~~~~~~~~~~~~~~~~~~~~
                      KVM_CAP_ARM_SYSTEM_SUSPEND
   arch/arm64/kvm/hyp/nvhe/psci-relay.c: In function '__kvm_host_psci_cpu_entry':
>> arch/arm64/kvm/hyp/nvhe/psci-relay.c:251:19: error: 'PKVM_PSCI_CPU_ENTRY' undeclared (first use in this function); did you mean 'KVM_PSCI_RET_DENIED'?
     pkvm_psci_notify(PKVM_PSCI_CPU_ENTRY, host_ctxt);
                      ^~~~~~~~~~~~~~~~~~~
                      KVM_PSCI_RET_DENIED
   cc1: some warnings being treated as errors


vim +29 arch/arm64/kvm/hyp/nvhe/psci-relay.c

    27	
  > 28	static void (*pkvm_psci_notifier)(enum pkvm_psci_notification, struct user_pt_regs *);
  > 29	static void pkvm_psci_notify(enum pkvm_psci_notification notif, struct kvm_cpu_context *host_ctxt)
    30	{
    31		if (smp_load_acquire(&pkvm_psci_notifier))
  > 32			pkvm_psci_notifier(notif, &host_ctxt->regs);
    33	}
    34	
    35	int __pkvm_register_psci_notifier(void (*cb)(enum pkvm_psci_notification, struct user_pt_regs *))
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
