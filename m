Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715E7218ADE
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Aug 2025 06:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754203888; cv=none; b=HZ6oFzP51z8fHOqOd6qlNDYFKphlubY8XdlEtw0+b5xzLn6SKs8L8/0kPhzj6Z8XehwMXLGWpZ/dZInDCOaEoasi6h5VJ/Q/ClQ0yCcQ9ctyj0lzP2R5MRqHyOE00Y1Ju+vuwmQieZVpg3FWRP75UMPHZK9c5eRy7WBLq+d2uVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754203888; c=relaxed/simple;
	bh=xvSr2HcSIjb3lczwCIo1SiSSPwwnjJyilJUhYaK+Zxo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E+PrQAp8KOJ7rxZRH1M+xDsnHAawNfzP+dX567JSHivEPwh4kPJfuw48NYXnODDbk9FQqQxzyMdC1NlsAvMlWhYu0q/H61EL/SDDUYcvMwivo6rRRUPbMKRQu9s2gnN2dawCTMw7O6v+4AfreYKrePGBCAYyiu3yqYCfm1gJ8zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MnudCfb/; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MnudCfb/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754203886; x=1785739886;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xvSr2HcSIjb3lczwCIo1SiSSPwwnjJyilJUhYaK+Zxo=;
  b=MnudCfb//YuEZSMtq7vySdZuKqywYjpQmfm2LMsK6eHNAx/y2S42JI/I
   pADgINYW2aZYhheTTobMU8nTDBaJX2+lR57AdA4AjgHkYLxW1IqRgrxwa
   exJ2KVAdXIYAzOQmN+hXrzjNa1dVktrGeMkB92qBmX2P0PmgtmDc+05oM
   Y5xMxHIAR4+V510ioQyro9NH63CPoUBclecW72bw1WTwC/PbHF7quQDOu
   dm+nPffU+5NT2MDD2X8rVRPoTRsJTxYq8bTqW83Xd0QyNYYLLjgyklmly
   0+v8PKuxJTIrDE7EBHD+renEfD2r1iRpAtVyMGByz7ch4H/go/OJDZJ2A
   A==;
X-CSE-ConnectionGUID: 2Rs4HRBWRvKrjNbFat0z7Q==
X-CSE-MsgGUID: s1MSOrkkSNO48IA/NlyyCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11510"; a="73952360"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="73952360"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2025 23:51:25 -0700
X-CSE-ConnectionGUID: CYr+xcNcTLabNP2t1X/eMw==
X-CSE-MsgGUID: SHIJ9NMbRz2Rs+EJqG/xgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="163444554"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa007.fm.intel.com with ESMTP; 02 Aug 2025 23:51:24 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uiSYz-0001ZP-1T;
	Sun, 03 Aug 2025 06:51:21 +0000
Date: Sun, 3 Aug 2025 08:50:41 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2632/2632] arch/x86/kernel/head64.c:382:12:
 warning: no previous prototype for 'early_clflush_bss_decrypted_section'
Message-ID: <202508030825.1WNeA3KA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   e5f0407c7ee0aba1c7b2ab0f516e9dfb707a0ee2
commit: ca0c1fa1ec4b6d9040cec7e543d50a93fc88d4c6 [2632/2632] x86/head/64: Flush caches for .bss..decrypted section after CR3 switches to early_top_pgt
config: x86_64-buildonly-randconfig-2001-20250803 (https://download.01.org/0day-ci/archive/20250803/202508030825.1WNeA3KA-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250803/202508030825.1WNeA3KA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508030825.1WNeA3KA-lkp@intel.com/

Note: functions only called from assembly code should be annotated with the asmlinkage attribute
All warnings (new ones prefixed by >>):

>> arch/x86/kernel/head64.c:382:12: warning: no previous prototype for 'early_clflush_bss_decrypted_section' [-Wmissing-prototypes]
     382 | void __ref early_clflush_bss_decrypted_section(void)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


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
