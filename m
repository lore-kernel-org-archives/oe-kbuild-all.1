Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006A03ACA77
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Mar 2026 11:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772622992; cv=none; b=BZBm3j1TSgathhPhyzKvN49IBH634PyEBdBh+DMO6crxQ3ELn/1rn3oz9O64j/GM2t0YOcAk30Jz7+LeFrsv6k5+Kc55XgKTIolkdIePOvuMk/U3FW2aL7OAqEZLDcYoZF2tGbVJjwupuHhmDC0sDXgBHhc5sXkFILDbQWFY1BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772622992; c=relaxed/simple;
	bh=ZuwF8tnHL+EIzUEc+HNA3bGNO+8PC+1hzz+5wJXFblY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BiUCaRRsMYH35VFU/aa88gbs+nw1u+yWYHqyhEyqxNIXTgwHcWYnnUCNQoW/oo7jNXvkztJxTZ7dVcJMT0Xm4B1bS5Padao1fu7XAOXEsTfupqMT64BmxAVJxvh/KLrMMzfrEyL/29IUFCGGO6QUIC/wZzTVzbqpWlU4aZVmVBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ef0qB/hS; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ef0qB/hS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772622990; x=1804158990;
  h=date:from:to:cc:subject:message-id;
  bh=ZuwF8tnHL+EIzUEc+HNA3bGNO+8PC+1hzz+5wJXFblY=;
  b=ef0qB/hS7ZALp32eMMUwUQ2rf6YqSJ+1FHiqxVDRZEbThlg48t+p4Ukt
   taeHq2jsMbh2XTNl5ndodLj6ThE19afoyDF0ppceadOeuz1p1ALccPPY0
   PloSfvfAYCLkV/xKY6PfLP4Do30PpBaiq/KS76fayFpEojBCmtNNFRetg
   ZfQalbmhYhpwVPV1v7TThzlPVo8ScmZqRZGahe2CdGZQm3ilgzNr1rWcr
   f5bCgnj5DetV9ypCkctCl0g7b5C8+Y37TXa6AJLP1L0QNNITeH36raBrF
   4AGeKdpbh0EgVgQFOm1YCIaVutSxGX600fU0oA8W034HfaHun/6zzu7pQ
   Q==;
X-CSE-ConnectionGUID: VzAaHKkcT3KpPE/j4IrAbw==
X-CSE-MsgGUID: Fmv5+Ao8TmKBw5vkRw2yYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="73646491"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; 
   d="scan'208";a="73646491"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 03:16:30 -0800
X-CSE-ConnectionGUID: eZU9nz0GRJ6QUWZ0y3jt6g==
X-CSE-MsgGUID: YFfHuwYWShKOFRPw26vHuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; 
   d="scan'208";a="215692440"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 04 Mar 2026 03:16:28 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxkDJ-000000001fx-3sbL;
	Wed, 04 Mar 2026 11:16:25 +0000
Date: Wed, 04 Mar 2026 12:15:29 +0100
From: kernel test robot <lkp@intel.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: [linuxppc:merge-test 8/28]
 arch/powerpc/kexec/crash.c:425:38: error: 'struct kimage' has no member named
 'arch'
Message-ID: <202603041251.fEtyajDg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/linuxppc/linux merge-test
head:   51348d7aa6f1a90d45ecf693d94e7865439b09d1
commit: d1035200dfb801750f5fd8c3be2f61a37d2af884 [8/28] powerpc/crash: Update backup region offset in elfcorehdr on memory hotplug
config: powerpc64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260304/202603041251.fEtyajDg-lkp@intel.com/config)
compiler: powerpc64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260304/202603041251.fEtyajDg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603041251.fEtyajDg-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/powerpc/kexec/crash.c: In function 'sync_backup_region_phdr':
>> arch/powerpc/kexec/crash.c:425:38: error: 'struct kimage' has no member named 'arch'
     425 |                                 image->arch.backup_start = phdr->p_offset;
         |                                      ^~
   arch/powerpc/kexec/crash.c:427:55: error: 'struct kimage' has no member named 'arch'
     427 |                                 phdr->p_offset = image->arch.backup_start;
         |                                                       ^~
   In file included from ./include/asm-generic/bug.h:31,
                    from ./arch/powerpc/include/asm/bug.h:116,
                    from ./include/linux/bug.h:5,
                    from ./include/linux/instrumented.h:10,
                    from ./include/asm-generic/bitops/instrumented-atomic.h:14,
                    from ./arch/powerpc/include/asm/bitops.h:321,
                    from ./include/linux/bitops.h:67,
                    from ./include/linux/kernel.h:23,
                    from arch/powerpc/kexec/crash.c:10:
   arch/powerpc/kexec/crash.c:430:44: error: 'struct kimage' has no member named 'arch'
     430 |                                       image->arch.backup_start);
         |                                            ^~
   ./include/linux/printk.h:483:33: note: in definition of macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   ./include/linux/printk.h:584:9: note: in expansion of macro 'printk'
     584 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   ./include/linux/kexec.h:531:40: note: in expansion of macro 'pr_info'
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
