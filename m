Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE67200C2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Mar 2026 03:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774408308; cv=none; b=f9QMYcSyzcetzzFbQd27+kS7b61fzSkne2E+D8iRIFrDwPRMGwwMLm4gePlKPbH+81ebcFO6SOTBHxqXqYk75WWtuenZyCXrYZ/+z6fnueAfm86e0vQOaJuVNsYVWEqPnZLRmBLCPbf37e6TXApSQTMNnarW5dLXLDEo41IJZEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774408308; c=relaxed/simple;
	bh=ZkltJBbc0+wxrNQ/PVi2SHIeuCkmUfAXUF66t+KSeNA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DfJfQEweZIiMa4R2adE/sJrcqmjc6zOb7P8ho/miPBrZHBd63BgcJHgLrAprLYOg4I63NxnWbPsKlJTjcaTaIBNXtcjdQZKnFUZ4tWLzl+/QVW1pY4PQZIpf+gqi9Bo5HwVSoMngu+as5v7Nx7FMJCGD+5TKLmZMjQ21fG4W+qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lRQh43mC; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lRQh43mC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774408307; x=1805944307;
  h=date:from:to:cc:subject:message-id;
  bh=ZkltJBbc0+wxrNQ/PVi2SHIeuCkmUfAXUF66t+KSeNA=;
  b=lRQh43mCpb4lZ85Muh4z9hv55DerTe1IVAofQ3HNs7kL0K4RNdrGAy9J
   Swci5Eq4M0NYEMXXytx9iJPTnzlLmfWCqaG6xkMscr6fzls3j05k72cQf
   rjbLkR/2jnbyf8cPpp6EO0vCn2to0NhyZwtvicRDMYYs8c06vRaUzBVUG
   t6ArluFzHBgvsMEsnMmRpyujbLhunlBgbyLlvpM27LRIx97TYdRIEFG1R
   BsXZVnDslkx6/eN1bg4OpoSYnP8pJMbOx5QcgMumOZmMU6AFVDYyoHMKz
   Ce0cIVdCOnSltNeGN7xMcQ8ZsmG4RaZ61p5IdD3VpK5lk1oRX7HTs1c91
   A==;
X-CSE-ConnectionGUID: 9ue09hvlTDKS+yG6V0UplA==
X-CSE-MsgGUID: p9BTmrMjS3iRvlfYJRD70A==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="86915769"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="86915769"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 20:11:46 -0700
X-CSE-ConnectionGUID: a9TdcdxfTnGFS7uzWEVNOw==
X-CSE-MsgGUID: kolyf6s8QRuLXILDEdlCMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="221208232"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 24 Mar 2026 20:11:44 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5Eej-000000005on-1vzE;
	Wed, 25 Mar 2026 03:11:41 +0000
Date: Wed, 25 Mar 2026 11:10:49 +0800
From: kernel test robot <lkp@intel.com>
To: Chengkaitao <chengkaitao@kylinos.cn>
Cc: oe-kbuild-all@lists.linux.dev, David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-stable 72/140] arch/sparc/mm/init_64.c:2582:16:
 error: implicit declaration of function 'vmemmap_pgd_populate'; did you mean
 'vmemmap_populate'?
Message-ID: <202603251147.CtgepAeH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-stable
head:   e393ce79b3cf63c2810be882eb6e531a54f520f4
commit: e504282091c8e4dc4f945c89d9b44ac2e0bfe504 [72/140] mm: convert vmemmap_p?d_populate() to static functions
config: sparc-randconfig-001-20260325 (https://download.01.org/0day-ci/archive/20260325/202603251147.CtgepAeH-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260325/202603251147.CtgepAeH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603251147.CtgepAeH-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   arch/sparc/mm/init_64.c: In function 'sun4v_linear_pte_xor_finalize':
   arch/sparc/mm/init_64.c:2202:16: warning: variable 'pagecv_flag' set but not used [-Wunused-but-set-variable]
     unsigned long pagecv_flag;
                   ^~~~~~~~~~~
   arch/sparc/mm/init_64.c: In function 'vmemmap_populate':
>> arch/sparc/mm/init_64.c:2582:16: error: implicit declaration of function 'vmemmap_pgd_populate'; did you mean 'vmemmap_populate'? [-Werror=implicit-function-declaration]
      pgd_t *pgd = vmemmap_pgd_populate(vstart, node);
                   ^~~~~~~~~~~~~~~~~~~~
                   vmemmap_populate
>> arch/sparc/mm/init_64.c:2582:16: warning: initialization of 'pgd_t *' {aka 'struct <anonymous> *'} from 'int' makes pointer from integer without a cast [-Wint-conversion]
>> arch/sparc/mm/init_64.c:2591:9: error: implicit declaration of function 'vmemmap_p4d_populate'; did you mean 'vmemmap_populate'? [-Werror=implicit-function-declaration]
      p4d = vmemmap_p4d_populate(pgd, vstart, node);
            ^~~~~~~~~~~~~~~~~~~~
            vmemmap_populate
>> arch/sparc/mm/init_64.c:2591:7: warning: assignment to 'p4d_t *' {aka 'struct <anonymous> *'} from 'int' makes pointer from integer without a cast [-Wint-conversion]
      p4d = vmemmap_p4d_populate(pgd, vstart, node);
          ^
>> arch/sparc/mm/init_64.c:2595:9: error: implicit declaration of function 'vmemmap_pud_populate'; did you mean 'vmemmap_populate'? [-Werror=implicit-function-declaration]
      pud = vmemmap_pud_populate(p4d, vstart, node);
            ^~~~~~~~~~~~~~~~~~~~
            vmemmap_populate
>> arch/sparc/mm/init_64.c:2595:7: warning: assignment to 'pud_t *' {aka 'struct <anonymous> *'} from 'int' makes pointer from integer without a cast [-Wint-conversion]
      pud = vmemmap_pud_populate(p4d, vstart, node);
          ^
   cc1: some warnings being treated as errors


vim +2582 arch/sparc/mm/init_64.c

c4bce90ea2069e arch/sparc64/mm/init.c  David S. Miller   2006-02-11  2563  
46644c2477c589 arch/sparc64/mm/init.c  David Miller      2007-10-16  2564  #ifdef CONFIG_SPARSEMEM_VMEMMAP
0aad818b2de455 arch/sparc/mm/init_64.c Johannes Weiner   2013-04-29  2565  int __meminit vmemmap_populate(unsigned long vstart, unsigned long vend,
7b73d978a5d0d2 arch/sparc/mm/init_64.c Christoph Hellwig 2017-12-29  2566  			       int node, struct vmem_altmap *altmap)
46644c2477c589 arch/sparc64/mm/init.c  David Miller      2007-10-16  2567  {
46644c2477c589 arch/sparc64/mm/init.c  David Miller      2007-10-16  2568  	unsigned long pte_base;
46644c2477c589 arch/sparc64/mm/init.c  David Miller      2007-10-16  2569  
46644c2477c589 arch/sparc64/mm/init.c  David Miller      2007-10-16  2570  	pte_base = (_PAGE_VALID | _PAGE_SZ4MB_4U |
46644c2477c589 arch/sparc64/mm/init.c  David Miller      2007-10-16  2571  		    _PAGE_CP_4U | _PAGE_CV_4U |
46644c2477c589 arch/sparc64/mm/init.c  David Miller      2007-10-16  2572  		    _PAGE_P_4U | _PAGE_W_4U);
46644c2477c589 arch/sparc64/mm/init.c  David Miller      2007-10-16  2573  	if (tlb_type == hypervisor)
46644c2477c589 arch/sparc64/mm/init.c  David Miller      2007-10-16  2574  		pte_base = (_PAGE_VALID | _PAGE_SZ4MB_4V |
494e5b6faeda1d arch/sparc/mm/init_64.c Khalid Aziz       2015-05-27  2575  			    page_cache4v_flag | _PAGE_P_4V | _PAGE_W_4V);
46644c2477c589 arch/sparc64/mm/init.c  David Miller      2007-10-16  2576  
c06240c7f5c39c arch/sparc/mm/init_64.c David S. Miller   2014-09-24  2577  	pte_base |= _PAGE_PMD_HUGE;
46644c2477c589 arch/sparc64/mm/init.c  David Miller      2007-10-16  2578  
c06240c7f5c39c arch/sparc/mm/init_64.c David S. Miller   2014-09-24  2579  	vstart = vstart & PMD_MASK;
c06240c7f5c39c arch/sparc/mm/init_64.c David S. Miller   2014-09-24  2580  	vend = ALIGN(vend, PMD_SIZE);
c06240c7f5c39c arch/sparc/mm/init_64.c David S. Miller   2014-09-24  2581  	for (; vstart < vend; vstart += PMD_SIZE) {
df8ee578894ebb arch/sparc/mm/init_64.c Pavel Tatashin    2017-11-15 @2582  		pgd_t *pgd = vmemmap_pgd_populate(vstart, node);
c06240c7f5c39c arch/sparc/mm/init_64.c David S. Miller   2014-09-24  2583  		unsigned long pte;
5637bc50483404 arch/sparc/mm/init_64.c Mike Rapoport     2019-11-24  2584  		p4d_t *p4d;
c06240c7f5c39c arch/sparc/mm/init_64.c David S. Miller   2014-09-24  2585  		pud_t *pud;
c06240c7f5c39c arch/sparc/mm/init_64.c David S. Miller   2014-09-24  2586  		pmd_t *pmd;
46644c2477c589 arch/sparc64/mm/init.c  David Miller      2007-10-16  2587  
df8ee578894ebb arch/sparc/mm/init_64.c Pavel Tatashin    2017-11-15  2588  		if (!pgd)
c06240c7f5c39c arch/sparc/mm/init_64.c David S. Miller   2014-09-24  2589  			return -ENOMEM;
c06240c7f5c39c arch/sparc/mm/init_64.c David S. Miller   2014-09-24  2590  
5637bc50483404 arch/sparc/mm/init_64.c Mike Rapoport     2019-11-24 @2591  		p4d = vmemmap_p4d_populate(pgd, vstart, node);
5637bc50483404 arch/sparc/mm/init_64.c Mike Rapoport     2019-11-24  2592  		if (!p4d)
5637bc50483404 arch/sparc/mm/init_64.c Mike Rapoport     2019-11-24  2593  			return -ENOMEM;
5637bc50483404 arch/sparc/mm/init_64.c Mike Rapoport     2019-11-24  2594  
5637bc50483404 arch/sparc/mm/init_64.c Mike Rapoport     2019-11-24 @2595  		pud = vmemmap_pud_populate(p4d, vstart, node);
df8ee578894ebb arch/sparc/mm/init_64.c Pavel Tatashin    2017-11-15  2596  		if (!pud)
c06240c7f5c39c arch/sparc/mm/init_64.c David S. Miller   2014-09-24  2597  			return -ENOMEM;
c06240c7f5c39c arch/sparc/mm/init_64.c David S. Miller   2014-09-24  2598  
c06240c7f5c39c arch/sparc/mm/init_64.c David S. Miller   2014-09-24  2599  		pmd = pmd_offset(pud, vstart);
c06240c7f5c39c arch/sparc/mm/init_64.c David S. Miller   2014-09-24  2600  		pte = pmd_val(*pmd);
c06240c7f5c39c arch/sparc/mm/init_64.c David S. Miller   2014-09-24  2601  		if (!(pte & _PAGE_VALID)) {
c06240c7f5c39c arch/sparc/mm/init_64.c David S. Miller   2014-09-24  2602  			void *block = vmemmap_alloc_block(PMD_SIZE, node);
c06240c7f5c39c arch/sparc/mm/init_64.c David S. Miller   2014-09-24  2603  
c06240c7f5c39c arch/sparc/mm/init_64.c David S. Miller   2014-09-24  2604  			if (!block)
c06240c7f5c39c arch/sparc/mm/init_64.c David S. Miller   2014-09-24  2605  				return -ENOMEM;
c06240c7f5c39c arch/sparc/mm/init_64.c David S. Miller   2014-09-24  2606  
c06240c7f5c39c arch/sparc/mm/init_64.c David S. Miller   2014-09-24  2607  			pmd_val(*pmd) = pte_base | __pa(block);
46644c2477c589 arch/sparc64/mm/init.c  David Miller      2007-10-16  2608  		}
46644c2477c589 arch/sparc64/mm/init.c  David Miller      2007-10-16  2609  	}
2856cc2e4d0852 arch/sparc/mm/init_64.c David S. Miller   2012-08-15  2610  
c06240c7f5c39c arch/sparc/mm/init_64.c David S. Miller   2014-09-24  2611  	return 0;
2856cc2e4d0852 arch/sparc/mm/init_64.c David S. Miller   2012-08-15  2612  }
46644c2477c589 arch/sparc64/mm/init.c  David Miller      2007-10-16  2613  #endif /* CONFIG_SPARSEMEM_VMEMMAP */
46644c2477c589 arch/sparc64/mm/init.c  David Miller      2007-10-16  2614  

:::::: The code at line 2582 was first introduced by commit
:::::: df8ee578894ebb591c2995cce422e6189c8bb757 sparc64: simplify vmemmap_populate

:::::: TO: Pavel Tatashin <pasha.tatashin@oracle.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
