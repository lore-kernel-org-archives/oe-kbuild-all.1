Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78FA32E06E6
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Apr 2026 06:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775715427; cv=none; b=JOcX4Hw74EBA6+RETTQLMwRZXhF+u2gt7/60pUjC6C0kMqSiAe3adzG7TvB9TzbWFJgxwwnoGCki5R75i9xAE4y+C3T1UNtmrJVZSQMQr1opwTtKD3ZeG9Y93ganCh8iVyPBDsj8Xa2hSLthdIwLNsDXqoU1uj0YJwgSv4+GS7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775715427; c=relaxed/simple;
	bh=PuCTJw4uXNRIb1oYIHjeguA7DxOVdrtjkxGKA/sm4Xg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZxIj+IYAxnK6QHE8v9mqXNBEj3AojnckjUX9mtCUGdnGwFjGAIhR5rjTAcpOg0sZYKhn0pYoSa7FyqAvRzpe5BkMWXKxwgw2HLQeuybFi3dMXeovY78NI4yqEG8xD1NmdA3uLDRBnPRiKoubVawSHnG7u0RaJYfYdzOd0iFkvT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W8N5obxJ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W8N5obxJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775715425; x=1807251425;
  h=date:from:to:cc:subject:message-id;
  bh=PuCTJw4uXNRIb1oYIHjeguA7DxOVdrtjkxGKA/sm4Xg=;
  b=W8N5obxJGVyC7TqECKfY0oxCebrtExuAUSOVcHenqufuZ9VF1eZTxRCu
   DbBve6xEKeB0CcQTdwyMSwdxEOMYzFvPvJ9OBvVig75EI90Wuel/7Q4pe
   +o5VdL8Kn9onCiymnG9RuYpQSDKaTqluUnp1deawbdEY/NQChpWp7DDyo
   CrQG5i7jDfRANx1KAc4V+pq1IOqsAkXbT0/LxVZfpOww/wjZZhz9aNvC7
   s+2obHPVjylcEMLGseFS/wIyiuymGkyU07hDmU96QItDMcBWojCma1pAz
   CwEWf9r+r/jALhMWjfMocrR+Y12YJFo9g9a+95PiT8UdDApZOUMVVC0tK
   g==;
X-CSE-ConnectionGUID: X/QkmnFCRS6xR/uqErpTiw==
X-CSE-MsgGUID: Lo5H5EaoQaSvlbY84CChXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="80571754"
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; 
   d="scan'208";a="80571754"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 23:16:57 -0700
X-CSE-ConnectionGUID: dmfHstEhQdmrx5Yb5uzQHg==
X-CSE-MsgGUID: FFFjeuUJSSazDs65EW8VAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; 
   d="scan'208";a="252004220"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 08 Apr 2026 23:16:55 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wAihB-00000000Ad3-0VXc;
	Thu, 09 Apr 2026 06:16:53 +0000
Date: Thu, 09 Apr 2026 08:15:53 +0200
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
 "Tycho Andersen (AMD)" <tycho@kernel.org>
Subject: [sean-jc:svm/sev_es_killed_by_firmware 16/18]
 arch/x86/kvm/svm/sev.c:3218:81: error: 'KVM_X86_SNP' undeclared; did you mean
 'KVM_X86_SNP_VM'?
Message-ID: <202604090822.8nCxRIq2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/sean-jc/linux svm/sev_es_killed_by_firmware
head:   6b5a842e2d3cb6a1eea0974e9be2e54c579f998e
commit: 91f5644d45ad2291f0d5a81a985a55219b9ec174 [16/18] KVM: SEV: don't expose unusable VM types
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260409/202604090822.8nCxRIq2-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260409/202604090822.8nCxRIq2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604090822.8nCxRIq2-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bits.h:5,
                    from include/linux/kvm_types.h:6,
                    from arch/x86/kvm/svm/sev.c:11:
   arch/x86/kvm/svm/sev.c: In function 'sev_hardware_setup':
>> arch/x86/kvm/svm/sev.c:3218:81: error: 'KVM_X86_SNP' undeclared (first use in this function); did you mean 'KVM_X86_SNP_VM'?
    3218 |                         sev_str_feature_state(sev_snp_supported, vm_types & BIT(KVM_X86_SNP)),
         |                                                                                 ^~~~~~~~~~~
   include/vdso/bits.h:7:44: note: in definition of macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                            ^~
   include/linux/printk.h:511:26: note: in expansion of macro 'printk_index_wrap'
     511 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                          ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:584:9: note: in expansion of macro 'printk'
     584 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   arch/x86/kvm/svm/sev.c:3217:17: note: in expansion of macro 'pr_info'
    3217 |                 pr_info("SEV-SNP %s (ASIDs %u - %u)\n",
         |                 ^~~~~~~
   arch/x86/kvm/svm/sev.c:3218:81: note: each undeclared identifier is reported only once for each function it appears in
    3218 |                         sev_str_feature_state(sev_snp_supported, vm_types & BIT(KVM_X86_SNP)),
         |                                                                                 ^~~~~~~~~~~
   include/vdso/bits.h:7:44: note: in definition of macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                            ^~
   include/linux/printk.h:511:26: note: in expansion of macro 'printk_index_wrap'
     511 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                          ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:584:9: note: in expansion of macro 'printk'
     584 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   arch/x86/kvm/svm/sev.c:3217:17: note: in expansion of macro 'pr_info'
    3217 |                 pr_info("SEV-SNP %s (ASIDs %u - %u)\n",
         |                 ^~~~~~~
   arch/x86/kvm/svm/sev.c:3268:13: error: invalid storage class for function 'sev_flush_encrypted_page'
    3268 | static void sev_flush_encrypted_page(struct kvm_vcpu *vcpu, void *va)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/svm/sev.c:3354:13: error: invalid storage class for function 'dump_ghcb'
    3354 | static void dump_ghcb(struct vcpu_svm *svm)
         |             ^~~~~~~~~
   arch/x86/kvm/svm/sev.c:3385:13: error: invalid storage class for function 'sev_es_sync_to_ghcb'
    3385 | static void sev_es_sync_to_ghcb(struct vcpu_svm *svm)
         |             ^~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/svm/sev.c:3404:13: error: invalid storage class for function 'sev_es_sync_from_ghcb'
    3404 | static void sev_es_sync_from_ghcb(struct vcpu_svm *svm)
         |             ^~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/svm/sev.c:3451:12: error: invalid storage class for function 'sev_es_validate_vmgexit'
    3451 | static int sev_es_validate_vmgexit(struct vcpu_svm *svm)
         |            ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/svm/sev.c:3672:12: error: invalid storage class for function 'setup_vmgexit_scratch'
    3672 | static int setup_vmgexit_scratch(struct vcpu_svm *svm, bool sync, u64 len)
         |            ^~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/svm/sev.c:3755:13: error: invalid storage class for function 'set_ghcb_msr_bits'
    3755 | static void set_ghcb_msr_bits(struct vcpu_svm *svm, u64 value, u64 mask,
         |             ^~~~~~~~~~~~~~~~~
   arch/x86/kvm/svm/sev.c:3762:12: error: invalid storage class for function 'get_ghcb_msr_bits'
    3762 | static u64 get_ghcb_msr_bits(struct vcpu_svm *svm, u64 mask, unsigned int pos)
         |            ^~~~~~~~~~~~~~~~~
   arch/x86/kvm/svm/sev.c:3767:13: error: invalid storage class for function 'set_ghcb_msr'
    3767 | static void set_ghcb_msr(struct vcpu_svm *svm, u64 value)
         |             ^~~~~~~~~~~~
   arch/x86/kvm/svm/sev.c:3772:12: error: invalid storage class for function 'snp_rmptable_psmash'
    3772 | static int snp_rmptable_psmash(kvm_pfn_t pfn)
         |            ^~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/svm/sev.c:3789:12: error: invalid storage class for function 'snp_complete_psc_msr'
    3789 | static int snp_complete_psc_msr(struct kvm_vcpu *vcpu)
         |            ^~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/svm/sev.c:3801:12: error: invalid storage class for function 'snp_begin_psc_msr'
    3801 | static int snp_begin_psc_msr(struct vcpu_svm *svm, u64 ghcb_msr)
         |            ^~~~~~~~~~~~~~~~~
   arch/x86/kvm/svm/sev.c:3843:12: error: invalid storage class for function 'snp_begin_psc'
    3843 | static int snp_begin_psc(struct vcpu_svm *svm, struct psc_buffer *psc);
         |            ^~~~~~~~~~~~~
   arch/x86/kvm/svm/sev.c:3845:13: error: invalid storage class for function 'snp_complete_psc'
    3845 | static void snp_complete_psc(struct vcpu_svm *svm, u64 psc_ret)
         |             ^~~~~~~~~~~~~~~~
   arch/x86/kvm/svm/sev.c:3860:13: error: invalid storage class for function '__snp_complete_one_psc'
    3860 | static void __snp_complete_one_psc(struct vcpu_svm *svm)
         |             ^~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/svm/sev.c:3882:12: error: invalid storage class for function 'snp_complete_one_psc'
    3882 | static int snp_complete_one_psc(struct kvm_vcpu *vcpu)
         |            ^~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/svm/sev.c: In function 'snp_complete_one_psc':
   arch/x86/kvm/svm/sev.c:3895:16: error: implicit declaration of function 'snp_begin_psc'; did you mean 'snp_begin_psc_msr'? [-Wimplicit-function-declaration]
    3895 |         return snp_begin_psc(svm, psc);
         |                ^~~~~~~~~~~~~
         |                snp_begin_psc_msr
   arch/x86/kvm/svm/sev.c: In function 'sev_hardware_setup':
   arch/x86/kvm/svm/sev.c:3898:12: error: invalid storage class for function 'snp_begin_psc'
    3898 | static int snp_begin_psc(struct vcpu_svm *svm, struct psc_buffer *psc)
         |            ^~~~~~~~~~~~~
   arch/x86/kvm/svm/sev.c:4032:13: error: invalid storage class for function 'sev_snp_init_protected_guest_state'
    4032 | static void sev_snp_init_protected_guest_state(struct kvm_vcpu *vcpu)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/svm/sev.c:4102:12: error: invalid storage class for function 'sev_snp_ap_creation'
    4102 | static int sev_snp_ap_creation(struct vcpu_svm *svm)
         |            ^~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/svm/sev.c:4178:12: error: invalid storage class for function 'snp_handle_guest_req'
    4178 | static int snp_handle_guest_req(struct vcpu_svm *svm, gpa_t req_gpa, gpa_t resp_gpa)
         |            ^~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/svm/sev.c:4217:12: error: invalid storage class for function 'snp_req_certs_err'
    4217 | static int snp_req_certs_err(struct vcpu_svm *svm, u32 vmm_error)
         |            ^~~~~~~~~~~~~~~~~
   arch/x86/kvm/svm/sev.c:4224:12: error: invalid storage class for function 'snp_complete_req_certs'
    4224 | static int snp_complete_req_certs(struct kvm_vcpu *vcpu)


vim +3218 arch/x86/kvm/svm/sev.c

  3057	
  3058	void __init sev_hardware_setup(void)
  3059	{
  3060		unsigned int eax, ebx, ecx, edx, sev_asid_count, sev_es_asid_count;
  3061		struct sev_platform_init_args init_args = {0};
  3062		bool sev_snp_supported = false;
  3063		bool sev_es_supported = false;
  3064		bool sev_supported = false;
  3065		u32 vm_types = 0;
  3066	
  3067		if (!sev_enabled || !npt_enabled || !nrips)
  3068			goto out;
  3069	
  3070		/*
  3071		 * SEV must obviously be supported in hardware.  Sanity check that the
  3072		 * CPU supports decode assists, which is mandatory for SEV guests to
  3073		 * support instruction emulation.  Ditto for flushing by ASID, as SEV
  3074		 * guests are bound to a single ASID, i.e. KVM can't rotate to a new
  3075		 * ASID to effect a TLB flush.
  3076		 */
  3077		if (!boot_cpu_has(X86_FEATURE_SEV) ||
  3078		    WARN_ON_ONCE(!boot_cpu_has(X86_FEATURE_DECODEASSISTS)) ||
  3079		    WARN_ON_ONCE(!boot_cpu_has(X86_FEATURE_FLUSHBYASID)))
  3080			goto out;
  3081	
  3082		/*
  3083		 * The kernel's initcall infrastructure lacks the ability to express
  3084		 * dependencies between initcalls, whereas the modules infrastructure
  3085		 * automatically handles dependencies via symbol loading.  Ensure the
  3086		 * PSP SEV driver is initialized before proceeding if KVM is built-in,
  3087		 * as the dependency isn't handled by the initcall infrastructure.
  3088		 */
  3089		if (IS_BUILTIN(CONFIG_KVM_AMD) && sev_module_init())
  3090			goto out;
  3091	
  3092		/* Retrieve SEV CPUID information */
  3093		cpuid(0x8000001f, &eax, &ebx, &ecx, &edx);
  3094	
  3095		/* Set encryption bit location for SEV-ES guests */
  3096		sev_enc_bit = ebx & 0x3f;
  3097	
  3098		/* Maximum number of encrypted guests supported simultaneously */
  3099		max_sev_asid = ecx;
  3100		if (!max_sev_asid)
  3101			goto out;
  3102	
  3103		/* Minimum ASID value that should be used for SEV guest */
  3104		min_sev_asid = edx;
  3105		sev_me_mask = 1UL << (ebx & 0x3f);
  3106	
  3107		/*
  3108		 * Initialize SEV ASID bitmaps. Allocate space for ASID 0 in the bitmap,
  3109		 * even though it's never used, so that the bitmap is indexed by the
  3110		 * actual ASID.
  3111		 */
  3112		nr_asids = max_sev_asid + 1;
  3113		sev_asid_bitmap = bitmap_zalloc(nr_asids, GFP_KERNEL);
  3114		if (!sev_asid_bitmap)
  3115			goto out;
  3116	
  3117		sev_reclaim_asid_bitmap = bitmap_zalloc(nr_asids, GFP_KERNEL);
  3118		if (!sev_reclaim_asid_bitmap) {
  3119			bitmap_free(sev_asid_bitmap);
  3120			sev_asid_bitmap = NULL;
  3121			goto out;
  3122		}
  3123	
  3124		if (min_sev_asid <= max_sev_asid) {
  3125			sev_asid_count = max_sev_asid - min_sev_asid + 1;
  3126			WARN_ON_ONCE(misc_cg_set_capacity(MISC_CG_RES_SEV, sev_asid_count));
  3127		}
  3128		sev_supported = true;
  3129	
  3130		/* SEV-ES support requested? */
  3131		if (!sev_es_enabled)
  3132			goto out;
  3133	
  3134		/*
  3135		 * SEV-ES requires MMIO caching as KVM doesn't have access to the guest
  3136		 * instruction stream, i.e. can't emulate in response to a #NPF and
  3137		 * instead relies on #NPF(RSVD) being reflected into the guest as #VC
  3138		 * (the guest can then do a #VMGEXIT to request MMIO emulation).
  3139		 */
  3140		if (!enable_mmio_caching)
  3141			goto out;
  3142	
  3143		/* Does the CPU support SEV-ES? */
  3144		if (!boot_cpu_has(X86_FEATURE_SEV_ES))
  3145			goto out;
  3146	
  3147		if (!lbrv) {
  3148			WARN_ONCE(!boot_cpu_has(X86_FEATURE_LBRV),
  3149				  "LBRV must be present for SEV-ES support");
  3150			goto out;
  3151		}
  3152	
  3153		/* Has the system been allocated ASIDs for SEV-ES? */
  3154		if (min_sev_asid == 1)
  3155			goto out;
  3156	
  3157		min_sev_es_asid = min_snp_asid = 1;
  3158		max_sev_es_asid = max_snp_asid = min_sev_asid - 1;
  3159	
  3160		sev_es_asid_count = min_sev_asid - 1;
  3161		WARN_ON_ONCE(misc_cg_set_capacity(MISC_CG_RES_SEV_ES, sev_es_asid_count));
  3162		sev_es_supported = true;
  3163		sev_snp_supported = sev_snp_enabled && cc_platform_has(CC_ATTR_HOST_SEV_SNP);
  3164	
  3165	out:
  3166		if (sev_enabled) {
  3167			init_args.probe = true;
  3168	
  3169			if (sev_is_snp_ciphertext_hiding_supported())
  3170				init_args.max_snp_asid = min(nr_ciphertext_hiding_asids,
  3171							     min_sev_asid - 1);
  3172	
  3173			if (sev_platform_init(&init_args))
  3174				sev_supported = sev_es_supported = sev_snp_supported = false;
  3175			else if (sev_snp_supported)
  3176				sev_snp_supported = is_sev_snp_initialized();
  3177	
  3178			if (sev_snp_supported) {
  3179				snp_supported_policy_bits = sev_get_snp_policy_bits() &
  3180							    KVM_SNP_POLICY_MASK_VALID;
  3181				nr_ciphertext_hiding_asids = init_args.max_snp_asid;
  3182			}
  3183	
  3184			/*
  3185			 * If ciphertext hiding is enabled, the joint SEV-ES/SEV-SNP
  3186			 * ASID range is partitioned into separate SEV-ES and SEV-SNP
  3187			 * ASID ranges, with the SEV-SNP range being [1..max_snp_asid]
  3188			 * and the SEV-ES range being (max_snp_asid..max_sev_es_asid].
  3189			 * Note, SEV-ES may effectively be disabled if all ASIDs from
  3190			 * the joint range are assigned to SEV-SNP.
  3191			 */
  3192			if (nr_ciphertext_hiding_asids) {
  3193				max_snp_asid = nr_ciphertext_hiding_asids;
  3194				min_sev_es_asid = max_snp_asid + 1;
  3195				pr_info("SEV-SNP ciphertext hiding enabled\n");
  3196			}
  3197		}
  3198	
  3199		if (sev_supported && min_sev_asid <= max_sev_asid) {
  3200			vm_types |= BIT(KVM_X86_SEV_VM);
  3201		if (sev_es_supported && min_sev_es_asid <= max_sev_es_asid)
  3202			vm_types |= BIT(KVM_X86_SEV_ES_VM);
  3203		if (sev_snp_supported) {
  3204			vm_types |= BIT(KVM_X86_SNP_VM);
  3205	
  3206		kvm_caps.supported_vm_types |= vm_types;
  3207	
  3208		if (boot_cpu_has(X86_FEATURE_SEV))
  3209			pr_info("SEV %s (ASIDs %u - %u)\n",
  3210				sev_str_feature_state(sev_supported, vm_types & BIT(KVM_X86_SEV_VM)),
  3211				min_sev_asid, max_sev_asid);
  3212		if (boot_cpu_has(X86_FEATURE_SEV_ES))
  3213			pr_info("SEV-ES %s (ASIDs %u - %u)\n",
  3214				sev_str_feature_state(sev_es_supported, vm_types & BIT(KVM_X86_SEV_ES_VM)),
  3215				min_sev_es_asid, max_sev_es_asid);
  3216		if (boot_cpu_has(X86_FEATURE_SEV_SNP))
  3217			pr_info("SEV-SNP %s (ASIDs %u - %u)\n",
> 3218				sev_str_feature_state(sev_snp_supported, vm_types & BIT(KVM_X86_SNP)),
  3219				min_snp_asid, max_snp_asid);
  3220	
  3221		sev_enabled = sev_supported;
  3222		sev_es_enabled = sev_es_supported;
  3223		sev_snp_enabled = sev_snp_supported;
  3224	
  3225		sev_supported_vmsa_features = 0;
  3226	
  3227		if (sev_es_enabled && cpu_feature_enabled(X86_FEATURE_DEBUG_SWAP) &&
  3228		    cpu_feature_enabled(X86_FEATURE_NO_NESTED_DATA_BP))
  3229			sev_supported_vmsa_features |= SVM_SEV_FEAT_DEBUG_SWAP;
  3230	
  3231		if (sev_snp_enabled && tsc_khz && cpu_feature_enabled(X86_FEATURE_SNP_SECURE_TSC))
  3232			sev_supported_vmsa_features |= SVM_SEV_FEAT_SECURE_TSC;
  3233	}
  3234	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
