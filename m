Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4250D848C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Oct 2024 01:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729732352; cv=none; b=ClmeVyfKmP1YbkGcIJB/ufxgtnQcayg14F5TTMjp/v3IG/3Osvg53WVJNvUCIQ/i8eCxnDa81zDfPFdPdL8ndOawFIxC8jIwftdocPRgaXMX5zAg3WrilAOmaNwVw2YtFKkmq1XX70JN0FK/WrRPXjkKHVwIrZ/VIuuzwA3Cjvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729732352; c=relaxed/simple;
	bh=hQsyUnCosxajBDt8AMuHiOiBvqAfDLZz0HvqkvreKnU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W9R0oXDoQk1hl9TdvX4LwisTCWl3GaWp6/FMfZZLZSVnUdSCMji+73AAUi+E/AsieGQGUS0vtSOIcCUI0VqpLx/b6vTRbgupWgJ+jRtjnhUq4guh57T6Rr/pjbWt+AbKl1jsMyhNvllzQR9fhC7hwDYlYD4DAK0GZn4ONsvF0kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SKTx5QZR; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SKTx5QZR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729732350; x=1761268350;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hQsyUnCosxajBDt8AMuHiOiBvqAfDLZz0HvqkvreKnU=;
  b=SKTx5QZRxLLF9lX1WR3gEwk8nCOQxaC8bOKyUghRGwhwu04PTVUuiNzG
   KAdTGwU7EL2AnJgDfYtl3Hnk0BuJsoNnijBlR3u+FxsCbwVucc30w5onu
   KSXFgkhl9yBI6ebH40Rv4lDzfFWvt6A/eN//de/nt1+D80kBh+efl2ilE
   VO67gzIJitxRmdssr1+FnJyf8//SVThii6TCWj24kl8orOVZ2kxrXrg1d
   PPXGR7jFGvFmPv9uLCeDuR1ckQfrB0u9WVWo+FaTjE71D4vkpiROwqR25
   ntwz/MVCvIXJKrHSnPrB5/X6EgGrsiqfEebHAGYogpbOZlckTDckxvS9y
   Q==;
X-CSE-ConnectionGUID: /0biCllbSJCMu7Tl7OLSAw==
X-CSE-MsgGUID: eRP6g2AcS2+/3Pwcpufljw==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="39930105"
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; 
   d="scan'208";a="39930105"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 18:12:29 -0700
X-CSE-ConnectionGUID: gBlfN0N0QHCmrHbIjmkVZQ==
X-CSE-MsgGUID: rbC9hkwRS+WejJPeJZOJow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; 
   d="scan'208";a="80356654"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 23 Oct 2024 18:12:28 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3mOo-000Vmn-0z;
	Thu, 24 Oct 2024 01:12:26 +0000
Date: Thu, 24 Oct 2024 09:12:11 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 2/2]
 arch/arm64/kvm/hyp/nvhe/hyp-main.c:1652:39: error: passing argument 1 of
 'handle_host_dynamic_hcall' from incompatible pointer type
Message-ID: <202410240906.LglEuwhg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   7f1ad2ebaa24958e3b0527f36d96e58f42cf3f0e
commit: 718bf2535e3912862e7f3aedb4a04f7377e7af3b [2/2] ANDROID: KVM: arm64: Fix missing mask for custom hypercall handling
config: arm64-randconfig-003-20241024 (https://download.01.org/0day-ci/archive/20241024/202410240906.LglEuwhg-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241024/202410240906.LglEuwhg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410240906.LglEuwhg-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kvm/hyp/nvhe/hyp-main.c:88:6: warning: no previous prototype for '__pkvm_unmask_serror' [-Wmissing-prototypes]
      88 | void __pkvm_unmask_serror(void)
         |      ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:474:43: warning: initialized field overwritten [-Woverride-init]
     474 |         [ESR_ELx_EC_WFx]                = handle_pvm_entry_wfx,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:474:43: note: (near initialization for 'entry_hyp_pvm_handlers[1]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:475:43: warning: initialized field overwritten [-Woverride-init]
     475 |         [ESR_ELx_EC_HVC64]              = handle_pvm_entry_hvc64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:475:43: note: (near initialization for 'entry_hyp_pvm_handlers[22]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:476:43: warning: initialized field overwritten [-Woverride-init]
     476 |         [ESR_ELx_EC_SYS64]              = handle_pvm_entry_sys64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:476:43: note: (near initialization for 'entry_hyp_pvm_handlers[24]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:477:43: warning: initialized field overwritten [-Woverride-init]
     477 |         [ESR_ELx_EC_IABT_LOW]           = handle_pvm_entry_iabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:477:43: note: (near initialization for 'entry_hyp_pvm_handlers[32]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:478:43: warning: initialized field overwritten [-Woverride-init]
     478 |         [ESR_ELx_EC_DABT_LOW]           = handle_pvm_entry_dabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:478:43: note: (near initialization for 'entry_hyp_pvm_handlers[36]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:483:43: warning: initialized field overwritten [-Woverride-init]
     483 |         [ESR_ELx_EC_WFx]                = handle_pvm_exit_wfx,
         |                                           ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:483:43: note: (near initialization for 'exit_hyp_pvm_handlers[1]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:484:43: warning: initialized field overwritten [-Woverride-init]
     484 |         [ESR_ELx_EC_HVC64]              = handle_pvm_exit_hvc64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:484:43: note: (near initialization for 'exit_hyp_pvm_handlers[22]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:485:43: warning: initialized field overwritten [-Woverride-init]
     485 |         [ESR_ELx_EC_SYS64]              = handle_pvm_exit_sys64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:485:43: note: (near initialization for 'exit_hyp_pvm_handlers[24]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:486:43: warning: initialized field overwritten [-Woverride-init]
     486 |         [ESR_ELx_EC_IABT_LOW]           = handle_pvm_exit_iabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:486:43: note: (near initialization for 'exit_hyp_pvm_handlers[32]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:487:43: warning: initialized field overwritten [-Woverride-init]
     487 |         [ESR_ELx_EC_DABT_LOW]           = handle_pvm_exit_dabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:487:43: note: (near initialization for 'exit_hyp_pvm_handlers[36]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:496:43: warning: initialized field overwritten [-Woverride-init]
     496 |         [ESR_ELx_EC_IABT_LOW]           = handle_vm_exit_abt,
         |                                           ^~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:496:43: note: (near initialization for 'exit_hyp_vm_handlers[32]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:497:43: warning: initialized field overwritten [-Woverride-init]
     497 |         [ESR_ELx_EC_DABT_LOW]           = handle_vm_exit_abt,
         |                                           ^~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:497:43: note: (near initialization for 'exit_hyp_vm_handlers[36]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c: In function 'fpsimd_host_restore':
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:796:29: warning: unused variable 'vq_len' [-Wunused-variable]
     796 |                         u64 vq_len = sve_vq_from_vl(kvm_host_sve_max_vl) - 1;
         |                             ^~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c: In function 'handle_host_hcall':
>> arch/arm64/kvm/hyp/nvhe/hyp-main.c:1652:39: error: passing argument 1 of 'handle_host_dynamic_hcall' from incompatible pointer type [-Wincompatible-pointer-types]
    1652 |         if (handle_host_dynamic_hcall(&host_ctxt->regs, id) == HCALL_HANDLED)
         |                                       ^~~~~~~~~~~~~~~~
         |                                       |
         |                                       struct user_pt_regs *
   In file included from arch/arm64/kvm/hyp/nvhe/hyp-main.c:24:
   arch/arm64/kvm/hyp/include/nvhe/modules.h:25:51: note: expected 'struct kvm_cpu_context *' but argument is of type 'struct user_pt_regs *'
      25 | handle_host_dynamic_hcall(struct kvm_cpu_context *host_ctxt, int id)
         |                           ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~


vim +/handle_host_dynamic_hcall +1652 arch/arm64/kvm/hyp/nvhe/hyp-main.c

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
