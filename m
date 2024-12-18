Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D24156225
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Dec 2024 13:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734528112; cv=none; b=AZb5IJ/f8+JFYTRF8vXNXxfh96zLuhpa478H/xeUVu6LXobVNwnCHnUWddy6u4kZhcpXdWYZqcyGkxKP86OS1NSqB6QLa9mL1IDLaKKxqxhOn0RvtZiEJoto12imqMEBaLRUBKhxsCW9ohPaGgBtpuNIhwtTc7sUwoXykOt/vDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734528112; c=relaxed/simple;
	bh=+hmrI6yqV4uIju996nkyf6jeAHl0OnncZ288oAEZM00=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YRwFvoBu+9RBbAg4feRoKyZXCbTP4yuK27bc9vRNku0s9sQpIeyvnbBqytyQqzESvCaygHQ3twaPJXblO0yHBQeAoV2eOarsTSL5xvOjCrgBqHfYuzY84tRDZPel//kWLBKVdyRM4sKA2HDvzXGXltcqkJ4BO/AuxwNSOqZ4Z8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WVEVWAVp; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WVEVWAVp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734528110; x=1766064110;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+hmrI6yqV4uIju996nkyf6jeAHl0OnncZ288oAEZM00=;
  b=WVEVWAVplVV6kMpCoJG8BnMCCp3LUAMcwz+m5KTUYJmfhsJY0Ky3fVp6
   iiUMwWqVYRWIZMHA0IebiRRbpczB0Q/Yka560+95SLhVxMECgEauTZ+UZ
   /KmY0AXm/H/Mh9whTgkKrMkvpGwDVqnAkYA6wdqPc39+xlK7t5GDKWOS1
   13vS87Lq1JfdIktRg5ftqD962nbudRptHHPGdXXRxAPQkHMSI1U35ykuF
   ttAqafe0jUm1LkNXdVDVK36JJtBIrEWCFoCFcNQ4/14P3SkAvzRcNajuj
   qcbnW2Q84WxL9DNiwn9zf3NL37BkbSGP7zXRxqlMm+8oVs/9S8MQicF4j
   w==;
X-CSE-ConnectionGUID: SjEAcPTBSkGe50uBfS8rig==
X-CSE-MsgGUID: wefUxj/wQYeLm515mVqtBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="38783450"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="38783450"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 05:21:49 -0800
X-CSE-ConnectionGUID: QS/lFcOISTG0bAmIy17V7Q==
X-CSE-MsgGUID: m57r9f7uTB63hrb+zmzK9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="128655178"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 18 Dec 2024 05:21:48 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNtzl-000GLe-2V;
	Wed, 18 Dec 2024 13:21:45 +0000
Date: Wed, 18 Dec 2024 21:21:31 +0800
From: kernel test robot <lkp@intel.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, Linus Walleij <linus.walleij@linaro.org>
Subject: [arm-integrator:p4d_pgd_cdtor 10/10]
 arch/s390/include/asm/pgalloc.h:129:24: error: initialization of 'pgd_t *'
 from incompatible pointer type 'long unsigned int *'
Message-ID: <202412182154.2WzAy2LI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git p4d_pgd_cdtor
head:   5453d8f69ac04a3a31ea973f98de9e0c58248a42
commit: 5453d8f69ac04a3a31ea973f98de9e0c58248a42 [10/10] mm: Introduce ctor/dtor at PGD level
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20241218/202412182154.2WzAy2LI-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241218/202412182154.2WzAy2LI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412182154.2WzAy2LI-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/s390/include/asm/mmu_context.h:11,
                    from arch/s390/include/asm/elf.h:181,
                    from include/linux/elf.h:6,
                    from include/linux/module.h:19,
                    from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/pci.h:37,
                    from arch/s390/include/asm/hw_irq.h:6,
                    from include/linux/irq.h:591,
                    from include/linux/msi.h:24,
                    from include/linux/kvm_host.h:19,
                    from arch/s390/kernel/asm-offsets.c:11:
   arch/s390/include/asm/pgalloc.h: In function 'p4d_free':
   arch/s390/include/asm/pgalloc.h:67:43: error: 'table' undeclared (first use in this function); did you mean 'sg_table'?
      67 |         pagetable_p4d_dtor(virt_to_ptdesc(table));
         |                                           ^~~~~
         |                                           sg_table
   arch/s390/include/asm/pgalloc.h:67:43: note: each undeclared identifier is reported only once for each function it appears in
   arch/s390/include/asm/pgalloc.h: In function 'pgd_alloc':
>> arch/s390/include/asm/pgalloc.h:129:24: error: initialization of 'pgd_t *' from incompatible pointer type 'long unsigned int *' [-Wincompatible-pointer-types]
     129 |         pgd_t *table = crst_table_alloc(mm);
         |                        ^~~~~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:102: arch/s390/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1203: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:224: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:224: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +129 arch/s390/include/asm/pgalloc.h

    62	
    63	static inline void p4d_free(struct mm_struct *mm, p4d_t *p4d)
    64	{
    65		if (mm_p4d_folded(mm))
    66			return;
  > 67		pagetable_p4d_dtor(virt_to_ptdesc(table));
    68		crst_table_free(mm, (unsigned long *) p4d);
    69	}
    70	
    71	static inline pud_t *pud_alloc_one(struct mm_struct *mm, unsigned long address)
    72	{
    73		unsigned long *table = crst_table_alloc(mm);
    74	
    75		if (!table)
    76			return NULL;
    77		crst_table_init(table, _REGION3_ENTRY_EMPTY);
    78		pagetable_pud_ctor(virt_to_ptdesc(table));
    79		return (pud_t *) table;
    80	}
    81	
    82	static inline void pud_free(struct mm_struct *mm, pud_t *pud)
    83	{
    84		if (mm_pud_folded(mm))
    85			return;
    86		pagetable_pud_dtor(virt_to_ptdesc(pud));
    87		crst_table_free(mm, (unsigned long *) pud);
    88	}
    89	
    90	static inline pmd_t *pmd_alloc_one(struct mm_struct *mm, unsigned long vmaddr)
    91	{
    92		unsigned long *table = crst_table_alloc(mm);
    93	
    94		if (!table)
    95			return NULL;
    96		crst_table_init(table, _SEGMENT_ENTRY_EMPTY);
    97		if (!pagetable_pmd_ctor(virt_to_ptdesc(table))) {
    98			crst_table_free(mm, table);
    99			return NULL;
   100		}
   101		return (pmd_t *) table;
   102	}
   103	
   104	static inline void pmd_free(struct mm_struct *mm, pmd_t *pmd)
   105	{
   106		if (mm_pmd_folded(mm))
   107			return;
   108		pagetable_pmd_dtor(virt_to_ptdesc(pmd));
   109		crst_table_free(mm, (unsigned long *) pmd);
   110	}
   111	
   112	static inline void pgd_populate(struct mm_struct *mm, pgd_t *pgd, p4d_t *p4d)
   113	{
   114		set_pgd(pgd, __pgd(_REGION1_ENTRY | __pa(p4d)));
   115	}
   116	
   117	static inline void p4d_populate(struct mm_struct *mm, p4d_t *p4d, pud_t *pud)
   118	{
   119		set_p4d(p4d, __p4d(_REGION2_ENTRY | __pa(pud)));
   120	}
   121	
   122	static inline void pud_populate(struct mm_struct *mm, pud_t *pud, pmd_t *pmd)
   123	{
   124		set_pud(pud, __pud(_REGION3_ENTRY | __pa(pmd)));
   125	}
   126	
   127	static inline pgd_t *pgd_alloc(struct mm_struct *mm)
   128	{
 > 129		pgd_t *table = crst_table_alloc(mm);
   130	
   131		if (!table)
   132			return NULL;
   133		pagetable_pgd_ctor(virt_to_ptdesc(table));
   134		return table;
   135	}
   136	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
