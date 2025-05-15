Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FAFA1C28E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 May 2025 14:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747317895; cv=none; b=oBnpGX+nYWkK27ANoj4sqlcAqponoefpaOBjVSr+YdLuFNb7QjogJ6UGee7+Z1DG65AC6+Gb6aCMG7aZGb65m/oBoTYamq1LLHW9e+46ghvWznPctvEf/NEZ3ifhs9ILlVGbvALqbbsoBjNQa2pCt/fGXSHlxaRV0oxaXjvMlAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747317895; c=relaxed/simple;
	bh=xnZzAo5XlH6clexuCtsuHmwPe6dlj9gUZ4O+ZpGNZDs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Zgl7kCIohXWocA0UWbN4UPI4Fa6HJtfONBRNGBmoW+dWXhkwFc1vd5/A/IQEz9IiLNE3oUzZQV94u0i3ygqPuu6rS11YwHKsAzHSx3Wq3MMZ2eY4fZ36H5zAH37R9+ZcVV+Tk/LVT95/YgBtelPpqXXXrtYPZpHl0IBiR3uthgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W+VCJzHE; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W+VCJzHE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747317894; x=1778853894;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xnZzAo5XlH6clexuCtsuHmwPe6dlj9gUZ4O+ZpGNZDs=;
  b=W+VCJzHE/9BrYH9CKNlPHKjKg9qu2dWsNd+YM8IR4Qv1ySg+N3aZujrp
   faqgAvlWCPS0U29i+LCqdusnYW5qFdAM2gEIpYNAliNwnZCkUBzoapesP
   nvOa3pfvR1Evj7s6Tp+8O1PFAh0F7oo+qY/jaQ+gedmhjAyOAByCA6DMC
   JzoJfvum6G7K3Az9cQxmmBeKr4DStw0mKuxMTJfpAe4vwyFFnX+KOgRlR
   mLSZILMWxW3gibeWn7U8mRA1eYYqOC04uF4zRe9h7dR4Hj91RnRHVDjU6
   0DcU6N8D751PzRfICoOpB/goaZLrBVOMgndU5d1pxwXsSerl0Qz3URbK7
   A==;
X-CSE-ConnectionGUID: xOec1awoSA+mxK04HW6g9Q==
X-CSE-MsgGUID: qPYGINR1TDyFa8dvp/tU7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="48943618"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="48943618"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 07:04:52 -0700
X-CSE-ConnectionGUID: F7eYwpx2TNuJzDsrz/PnWw==
X-CSE-MsgGUID: u+s9E/+fR/2aqb3/P+lBeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="138778835"
Received: from igk-lkp-server01.igk.intel.com (HELO a1decbf9c5f9) ([10.211.3.150])
  by fmviesa008.fm.intel.com with ESMTP; 15 May 2025 07:04:50 -0700
Received: from kbuild by a1decbf9c5f9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFZCa-0000F7-1i;
	Thu, 15 May 2025 14:04:48 +0000
Date: Thu, 15 May 2025 22:04:16 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2229/2229] arch/x86/kernel/head64.c:382:12:
 warning: no previous prototype for function
 'early_clflush_bss_decrypted_section'
Message-ID: <202505150041.GhGsIYWp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   a53913bacac4876eee9ce118b3101dff842318ef
commit: ca0c1fa1ec4b6d9040cec7e543d50a93fc88d4c6 [2229/2229] x86/head/64: Flush caches for .bss..decrypted section after CR3 switches to early_top_pgt
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250515/202505150041.GhGsIYWp-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.73.0 (cc66ad468 2023-10-03)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250515/202505150041.GhGsIYWp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505150041.GhGsIYWp-lkp@intel.com/

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
