Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C5C1E87E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Mar 2024 23:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710978512; cv=none; b=qoAyvVsD3p4jpAdkJCKd9XlqFsaBNDtvefPpmNYfivjW+sjEG/8unZ9NTcZuqomg90eSx4Ert1bpDnG2FzxUJnG/m02ttRpHsnPjCrici9fEcPzvEg+v7ADtlVll2+XZmjvRBNOzBKz58SaXbYasBDdLq9x1scvxFLISUJ4My6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710978512; c=relaxed/simple;
	bh=57lrx6iSbXemQQpdOlxh96Dti83TjnAeIiw2En3DHyg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dfajDLf4YyRJ4IlzIYNH+WdECGXi9g1pUSz1kkKzs06fDK48KKhhkjUreV0/BUGP3hjOqIHADP40jipKMs8KGXh6x1Tb7wI4PXmNolekFL3UiDU8A3aXShdf4jL2b7QeIQCiJ24an/IqE+VKeUWtRyPzpsKYBv/bKNOFovCqcMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RQohIhQc; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RQohIhQc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710978508; x=1742514508;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=57lrx6iSbXemQQpdOlxh96Dti83TjnAeIiw2En3DHyg=;
  b=RQohIhQc3znc6rDcUXR52+tqqaaQIUIjS+R3DF8wV5vsURFw6q6bvID5
   Hz0mE6Kjd/aPanpDs40w5g37vAuYUjbUf7qg8z211rfWfR9CIvLIcv206
   DkGBbgh7CY2rKzyFZHL7U5QZcFiJvEq0ug89XWsgOIndnMUh4vFbQu8mC
   KpNoLl1j4u3tBdSdLMc2AjgLnHLfDI2Qg8xkwT5elrLzMJ5g7CqbwlPrL
   54Vzy27HZO+Fc45R3u0f/d7kSg0/K42eCEuBeb+YOcg4D+kRgVIThtgZP
   Kz6Ku+0BcZ7WmxIv/b+vkALFwYdTdOE9aFNLA3YVVXQfCEJvYs/1x4874
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="6120443"
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; 
   d="scan'208";a="6120443"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2024 16:48:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; 
   d="scan'208";a="14214465"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 20 Mar 2024 16:48:27 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rn5fV-000J0d-0N;
	Wed, 20 Mar 2024 23:48:25 +0000
Date: Thu, 21 Mar 2024 07:47:25 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.1 1/3]
 arch/arm64/kvm/hyp/nvhe/hyp-main.c:770:6: warning: unused variable 'zcr_el2'
Message-ID: <202403210724.yOiHufN8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.1
head:   d1835065fcfdece30b2393babca1371041d5f5e2
commit: c432f4f2755c515bb9b15a7253d0f249a6a946cc [1/3] ANDROID: KVM: arm64: Use active guest SVE vector length on save/restore
config: arm64-randconfig-001-20240321 (https://download.01.org/0day-ci/archive/20240321/202403210724.yOiHufN8-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 8f68022f8e6e54d1aeae4ed301f5a015963089b7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240321/202403210724.yOiHufN8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403210724.yOiHufN8-lkp@intel.com/

All warnings (new ones prefixed by >>):

         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:473:28: note: previous initialization is here
     473 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:475:24: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     475 |         [ESR_ELx_EC_HVC64]              = handle_pvm_entry_hvc64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:473:28: note: previous initialization is here
     473 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:476:24: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     476 |         [ESR_ELx_EC_SYS64]              = handle_pvm_entry_sys64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:473:28: note: previous initialization is here
     473 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:477:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     477 |         [ESR_ELx_EC_IABT_LOW]           = handle_pvm_entry_iabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:473:28: note: previous initialization is here
     473 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:478:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     478 |         [ESR_ELx_EC_DABT_LOW]           = handle_pvm_entry_dabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:473:28: note: previous initialization is here
     473 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:483:22: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     483 |         [ESR_ELx_EC_WFx]                = handle_pvm_exit_wfx,
         |                                           ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:482:28: note: previous initialization is here
     482 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:484:24: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     484 |         [ESR_ELx_EC_HVC64]              = handle_pvm_exit_hvc64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:482:28: note: previous initialization is here
     482 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:485:24: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     485 |         [ESR_ELx_EC_SYS64]              = handle_pvm_exit_sys64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:482:28: note: previous initialization is here
     482 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:486:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     486 |         [ESR_ELx_EC_IABT_LOW]           = handle_pvm_exit_iabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:482:28: note: previous initialization is here
     482 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:487:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     487 |         [ESR_ELx_EC_DABT_LOW]           = handle_pvm_exit_dabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:482:28: note: previous initialization is here
     482 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:496:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     496 |         [ESR_ELx_EC_IABT_LOW]           = handle_vm_exit_abt,
         |                                           ^~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:495:28: note: previous initialization is here
     495 |         [0 ... ESR_ELx_EC_MAX]          = handle_vm_exit_generic,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:497:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     497 |         [ESR_ELx_EC_DABT_LOW]           = handle_vm_exit_abt,
         |                                           ^~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:495:28: note: previous initialization is here
     495 |         [0 ... ESR_ELx_EC_MAX]          = handle_vm_exit_generic,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/hyp/nvhe/hyp-main.c:770:6: warning: unused variable 'zcr_el2' [-Wunused-variable]
     770 |         u64 zcr_el2 = min(zcr_el1, vcpu_sve_max_vq(vcpu) - 1ULL);
         |             ^~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:799:8: warning: unused variable 'vq_len' [-Wunused-variable]
     799 |                         u64 vq_len = sve_vq_from_vl(kvm_host_sve_max_vl) - 1;
         |                             ^~~~~~
   16 warnings and 1 error generated.
--
   In file included from arch/arm64/kvm/hyp/nvhe/switch.c:7:
   In file included from arch/arm64/kvm/hyp/include/hyp/switch.h:10:
   In file included from arch/arm64/kvm/hyp/include/hyp/adjust_pc.h:13:
   In file included from arch/arm64/include/asm/kvm_emulate.h:14:
   In file included from include/linux/kvm_host.h:16:
   In file included from include/linux/mm.h:2025:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from arch/arm64/kvm/hyp/nvhe/switch.c:7:
>> arch/arm64/kvm/hyp/include/hyp/switch.h:246:6: warning: unused variable 'zcr_el2' [-Wunused-variable]
     246 |         u64 zcr_el2 = min(zcr_el1, vcpu_sve_max_vq(vcpu) - 1ULL);
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
   arch/arm64/kvm/hyp/nvhe/switch.c:234:26: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     234 |         [ESR_ELx_EC_CP15_32]            = kvm_hyp_handle_cp15_32,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:233:28: note: previous initialization is here
     233 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:235:24: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     235 |         [ESR_ELx_EC_HVC64]              = kvm_hyp_handle_hvc64,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:233:28: note: previous initialization is here
     233 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:236:24: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     236 |         [ESR_ELx_EC_SYS64]              = kvm_hyp_handle_sysreg,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:233:28: note: previous initialization is here
     233 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:237:22: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     237 |         [ESR_ELx_EC_SVE]                = kvm_hyp_handle_fpsimd,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:233:28: note: previous initialization is here
     233 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:238:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     238 |         [ESR_ELx_EC_FP_ASIMD]           = kvm_hyp_handle_fpsimd,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:233:28: note: previous initialization is here
     233 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:239:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     239 |         [ESR_ELx_EC_IABT_LOW]           = kvm_hyp_handle_iabt_low,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:233:28: note: previous initialization is here
     233 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:240:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     240 |         [ESR_ELx_EC_DABT_LOW]           = kvm_hyp_handle_dabt_low,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:233:28: note: previous initialization is here
     233 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:241:29: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     241 |         [ESR_ELx_EC_WATCHPT_LOW]        = kvm_hyp_handle_watchpt_low,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:233:28: note: previous initialization is here
     233 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:242:22: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     242 |         [ESR_ELx_EC_PAC]                = kvm_hyp_handle_ptrauth,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:233:28: note: previous initialization is here
     233 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:247:24: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     247 |         [ESR_ELx_EC_HVC64]              = kvm_handle_pvm_hvc64,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:246:28: note: previous initialization is here
     246 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
--
   In file included from arch/arm64/kvm/hyp/vhe/switch.c:7:
   In file included from arch/arm64/kvm/hyp/include/hyp/switch.h:10:
   In file included from arch/arm64/kvm/hyp/include/hyp/adjust_pc.h:13:
   In file included from arch/arm64/include/asm/kvm_emulate.h:14:
   In file included from include/linux/kvm_host.h:16:
   In file included from include/linux/mm.h:2025:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from arch/arm64/kvm/hyp/vhe/switch.c:7:
>> arch/arm64/kvm/hyp/include/hyp/switch.h:246:6: warning: unused variable 'zcr_el2' [-Wunused-variable]
     246 |         u64 zcr_el2 = min(zcr_el1, vcpu_sve_max_vq(vcpu) - 1ULL);
         |             ^~~~~~~
   arch/arm64/kvm/hyp/vhe/switch.c:166:26: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     166 |         [ESR_ELx_EC_CP15_32]            = kvm_hyp_handle_cp15_32,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/vhe/switch.c:165:28: note: previous initialization is here
     165 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/vhe/switch.c:167:24: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     167 |         [ESR_ELx_EC_SYS64]              = kvm_hyp_handle_sysreg,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/vhe/switch.c:165:28: note: previous initialization is here
     165 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/vhe/switch.c:168:22: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     168 |         [ESR_ELx_EC_SVE]                = kvm_hyp_handle_fpsimd,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/vhe/switch.c:165:28: note: previous initialization is here
     165 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/vhe/switch.c:169:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     169 |         [ESR_ELx_EC_FP_ASIMD]           = kvm_hyp_handle_fpsimd,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/vhe/switch.c:165:28: note: previous initialization is here
     165 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/vhe/switch.c:170:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     170 |         [ESR_ELx_EC_IABT_LOW]           = kvm_hyp_handle_iabt_low,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/vhe/switch.c:165:28: note: previous initialization is here
     165 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/vhe/switch.c:171:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     171 |         [ESR_ELx_EC_DABT_LOW]           = kvm_hyp_handle_dabt_low,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/vhe/switch.c:165:28: note: previous initialization is here
     165 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/vhe/switch.c:172:29: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     172 |         [ESR_ELx_EC_WATCHPT_LOW]        = kvm_hyp_handle_watchpt_low,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/vhe/switch.c:165:28: note: previous initialization is here
     165 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/vhe/switch.c:173:22: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     173 |         [ESR_ELx_EC_PAC]                = kvm_hyp_handle_ptrauth,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/vhe/switch.c:165:28: note: previous initialization is here
     165 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   10 warnings generated.


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
