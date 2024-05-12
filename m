Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519598C13
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 May 2024 06:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715496168; cv=none; b=SC8pAzxuyWEl1/u0JS23236k/oFxNP8MR6RT4gbXPZKJkbcngIVDp8Zc2/uySRSxI3JRD3kolDMAMFN54PGhHezm8+Ke/CVOaaJ0ZEAZls2+L8ATKCDkt5wC+DwUc1DMEFatwv32A8r2c/bFma9qNhNWMdx9sxP7uklo67gb0PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715496168; c=relaxed/simple;
	bh=+5feRetd2Dm0gh0KcxyZbso+ozxrDsdDIBZlK/llpfs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZgSwwa7EhqdlwsIa63BslOBGdN+lT2vNPjxYEb4Xu4G68IM8A8gnGhn6dUN9mG7tSLJjWv4//+7OGadmh1TFLvttf5NMu/HSqCNvZCiBa+cN21DoY39Z8XplkprAk1BK3x5aYJvPqeVTn+ciqJndRzu3144qBnlUkhKzO1BtjEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YpXDrpVa; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YpXDrpVa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715496166; x=1747032166;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+5feRetd2Dm0gh0KcxyZbso+ozxrDsdDIBZlK/llpfs=;
  b=YpXDrpVaaGTdip5KyTbgd/U1/GNmeZCJdStXNxHrms8ibbawZmmzLG/h
   wg8DJSqibAkyhhembbgQT3jDF9oOQoA1UySwCPdkydmYuwRie7Q/Bj8He
   93t2nG9OcV1nAWGufs3Y+Dpiwrdfg2bZQDn18kfGG1HoEDcXw8tv21Sjx
   mu06wNKKWuzHGDqeV+q0+SSpLePVvy+2ks2R+z/2REgC8S37QsOAllAus
   7FNI0+F0frput36k5X4ki8u5HX4XsoXF/jlfvL0dZ8XGVlgd7iho9SfSc
   sdOCJRMId7XGeqc2mLlrOdFGTETQU3SLt6+U8biwmDyz8lNr+9ugC18/l
   Q==;
X-CSE-ConnectionGUID: oIGvkV4LQ3qKRH1IYNhw2g==
X-CSE-MsgGUID: f491V4scRiS0dBsL7e7hLg==
X-IronPort-AV: E=McAfee;i="6600,9927,11070"; a="11487220"
X-IronPort-AV: E=Sophos;i="6.08,155,1712646000"; 
   d="scan'208";a="11487220"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2024 23:42:46 -0700
X-CSE-ConnectionGUID: gfdO4aQlSneNaN+c9irxTg==
X-CSE-MsgGUID: AUfXvpcPSROm49ksxCqFlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,155,1712646000"; 
   d="scan'208";a="60866146"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 11 May 2024 23:42:43 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s62uu-0008Fr-0c;
	Sun, 12 May 2024 06:42:40 +0000
Date: Sun, 12 May 2024 14:41:54 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 6582/6591] arch/x86/kernel/head64.c:382:12:
 warning: no previous prototype for function
 'early_clflush_bss_decrypted_section'
Message-ID: <202405121442.lPkiL6yk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   af8a5753e476c40851cc338e3ac6aa2d962d05a1
commit: a232fa20af9767823243e08b945dbd150a280769 [6582/6591] x86/head/64: Flush caches for .bss..decrypted section after CR3 switches to early_top_pgt
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240512/202405121442.lPkiL6yk-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240512/202405121442.lPkiL6yk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405121442.lPkiL6yk-lkp@intel.com/

Note: functions only called from assembly code should be annotated with the asmlinkage attribute
All warnings (new ones prefixed by >>):

>> arch/x86/kernel/head64.c:382:12: warning: no previous prototype for function 'early_clflush_bss_decrypted_section' [-Wmissing-prototypes]
     382 | void __ref early_clflush_bss_decrypted_section(void)
         |            ^
   arch/x86/kernel/head64.c:382:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     382 | void __ref early_clflush_bss_decrypted_section(void)
         | ^
         | static 
   1 warning generated.


vim +/early_clflush_bss_decrypted_section +382 arch/x86/kernel/head64.c

   381	
 > 382	void __ref early_clflush_bss_decrypted_section(void)
   383	{
   384		unsigned long vaddr, vaddr_end;
   385		char *cl, *start, *end;
   386	
   387		/* Only allow bsp flush these caches and the bsp must at early boot stage */
   388		if (bsp_flush_bss_decrypted_section_handled)
   389			return;
   390	
   391		if (read_cr3_pa() != __pa_nodebug(early_top_pgt))
   392			return;
   393	
   394		/* Only Hygon CSV guest should do the clflush */
   395		if (!__should_do_clflush())
   396			goto handled;
   397	
   398		/*
   399		 * The memory region of .bss..decrypted section maybe mapped
   400		 * with encryption in earlier stage. If the correspond stale
   401		 * caches lives in earlier stage were not flushed before we
   402		 * access that memory region, then Linux will crash later
   403		 * because the stale caches will pollute the memory. So we
   404		 * need flush the caches with encrypted mapping before we
   405		 * access .bss..decrypted section.
   406		 *
   407		 * The function __startup_64() have already filled the
   408		 * encrypted mapping for .bss..decrypted section, use that
   409		 * mapping here.
   410		 */
   411		vaddr = (unsigned long)__start_bss_decrypted -
   412					__START_KERNEL_map + phys_base;
   413		vaddr_end = (unsigned long)__end_bss_decrypted -
   414					__START_KERNEL_map + phys_base;
   415	
   416		/* Hardcode cl-size to 64 at this stage. */
   417		start = (char *)(vaddr & ~63);
   418		end   = (char *)((vaddr_end + 63) & ~63);
   419	
   420		asm volatile("mfence" : : : "memory");
   421		for (cl = start; cl != end; cl += 64)
   422			clflush(cl);
   423		asm volatile("mfence" : : : "memory");
   424	
   425	handled:
   426		bsp_flush_bss_decrypted_section_handled = true;
   427	}
   428	#endif
   429	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
