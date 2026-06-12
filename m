Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6108335AC17
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jun 2026 07:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781247703; cv=none; b=O3twcXOQaVqbPug2k+BXJYnYzDH/mii4rKN2e0Xgug4S6eM4D3jt4A1xMgAJsBcGkprKRHXofJMzUEAJzRBe5zs6cxcdvrtoWEFGLImUId4+7L+niGjqcYw7nPcCba4VP0qSLJ1RvB5R65rPSrOkdvm30rUaRjSxpOimNgSiNCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781247703; c=relaxed/simple;
	bh=efCU5Em2UP/ND9ML//jNSLDrB3IBzCejGASuKi3woyE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GvAwPJ7ixxaFlIKENCDMy33fVDJ2m7LYg0LBf/o/pvyWtfSHTSRz94AKM+9bG3lON/UsVF+Fm6dgYUfj86KLbC54FkoujNltX3NMnkIn1TDBXsge4hs5cqX7+hm9uB07mFHV7kYNWRy+vDJ+C1Bx4dHHAxCWsj42Lm0kBiel+LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I+bNSa3z; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I+bNSa3z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781247701; x=1812783701;
  h=date:from:to:cc:subject:message-id;
  bh=efCU5Em2UP/ND9ML//jNSLDrB3IBzCejGASuKi3woyE=;
  b=I+bNSa3zpRZnGzATEEDlyKrsQVjQ107AAqq6rBZI3LZuAIupinlmUeua
   gsMMESK9PgCVlq917ksSXhJ/CofxdsTf6zQEHfaX0bW8tlz4ZZAqVBJtB
   ObskHNQswGpjS4SAPsskMe3BeLKbUlg923vxp6SifRlBtBtGk7zSPBDxH
   zGFM1sVnEWKYNntHrroc3u4+UqgfGxc3HVitTA3zkxbiqa0EosbH81A8t
   svSos4JPd1qdL0LasQtJ/g/LlvvAzFN/UOIZ9DX4lkQBe3tCzHENeZMri
   QpTsmmlViHZriHCT2gwtatSySjcRnE0bDauBfwNJ4azIiINICrlgmmKHM
   A==;
X-CSE-ConnectionGUID: RtDlFFh0QjKBHSFFBpMAUw==
X-CSE-MsgGUID: wS6wU/tISuKNv4Fv9fAvtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81816460"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="81816460"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 00:01:40 -0700
X-CSE-ConnectionGUID: RzaIrUokTBGvHClPweElww==
X-CSE-MsgGUID: pKdA3yDhQWiK+MLFyyhaWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="251831298"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 12 Jun 2026 00:01:39 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXvtY-00000000OQn-3Qox;
	Fri, 12 Jun 2026 07:01:36 +0000
Date: Fri, 12 Jun 2026 15:00:52 +0800
From: kernel test robot <lkp@intel.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:b4/clear_not_present_full_ptes 3/4]
 include/linux/pgtable.h:974:31: error: parameter 'addr' set but not used
Message-ID: <202606121420.Wke8Ipgx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/davidhildenbrand/linux b4/clear_not_present_full_ptes
head:   81719d3f861fee6a18ea50f011a411e7fa330df1
commit: cc8cb0687c651143e5bba6b80b26f188b5cd641d [3/4] mm: drop pte_clear_not_present_full()
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260612/202606121420.Wke8Ipgx-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606121420.Wke8Ipgx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606121420.Wke8Ipgx-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kasan.h:38,
                    from include/linux/slab.h:264,
                    from lib/test_bitops.c:12:
   include/linux/pgtable.h: In function 'clear_not_present_full_ptes':
>> include/linux/pgtable.h:974:31: error: parameter 'addr' set but not used [-Werror=unused-but-set-parameter=]
     974 |                 unsigned long addr, pte_t *ptep, unsigned int nr, int full)
         |                 ~~~~~~~~~~~~~~^~~~
   cc1: all warnings being treated as errors


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
