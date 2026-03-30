Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE33519CD1D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Mar 2026 14:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774879338; cv=none; b=UhyMW6hEZ9+kekrNWgbHFloCN0NiGab8CqeAPB4kFxtv7tXTbM7foHhEP21QwTPQdtN0oGRlxLhtLraDkY7MCbbBapQ7rbd1x7/xB7Naoqs4jjI6mnrcX5BM1ZCrGA9ygk65p4pku19V/jYADfxKFjRrN18qWzUdFTBx8gf/LAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774879338; c=relaxed/simple;
	bh=CXWfXGo3BmMUTRoTcXeVwFjzGeUUl8/nx/qgxQlRD4Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jFh6XyyB8yvJKfgLtjyvaNXBG0IKYuSf9g1SFZFFxg95G71Gm6hBCG8OZOV27xvdVJrpe80HV47BskJbcvRY+H2uaR9NhkK4YlB9XGdXNXLrfBCtyUQjzJosOwrmt9iXB2UMfiOoP1CQXEpXY4hOLTHUba6c8Fasc/8FLrCjRx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XXHG2SJN; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XXHG2SJN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774879337; x=1806415337;
  h=date:from:to:cc:subject:message-id;
  bh=CXWfXGo3BmMUTRoTcXeVwFjzGeUUl8/nx/qgxQlRD4Y=;
  b=XXHG2SJNXEPQUrHTlgfu2XBEYmw+Qh6uAXOWchPjbDBcUJc90m9yPv+q
   Uo82fSUt+z2olSSD8uo9Cs7VfZhT3zAe7R6G4PBZ3B7srmZC1vxOdGZkc
   e2pB9aGflHXnzkKE8UH0aHM2wqaNJ2pS2aVjq1uQ9ck3Eh51ka/lIAHno
   Qdz51QPpi+OGxZYaESfyBznAGXKxvTg1rwzwY+L4kV7KdZI78mp5H81Lr
   vgxGNdXiDt82St/8tSdNye98Q8ZcSnpAK/RasHEWifPc6IZyvq0ZjYLz4
   uenlNUX+3Dhx0j4iaHnyl0t6wYtFaVVYV6fWhnQtrofE+yTXmjIolYwoc
   w==;
X-CSE-ConnectionGUID: xKbNLoDTT5yM7CoOs2TVcw==
X-CSE-MsgGUID: aVuNVePiQiyNyesHK0J2sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="79772895"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="79772895"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 07:02:16 -0700
X-CSE-ConnectionGUID: mAwAKOADSdqHw7R7eBI/cQ==
X-CSE-MsgGUID: iZzOLhrBRHqF/tsuuYY6Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="226320548"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 30 Mar 2026 07:02:15 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7DC0-000000001B7-1pVk;
	Mon, 30 Mar 2026 14:02:12 +0000
Date: Mon, 30 Mar 2026 22:01:34 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-poly-aosp-pixel-malibu-staging 4/4]
 arch/arm64/kvm/hyp/nvhe/hyp-main.c:56:6: warning: no previous prototype for
 '__pkvm_unmask_serror'
Message-ID: <202603302113.JUexbP8D-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common mirror-poly-aosp-pixel-malibu-staging
head:   5de4567efb4a2a85c5768504b0f45f278e9b13a2
commit: a08dde8a50c098a8002175044a68f63a9de16a53 [4/4] ANDROID: KVM: arm64: Add pKVM module register_unmask_serror
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20260330/202603302113.JUexbP8D-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260330/202603302113.JUexbP8D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603302113.JUexbP8D-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/hyp/nvhe/hyp-main.c:56:6: warning: no previous prototype for '__pkvm_unmask_serror' [-Wmissing-prototypes]
      56 | void __pkvm_unmask_serror(void)
         |      ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:455:43: warning: initialized field overwritten [-Woverride-init]
     455 |         [ESR_ELx_EC_WFx]                = handle_pvm_entry_wfx,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:455:43: note: (near initialization for 'entry_hyp_pvm_handlers[1]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:456:43: warning: initialized field overwritten [-Woverride-init]
     456 |         [ESR_ELx_EC_HVC64]              = handle_pvm_entry_hvc64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:456:43: note: (near initialization for 'entry_hyp_pvm_handlers[22]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:457:43: warning: initialized field overwritten [-Woverride-init]
     457 |         [ESR_ELx_EC_SYS64]              = handle_pvm_entry_sys64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:457:43: note: (near initialization for 'entry_hyp_pvm_handlers[24]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:458:43: warning: initialized field overwritten [-Woverride-init]
     458 |         [ESR_ELx_EC_IABT_LOW]           = handle_pvm_entry_iabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:458:43: note: (near initialization for 'entry_hyp_pvm_handlers[32]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:459:43: warning: initialized field overwritten [-Woverride-init]
     459 |         [ESR_ELx_EC_DABT_LOW]           = handle_pvm_entry_dabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:459:43: note: (near initialization for 'entry_hyp_pvm_handlers[36]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:464:43: warning: initialized field overwritten [-Woverride-init]
     464 |         [ESR_ELx_EC_WFx]                = handle_pvm_exit_wfx,
         |                                           ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:464:43: note: (near initialization for 'exit_hyp_pvm_handlers[1]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:465:43: warning: initialized field overwritten [-Woverride-init]
     465 |         [ESR_ELx_EC_HVC64]              = handle_pvm_exit_hvc64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:465:43: note: (near initialization for 'exit_hyp_pvm_handlers[22]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:466:43: warning: initialized field overwritten [-Woverride-init]
     466 |         [ESR_ELx_EC_SYS64]              = handle_pvm_exit_sys64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:466:43: note: (near initialization for 'exit_hyp_pvm_handlers[24]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:467:43: warning: initialized field overwritten [-Woverride-init]
     467 |         [ESR_ELx_EC_IABT_LOW]           = handle_pvm_exit_iabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:467:43: note: (near initialization for 'exit_hyp_pvm_handlers[32]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:468:43: warning: initialized field overwritten [-Woverride-init]
     468 |         [ESR_ELx_EC_DABT_LOW]           = handle_pvm_exit_dabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:468:43: note: (near initialization for 'exit_hyp_pvm_handlers[36]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:477:43: warning: initialized field overwritten [-Woverride-init]
     477 |         [ESR_ELx_EC_IABT_LOW]           = handle_vm_exit_abt,
         |                                           ^~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:477:43: note: (near initialization for 'exit_hyp_vm_handlers[32]')
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:478:43: warning: initialized field overwritten [-Woverride-init]
     478 |         [ESR_ELx_EC_DABT_LOW]           = handle_vm_exit_abt,
         |                                           ^~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:478:43: note: (near initialization for 'exit_hyp_vm_handlers[36]')


vim +/__pkvm_unmask_serror +56 arch/arm64/kvm/hyp/nvhe/hyp-main.c

    55	
  > 56	void __pkvm_unmask_serror(void)
    57	{
    58		u64 hcr = read_sysreg(HCR_EL2);
    59	
    60		if (!unmask_serror || !unmask_serror())
    61			return;
    62	
    63		write_sysreg(hcr | HCR_AMO, HCR_EL2);
    64		asm volatile("msr daifclr, #4");
    65		isb();
    66	}
    67	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
