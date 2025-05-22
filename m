Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC77B221DB7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 May 2025 06:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747896268; cv=none; b=cN10Tjn7rW+plUCeBx3x8arpG7GCWGuq6klqXkQemWND59LJGSNHnAPYpPfmoHsPF18ggF6EtUFZ/yoXkOwwxmgvrkxT5NxED4RDdbZfFG3/6hbuwb1+1AeCcRPR67vt9UqgtWHg63A+o1BXWnSSk6cXlKtOYH90atjI6rhjavM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747896268; c=relaxed/simple;
	bh=jMTFtQ6dySWEGh+LEG96OjphKYbS3gRp0f2Jmpra1vE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KIHAKjRwfr448FqGy/JGRVJ47RuWBf8lX2co9ukBmBQ/AQh2wiqG79TQ6GZpkSFBuZjIVBzZRQ6WUK3twQ1B6JDSwdgzs74zMdYuETjID7VfRvAPyrmXj5NmjLZLLFKJXW1BR8igosc+/bwwdM7LFXFtoVz1ee54U44cttwUozY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZKLNy4Nu; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZKLNy4Nu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747896267; x=1779432267;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jMTFtQ6dySWEGh+LEG96OjphKYbS3gRp0f2Jmpra1vE=;
  b=ZKLNy4Nux3N24121HqgKOWvetVzVpeOXeUTQy554Z8IZdgcvWxgX4q5g
   L5N3teRhr6KjWQczIhR6ShcTDdrXueKFgQhhBdzxUZ0ewWAQaIhdgR3WN
   aHZYWL8dokA9O6puRCbk03Ibd0w4gQ9eJ/3Nd2oF41/7fG9ueMOaVuTMM
   hEcbPFpFOGCkqGNZ7ebsM5s5GaBbJmtYdiMjHFOQUF2nHy/g2k1OXkm/3
   DRSjQuxhsMiBSikxDP4smiG0picPtFejcOGG1IEZAI0OR+Lp5w/LygaXO
   D2+1b5y5pz0Bsi5IdjUkL/u86O5kghNfFM/tC6io9tiDjmHD7FMAFcQ+5
   g==;
X-CSE-ConnectionGUID: WtjmEqK8QROMympGEVNZJQ==
X-CSE-MsgGUID: /U6Wif8rT0ClnwYDlxrjbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="61248480"
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="61248480"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 23:44:23 -0700
X-CSE-ConnectionGUID: ZOF0npAbQ4WX3CT2Z2lNKg==
X-CSE-MsgGUID: w67s2hLXQLWFJdbGJ56c3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="140971495"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 21 May 2025 23:44:11 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHzey-000P0M-2a;
	Thu, 22 May 2025 06:44:08 +0000
Date: Thu, 22 May 2025 14:44:03 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1] arch/x86/coco/tdx/tdx.c:1080:19:
 error: 'struct pv_irq_ops' has no member named 'safe_halt'
Message-ID: <202505221423.U4pxkBE3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   fb5cc85bab973405a8cefa20ac865e18777fa923
commit: 805e3ce5e0e32b31dcecc0774c57c17a1f13cef6 [1/1] x86/tdx: Fix arch_safe_halt() execution for TDX VMs
config: x86_64-randconfig-r122-20250522 (https://download.01.org/0day-ci/archive/20250522/202505221423.U4pxkBE3-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250522/202505221423.U4pxkBE3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505221423.U4pxkBE3-lkp@intel.com/

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
