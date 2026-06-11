Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226C52EC0A6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jun 2026 20:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781209243; cv=none; b=WUgrfJJbBv2+urcivvt4z8St+KpBrwowZs4gnBn0sXbK7vW8aVXGk/azi/bz8jfM6s3ukJALy37a439CwD50g7b3+mRKcpTWu4XiOMulGqww1WvdxIM5EaFk97cMA6zyQuJSOwFrX+aZMclCHKn9/TGmPueoOvnASa6HHRZOhXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781209243; c=relaxed/simple;
	bh=mCXvHDta2zX3j4y0dsYPLePQv772oGLH5wXZRWy/SoU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=per4Vajaj9HBcgArhkST0pBw5ShNbgIiCGloiUnD3SU6gZ/t/wENYeFaVAOtP8YSF85O3X7cPKBzVgNqwgK8aNBgIxDisfBzoqN5a/QL88b6e93uAAWdNDbuUn8pul3DA2Db8gjZ+dOdeU5/uYo62j1IbQLw0HDUTU4CzzkoesA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QDchqTRP; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QDchqTRP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781209242; x=1812745242;
  h=date:from:to:cc:subject:message-id;
  bh=mCXvHDta2zX3j4y0dsYPLePQv772oGLH5wXZRWy/SoU=;
  b=QDchqTRPMae9ctZYG7AtnoBe3ZdmuiCWn87eDgvahgpGAVbKKffNN2Kk
   jZochk7Vn21Lo5MWqpzev2S+TvfT+UZs6FCXTgx5CbUCTQwlwKe/VYF3s
   jYy6kwSPn3f1LUQgJ9EyHcIMQ0BCUHLGWfSz7DrB6YXbDtdtp7yY0vsxk
   6PVeVRc8CDoisL1x9swl5BCiAJUSVxIGQBWOPe3EZ5HwRQH7fnVYh6KU5
   23fO+4PkpLzHMbzdFTaGEia8vbvX5LOAzkIS01qF4iXJ+WGL2tHwRnqzn
   qCb412KJg2pry28BVL2dLC01UFJCTvXcfx3ahaYOwDI6vNCC7AJMyVjvm
   w==;
X-CSE-ConnectionGUID: BEirRPd2TM+ffrPhbxrslA==
X-CSE-MsgGUID: EAuBEv1/R0eP/7PmuIlS3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="107469773"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="107469773"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 13:20:41 -0700
X-CSE-ConnectionGUID: XTIBYdnnRnKQJyp8Homraw==
X-CSE-MsgGUID: IJ5KirC1Q0mqhRqu3Pyq5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="276786651"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 11 Jun 2026 13:20:40 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXltF-00000000Np1-2Bgo;
	Thu, 11 Jun 2026 20:20:37 +0000
Date: Fri, 12 Jun 2026 04:19:39 +0800
From: kernel test robot <lkp@intel.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:b4/clear_not_present_full_ptes 3/4]
 include/linux/pgtable.h:974:31: warning: parameter 'addr' set but not used
Message-ID: <202606120426.Ikt3cwrC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/davidhildenbrand/linux b4/clear_not_present_full_ptes
head:   81719d3f861fee6a18ea50f011a411e7fa330df1
commit: cc8cb0687c651143e5bba6b80b26f188b5cd641d [3/4] mm: drop pte_clear_not_present_full()
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20260612/202606120426.Ikt3cwrC-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606120426.Ikt3cwrC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606120426.Ikt3cwrC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/mm.h:31,
                    from include/linux/pid_namespace.h:7,
                    from include/linux/ptrace.h:10,
                    from arch/openrisc/kernel/asm-offsets.c:29:
   include/linux/pgtable.h: In function 'clear_not_present_full_ptes':
>> include/linux/pgtable.h:974:31: warning: parameter 'addr' set but not used [-Wunused-but-set-parameter=]
     974 |                 unsigned long addr, pte_t *ptep, unsigned int nr, int full)
         |                 ~~~~~~~~~~~~~~^~~~
--
   In file included from include/linux/mm.h:31,
                    from include/linux/pid_namespace.h:7,
                    from include/linux/ptrace.h:10,
                    from arch/openrisc/kernel/asm-offsets.c:29:
   include/linux/pgtable.h: In function 'clear_not_present_full_ptes':
>> include/linux/pgtable.h:974:31: warning: parameter 'addr' set but not used [-Wunused-but-set-parameter=]
     974 |                 unsigned long addr, pte_t *ptep, unsigned int nr, int full)
         |                 ~~~~~~~~~~~~~~^~~~
   In file included from include/linux/mm.h:31,
                    from arch/openrisc/include/asm/pgalloc.h:20,
                    from arch/openrisc/include/asm/io.h:18,
                    from include/linux/io.h:12,
                    from include/linux/irq.h:20,
                    from include/asm-generic/hardirq.h:17,
                    from ./arch/openrisc/include/generated/asm/hardirq.h:1,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/kernel_stat.h:8,
                    from include/linux/cgroup.h:27,
                    from include/linux/cgroup_api.h:1,
                    from kernel/sched/sched.h:28,
                    from kernel/sched/rq-offsets.c:5:
   include/linux/pgtable.h: In function 'clear_not_present_full_ptes':
>> include/linux/pgtable.h:974:31: warning: parameter 'addr' set but not used [-Wunused-but-set-parameter=]
     974 |                 unsigned long addr, pte_t *ptep, unsigned int nr, int full)
         |                 ~~~~~~~~~~~~~~^~~~


vim +/addr +974 include/linux/pgtable.h

7df676974359f9 include/asm-generic/pgtable.h Bibo Mao                2020-05-27  956  
a62fb92ac12ed3 include/linux/pgtable.h       Ryan Roberts            2024-04-08  957  #ifndef clear_not_present_full_ptes
a62fb92ac12ed3 include/linux/pgtable.h       Ryan Roberts            2024-04-08  958  /**
a62fb92ac12ed3 include/linux/pgtable.h       Ryan Roberts            2024-04-08  959   * clear_not_present_full_ptes - Clear multiple not present PTEs which are
a62fb92ac12ed3 include/linux/pgtable.h       Ryan Roberts            2024-04-08  960   *				 consecutive in the pgtable.
a62fb92ac12ed3 include/linux/pgtable.h       Ryan Roberts            2024-04-08  961   * @mm: Address space the ptes represent.
a62fb92ac12ed3 include/linux/pgtable.h       Ryan Roberts            2024-04-08  962   * @addr: Address of the first pte.
a62fb92ac12ed3 include/linux/pgtable.h       Ryan Roberts            2024-04-08  963   * @ptep: Page table pointer for the first entry.
a62fb92ac12ed3 include/linux/pgtable.h       Ryan Roberts            2024-04-08  964   * @nr: Number of entries to clear.
a62fb92ac12ed3 include/linux/pgtable.h       Ryan Roberts            2024-04-08  965   * @full: Whether we are clearing a full mm.
a62fb92ac12ed3 include/linux/pgtable.h       Ryan Roberts            2024-04-08  966   *
a62fb92ac12ed3 include/linux/pgtable.h       Ryan Roberts            2024-04-08  967   * May be overridden by the architecture; otherwise, implemented as a simple
cc8cb0687c6511 include/linux/pgtable.h       David Hildenbrand (Arm  2026-06-10  968)  * loop over pte_clear().
a62fb92ac12ed3 include/linux/pgtable.h       Ryan Roberts            2024-04-08  969   *
a62fb92ac12ed3 include/linux/pgtable.h       Ryan Roberts            2024-04-08  970   * Context: The caller holds the page table lock.  The PTEs are all not present.
a62fb92ac12ed3 include/linux/pgtable.h       Ryan Roberts            2024-04-08  971   * The PTEs are all in the same PMD.
a62fb92ac12ed3 include/linux/pgtable.h       Ryan Roberts            2024-04-08  972   */
a62fb92ac12ed3 include/linux/pgtable.h       Ryan Roberts            2024-04-08  973  static inline void clear_not_present_full_ptes(struct mm_struct *mm,
a62fb92ac12ed3 include/linux/pgtable.h       Ryan Roberts            2024-04-08 @974  		unsigned long addr, pte_t *ptep, unsigned int nr, int full)
a62fb92ac12ed3 include/linux/pgtable.h       Ryan Roberts            2024-04-08  975  {
a62fb92ac12ed3 include/linux/pgtable.h       Ryan Roberts            2024-04-08  976  	for (;;) {
cc8cb0687c6511 include/linux/pgtable.h       David Hildenbrand (Arm  2026-06-10  977) 		pte_clear(mm, addr, ptep);
a62fb92ac12ed3 include/linux/pgtable.h       Ryan Roberts            2024-04-08  978  		if (--nr == 0)
a62fb92ac12ed3 include/linux/pgtable.h       Ryan Roberts            2024-04-08  979  			break;
a62fb92ac12ed3 include/linux/pgtable.h       Ryan Roberts            2024-04-08  980  		ptep++;
a62fb92ac12ed3 include/linux/pgtable.h       Ryan Roberts            2024-04-08  981  		addr += PAGE_SIZE;
a62fb92ac12ed3 include/linux/pgtable.h       Ryan Roberts            2024-04-08  982  	}
a62fb92ac12ed3 include/linux/pgtable.h       Ryan Roberts            2024-04-08  983  }
a62fb92ac12ed3 include/linux/pgtable.h       Ryan Roberts            2024-04-08  984  #endif
a62fb92ac12ed3 include/linux/pgtable.h       Ryan Roberts            2024-04-08  985  

:::::: The code at line 974 was first introduced by commit
:::::: a62fb92ac12ed39df4930dca599a3b427552882a mm: swap: free_swap_and_cache_nr() as batched free_swap_and_cache()

:::::: TO: Ryan Roberts <ryan.roberts@arm.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
