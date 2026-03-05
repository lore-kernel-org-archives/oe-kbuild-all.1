Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999B837416A
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Mar 2026 08:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772698967; cv=none; b=mXJpCwNAT3/q/D435nMBhtY/6P89PIebNVUE+YgNY8vvCL48xhsPokHlxH3vbYLy4WJEAeIRR+I3YZrOvn4ILpPUnl7odaJYCFkxqc0pEus2rI2S/lRVhKfG7JGZPyKoBV5Fq+15U0EdGgW2uDiIi18OPPWNjgvM3pMy7r0ZoxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772698967; c=relaxed/simple;
	bh=/1obMsVMTbjPwwFG1RlyFjz6OriiBBTRAcrYmvt0IIg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sDZGKXykDeHF4P3EL3xZzqWABCtk3cVD9rNprWwGoo2+aaclUE4jgvBt96tWs33eCEGjesiixjWtDn7LI98D9RJwfOJOq9y9h0V6weMjWRClE/lSKXTn5mSqpoFYaMWNto19OiS62ARBV3wMmU2QLL3j3NGioteRtb6/rwlrudU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PJcq6thC; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PJcq6thC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772698964; x=1804234964;
  h=date:from:to:cc:subject:message-id;
  bh=/1obMsVMTbjPwwFG1RlyFjz6OriiBBTRAcrYmvt0IIg=;
  b=PJcq6thCrvBlXHSzy+CuQHaml0p5fqTCuWW/1/mbSunK8o5CpxNOdair
   HS0gaRXLMP76fsOKetrEGvORz9yzz710ANqrJBYwwDyNT93pG3Kpsj8dA
   dNyrQdD4xqSdt2fYeZl1arTPz8YHUN0oTP0BiixcaBgQ0ynWbC6+Sgq5k
   FnQYI6gfAX8Uf0baZ2v8s7tM1KUrX6U/lzGiqHDtvlj1EL87RiaQvLXOe
   yWBYFmxzRV9OMMZZkmA4eH9VsYMN/6HdI5acSrnFJYsj1teWdB/sT1BHn
   C/FS/UBNszphaIpxF0obT0db6/GCsroEQmRbtDRDCcec3Qso4ucXcTYg9
   w==;
X-CSE-ConnectionGUID: EAfGQBcSRPavo0KDHPGqbQ==
X-CSE-MsgGUID: 6NxHOHvDQ9agVsIzz+RAEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="84111406"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="84111406"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 00:22:37 -0800
X-CSE-ConnectionGUID: LgrWNpkWSGm9vfkooHdxGw==
X-CSE-MsgGUID: mejCtOBoQvOk2SqynYQ1jQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO cadc4577a874) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 05 Mar 2026 00:22:34 -0800
Received: from kbuild by cadc4577a874 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vy3ya-000000000HY-1xvM;
	Thu, 05 Mar 2026 08:22:32 +0000
Date: Thu, 05 Mar 2026 16:22:24 +0800
From: kernel test robot <lkp@intel.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: [linuxppc:merge-test 8/28]
 arch/powerpc/kexec/crash.c:425:38: error: 'struct kimage' has no member named
 'arch'
Message-ID: <202603051636.SiLrBiuv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/linuxppc/linux merge-test
head:   51348d7aa6f1a90d45ecf693d94e7865439b09d1
commit: d1035200dfb801750f5fd8c3be2f61a37d2af884 [8/28] powerpc/crash: Update backup region offset in elfcorehdr on memory hotplug
config: powerpc64-randconfig-r051-20260305 (https://download.01.org/0day-ci/archive/20260305/202603051636.SiLrBiuv-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603051636.SiLrBiuv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603051636.SiLrBiuv-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/powerpc/kexec/crash.c: In function 'sync_backup_region_phdr':
>> arch/powerpc/kexec/crash.c:425:38: error: 'struct kimage' has no member named 'arch'
     425 |                                 image->arch.backup_start = phdr->p_offset;
         |                                      ^~
   arch/powerpc/kexec/crash.c:427:55: error: 'struct kimage' has no member named 'arch'
     427 |                                 phdr->p_offset = image->arch.backup_start;
         |                                                       ^~
   In file included from include/asm-generic/bug.h:31,
                    from arch/powerpc/include/asm/bug.h:116,
                    from include/linux/bug.h:5,
                    from include/linux/instrumented.h:10,
                    from include/asm-generic/bitops/instrumented-atomic.h:14,
                    from arch/powerpc/include/asm/bitops.h:321,
                    from include/linux/bitops.h:67,
                    from include/linux/kernel.h:23,
                    from arch/powerpc/kexec/crash.c:10:
   arch/powerpc/kexec/crash.c:430:44: error: 'struct kimage' has no member named 'arch'
     430 |                                       image->arch.backup_start);
         |                                            ^~
   include/linux/printk.h:483:33: note: in definition of macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:584:9: note: in expansion of macro 'printk'
     584 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kexec.h:531:40: note: in expansion of macro 'pr_info'
     531 |         do { if (kexec_file_dbg_print) pr_info(fmt, ##arg); } while (0)
         |                                        ^~~~~~~
   arch/powerpc/kexec/crash.c:429:25: note: in expansion of macro 'kexec_dprintk'
     429 |                         kexec_dprintk("Backup region offset updated to 0x%lx\n",
         |                         ^~~~~~~~~~~~~


vim +425 arch/powerpc/kexec/crash.c

   402	
   403	#ifdef CONFIG_CRASH_DUMP
   404	/**
   405	 * sync_backup_region_phdr - synchronize backup region offset between
   406	 *			    kexec image and ELF core header.
   407	 * @image: Kexec image.
   408	 * @ehdr: ELF core header.
   409	 * @phdr_to_kimage: If true, read the offset from the ELF program header
   410	 *		    and update the kimage backup region. If false, update
   411	 *		    the ELF program header offset from the kimage backup
   412	 *		    region.
   413	 *
   414	 * Returns nothing.
   415	 */
   416	void sync_backup_region_phdr(struct kimage *image, Elf64_Ehdr *ehdr, bool phdr_to_kimage)
   417	{
   418		Elf64_Phdr *phdr;
   419		unsigned int i;
   420	
   421		phdr = (Elf64_Phdr *)(ehdr + 1);
   422		for (i = 0; i < ehdr->e_phnum; i++, phdr++) {
   423			if (phdr->p_paddr == BACKUP_SRC_START) {
   424				if (phdr_to_kimage)
 > 425					image->arch.backup_start = phdr->p_offset;
   426				else
   427					phdr->p_offset = image->arch.backup_start;
   428	
   429				kexec_dprintk("Backup region offset updated to 0x%lx\n",
   430					      image->arch.backup_start);
   431				return;
   432			}
   433		}
   434	}
   435	#endif /* CONFIG_CRASH_DUMP */
   436	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
