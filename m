Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D7A34A773
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Jan 2026 22:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769812418; cv=none; b=HpEVN8RUGopvhnsHHo/CjrzO2tFui6OTe1uzX1pXxvWZPGXn7drAXmCmWZ1gUj6dQXT0hkLfmjW0mMe7zZI8JLyt7UZUZI/8I2SYgnxmUcZsHjRt0RF1MLjcCsvfbNwaAsTxo8jcXbr1xmB1jCa39dfZIndDbBcswdG0ytzw5G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769812418; c=relaxed/simple;
	bh=lKv7JAWnphs1nyzsBh4J/p0yHhK+pvwOh3V0W2FsVzU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=A02gXS8kUvj87D0kyePZFZAxS9e5U4xVqMut9JkiYaFEwu0NICcdILL7N//Ivx0XB+7zwHVZlmOqQin3INwm8g9ShqTFwJk3Qhl2E5Z/15p0y6MsxiHMIWrauRtU8wNzy55PjgmI4WIKGrF6a3YLOD6XIoHhDJQfgA2Jj4S5pBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZP9DOmw9; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZP9DOmw9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769812418; x=1801348418;
  h=date:from:to:cc:subject:message-id;
  bh=lKv7JAWnphs1nyzsBh4J/p0yHhK+pvwOh3V0W2FsVzU=;
  b=ZP9DOmw9q74d0c9lmMCOXDWVjJeV9IpA+NL8MVefwIB2I1OLMvtdajoA
   sTY1m0Ju6n9EU6C4j1KQHpyhanEMuQfwj/javE06Uw9FRkVfGOStpVCRY
   ks6jc07gdRvDJdRBHYtU7joAYRziLAZY4vKk0ZSCAyjyWFVFMaMgxXpY9
   IbCKAZL5JqT1vJhUad8cIeutbRuLiDzUUyoVyaR994fgnCo0sbLXM5yAy
   wgEOiSkxbjrTXm67sjkmLhCIYFyn0BL2CPLFZ+lT0CCNkEKYwdR2DCd80
   HPDiv2su68VjvJ4bL6Z2UQ6gfX8xi66NFmE4q40EnnGoh2QixU91wZ/bL
   Q==;
X-CSE-ConnectionGUID: XxHYXipWSl+pbhEWv/rP4g==
X-CSE-MsgGUID: XpW/FEx2RTaG0vmdCSg9wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="71047138"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; 
   d="scan'208";a="71047138"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 14:33:37 -0800
X-CSE-ConnectionGUID: oLIJLHweRQaqqVuTP7NSkw==
X-CSE-MsgGUID: SmGCf/53TnaZ8KbFGYTNCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; 
   d="scan'208";a="208956323"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 30 Jan 2026 14:33:35 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlx3U-00000000dRq-2kKQ;
	Fri, 30 Jan 2026 22:33:32 +0000
Date: Sat, 31 Jan 2026 06:33:11 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie-v4-wip 22/22]
 arch/x86/boot/startup/map_kernel.c:111:33: error: 'struct boot_params' has no
 member named 'kaslr_va_shift'
Message-ID: <202601310642.Agoh4xjA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-v4-wip
head:   1857f672aab1ce60b60db9458e7120522a7b5056
commit: 1857f672aab1ce60b60db9458e7120522a7b5056 [22/22] WIP
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260131/202601310642.Agoh4xjA-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260131/202601310642.Agoh4xjA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601310642.Agoh4xjA-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/boot/startup/map_kernel.c: In function '__startup_64':
>> arch/x86/boot/startup/map_kernel.c:111:33: error: 'struct boot_params' has no member named 'kaslr_va_shift'
     111 |                 p2v_offset -= bp->kaslr_va_shift;
         |                                 ^~


vim +111 arch/x86/boot/startup/map_kernel.c

    78	
    79	/*
    80	 * This code is compiled using PIC codegen because it will execute from the
    81	 * early 1:1 mapping of memory, which deviates from the mapping expected by the
    82	 * linker. Due to this deviation, taking the address of a global variable will
    83	 * produce an ambiguous result when using the plain & operator.  Instead,
    84	 * rip_rel_ptr() must be used, which will return the RIP-relative address in
    85	 * the 1:1 mapping of memory. Kernel virtual addresses can be determined by
    86	 * subtracting p2v_offset from the RIP-relative address.
    87	 */
    88	unsigned long __init __startup_64(unsigned long p2v_offset,
    89					  struct boot_params *bp)
    90	{
    91		pmd_t (*early_pgts)[PTRS_PER_PMD] = rip_rel_ptr(early_dynamic_pgts);
    92		unsigned long physaddr = (unsigned long)rip_rel_ptr(_text);
    93		unsigned long va_text, va_end;
    94		unsigned long pgtable_flags;
    95		unsigned long load_delta;
    96		pgdval_t *pgd;
    97		p4dval_t *p4d;
    98		pudval_t *pud;
    99		pmdval_t *pmd, pmd_entry;
   100		bool la57;
   101		int i;
   102	
   103		la57 = check_la57_support();
   104	
   105		/* Is the address too large? */
   106		if (physaddr >> MAX_PHYSMEM_BITS)
   107			for (;;);
   108	
   109		sanitize_boot_params(bp);
   110		if (IS_ENABLED(CONFIG_RELOCATABLE_PIE))
 > 111			p2v_offset -= bp->kaslr_va_shift;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
