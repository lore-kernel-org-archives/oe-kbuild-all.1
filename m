Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21263F20F4
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Jul 2026 09:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783590517; cv=none; b=Q5JjCaRKsm5ummGE2X6Y4dVYapWrL/v5+KpiyQOUAi/USGzWHht798sIMnroiBlDekONWLTKIZzQS0yNNHL3Ys+O+babIXfIF5YsxbcXwI25qW5ZT+G8NrqB9cM98dSHy3qMFw+qUzTtGzyhlIb2GxgZCSeUomyJ3LYWbflJWj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783590517; c=relaxed/simple;
	bh=8l7ft8qZfJXs9oNfNwa/9B7hzane0tcifinlWQq+vGM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EADS40L7ylDsY7htfzzjnu4Zb4NHgkq3pL8PTaA8DOiVL1pqP52OX2wtHDhaNpBdEsAxkWK5aUR+ol239MkDqtYgp5G6ddpeQ/v4e9GRNQHX9xL2E1lmHE2B00GOM/X+BntsFzIQlHrnTzqa0BcCZhYbKSz8GrVvH0wdXTsqOLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lqodi48t; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lqodi48t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783590515; x=1815126515;
  h=date:from:to:cc:subject:message-id;
  bh=8l7ft8qZfJXs9oNfNwa/9B7hzane0tcifinlWQq+vGM=;
  b=Lqodi48tCW92rtqI+y9ZxwIKsiF54F5SVDMNndK0rTrnuz+G4p1GTVhK
   bg/bIhtW5Kp8vOOP/leIuhv5oYAHwB2Wx1hjS0i3pC6h3TQtLV2NbbJLT
   aA0O3Nsdt/6AJkUY4skvTXmJUQrxSDQG3oZS1EApHZR1vRL2Z4JnlQdla
   8oplkFBm6ZYhHg3XuUQ9mA/MyEJLxvgHKtIFCp6RZut0TqpNrA3oJ9+U+
   J5LmZADU1H52y734q8V/kuqgF1ev/BUGpKml642PLQK202H9nNb4+6LL8
   BGaK6955mU+ouekwO+O7ouuIhw7svYaPiWFLQEWG4cclYsZaoAelzNbPU
   A==;
X-CSE-ConnectionGUID: m2i4WvUhRMyW0h43au21jA==
X-CSE-MsgGUID: /L6vhqtuQpqmUO8ugW4bLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="95781992"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="95781992"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 02:48:34 -0700
X-CSE-ConnectionGUID: FILuxyE/RxKMI71K+20m8Q==
X-CSE-MsgGUID: ruzyWlqzTamzEfD6zxNkOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="254048987"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 09 Jul 2026 02:48:32 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whlMr-00000000HWd-0WHO;
	Thu, 09 Jul 2026 09:48:29 +0000
Date: Thu, 09 Jul 2026 17:47:35 +0800
From: kernel test robot <lkp@intel.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 "David Hildenbrand (Arm)" <david@kernel.org>
Subject: [davidhildenbrand:folded_pgtable 14/32]
 arch/csky/mm/fault.c:139:9: error: 'pgdp_k' undeclared; did you mean
 'pmdp_k'?
Message-ID: <202607091707.RCUR8gr5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/davidhildenbrand/linux folded_pgtable
head:   0551ca68b7552b7d71f1d2882635809a573d6c79
commit: 0763dc8f9d1187b3697780a0773456af1522e2fa [14/32] csky: mm: use proper set_pXd() for folded patable in vmalloc_fault()
config: csky-allnoconfig (https://download.01.org/0day-ci/archive/20260709/202607091707.RCUR8gr5-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260709/202607091707.RCUR8gr5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607091707.RCUR8gr5-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/csky/mm/fault.c: In function 'vmalloc_fault':
>> arch/csky/mm/fault.c:139:9: error: 'pgdp_k' undeclared (first use in this function); did you mean 'pmdp_k'?
     139 |         pgdp_k = (pmd_t *)(init_mm.pgd + offset);
         |         ^~~~~~
         |         pmdp_k
   arch/csky/mm/fault.c:139:9: note: each undeclared identifier is reported only once for each function it appears in


vim +139 arch/csky/mm/fault.c

   114	
   115	static inline void vmalloc_fault(struct pt_regs *regs, int code, unsigned long addr)
   116	{
   117		pmd_t *pmdp, *pmdp_k, pmd_k;
   118		pte_t *ptep_k;
   119		int offset;
   120	
   121		BUILD_BUG_ON(CONFIG_PGTABLE_LEVELS != 2);
   122	
   123		/* User mode accesses just cause a SIGSEGV */
   124		if (user_mode(regs)) {
   125			do_trap(regs, SIGSEGV, code, addr);
   126			return;
   127		}
   128	
   129		/*
   130		 * Synchronize this task's top level page-table
   131		 * with the 'reference' page table.
   132		 *
   133		 * Do _not_ use "tsk" here. We might be inside
   134		 * an interrupt in the middle of a task switch..
   135		 */
   136		offset = pgd_index(addr);
   137	
   138		pmdp = (pmd_t *)(get_pgd() + offset);
 > 139		pgdp_k = (pmd_t *)(init_mm.pgd + offset);
   140		pmd_k = pmdp_get(pmdp_k);
   141		if (!pmd_present(pmd_k)) {
   142			no_context(regs, addr);
   143			return;
   144		}
   145	
   146		set_pmd(pmdp, pmd_k);
   147	
   148		ptep_k = pte_offset_kernel(pmdp_k, addr);
   149		if (!pte_present(ptep_get(ptep_k))) {
   150			no_context(regs, addr);
   151			return;
   152		}
   153	
   154		flush_tlb_one(addr);
   155	}
   156	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
