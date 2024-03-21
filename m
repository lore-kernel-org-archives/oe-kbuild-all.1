Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BE858AC6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Mar 2024 12:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711022928; cv=none; b=d0LaCPoqdvpgnuJplCcRW5nZGdsew9YhJ2wuSMdDQnHZ+jy1tV416Y6z+o3yhW51N+/FdPp1C5FGVq1nxWz0eScp9uhVTaJuiN1hzLZCWO9D8WjH0e/kBxwuWSQa1AzQwLhC5jFzRWSKSu+gi9MgRMXiOQUH3KckfJePYttbixk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711022928; c=relaxed/simple;
	bh=lC8Ru0kILHyDZUTZH8keiS8r3cz8sYNt9mi4qZOycd0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dMYk4SFagkzwFPaY3IfuMUAuzoWHMqJP/avp2SC9Zs4yUZeFKuyD05eLU9mvY9ry8pyHp+hcKY31o9NkXpY/x5Hg0xDFpfuc4SEbqLWo/Pef9EXswg+1In1RkfuVdXb/j4C8oxrr1x78JwVOo48SCuXxnKHnIlRgApA2Rl7M3gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mS6+9Dv4; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mS6+9Dv4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711022927; x=1742558927;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lC8Ru0kILHyDZUTZH8keiS8r3cz8sYNt9mi4qZOycd0=;
  b=mS6+9Dv4zwyz5YuYmXmK/lrdZov7CAkWyEeNzrqCakjyrSTzmUsH9AL1
   V56ZaBZ34FBMltsRN5X1CBlVdz4OrcorRJwSO+mSRwUHDLJkIP8hpwQKk
   c8Xht3kg9F0q8uZ9uPJgE8bq6vLzouinVSeJm2FJyrqE3HLnEasW2IRUu
   Sz/F4YrbcU1jGnAKCIN/zMVezEuLzIDQWqKC1AfwVtuiQtv0SuMJI9wIY
   P+VxCqDJrMdDkZCfustx1xJOXVQMYPjUmQPGcxZMZ2khU5mwFpqxsdriA
   wTp1L6jBGbDW9Bus2xwF73MxiGp8JovDY1+Z65bppWTgMJJV7EwzNx25V
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="28478063"
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; 
   d="scan'208";a="28478063"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2024 05:08:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; 
   d="scan'208";a="19198903"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 21 Mar 2024 05:08:45 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rnHDu-000JOh-2R;
	Thu, 21 Mar 2024 12:08:42 +0000
Date: Thu, 21 Mar 2024 20:08:15 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.1 3/3]
 arch/arm64/kvm/hyp/nvhe/hyp-main.c:1652:32: error: incompatible pointer
 types passing 'struct user_pt_regs *' to parameter of type 'struct
 kvm_cpu_context *'
Message-ID: <202403212047.oJcQH2FZ-lkp@intel.com>
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
commit: c14320efd5013486fe04ed5583c68d1a02e87e47 [3/3] ANDROID: KVM: arm64: Fix missing mask for custom hypercall handling
config: arm64-randconfig-002-20240321 (https://download.01.org/0day-ci/archive/20240321/202403212047.oJcQH2FZ-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 8f68022f8e6e54d1aeae4ed301f5a015963089b7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240321/202403212047.oJcQH2FZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403212047.oJcQH2FZ-lkp@intel.com/

All errors (new ones prefixed by >>):

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
>> arch/arm64/kvm/hyp/nvhe/hyp-main.c:1652:32: error: incompatible pointer types passing 'struct user_pt_regs *' to parameter of type 'struct kvm_cpu_context *' [-Werror,-Wincompatible-pointer-types]
    1652 |         if (handle_host_dynamic_hcall(&host_ctxt->regs, id) == HCALL_HANDLED)
         |                                       ^~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:25:51: note: passing argument to parameter 'host_ctxt' here
      25 | handle_host_dynamic_hcall(struct kvm_cpu_context *host_ctxt, int id)
         |                                                   ^
   18 warnings and 2 errors generated.


vim +1652 arch/arm64/kvm/hyp/nvhe/hyp-main.c

  1630	
  1631	static void handle_host_hcall(struct kvm_cpu_context *host_ctxt)
  1632	{
  1633		DECLARE_REG(unsigned long, id, host_ctxt, 0);
  1634		unsigned long hcall_min = 0;
  1635		hcall_t hfn;
  1636	
  1637		/*
  1638		 * If pKVM has been initialised then reject any calls to the
  1639		 * early "privileged" hypercalls. Note that we cannot reject
  1640		 * calls to __pkvm_prot_finalize for two reasons: (1) The static
  1641		 * key used to determine initialisation must be toggled prior to
  1642		 * finalisation and (2) finalisation is performed on a per-CPU
  1643		 * basis. This is all fine, however, since __pkvm_prot_finalize
  1644		 * returns -EPERM after the first call for a given CPU.
  1645		 */
  1646		if (static_branch_unlikely(&kvm_protected_mode_initialized))
  1647			hcall_min = __KVM_HOST_SMCCC_FUNC___pkvm_prot_finalize;
  1648	
  1649		id &= ~ARM_SMCCC_CALL_HINTS;
  1650		id -= KVM_HOST_SMCCC_ID(0);
  1651	
> 1652		if (handle_host_dynamic_hcall(&host_ctxt->regs, id) == HCALL_HANDLED)
  1653			goto end;
  1654	
  1655		if (unlikely(id < hcall_min || id >= ARRAY_SIZE(host_hcall)))
  1656			goto inval;
  1657	
  1658		hfn = host_hcall[id];
  1659		if (unlikely(!hfn))
  1660			goto inval;
  1661	
  1662		cpu_reg(host_ctxt, 0) = SMCCC_RET_SUCCESS;
  1663		hfn(host_ctxt);
  1664	end:
  1665		trace_host_hcall(id, 0);
  1666	
  1667		return;
  1668	inval:
  1669		trace_host_hcall(id, 1);
  1670		cpu_reg(host_ctxt, 0) = SMCCC_RET_NOT_SUPPORTED;
  1671	}
  1672	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
