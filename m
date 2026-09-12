Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1123233A6F7
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Sep 2026 06:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789193933; cv=none; b=tDA4HCDDBsIVvxNkkyN89dJeOgcLMW/94UNv65nUSFQRhsjkNbn6gG/DggTMH3SvxUCgvvVuSoi68bgG0y3U3m2aDfO98fi9Kj8nqp3c1z3yT9IpH6hvc3HpYCiSIp2H7tXxp86IwARMKZqdH/DvzMKRw3+qAJr1otbKi3mFKzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789193933; c=relaxed/simple;
	bh=yWrSKKWLqwoT9KWrQNBs9Y7SbJxz3+SxdR9X9vuDPG8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=K0PoZWVaoTCtHmp02IlJy4zM+l91sx8sHoKyGvpVO8w3g5gWMHqBKZNvnYSLr84qK8lKKGiaZXEg3HsxBvc6SqTB93OMrtjZ+2CXK9pq9vIABVKFsI4FHhhSNwRx/VzpS7BKolwfoOBPnVDfGw5ExV+swqKopq2Dztf+33DMt3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gE93VGph; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gE93VGph"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789193930; x=1820729930;
  h=date:from:to:cc:subject:message-id;
  bh=yWrSKKWLqwoT9KWrQNBs9Y7SbJxz3+SxdR9X9vuDPG8=;
  b=gE93VGphW6HzEfIcXWbL0YG9vXJoqgzgTjbOJ0SpEV01E3Y0h7tkvrO9
   lH3tolT/yWr5IvnK69qluKLOWSVE4cLLWIYXmOEo+gt3acoWmcl9ApRX+
   qZoVq6q8zEgnR9gF+R/U255hKWNAdG/fNJiX+4MBnWShXLmzZUcl0agRJ
   ZIwcd1AAdwa5NT6d7S37s5PqwZ6LP9iJg03SL5vF1BVDyL9fPSfE4xpYx
   Om4QSKcFQF96V3v+LLzv3VUONEnpN3kqPz7+ZcZ/edRw+QMcx3MkbhHIC
   vAk2kYx8KU8gfpniYaGLBVSIEIWe0z/6x8vDxE3GNObKd9nR1I6Wii/Wc
   w==;
X-CSE-ConnectionGUID: DABvO93uTeaAIr8s4wM9ow==
X-CSE-MsgGUID: kE6zfv7lRMqiTKXTgEK2Ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="89676464"
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="89676464"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 23:18:50 -0700
X-CSE-ConnectionGUID: e4ribaK8SF26SJDjMrOlBQ==
X-CSE-MsgGUID: u+S1feZXTSmXSNyey3w0MA==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 11 Sep 2026 23:18:47 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5H4X-000000002ij-1WtT;
	Sat, 12 Sep 2026 06:18:45 +0000
Date: Sat, 12 Sep 2026 14:18:21 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [clangbuiltlinux:question_mark_operator 4/5]
 mm/sparse-vmemmap.c:230:9: warning: unused variable 'p'
Message-ID: <202609121439.SevojbMn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/ClangBuiltLinux/linux question_mark_operator
head:   532a7ac2d57bb5674f5feffb4ba378f8a32f3bcf
commit: 21ffcd408eaea91fb594ec0a27f9108349c2d31b [4/5] mm: sparse-vmemmap: use try operator ('?') for chained pointer returns
config: powerpc64-randconfig-002-20260912 (https://download.01.org/0day-ci/archive/20260912/202609121439.SevojbMn-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260912/202609121439.SevojbMn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609121439.SevojbMn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/sparse-vmemmap.c: In function 'vmemmap_alloc_block_zero':
   mm/sparse-vmemmap.c:186:44: error: expected expression before ';' token
     void *p = vmemmap_alloc_block(size, node)?;
                                               ^
   mm/sparse-vmemmap.c: In function 'vmemmap_pmd_populate':
   mm/sparse-vmemmap.c:197:55: error: expected expression before ';' token
      void *p = vmemmap_alloc_block_zero(PAGE_SIZE, node)?;
                                                          ^
   mm/sparse-vmemmap.c: In function 'vmemmap_pud_populate':
   mm/sparse-vmemmap.c:208:55: error: expected expression before ';' token
      void *p = vmemmap_alloc_block_zero(PAGE_SIZE, node)?;
                                                          ^
   mm/sparse-vmemmap.c: In function 'vmemmap_p4d_populate':
   mm/sparse-vmemmap.c:219:55: error: expected expression before ';' token
      void *p = vmemmap_alloc_block_zero(PAGE_SIZE, node)?;
                                                          ^
   mm/sparse-vmemmap.c: In function 'vmemmap_pgd_populate':
   mm/sparse-vmemmap.c:230:55: error: expected expression before ';' token
      void *p = vmemmap_alloc_block_zero(PAGE_SIZE, node)?;
                                                          ^
>> mm/sparse-vmemmap.c:230:9: warning: unused variable 'p' [-Wunused-variable]
      void *p = vmemmap_alloc_block_zero(PAGE_SIZE, node)?;
            ^
   mm/sparse-vmemmap.c: In function 'vmemmap_populate_address':
   mm/sparse-vmemmap.c:241:48: error: expected expression before ';' token
     pgd_t *pgd = vmemmap_pgd_populate(addr, node)?;
                                                   ^
   mm/sparse-vmemmap.c:242:53: error: expected expression before ';' token
     p4d_t *p4d = vmemmap_p4d_populate(pgd, addr, node)?;
                                                        ^
   mm/sparse-vmemmap.c:243:53: error: expected expression before ';' token
     pud_t *pud = vmemmap_pud_populate(p4d, addr, node)?;
                                                        ^
   mm/sparse-vmemmap.c:244:53: error: expected expression before ';' token
     pmd_t *pmd = vmemmap_pmd_populate(pud, addr, node)?;
                                                        ^
   mm/sparse-vmemmap.c:245:75: error: expected expression before ';' token
     pte_t *pte = vmemmap_pte_populate(pmd, addr, node, altmap, ptpfn, flags)?;
                                                                              ^


vim +/p +230 mm/sparse-vmemmap.c

   214	
   215	static p4d_t * __meminit vmemmap_p4d_populate(pgd_t *pgd, unsigned long addr, int node)
   216	{
   217		p4d_t *p4d = p4d_offset(pgd, addr);
   218		if (p4d_none(*p4d)) {
 > 219			void *p = vmemmap_alloc_block_zero(PAGE_SIZE, node)?;
   220			pud_init(p);
   221			p4d_populate_kernel(addr, p4d, p);
   222		}
   223		return p4d;
   224	}
   225	
   226	static pgd_t * __meminit vmemmap_pgd_populate(unsigned long addr, int node)
   227	{
   228		pgd_t *pgd = pgd_offset_k(addr);
   229		if (pgd_none(*pgd)) {
 > 230			void *p = vmemmap_alloc_block_zero(PAGE_SIZE, node)?;
   231			pgd_populate_kernel(addr, pgd, p);
   232		}
   233		return pgd;
   234	}
   235	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
