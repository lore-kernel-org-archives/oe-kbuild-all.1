Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D9213D24D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Apr 2024 10:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712831423; cv=none; b=Bm0SeouU3+5C63RTI2MqmOPc0LoglngawtLTFs+f5t6RwGqNz+y9YOHsLnSjzZ/yuL51G+esTDk5adTg7eL3RxpZ6qO0p21Egof2p8vEjCWTajM+J/N7utPfuSNNAERDt5s1ikShgthL4FeFg2OJ/sUMfpHtudMInBf+Sw59nCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712831423; c=relaxed/simple;
	bh=u+NZi7FdCAjeegwmb4V1XrA0gjR57a2eHkinDJVAIqE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qsUreH94ELJorxP7T4/18s9jPHtM+7kx/SKXWzi37ILiF62YO7DsIPmLQDuUEL9RYg0u+u3mbp80F/+9IpSxGUFH9g1wf24pmhHGW8bu0YVjo4zHQOkaaJFrnC5qh0HQOTaP2I9monoKCpkpUY7CAeu0oozlVmokH7TVm/JJg88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JxklJSsZ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JxklJSsZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712831421; x=1744367421;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u+NZi7FdCAjeegwmb4V1XrA0gjR57a2eHkinDJVAIqE=;
  b=JxklJSsZJvFhiSREx4XwRZMO2frUgJVWNTUdcANd+WTvCWNstrcvOUyX
   qqRX7gPSvKIaXNLo5UFFNO3+ZMCONeDYe74IovEnxwHPqupX3NslGfqzw
   joVBgbA0154UejOReiDQpCsVTigIw5p6HZnmu6kMOWyGIDIR4PSy9vXn7
   xoKDw+cZmeOEutjYg9NVBsptudxsVAWCiolRDOrN3g7c0q1NBGUBm+Ib7
   CfRnJps2WoeErZo5eIERuRxWKjv40WbvZncpCWbhoxCopg25juTpHM9jq
   YV/51U+YYwZI+Yw+u8BoXHB2BECGrsUHKa7OflxskO7uw57mqv3MNncl4
   g==;
X-CSE-ConnectionGUID: mK3W3JfAQoaw0KiXU+YUDQ==
X-CSE-MsgGUID: ur+vjHYaScGFsh3FXa79nw==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="19384461"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="19384461"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 03:30:21 -0700
X-CSE-ConnectionGUID: /keTWwwsSm66D2H81TRUOQ==
X-CSE-MsgGUID: 03T4lJQVRIeLIr2VgsczMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="25635447"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 11 Apr 2024 03:30:20 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rurhB-0008W1-1Q;
	Thu, 11 Apr 2024 10:30:17 +0000
Date: Thu, 11 Apr 2024 18:29:45 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (IBM)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mike Rapoport <rppt@kernel.org>
Subject: [rppt:execmem/v4+x86-rox 16/23] arch/um/kernel/um_arch.c:473:7:
 warning: no previous prototype for 'text_poke_copy'
Message-ID: <202404111816.e6575Gy7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git execmem/v4+x86-rox
head:   98afa1d7e1d9deaee05261840ca6939daf8b6245
commit: 63d06c41f948a7ec5d1566a2398f72b87040b983 [16/23] asm-generic: introduce text-patching.h
config: um-i386_defconfig (https://download.01.org/0day-ci/archive/20240411/202404111816.e6575Gy7-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240411/202404111816.e6575Gy7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404111816.e6575Gy7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/um/kernel/um_arch.c:408:19: warning: no previous prototype for 'read_initrd' [-Wmissing-prototypes]
     408 | int __init __weak read_initrd(void)
         |                   ^~~~~~~~~~~
   arch/um/kernel/um_arch.c:461:7: warning: no previous prototype for 'text_poke' [-Wmissing-prototypes]
     461 | void *text_poke(void *addr, const void *opcode, size_t len)
         |       ^~~~~~~~~
>> arch/um/kernel/um_arch.c:473:7: warning: no previous prototype for 'text_poke_copy' [-Wmissing-prototypes]
     473 | void *text_poke_copy(void *addr, const void *opcode, size_t len)
         |       ^~~~~~~~~~~~~~
   arch/um/kernel/um_arch.c:478:6: warning: no previous prototype for 'text_poke_sync' [-Wmissing-prototypes]
     478 | void text_poke_sync(void)
         |      ^~~~~~~~~~~~~~


vim +/text_poke_copy +473 arch/um/kernel/um_arch.c

   407	
 > 408	int __init __weak read_initrd(void)
   409	{
   410		return 0;
   411	}
   412	
   413	void __init setup_arch(char **cmdline_p)
   414	{
   415		u8 rng_seed[32];
   416	
   417		stack_protections((unsigned long) &init_thread_info);
   418		setup_physmem(uml_physmem, uml_reserved, physmem_size, highmem);
   419		mem_total_pages(physmem_size, iomem_size, highmem);
   420		uml_dtb_init();
   421		read_initrd();
   422	
   423		paging_init();
   424		strscpy(boot_command_line, command_line, COMMAND_LINE_SIZE);
   425		*cmdline_p = command_line;
   426		setup_hostinfo(host_info, sizeof host_info);
   427	
   428		if (os_getrandom(rng_seed, sizeof(rng_seed), 0) == sizeof(rng_seed)) {
   429			add_bootloader_randomness(rng_seed, sizeof(rng_seed));
   430			memzero_explicit(rng_seed, sizeof(rng_seed));
   431		}
   432	}
   433	
   434	void __init arch_cpu_finalize_init(void)
   435	{
   436		arch_check_bugs();
   437		os_check_bugs();
   438	}
   439	
   440	void apply_seal_endbr(s32 *start, s32 *end)
   441	{
   442	}
   443	
   444	void apply_retpolines(s32 *start, s32 *end)
   445	{
   446	}
   447	
   448	void apply_returns(s32 *start, s32 *end)
   449	{
   450	}
   451	
   452	void apply_fineibt(s32 *start_retpoline, s32 *end_retpoline,
   453			   s32 *start_cfi, s32 *end_cfi)
   454	{
   455	}
   456	
   457	void apply_alternatives(struct alt_instr *start, struct alt_instr *end)
   458	{
   459	}
   460	
   461	void *text_poke(void *addr, const void *opcode, size_t len)
   462	{
   463		/*
   464		 * In UML, the only reference to this function is in
   465		 * apply_relocate_add(), which shouldn't ever actually call this
   466		 * because UML doesn't have live patching.
   467		 */
   468		WARN_ON(1);
   469	
   470		return memcpy(addr, opcode, len);
   471	}
   472	
 > 473	void *text_poke_copy(void *addr, const void *opcode, size_t len)
   474	{
   475		return text_poke(addr, opcode, len);
   476	}
   477	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
