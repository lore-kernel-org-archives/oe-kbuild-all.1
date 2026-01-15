Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C6D2D7DEC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jan 2026 06:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768457334; cv=none; b=NpoN193cLIFAuwOdWHlSQHd1NAuqzcWQkyV8qVUp8TkpSmGaVz5UsGQdRHWyzrTTupx0EaoI7KadYFG+iBM5A4WzBjjR40m2jjhpAbpAV1SVPvs+Q1duxQYejtRg0/DRXz0DjRBya/KtfTT69Ru28H5s7eDWV9symNaIoqq0DDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768457334; c=relaxed/simple;
	bh=JjLISrkVF/R/X7bpAUQ6OqYBgkEKbBJbNAjBhTY+3dA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sLMgrnPqAx8ismLbDPyTps1ANR/nmicXR3Z6+cmf4+bL0npUD9+7xytBhWn7QdsXOwP0Z8BbALcEz+8Nez5sGPHNQZt4iruFXBGeHmBQ4qFp47NC1Hj1sH0OYnH2tAF4+HvJ3bbDsAmSw3WcLWD6fl2JLBzR2rJeta1zZ6KQsf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dY29ZHvr; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dY29ZHvr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768457331; x=1799993331;
  h=date:from:to:cc:subject:message-id;
  bh=JjLISrkVF/R/X7bpAUQ6OqYBgkEKbBJbNAjBhTY+3dA=;
  b=dY29ZHvr/zkKcdifA6aKp9h3+np1fGjbFA2B9vTHGEV/eQg0qHjFpPm6
   sr/YBSv8CK1sOeiwpfIlywk3e1kVuOi13c23BobQiUJKhQ9TufaHSzdwX
   au3+UthJylLfiQXl/rU0fUpOUQ/IepmxvR5O5tsI67qVkcwCpHc64yWk3
   5yMXUoXrtLGLATGGb8aJw75llcblH3rW67SUw+GOBvnW1YJ7EgH5NGP0A
   S8ak/goXuEKnTy75zF8S0pEtBokVkryViCRIvG/KlRgI6vxM0UXjMiQoh
   IqzwSBUkRma/Ow2dhRyQVZo81dRYsEhOEGakxYDvMAnwM5/GvX+OgLJr2
   Q==;
X-CSE-ConnectionGUID: drk0phScTz6Cdq/0JOTX4g==
X-CSE-MsgGUID: G4cmvhcZQZ2LRB+DYLELRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="80872270"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="80872270"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 22:08:50 -0800
X-CSE-ConnectionGUID: E/Bv+hWIT6udFSOOJDEIxA==
X-CSE-MsgGUID: aq+xKaBjQyejD8hgoavf2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="204012042"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 14 Jan 2026 22:08:49 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgGXG-00000000Hdi-2oSu;
	Thu, 15 Jan 2026 06:08:46 +0000
Date: Thu, 15 Jan 2026 14:08:42 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/2]
 arch/arm64/kvm/hyp/nvhe/hyp-main.c:1570:31: error: invalid use of void
 expression
Message-ID: <202601151444.13JtoE6n-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   5150a2974c100f8aa5cbfa9a09d804ee4369f61e
commit: 416566c3ecff27c1aafb0af725d906b9b28b2736 [0/2] ANDROID: KVM: arm64: Return an error from __pkvm_teardown_tracing
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20260115/202601151444.13JtoE6n-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260115/202601151444.13JtoE6n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601151444.13JtoE6n-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kvm/hyp/nvhe/hyp-main.c:77:6: warning: no previous prototype for '__pkvm_unmask_serror' [-Wmissing-prototypes]
      77 | void __pkvm_unmask_serror(void)
         |      ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:463:43: warning: initialized field overwritten [-Woverride-init]
     463 |         [ESR_ELx_EC_WFx]                = handle_pvm_entry_wfx,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:463:43: note: (near initialization for 'entry_hyp_pvm_handlers[1]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:464:43: warning: initialized field overwritten [-Woverride-init]
     464 |         [ESR_ELx_EC_HVC64]              = handle_pvm_entry_hvc64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:464:43: note: (near initialization for 'entry_hyp_pvm_handlers[22]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:465:43: warning: initialized field overwritten [-Woverride-init]
     465 |         [ESR_ELx_EC_SYS64]              = handle_pvm_entry_sys64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:465:43: note: (near initialization for 'entry_hyp_pvm_handlers[24]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:466:43: warning: initialized field overwritten [-Woverride-init]
     466 |         [ESR_ELx_EC_IABT_LOW]           = handle_pvm_entry_iabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:466:43: note: (near initialization for 'entry_hyp_pvm_handlers[32]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:467:43: warning: initialized field overwritten [-Woverride-init]
     467 |         [ESR_ELx_EC_DABT_LOW]           = handle_pvm_entry_dabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:467:43: note: (near initialization for 'entry_hyp_pvm_handlers[36]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:472:43: warning: initialized field overwritten [-Woverride-init]
     472 |         [ESR_ELx_EC_WFx]                = handle_pvm_exit_wfx,
         |                                           ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:472:43: note: (near initialization for 'exit_hyp_pvm_handlers[1]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:473:43: warning: initialized field overwritten [-Woverride-init]
     473 |         [ESR_ELx_EC_HVC64]              = handle_pvm_exit_hvc64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:473:43: note: (near initialization for 'exit_hyp_pvm_handlers[22]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:474:43: warning: initialized field overwritten [-Woverride-init]
     474 |         [ESR_ELx_EC_SYS64]              = handle_pvm_exit_sys64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:474:43: note: (near initialization for 'exit_hyp_pvm_handlers[24]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:475:43: warning: initialized field overwritten [-Woverride-init]
     475 |         [ESR_ELx_EC_IABT_LOW]           = handle_pvm_exit_iabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:475:43: note: (near initialization for 'exit_hyp_pvm_handlers[32]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:476:43: warning: initialized field overwritten [-Woverride-init]
     476 |         [ESR_ELx_EC_DABT_LOW]           = handle_pvm_exit_dabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:476:43: note: (near initialization for 'exit_hyp_pvm_handlers[36]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:485:43: warning: initialized field overwritten [-Woverride-init]
     485 |         [ESR_ELx_EC_IABT_LOW]           = handle_vm_exit_abt,
         |                                           ^~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:485:43: note: (near initialization for 'exit_hyp_vm_handlers[32]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:486:43: warning: initialized field overwritten [-Woverride-init]
     486 |         [ESR_ELx_EC_DABT_LOW]           = handle_vm_exit_abt,
         |                                           ^~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:486:43: note: (near initialization for 'exit_hyp_vm_handlers[36]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c: In function 'handle___pkvm_teardown_tracing':
>> arch/arm64/kvm/hyp/nvhe/hyp-main.c:1570:31: error: invalid use of void expression
    1570 |         cpu_reg(host_ctxt, 1) = __pkvm_teardown_tracing();
         |                               ^


vim +1570 arch/arm64/kvm/hyp/nvhe/hyp-main.c

  1567	
  1568	static void handle___pkvm_teardown_tracing(struct kvm_cpu_context *host_ctxt)
  1569	{
> 1570		cpu_reg(host_ctxt, 1) = __pkvm_teardown_tracing();
  1571	}
  1572	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
