Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC62233F8C5
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 May 2026 06:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778136535; cv=none; b=D1SHsdrINskjDvzdN5WKlTAU7tSHp6yRqLYVI3ylf3VAALhqfrFj0d679AumyhKV9ckaRuQJtk2KFjY5lw8THTQSP9kvCNobw9RbAOiRtXS1BuKS75bpc0o4dfxWmj/pWzGP/DBIIdKkkV/vIXiri2roFYSD7G76m6XgMz3XbBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778136535; c=relaxed/simple;
	bh=xMl4YHtVqTtUnM3Wi/LqQ+vgghrePDmGdSWxk4v0tjE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=P42XvuaBuZtHw2+a8TflrDE8YylD9Djqgir2FEkunJoRE3mEbFj0cgROLGb7pVh9RwGwTklQNlxxSKaMFZRya6S/w+Czi3H1W5JqBFSQvVVLXT4xYGlJZ5+pL7V9GqORA8ixFMttv0jsTgBfUSrr69goN0pvzJQ9xXA9+Aajx1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lAQglifw; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lAQglifw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778136534; x=1809672534;
  h=date:from:to:cc:subject:message-id;
  bh=xMl4YHtVqTtUnM3Wi/LqQ+vgghrePDmGdSWxk4v0tjE=;
  b=lAQglifwk4Phpdd45nB+jn4c/Sn96DLDu6ydZB/2IutNU+ueDJRts7qx
   oXKNJ3Ryys/eLAHBqj2DJKnOdinu/YAvnHQsQzEZlme4botm7T/hx4YTz
   XGfa4e1iVTwrRMA8ICYihrExdWIDH2SNXR23PSh4Md+3+3HhQdB/vRWbP
   GkaQ4yV11vcGbH/UAi083yo1NBE+UegOcAylCwyyntiGJUPfGkPxbTwZZ
   kZzlgE0Ls8zQK0tLp3zKjmM+14gnRDDXbV/02tCQtyw1y3hw9+gOlOYYd
   TUPIv92N3aqHSu9dCV1iwTJ6LftTEGF8KW64+7mO+QWBHcnBQ74cPKLaS
   w==;
X-CSE-ConnectionGUID: Rg+hg+RRRBa71A9o0vRE3g==
X-CSE-MsgGUID: jugQE//MRcCUGrZITbJjEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="90179833"
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; 
   d="scan'208";a="90179833"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 23:48:53 -0700
X-CSE-ConnectionGUID: iujzzSQLSTSVhWmo6VDUzg==
X-CSE-MsgGUID: pymdvk4dQ8eXry+wws2e/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; 
   d="scan'208";a="260082416"
Received: from lkp-server01.sh.intel.com (HELO 8365ac1094ea) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 06 May 2026 23:48:51 -0700
Received: from kbuild by 8365ac1094ea with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKsXR-0000000004n-0U7T;
	Thu, 07 May 2026 06:48:49 +0000
Date: Thu, 07 May 2026 14:48:32 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2025-06 0/2]
 arch/x86/coco/tdx/tdx.c:1080:19: error: 'struct pv_irq_ops' has no member
 named 'safe_halt'
Message-ID: <202605071446.s6A5twtR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Vishal,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-2025-06
head:   2059498fdeda11f110dd3d228698c61b8140be84
commit: 805e3ce5e0e32b31dcecc0774c57c17a1f13cef6 [0/2] x86/tdx: Fix arch_safe_halt() execution for TDX VMs
config: x86_64-randconfig-011-20260507 (https://download.01.org/0day-ci/archive/20260507/202605071446.s6A5twtR-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260507/202605071446.s6A5twtR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605071446.s6A5twtR-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/coco/tdx/tdx.c: In function 'tdx_early_init':
>> arch/x86/coco/tdx/tdx.c:1080:19: error: 'struct pv_irq_ops' has no member named 'safe_halt'
    1080 |         pv_ops.irq.safe_halt = tdx_safe_halt;
         |                   ^
>> arch/x86/coco/tdx/tdx.c:1081:19: error: 'struct pv_irq_ops' has no member named 'halt'
    1081 |         pv_ops.irq.halt = tdx_halt;
         |                   ^


vim +1080 arch/x86/coco/tdx/tdx.c

  1011	
  1012	void __init tdx_early_init(void)
  1013	{
  1014		u64 cc_mask;
  1015		u32 eax, sig[3];
  1016	
  1017		cpuid_count(TDX_CPUID_LEAF_ID, 0, &eax, &sig[0], &sig[2],  &sig[1]);
  1018	
  1019		if (memcmp(TDX_IDENT, sig, sizeof(sig)))
  1020			return;
  1021	
  1022		setup_force_cpu_cap(X86_FEATURE_TDX_GUEST);
  1023	
  1024		/* TSC is the only reliable clock in TDX guest */
  1025		setup_force_cpu_cap(X86_FEATURE_TSC_RELIABLE);
  1026	
  1027		cc_vendor = CC_VENDOR_INTEL;
  1028	
  1029		/* Configure the TD */
  1030		tdx_setup(&cc_mask);
  1031	
  1032		cc_set_mask(cc_mask);
  1033	
  1034		/*
  1035		 * All bits above GPA width are reserved and kernel treats shared bit
  1036		 * as flag, not as part of physical address.
  1037		 *
  1038		 * Adjust physical mask to only cover valid GPA bits.
  1039		 */
  1040		physical_mask &= cc_mask - 1;
  1041	
  1042		/*
  1043		 * The kernel mapping should match the TDX metadata for the page.
  1044		 * load_unaligned_zeropad() can touch memory *adjacent* to that which is
  1045		 * owned by the caller and can catch even _momentary_ mismatches.  Bad
  1046		 * things happen on mismatch:
  1047		 *
  1048		 *   - Private mapping => Shared Page  == Guest shutdown
  1049	         *   - Shared mapping  => Private Page == Recoverable #VE
  1050		 *
  1051		 * guest.enc_status_change_prepare() converts the page from
  1052		 * shared=>private before the mapping becomes private.
  1053		 *
  1054		 * guest.enc_status_change_finish() converts the page from
  1055		 * private=>shared after the mapping becomes private.
  1056		 *
  1057		 * In both cases there is a temporary shared mapping to a private page,
  1058		 * which can result in a #VE.  But, there is never a private mapping to
  1059		 * a shared page.
  1060		 */
  1061		x86_platform.guest.enc_status_change_prepare = tdx_enc_status_change_prepare;
  1062		x86_platform.guest.enc_status_change_finish  = tdx_enc_status_change_finish;
  1063	
  1064		x86_platform.guest.enc_cache_flush_required  = tdx_cache_flush_required;
  1065		x86_platform.guest.enc_tlb_flush_required    = tdx_tlb_flush_required;
  1066	
  1067		x86_platform.guest.enc_kexec_begin	     = tdx_kexec_begin;
  1068		x86_platform.guest.enc_kexec_finish	     = tdx_kexec_finish;
  1069	
  1070		/*
  1071		 * Avoid "sti;hlt" execution in TDX guests as HLT induces a #VE that
  1072		 * will enable interrupts before HLT TDCALL invocation if executed
  1073		 * in STI-shadow, possibly resulting in missed wakeup events.
  1074		 *
  1075		 * Modify all possible HLT execution paths to use TDX specific routines
  1076		 * that directly execute TDCALL and toggle the interrupt state as
  1077		 * needed after TDCALL completion. This also reduces HLT related #VEs
  1078		 * in addition to having a reliable halt logic execution.
  1079		 */
> 1080		pv_ops.irq.safe_halt = tdx_safe_halt;
> 1081		pv_ops.irq.halt = tdx_halt;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
