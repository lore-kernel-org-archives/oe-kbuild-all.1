Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD8C4CA29B
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Sep 2026 12:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788784786; cv=none; b=N3srrslafUMS6/6x9Mv9aZLfEJIaxlMvDuxzrBLVB+D2bZvtAp+OkDVwAdpDbeKO8P8ZX7ajGk9C1OK/4L4kphIVojCLcREFqj+GNJRWUOrx0rE+Z5Y+rvO1x0PVTn4FHUXLnasEnm2quBmNxA30IRFtTVwC8E9bC+qTkG7kKdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788784786; c=relaxed/simple;
	bh=APQmt5kSwYGxKeXppfmOH3d1d4PjHWmHQHLzH57eh+c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Bwf0XUgGFOuEIql22jjCOX2R4VAMuT6eTwv2Pl4BhPRNqr9R/jSLSW6vXrV9kgUQsXQfr+/i3gtPYvWZaEi7P5/7fK+AlLAG69/EcVEQZMKa8apb4UMtQf0BjHVHDh/nucd3eAngPgK215KO+C116b5v5WrxKUfnB4Glahc1tyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bLtixPnJ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bLtixPnJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788784782; x=1820320782;
  h=date:from:to:cc:subject:message-id;
  bh=APQmt5kSwYGxKeXppfmOH3d1d4PjHWmHQHLzH57eh+c=;
  b=bLtixPnJXebiyNiynDFgJzB0aNa/Cv7wxsnXQFedf5XBtJ4f0DOQW+dB
   z6KkygxlNrZp8pLIduLsWr1g7dTeVmAjQEx/Z9aUHRev8hSDlvKwruW8S
   eNskB9mmLBVrx3MqUAd+Zrb1eJEA9gqfeEgNOYFJMo3dgoQ+bbyufL5Z0
   6QByHiD2fB4wILMwpl60+W/IGw5VpTvV/qeDoSsRAyYUdCvE5aaje+1O/
   Y+rDsp9xlgrxLs4gO/lY6PQimEYjhLnzNkY2spo+QTsqWCV7ITmPYoAwF
   IxRtoyEYautOm8x+20qjHzR55t0rmL9BRITYE3QanegtEXnHFY+nfoR02
   w==;
X-CSE-ConnectionGUID: 0ZrkjKuCQmWNQIJdx0NqKg==
X-CSE-MsgGUID: k746vhWWTdGv6wjljzWVSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="106704057"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
   d="scan'208";a="106704057"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 05:39:41 -0700
X-CSE-ConnectionGUID: Ud14w3rPS9iHIXMmnElYAA==
X-CSE-MsgGUID: 89PqQ0PFRkqbN1+cef7N0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
   d="scan'208";a="266361282"
Received: from lkp-server01.sh.intel.com (HELO dff15f1b2031) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 07 Sep 2026 05:39:39 -0700
Received: from kbuild by dff15f1b2031 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3YdN-000000000tT-1oro;
	Mon, 07 Sep 2026 12:39:37 +0000
Date: Mon, 07 Sep 2026 20:38:51 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [daveh-devel:shstk-vmalloc 19/19]
 arch/x86/kernel/shstk_kunit.c:75:36: warning: cast from pointer to integer of
 different size
Message-ID: <202609072027.cydV3K5Z-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/daveh/devel.git shstk-vmalloc
head:   a820a994160883fea70750876fe26073766d831f
commit: a820a994160883fea70750876fe26073766d831f [19/19] kshstk-onoff-test
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20260907/202609072027.cydV3K5Z-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260907/202609072027.cydV3K5Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609072027.cydV3K5Z-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kernel/shstk_kunit.c: In function 'enable_kernel_shstk_and_load_ssp':
>> arch/x86/kernel/shstk_kunit.c:75:36: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      75 |         __wrmsrq(MSR_IA32_PL0_SSP, (u64)token_addr);
         |                                    ^
   arch/x86/kernel/shstk_kunit.c: Assembler messages:
   arch/x86/kernel/shstk_kunit.c:47: Error: `rdsspq' is only supported in 64-bit mode


vim +75 arch/x86/kernel/shstk_kunit.c

    61	
    62	static noinline notrace void enable_kernel_shstk_and_load_ssp(unsigned long *token_addr)
    63	{
    64		unsigned long flags;
    65		u64 old_msr;
    66		/*
    67		 * 2. Format 64-bit Restore Token:
    68		 * Token must match linear address of token itself with Bit 0 set (64-bit mode)
    69		 * and Bit 1 clear (not busy).
    70		 */
    71		unsigned long restore_token = (unsigned long)token_addr | 0x1ULL;
    72		printk("CET Test: Prepared restore token 0x%lx at %p\n", restore_token, token_addr);
    73	
    74		local_irq_save(flags);
  > 75		__wrmsrq(MSR_IA32_PL0_SSP, (u64)token_addr);
    76		old_msr = __rdmsr(MSR_IA32_S_CET);
    77	
    78		/* Must be atomic, nothing can go in between these two: */
    79		__wrmsrq(MSR_IA32_S_CET, old_msr | CET_SHSTK_EN | CET_WRSS_EN);
    80		asm volatile ( "setssbsy" ::: "memory" );
    81		//wrssq(restore_token, token_addr);
    82		/* End atomic bit */
    83	
    84	
    85		local_irq_restore(flags);
    86	}
    87	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
