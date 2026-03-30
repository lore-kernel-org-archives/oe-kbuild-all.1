Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A145F3CA491
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Mar 2026 12:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774872490; cv=none; b=euByMK8xVg5dhkW4xfN5Bem+tIIa/5Fxg+YNGcfCnUWNf+tI1CGjImcTN7bTSWWoVTslDhtYw4LvTcKmNTjaA6t+jkm/+liInM0x7Pm7Q9Abd1EcY1ltDePjS5ZBS6IFa+a7cBGp9EEINZtWMw90Oro/0L6/9ZmhoeXLiKjz9dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774872490; c=relaxed/simple;
	bh=+1AyIoogvFphLr3NnjlnRIgM8PTNLAKu7FsXKy/4A5s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dgeRj8o6gHzdJMDKjH8pugeHn59Vg75bnBBBjqS3oc7rUzTHUezIzmMgHrGeM6TBRfweddnqD9YWy1FVV9BWcA5p3TlLPYADWiwIHV1W8SbuyxUrxY0xYyBLRsmMa3i1abZqw5qCfmr7AK+3wKxTzUBi9TttQ0lSUCaS16+3gWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QyiYNDsn; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QyiYNDsn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774872489; x=1806408489;
  h=date:from:to:cc:subject:message-id;
  bh=+1AyIoogvFphLr3NnjlnRIgM8PTNLAKu7FsXKy/4A5s=;
  b=QyiYNDsnv44S395OS0KYBNlXdoSd2yNUieO98TlO6la6PHjS1c6Yv7jQ
   T2SvoMgIz9MY+WJxnusWEmRPZJfxFOV4uCRi3lidqutoLfdnuw5wrDgWQ
   YAEhEnF/qt31G87dkYELkjIL8neA8yiV+1pUMlFoy2DOzTpCRiph25I12
   4bxvrkagw8n3Es/RIlJp97ATJ5+AVEX2sWky+dbc/bZJhR5d5DXb8Xlb9
   lMQF7zOGWnF6DBs0PsB2V1fV/Ocvt+zxdLfCishSDhPRVZI0FyhF7rcud
   BkMrlj6eRMl4GKOOe8lqatEsMZOUPd1cT7DrtX/SmZTFkVPm01Uus41f8
   w==;
X-CSE-ConnectionGUID: OUIrhvaySDGhFweuUILrLg==
X-CSE-MsgGUID: /rd7pgqJRMeB+0Ubrb008g==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="86165370"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="86165370"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 05:08:07 -0700
X-CSE-ConnectionGUID: QX8PwXC4QSS27zZ8kzWavw==
X-CSE-MsgGUID: bDnBe9nfROW7hkiNeqaSXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="230084723"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 30 Mar 2026 05:08:05 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7BPW-0000000013J-1Oys;
	Mon, 30 Mar 2026 12:08:02 +0000
Date: Mon, 30 Mar 2026 20:07:07 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-poly-aosp-pixel-lajolla-staging 1/1]
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:48:42: warning: declaration of
 'struct pkvm_sglist_page' will not be visible outside of this function
Message-ID: <202603302052.MjlevCLu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common mirror-poly-aosp-pixel-lajolla-staging
head:   b050398b89b00b305b45dd70b8ab91470c42f155
commit: 93edf5c34a4239a22f09c63e965352bbeb97ad95 [1/1] ANDROID: KVM: arm64: Add __pkvm_host_donate_sglist_hyp
config: arm64-randconfig-001-20260330 (https://download.01.org/0day-ci/archive/20260330/202603302052.MjlevCLu-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 2cd67b8b69f78e3f95918204320c3075a74ba16c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260330/202603302052.MjlevCLu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603302052.MjlevCLu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp/nvhe/mm.c:18:
>> arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:48:42: warning: declaration of 'struct pkvm_sglist_page' will not be visible outside of this function [-Wvisibility]
      48 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages);
         |                                          ^
   In file included from arch/arm64/kvm/hyp/nvhe/mm.c:20:
   arch/arm64/kvm/hyp/include/nvhe/modules.h:40:6: warning: no previous prototype for function 'module_handle_host_perm_fault' [-Wmissing-prototypes]
      40 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         |      ^
   arch/arm64/kvm/hyp/include/nvhe/modules.h:40:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      40 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         | ^
         | static 
   arch/arm64/kvm/hyp/include/nvhe/modules.h:41:6: warning: no previous prototype for function 'module_handle_host_smc' [-Wmissing-prototypes]
      41 | bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         |      ^
   arch/arm64/kvm/hyp/include/nvhe/modules.h:41:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      41 | bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         | ^
         | static 
   arch/arm64/kvm/hyp/include/nvhe/modules.h:42:6: warning: no previous prototype for function 'module_handle_guest_smc' [-Wmissing-prototypes]
      42 | bool module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct arm_smccc_1_2_regs *res,
         |      ^
   arch/arm64/kvm/hyp/include/nvhe/modules.h:42:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      42 | bool module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct arm_smccc_1_2_regs *res,
         | ^
         | static 
   4 warnings generated.
--
   In file included from arch/arm64/kvm/hyp/nvhe/alloc.c:9:
>> arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:48:42: warning: declaration of 'struct pkvm_sglist_page' will not be visible outside of this function [-Wvisibility]
      48 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages);
         |                                          ^
   1 warning generated.
--
   In file included from arch/arm64/kvm/hyp/nvhe/trace.c:9:
>> arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:48:42: warning: declaration of 'struct pkvm_sglist_page' will not be visible outside of this function [-Wvisibility]
      48 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages);
         |                                          ^
   arch/arm64/kvm/hyp/nvhe/trace.c:145:49: warning: variable 'new_head' set but not used [-Wunused-but-set-variable]
     145 |         struct hyp_buffer_page *tail_page, *new_tail, *new_head;
         |                                                        ^
   2 warnings generated.
--
   In file included from arch/arm64/kvm/hyp/nvhe/mem_protect.c:21:
>> arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:48:42: warning: declaration of 'struct pkvm_sglist_page' will not be visible outside of this function [-Wvisibility]
      48 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages);
         |                                          ^
   In file included from arch/arm64/kvm/hyp/nvhe/mem_protect.c:23:
   arch/arm64/kvm/hyp/include/nvhe/modules.h:40:6: warning: no previous prototype for function 'module_handle_host_perm_fault' [-Wmissing-prototypes]
      40 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         |      ^
   arch/arm64/kvm/hyp/include/nvhe/modules.h:40:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      40 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         | ^
         | static 
   arch/arm64/kvm/hyp/include/nvhe/modules.h:41:6: warning: no previous prototype for function 'module_handle_host_smc' [-Wmissing-prototypes]
      41 | bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         |      ^
   arch/arm64/kvm/hyp/include/nvhe/modules.h:41:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      41 | bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         | ^
         | static 
   arch/arm64/kvm/hyp/include/nvhe/modules.h:42:6: warning: no previous prototype for function 'module_handle_guest_smc' [-Wmissing-prototypes]
      42 | bool module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct arm_smccc_1_2_regs *res,
         |      ^
   arch/arm64/kvm/hyp/include/nvhe/modules.h:42:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      42 | bool module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct arm_smccc_1_2_regs *res,
         | ^
         | static 
>> arch/arm64/kvm/hyp/nvhe/mem_protect.c:1492:42: warning: declaration of 'struct pkvm_sglist_page' will not be visible outside of this function [-Wvisibility]
    1492 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages)
         |                                          ^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1492:5: error: conflicting types for '__pkvm_host_donate_sglist_hyp'
    1492 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages)
         |     ^
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:48:5: note: previous declaration is here
      48 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages);
         |     ^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1500:69: error: invalid application of 'sizeof' to an incomplete type 'struct pkvm_sglist_page'
    1500 |         WARN_ON(__hyp_check_page_state_range((u64)sglist, nr_pages * sizeof(*sglist),
         |                                                                            ^~~~~~~~~
   include/asm-generic/bug.h:123:25: note: expanded from macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1492:42: note: forward declaration of 'struct pkvm_sglist_page'
    1492 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages)
         |                                          ^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1508:13: error: subscript of pointer to incomplete type 'struct pkvm_sglist_page'
    1508 |                 if (sglist[p].order > max_order) {
         |                     ~~~~~~^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1492:42: note: forward declaration of 'struct pkvm_sglist_page'
    1492 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages)
         |                                          ^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1512:29: error: subscript of pointer to incomplete type 'struct pkvm_sglist_page'
    1512 |                 size = PAGE_SIZE << sglist[p].order;
         |                                     ~~~~~~^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1492:42: note: forward declaration of 'struct pkvm_sglist_page'
    1492 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages)
         |                                          ^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1514:33: error: subscript of pointer to incomplete type 'struct pkvm_sglist_page'
    1514 |                 if (!pfn_range_is_valid(sglist[p].pfn, size >> PAGE_SHIFT)) {
         |                                         ~~~~~~^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1492:42: note: forward declaration of 'struct pkvm_sglist_page'
    1492 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages)
         |                                          ^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1518:32: error: subscript of pointer to incomplete type 'struct pkvm_sglist_page'
    1518 |                 phys = hyp_pfn_to_phys(sglist[p].pfn);
         |                                        ~~~~~~^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1492:42: note: forward declaration of 'struct pkvm_sglist_page'
    1492 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages)
         |                                          ^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1530:36: error: subscript of pointer to incomplete type 'struct pkvm_sglist_page'
    1530 |                 size_t size = PAGE_SIZE << sglist[p].order;
         |                                            ~~~~~~^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1492:42: note: forward declaration of 'struct pkvm_sglist_page'
    1492 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages)
         |                                          ^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1531:36: error: subscript of pointer to incomplete type 'struct pkvm_sglist_page'
    1531 |                 u64 phys = hyp_pfn_to_phys(sglist[p].pfn);
         |                                            ~~~~~~^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1492:42: note: forward declaration of 'struct pkvm_sglist_page'
    1492 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages)
         |                                          ^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1543:34: error: subscript of pointer to incomplete type 'struct pkvm_sglist_page'
    1543 |                                 phys = hyp_pfn_to_phys(sglist[p].pfn);
         |                                                        ~~~~~~^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1492:42: note: forward declaration of 'struct pkvm_sglist_page'
    1492 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages)
         |                                          ^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1544:31: error: subscript of pointer to incomplete type 'struct pkvm_sglist_page'
    1544 |                                 size = PAGE_SIZE << sglist[p].order;
         |                                                     ~~~~~~^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:1492:42: note: forward declaration of 'struct pkvm_sglist_page'
    1492 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages)
         |                                          ^
   5 warnings and 10 errors generated.
--
   In file included from arch/arm64/kvm/hyp/nvhe/pkvm.c:21:
>> arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:48:42: warning: declaration of 'struct pkvm_sglist_page' will not be visible outside of this function [-Wvisibility]
      48 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages);
         |                                          ^
   In file included from arch/arm64/kvm/hyp/nvhe/pkvm.c:23:
   arch/arm64/kvm/hyp/include/nvhe/modules.h:40:6: warning: no previous prototype for function 'module_handle_host_perm_fault' [-Wmissing-prototypes]
      40 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         |      ^
   arch/arm64/kvm/hyp/include/nvhe/modules.h:40:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      40 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         | ^
         | static 
   arch/arm64/kvm/hyp/include/nvhe/modules.h:41:6: warning: no previous prototype for function 'module_handle_host_smc' [-Wmissing-prototypes]
      41 | bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         |      ^
   arch/arm64/kvm/hyp/include/nvhe/modules.h:41:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      41 | bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         | ^
         | static 
   arch/arm64/kvm/hyp/include/nvhe/modules.h:42:6: warning: no previous prototype for function 'module_handle_guest_smc' [-Wmissing-prototypes]
      42 | bool module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct arm_smccc_1_2_regs *res,
         |      ^
   arch/arm64/kvm/hyp/include/nvhe/modules.h:42:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      42 | bool module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct arm_smccc_1_2_regs *res,
         | ^
         | static 
   arch/arm64/kvm/hyp/nvhe/pkvm.c:1868:8: error: call to undeclared function 'module_get_guest_trng_rng'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1868 |         ret = module_get_guest_trng_rng(entropy, nbits);
         |               ^
   arch/arm64/kvm/hyp/nvhe/pkvm.c:1868:8: note: did you mean 'module_handle_guest_trng_rng'?
   arch/arm64/kvm/hyp/nvhe/pkvm.c:1854:13: note: 'module_handle_guest_trng_rng' declared here
    1854 | static bool module_handle_guest_trng_rng(struct kvm_vcpu *vcpu)
         |             ^
    1855 | {
    1856 |         u64 ret;
    1857 |         u64 entropy[DIV_ROUND_UP(ARM_SMCCC_TRNG_SMC64_BITS, 64)];
    1858 |         u64 nbits;
    1859 | 
    1860 |         nbits = smccc_get_arg1(vcpu);
    1861 |         if (nbits == 0 || nbits > ARM_SMCCC_TRNG_SMC64_BITS) {
    1862 |                 ret = ARM_SMCCC_TRNG_INVALID_PARAMETERS;
    1863 |                 goto err;
    1864 |         }
    1865 | 
    1866 |         memset(entropy, 0, sizeof(entropy));
    1867 | 
    1868 |         ret = module_get_guest_trng_rng(entropy, nbits);
         |               ~~~~~~~~~~~~~~~~~~~~~~~~~
         |               module_handle_guest_trng_rng
   arch/arm64/kvm/hyp/nvhe/pkvm.c:1887:9: error: call to undeclared function 'module_get_guest_trng_uuid'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1887 |         uuid = module_get_guest_trng_uuid();
         |                ^
   arch/arm64/kvm/hyp/nvhe/pkvm.c:1887:7: error: incompatible integer to pointer conversion assigning to 'const uuid_t *' from 'int' [-Wint-conversion]
    1887 |         uuid = module_get_guest_trng_uuid();
         |              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   4 warnings and 3 errors generated.
--
   In file included from arch/arm64/kvm/hyp/nvhe/hyp-main.c:24:
>> arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:48:42: warning: declaration of 'struct pkvm_sglist_page' will not be visible outside of this function [-Wvisibility]
      48 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages);
         |                                          ^
   In file included from arch/arm64/kvm/hyp/nvhe/hyp-main.c:25:
   arch/arm64/kvm/hyp/include/nvhe/modules.h:40:6: warning: no previous prototype for function 'module_handle_host_perm_fault' [-Wmissing-prototypes]
      40 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         |      ^
   arch/arm64/kvm/hyp/include/nvhe/modules.h:40:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      40 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         | ^
         | static 
   arch/arm64/kvm/hyp/include/nvhe/modules.h:41:6: warning: no previous prototype for function 'module_handle_host_smc' [-Wmissing-prototypes]
      41 | bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         |      ^
   arch/arm64/kvm/hyp/include/nvhe/modules.h:41:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      41 | bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         | ^
         | static 
   arch/arm64/kvm/hyp/include/nvhe/modules.h:42:6: warning: no previous prototype for function 'module_handle_guest_smc' [-Wmissing-prototypes]
      42 | bool module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct arm_smccc_1_2_regs *res,
         |      ^
   arch/arm64/kvm/hyp/include/nvhe/modules.h:42:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      42 | bool module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct arm_smccc_1_2_regs *res,
         | ^
         | static 
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:463:22: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     463 |         [ESR_ELx_EC_WFx]                = handle_pvm_entry_wfx,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:462:28: note: previous initialization is here
     462 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:464:24: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     464 |         [ESR_ELx_EC_HVC64]              = handle_pvm_entry_hvc64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:462:28: note: previous initialization is here
     462 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:465:24: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     465 |         [ESR_ELx_EC_SYS64]              = handle_pvm_entry_sys64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:462:28: note: previous initialization is here
     462 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:466:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     466 |         [ESR_ELx_EC_IABT_LOW]           = handle_pvm_entry_iabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:462:28: note: previous initialization is here
     462 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:467:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     467 |         [ESR_ELx_EC_DABT_LOW]           = handle_pvm_entry_dabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:462:28: note: previous initialization is here
     462 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:472:22: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     472 |         [ESR_ELx_EC_WFx]                = handle_pvm_exit_wfx,
         |                                           ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:471:28: note: previous initialization is here
     471 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:473:24: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     473 |         [ESR_ELx_EC_HVC64]              = handle_pvm_exit_hvc64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:471:28: note: previous initialization is here
     471 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:474:24: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     474 |         [ESR_ELx_EC_SYS64]              = handle_pvm_exit_sys64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:471:28: note: previous initialization is here
     471 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:475:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     475 |         [ESR_ELx_EC_IABT_LOW]           = handle_pvm_exit_iabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:471:28: note: previous initialization is here
--
   In file included from arch/arm64/kvm/hyp/nvhe/psci-relay.c:15:
>> arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:48:42: warning: declaration of 'struct pkvm_sglist_page' will not be visible outside of this function [-Wvisibility]
      48 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages);
         |                                          ^
   In file included from arch/arm64/kvm/hyp/nvhe/psci-relay.c:17:
   arch/arm64/kvm/hyp/include/nvhe/modules.h:40:6: warning: no previous prototype for function 'module_handle_host_perm_fault' [-Wmissing-prototypes]
      40 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         |      ^
   arch/arm64/kvm/hyp/include/nvhe/modules.h:40:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      40 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, u64 addr) { return false; }
         | ^
         | static 
   arch/arm64/kvm/hyp/include/nvhe/modules.h:41:6: warning: no previous prototype for function 'module_handle_host_smc' [-Wmissing-prototypes]
      41 | bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         |      ^
   arch/arm64/kvm/hyp/include/nvhe/modules.h:41:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      41 | bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         | ^
         | static 
   arch/arm64/kvm/hyp/include/nvhe/modules.h:42:6: warning: no previous prototype for function 'module_handle_guest_smc' [-Wmissing-prototypes]
      42 | bool module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct arm_smccc_1_2_regs *res,
         |      ^
   arch/arm64/kvm/hyp/include/nvhe/modules.h:42:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      42 | bool module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct arm_smccc_1_2_regs *res,
         | ^
         | static 
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:30:58: error: variable has incomplete type 'enum pkvm_psci_notification'
      30 | static void pkvm_psci_notify(enum pkvm_psci_notification notif, struct kvm_cpu_context *host_ctxt)
         |                                                          ^
   arch/arm64/kvm/hyp/include/nvhe/modules.h:14:6: note: forward declaration of 'enum pkvm_psci_notification'
      14 | enum pkvm_psci_notification;
         |      ^
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:192:19: error: use of undeclared identifier 'PKVM_PSCI_CPU_SUSPEND'
     192 |         pkvm_psci_notify(PKVM_PSCI_CPU_SUSPEND, host_ctxt);
         |                          ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:223:19: error: use of undeclared identifier 'PKVM_PSCI_SYSTEM_SUSPEND'
     223 |         pkvm_psci_notify(PKVM_PSCI_SYSTEM_SUSPEND, host_ctxt);
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:254:19: error: use of undeclared identifier 'PKVM_PSCI_CPU_ENTRY'
     254 |         pkvm_psci_notify(PKVM_PSCI_CPU_ENTRY, host_ctxt);
         |                          ^~~~~~~~~~~~~~~~~~~
   4 warnings and 4 errors generated.


vim +48 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h

    40	
    41	int __pkvm_prot_finalize(void);
    42	int __pkvm_host_share_hyp(u64 pfn);
    43	int __pkvm_host_unshare_hyp(u64 pfn);
    44	int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages);
    45	int ___pkvm_host_donate_hyp(u64 pfn, u64 nr_pages, bool accept_mmio);
    46	int ___pkvm_host_donate_hyp_prot(u64 pfn, u64 nr_pages,
    47					 bool accept_mmio, enum kvm_pgtable_prot prot);
  > 48	int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size_t nr_pages);
    49	int __pkvm_hyp_donate_host(u64 pfn, u64 nr_pages);
    50	int __pkvm_guest_share_hyp_page(struct pkvm_hyp_vcpu *vcpu, u64 ipa, u64 *hyp_va);
    51	int __pkvm_guest_unshare_hyp_page(struct pkvm_hyp_vcpu *vcpu, u64 ipa);
    52	int __pkvm_guest_share_ffa_page(struct pkvm_hyp_vcpu *vcpu, u64 ipa, phys_addr_t *phys);
    53	int __pkvm_guest_unshare_ffa_page(struct pkvm_hyp_vcpu *vcpu, u64 ipa);
    54	int __pkvm_host_share_ffa(u64 pfn, u64 nr_pages);
    55	int __pkvm_host_unshare_ffa(u64 pfn, u64 nr_pages);
    56	int __pkvm_host_donate_guest(u64 pfn, u64 gfn, u64 nr_pages, struct pkvm_hyp_vcpu *vcpu);
    57	int __pkvm_host_donate_sglist_guest(struct pkvm_hyp_vcpu *vcpu);
    58	int __pkvm_host_reclaim_page_guest(u64 gfn, u64 nr_pages, struct pkvm_hyp_vm *vm);
    59	int __pkvm_guest_share_host(u64 gfn, struct pkvm_hyp_vcpu *vcpu, u64 nr_pages, u64 *nr_shared);
    60	int __pkvm_guest_unshare_host(u64 gfn, struct pkvm_hyp_vcpu *vcpu, u64 nr_pages, u64 *nr_shared);
    61	int __pkvm_host_share_guest(u64 pfn, u64 gfn, u64 nr_pages, struct pkvm_hyp_vcpu *vcpu,
    62				    enum kvm_pgtable_prot prot);
    63	int __pkvm_host_unshare_guest(u64 gfn, u64 nr_pages, struct pkvm_hyp_vm *hyp_vm);
    64	int __pkvm_host_relax_perms_guest(u64 gfn, struct pkvm_hyp_vcpu *vcpu, enum kvm_pgtable_prot prot);
    65	int __pkvm_host_wrprotect_guest(u64 gfn, u64 nr_pages, struct pkvm_hyp_vm *hyp_vm);
    66	int __pkvm_host_test_clear_young_guest(u64 gfn, u64 nr_pages, bool mkold, struct pkvm_hyp_vm *vm);
    67	int __pkvm_host_mkyoung_guest(u64 gfn, struct pkvm_hyp_vcpu *vcpu);
    68	int __pkvm_host_split_guest(u64 gfn, u64 size, struct pkvm_hyp_vcpu *vcpu);
    69	int __pkvm_host_donate_ffa(u64 pfn, u64 nr_pages);
    70	int __pkvm_host_reclaim_ffa(u64 pfn, u64 nr_pages);
    71	int __pkvm_install_ioguard_page(struct pkvm_hyp_vcpu *hyp_vcpu, u64 ipa,
    72					u64 nr_pages, u64 *nr_guarded);
    73	bool __pkvm_check_ioguard_page(struct pkvm_hyp_vcpu *hyp_vcpu);
    74	int __pkvm_guest_relinquish_to_host(struct pkvm_hyp_vcpu *vcpu,
    75					    u64 ipa, u64 *ppa);
    76	u64 __pkvm_ptdump_get_config(pkvm_handle_t handle, enum pkvm_ptdump_ops op);
    77	u64 __pkvm_ptdump_walk_range(pkvm_handle_t handle, struct pkvm_ptdump_log_hdr *log_hva);
    78	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
