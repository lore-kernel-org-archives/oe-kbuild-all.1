Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA4C347FD0
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 May 2026 10:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778149824; cv=none; b=Zcc1pGxd1tDe4Y3+nHHNBusujYAyoUXEamxnh/lblfACilMIv+WAb4sDKjrslaeozrQmxwDuSBFKzRpc8eFP5GtK3FdHR5x66C7dA79VDHRnUMnMcD+SnaNQCg9pSAeq9k2i8Ls1ekyuUXn5FC48VQnMA2GRfIItSxb4KF8PK58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778149824; c=relaxed/simple;
	bh=farPK6xz9kJ3PMDOZE1erHtmmC1J9/tsIHddOMFX6PQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FvkpKsws5rHVs2AH4pjz9+9vw1e6bKEuhQSy+QZzb5b7AHbMXb/HZZfO9dEtxZabY+oRghdUiPiaLdzz9G+0MM2C81VPuRrc1OqLQHrJs7y6ygFV5et4PJxXLq3RItTMHL2GovnXDo6XJU1apPaOzuqvXwMSRfJTzXTpOkLV/FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WCT6LlZ9; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WCT6LlZ9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778149822; x=1809685822;
  h=date:from:to:cc:subject:message-id;
  bh=farPK6xz9kJ3PMDOZE1erHtmmC1J9/tsIHddOMFX6PQ=;
  b=WCT6LlZ9/D3+jbtPjuU4p2TmdpGwaqxLF4A9xZT0mb5gU8Bq/JJJbY6K
   Uu2NruHdEt5laCIspqFh++9nVqUjdU50PjdrfQydWqVtnDP2pPi8fM4Bi
   NRs4/NZECSezzrlinFSULXxq1AryyPch7BG158BqZtvbxV26scLmz9SJQ
   ncmSy3BZFOknV9UwABR2rWIGaLgnorQgMCviRcE2xuV/YipNpaBYaT0sX
   LliMWTOn9CHC+dxJjQIeDoJ5RwKMJ10Gd4GeBw8uXEk4jCQfo8/JQms7n
   JlQRHoMgo9KmNvcREyG1KoYCzrlamEEyqAkmM/NtTxSBkiCcbPRS5+114
   g==;
X-CSE-ConnectionGUID: /YaOVcQdSFO4XSsXS1yXuA==
X-CSE-MsgGUID: ghklZ4mnTkeEoXC4uiCO0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="79205458"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="79205458"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 03:30:09 -0700
X-CSE-ConnectionGUID: lc+PK9wsQxuk2XW65bBraw==
X-CSE-MsgGUID: NKuY4pCXRi+bz0kNMd+xYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="235588532"
Received: from lkp-server01.sh.intel.com (HELO 8365ac1094ea) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 07 May 2026 03:30:08 -0700
Received: from kbuild by 8365ac1094ea with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKvzY-000000000BB-3xm6;
	Thu, 07 May 2026 10:30:04 +0000
Date: Thu, 07 May 2026 18:29:47 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2025-12 2/2]
 arch/arm64/kvm/hyp/nvhe/hyp-main.c:1566:31: error: void value not ignored as
 it ought to be
Message-ID: <202605071800.sMfE64XI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-2025-12
head:   dd0193c58f11f9f3d7434d6682346d8188da77c8
commit: 6dd5397a79162e19c9d670e6e11c8db49b824a91 [2/2] ANDROID: KVM: arm64: Return an error from __pkvm_teardown_tracing
config: arm64-randconfig-002-20260507 (https://download.01.org/0day-ci/archive/20260507/202605071800.sMfE64XI-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260507/202605071800.sMfE64XI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605071800.sMfE64XI-lkp@intel.com/

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
>> arch/arm64/kvm/hyp/nvhe/hyp-main.c:1566:31: error: void value not ignored as it ought to be
    1566 |         cpu_reg(host_ctxt, 1) = __pkvm_teardown_tracing();
         |                               ^

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for FB_IOMEM_HELPERS
   Depends on [n]: HAS_IOMEM [=y] && FB_CORE [=n]
   Selected by [m]:
   - DRM_XE_DISPLAY [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_XE [=m] && DRM_XE [=m]=m [=m]


vim +1566 arch/arm64/kvm/hyp/nvhe/hyp-main.c

  1563	
  1564	static void handle___pkvm_teardown_tracing(struct kvm_cpu_context *host_ctxt)
  1565	{
> 1566		cpu_reg(host_ctxt, 1) = __pkvm_teardown_tracing();
  1567	}
  1568	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
