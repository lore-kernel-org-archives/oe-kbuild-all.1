Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20E613BC0E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Feb 2025 11:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740224736; cv=none; b=ghYx8ii5cjFMUtZxQg9FnN5QMgJU5TymWpkscllKKFrfyGUqoh4Hiqz/23mzXes9a+nlkZ1xyhh+6QgeYTHpALcKoE7NeFZCyPnDyba44RQduheJCsH5uau3DaM0uek+UqGxR12iHxHg2ROP6eYcJrcYhQRrNr12qCXez91ZmuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740224736; c=relaxed/simple;
	bh=6B7Sq7tcBWjD03Qtb22LDsGsNTO6H1Wo6pdEvt6JUx0=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WMcLzFad8lPaaWqWd5ZpPe4yx6RwyQr2jTatqYct8t+TEMuCWfSIBv1FHliOlwYd6dokBYxqc4cdEL91kvVW18NNA+MlNeUoE57a9Zq4R6zMTvME10cKyjuHRAow+f3s7hLiH9D5iKasGjNvae3rGdh/Bp/glaxFCZBUNrs4nxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y6DNzcBN; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y6DNzcBN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740224734; x=1771760734;
  h=date:from:cc:subject:message-id:mime-version;
  bh=6B7Sq7tcBWjD03Qtb22LDsGsNTO6H1Wo6pdEvt6JUx0=;
  b=Y6DNzcBNyU38T1ARLeOQfAiMkbbY3bICIqGX86AgTOeCqHlmGflOv35B
   iRIL0SMDr/AlnhM1Gyrj9SBPajPeWBB/Fe/xe34zhMLLf0vLTsdqnmINb
   eWUde6hsxr58CkHQS6wT06eN2X11rpQctT+W4h/sYG/N+ugp0UIf4Z6eZ
   48lfTfyh8Fw/5CdDxKiq1oYdlwrpURREM2H+k/BlpDnsduRQl5MV/7jgH
   YIUaVmWPbQY8nPxTLQUcmBLm1JisGHdhc00dtEgDcNEpTvEszPUDb8a2b
   gUOaDcNSTYXOodlYOByJgMuGR4IOlozVwge+iNU/XxCOEoFJN2IPPzdpN
   A==;
X-CSE-ConnectionGUID: uO+RtNd5Tji4Zeio3dzMRw==
X-CSE-MsgGUID: hlyu2OXdS56o37StxO/few==
X-IronPort-AV: E=McAfee;i="6700,10204,11353"; a="41159789"
X-IronPort-AV: E=Sophos;i="6.13,307,1732608000"; 
   d="scan'208";a="41159789"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2025 03:45:33 -0800
X-CSE-ConnectionGUID: Rkex7r9hTaqfzCGPNWFqTQ==
X-CSE-MsgGUID: c6WEGBiYRqCEQtUp+o9/+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,307,1732608000"; 
   d="scan'208";a="138833870"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 22 Feb 2025 03:45:32 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlnwn-0006Wl-2X
	for oe-kbuild-all@lists.linux.dev;
	Sat, 22 Feb 2025 11:45:29 +0000
Date: Sat, 22 Feb 2025 19:44:31 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:6.12/dovetail-xenomai 5/5]
 arch/x86/kernel/cpu/mshyperv.c:613:3: error: use of undeclared identifier
 '__sysvec_hyperv_reenlightenment'; did you mean
 'sysvec_hyperv_reenlightenment'?
Message-ID: <202502221948.nLTMTzqr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.12/dovetail-xenomai
head:   96c9aceb59d0ff2f4ac73415eeee24969ba6fa8f
commit: e6d9428e4f0f17d0586fd7e05950a990e9ada981 [5/5] x86: dovetail: Allow multiple HV guest extensions to be enabled
config: i386-buildonly-randconfig-004-20250222 (https://download.01.org/0day-ci/archive/20250222/202502221948.nLTMTzqr-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250222/202502221948.nLTMTzqr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502221948.nLTMTzqr-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/cpu/mshyperv.c:25:
   arch/x86/include/asm/idtentry.h:284:52: error: parameter 'function' was not declared, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
     284 | static inline void pipeline_install_sysvec(vector, function) {}
         |                                                    ^
   arch/x86/include/asm/idtentry.h:284:44: error: parameter 'vector' was not declared, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
     284 | static inline void pipeline_install_sysvec(vector, function) {}
         |                                            ^
   arch/x86/include/asm/idtentry.h:284:20: error: a function definition without a prototype is deprecated in all versions of C and is not supported in C23 [-Werror,-Wdeprecated-non-prototype]
     284 | static inline void pipeline_install_sysvec(vector, function) {}
         |                    ^
   arch/x86/kernel/cpu/mshyperv.c:609:2: error: incompatible pointer to integer conversion passing 'void (struct pt_regs *)' to parameter of type 'int' [-Wint-conversion]
     609 |         sysvec_install(HYPERVISOR_CALLBACK_VECTOR, sysvec_hyperv_callback);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/idtentry.h:535:34: note: expanded from macro 'sysvec_install'
     535 |         pipeline_install_sysvec(vector, __##function);                  \
         |                                         ^~~~~~~~~~~~
   <scratch space>:140:1: note: expanded from here
     140 | __sysvec_hyperv_callback
         | ^~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/kernel/cpu/mshyperv.c:613:3: error: use of undeclared identifier '__sysvec_hyperv_reenlightenment'; did you mean 'sysvec_hyperv_reenlightenment'?
     613 |                 sysvec_install(HYPERV_REENLIGHTENMENT_VECTOR, sysvec_hyperv_reenlightenment);
         |                 ^
   arch/x86/include/asm/idtentry.h:535:34: note: expanded from macro 'sysvec_install'
     535 |         pipeline_install_sysvec(vector, __##function);                  \
         |                                         ^
   <scratch space>:209:1: note: expanded from here
     209 | __sysvec_hyperv_reenlightenment
         | ^
   arch/x86/include/asm/idtentry.h:835:66: note: 'sysvec_hyperv_reenlightenment' declared here
     835 | DECLARE_IDTENTRY_SYSVEC_PIPELINED(HYPERV_REENLIGHTENMENT_VECTOR, sysvec_hyperv_reenlightenment);
         |                                                                  ^
   arch/x86/kernel/cpu/mshyperv.c:618:3: error: incompatible pointer to integer conversion passing 'void (struct pt_regs *)' to parameter of type 'int' [-Wint-conversion]
     618 |                 sysvec_install(HYPERV_STIMER0_VECTOR, sysvec_hyperv_stimer0);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/idtentry.h:535:34: note: expanded from macro 'sysvec_install'
     535 |         pipeline_install_sysvec(vector, __##function);                  \
         |                                         ^~~~~~~~~~~~
   <scratch space>:21:1: note: expanded from here
      21 | __sysvec_hyperv_stimer0
         | ^~~~~~~~~~~~~~~~~~~~~~~
   6 errors generated.


vim +613 arch/x86/kernel/cpu/mshyperv.c

ca3ba2a2f4a49a3 Jason Wang       2014-02-28  568  
a4eeb2176d89fdf Baoquan He       2024-01-24  569  #if IS_ENABLED(CONFIG_HYPERV)
a4eeb2176d89fdf Baoquan He       2024-01-24  570  #if defined(CONFIG_KEXEC_CORE)
2517281d63a2b09 Vitaly Kuznetsov 2015-08-01  571  	machine_ops.shutdown = hv_machine_shutdown;
a4eeb2176d89fdf Baoquan He       2024-01-24  572  #endif
a4eeb2176d89fdf Baoquan He       2024-01-24  573  #if defined(CONFIG_CRASH_DUMP)
b4370df2b1f5158 Vitaly Kuznetsov 2015-08-01  574  	machine_ops.crash_shutdown = hv_machine_crash_shutdown;
a4eeb2176d89fdf Baoquan He       2024-01-24  575  #endif
1e034743e918d19 Vitaly Kuznetsov 2015-09-23  576  #endif
e1471463180ddc3 Joseph Salisbury 2020-09-26  577  	if (ms_hyperv.features & HV_ACCESS_TSC_INVARIANT) {
5f92b45c3b67e3d Ani Sinha        2021-07-16  578  		/*
5f92b45c3b67e3d Ani Sinha        2021-07-16  579  		 * Writing to synthetic MSR 0x40000118 updates/changes the
5f92b45c3b67e3d Ani Sinha        2021-07-16  580  		 * guest visible CPUIDs. Setting bit 0 of this MSR  enables
5f92b45c3b67e3d Ani Sinha        2021-07-16  581  		 * guests to report invariant TSC feature through CPUID
5f92b45c3b67e3d Ani Sinha        2021-07-16  582  		 * instruction, CPUID 0x800000007/EDX, bit 8. See code in
5f92b45c3b67e3d Ani Sinha        2021-07-16  583  		 * early_init_intel() where this bit is examined. The
5f92b45c3b67e3d Ani Sinha        2021-07-16  584  		 * setting of this MSR bit should happen before init_intel()
5f92b45c3b67e3d Ani Sinha        2021-07-16  585  		 * is called.
5f92b45c3b67e3d Ani Sinha        2021-07-16  586  		 */
b961aa757f940be Vitaly Kuznetsov 2022-10-13  587  		wrmsrl(HV_X64_MSR_TSC_INVARIANT_CONTROL, HV_EXPOSE_INVARIANT_TSC);
dce7cd62754b5d4 Andrea Parri     2019-10-03  588  		setup_force_cpu_cap(X86_FEATURE_TSC_RELIABLE);
dce7cd62754b5d4 Andrea Parri     2019-10-03  589  	}
1e2ae9ec072f3b7 Vitaly Kuznetsov 2016-04-15  590  
1e2ae9ec072f3b7 Vitaly Kuznetsov 2016-04-15  591  	/*
1e2ae9ec072f3b7 Vitaly Kuznetsov 2016-04-15  592  	 * Generation 2 instances don't support reading the NMI status from
1e2ae9ec072f3b7 Vitaly Kuznetsov 2016-04-15  593  	 * 0x61 port.
1e2ae9ec072f3b7 Vitaly Kuznetsov 2016-04-15  594  	 */
1e2ae9ec072f3b7 Vitaly Kuznetsov 2016-04-15  595  	if (efi_enabled(EFI_BOOT))
1e2ae9ec072f3b7 Vitaly Kuznetsov 2016-04-15  596  		x86_platform.get_nmi_reason = hv_get_nmi_reason;
8730046c1498e8f K. Y. Srinivasan 2017-01-18  597  
8730046c1498e8f K. Y. Srinivasan 2017-01-18  598  #if IS_ENABLED(CONFIG_HYPERV)
812b0597fb40432 Michael Kelley   2023-03-26  599  	if ((hv_get_isolation_type() == HV_ISOLATION_TYPE_VBS) ||
d3a9d7e49d15316 Dexuan Cui       2023-08-24  600  	    ms_hyperv.paravisor_present)
812b0597fb40432 Michael Kelley   2023-03-26  601  		hv_vtom_init();
8730046c1498e8f K. Y. Srinivasan 2017-01-18  602  	/*
8730046c1498e8f K. Y. Srinivasan 2017-01-18  603  	 * Setup the hook to get control post apic initialization.
8730046c1498e8f K. Y. Srinivasan 2017-01-18  604  	 */
8730046c1498e8f K. Y. Srinivasan 2017-01-18  605  	x86_platform.apic_post_init = hyperv_init;
2ffd9e33ce4af4e Vitaly Kuznetsov 2017-08-02  606  	hyperv_setup_mmu_ops();
93286261de1b463 Vitaly Kuznetsov 2018-01-24  607  
8f4a29b0e8a40d8 Xin Li           2023-12-05  608  	/* Install system interrupt handler for hypervisor callback */
8f4a29b0e8a40d8 Xin Li           2023-12-05  609  	sysvec_install(HYPERVISOR_CALLBACK_VECTOR, sysvec_hyperv_callback);
8f4a29b0e8a40d8 Xin Li           2023-12-05  610  
8f4a29b0e8a40d8 Xin Li           2023-12-05  611  	/* Install system interrupt handler for reenlightenment notifications */
e1471463180ddc3 Joseph Salisbury 2020-09-26  612  	if (ms_hyperv.features & HV_ACCESS_REENLIGHTENMENT) {
8f4a29b0e8a40d8 Xin Li           2023-12-05 @613  		sysvec_install(HYPERV_REENLIGHTENMENT_VECTOR, sysvec_hyperv_reenlightenment);
a16be368dd3fb69 Thomas Gleixner  2020-05-21  614  	}
93286261de1b463 Vitaly Kuznetsov 2018-01-24  615  
8f4a29b0e8a40d8 Xin Li           2023-12-05  616  	/* Install system interrupt handler for stimer0 */
a16be368dd3fb69 Thomas Gleixner  2020-05-21  617  	if (ms_hyperv.misc_features & HV_STIMER_DIRECT_MODE_AVAILABLE) {
8f4a29b0e8a40d8 Xin Li           2023-12-05  618  		sysvec_install(HYPERV_STIMER0_VECTOR, sysvec_hyperv_stimer0);
a16be368dd3fb69 Thomas Gleixner  2020-05-21  619  	}
3a025de64bf89c8 Yi Sun           2018-10-08  620  

:::::: The code at line 613 was first introduced by commit
:::::: 8f4a29b0e8a40d865040800684d7ff4141c1394f x86/traps: Add sysvec_install() to install a system interrupt handler

:::::: TO: Xin Li <xin3.li@intel.com>
:::::: CC: Borislav Petkov (AMD) <bp@alien8.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
