Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AEBF3AF67A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Apr 2026 11:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777547722; cv=none; b=slVBJn6J33SjnnlNYKf7N3AGT4WYh8Yd8tjFI9hmldkvah7yUtzqWsXWNhx8/bQDsWtibszagQRPF/ydLbDpv28Zf9EmyiPoXBKT8bg/KFvs8V+lrlfgaYxtW4XXy4MXNeZ4gL91UMcLrOSXihUWnoOotyN6RcaWQ6Az6sxwfho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777547722; c=relaxed/simple;
	bh=NbOgp9s7YEplWRcwItlsAAnz7MfVC52dl785oIsAWPg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZML1ROTBrLGrCmkj2IrsFNRLLgSqPZbjUd/L04RdoZfoxa8/Ph83qskB3LhjmAUs7uQGC1NA1pRrkKLq94Fwk7MBK9C9/visZGcoeUhr/87Ms6n8A2eHNWtUkjYsufDl7hGbTY3ijfN3N00CKPesj8cmC16sCrcL5Iq8F7KJ2U4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cn/U4YUD; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cn/U4YUD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777547720; x=1809083720;
  h=date:from:to:cc:subject:message-id;
  bh=NbOgp9s7YEplWRcwItlsAAnz7MfVC52dl785oIsAWPg=;
  b=cn/U4YUDYDBtUO7wbspBOp6alo5KU6k7pobH/kM1QLpDqw4x579whp++
   HKJ6VdJabhwIlh3zQiRyV1ceDLJAH8DaSXghduUzeth64f2AoIpav3wxn
   wl+l6/ieaJxxr7q4XBX+bd//ZQRX+UQcTBEkgq03XvaWPMUneJtP6aAg9
   hwIhFrgZEWg9L5BvcTQ6VR/E+wZT5BgtRQh3eXfCazcS9XBRu8SSX3Bq6
   Up/Y2Xgi0gf2gVVvr7PZcKOASMaeh4P+Wl+XNXpxyYeYeMFdnENkKxfHF
   G7rlTQRREwoReYwcdvc6xxmHP3dfy11DW5/StzS8lkL8hdT4HG6J2/t7x
   A==;
X-CSE-ConnectionGUID: LemtGCurTwaUWsipqA2HDw==
X-CSE-MsgGUID: /fNHxVemQMiG2wCWy9Yrbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="89870947"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="89870947"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 04:15:19 -0700
X-CSE-ConnectionGUID: eahsWN/jRMeks74m9/6+AQ==
X-CSE-MsgGUID: LupT6cvtQ1iBK2vme3vDzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="234594929"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 30 Apr 2026 04:15:18 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIPMR-00000000CJs-2won;
	Thu, 30 Apr 2026 11:15:15 +0000
Date: Thu, 30 Apr 2026 19:15:03 +0800
From: kernel test robot <lkp@intel.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:b4/bootmem_info 8/11]
 arch/x86/mm/init_64.c:1050:9: error: too few arguments to function
 'free_pagetable'
Message-ID: <202604301904.DdB3UOGs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/davidhildenbrand/linux b4/bootmem_info
head:   80cd9eaf52f7ea07b36881a937059d7075ac110a
commit: 21143629e50fc0929fea624f4bf416dbd35541ef [8/11] arch/x86/mm: move free_reserved_pages() to mm.h
config: x86_64-randconfig-072-20260430 (https://download.01.org/0day-ci/archive/20260430/202604301904.DdB3UOGs-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604301904.DdB3UOGs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604301904.DdB3UOGs-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/mm/init_64.c: In function 'free_pte_table':
>> arch/x86/mm/init_64.c:1050:9: error: too few arguments to function 'free_pagetable'
    1050 |         free_pagetable(pmd_page(*pmd));
         |         ^~~~~~~~~~~~~~
   arch/x86/mm/init_64.c:1003:23: note: declared here
    1003 | static void __meminit free_pagetable(struct page *page, int order)
         |                       ^~~~~~~~~~~~~~
   arch/x86/mm/init_64.c: In function 'free_pmd_table':
   arch/x86/mm/init_64.c:1068:9: error: too few arguments to function 'free_pagetable'
    1068 |         free_pagetable(pud_page(*pud));
         |         ^~~~~~~~~~~~~~
   arch/x86/mm/init_64.c:1003:23: note: declared here
    1003 | static void __meminit free_pagetable(struct page *page, int order)
         |                       ^~~~~~~~~~~~~~
   arch/x86/mm/init_64.c: In function 'free_pud_table':
   arch/x86/mm/init_64.c:1086:9: error: too few arguments to function 'free_pagetable'
    1086 |         free_pagetable(p4d_page(*p4d));
         |         ^~~~~~~~~~~~~~
   arch/x86/mm/init_64.c:1003:23: note: declared here
    1003 | static void __meminit free_pagetable(struct page *page, int order)
         |                       ^~~~~~~~~~~~~~
   arch/x86/mm/init_64.c: In function 'remove_pte_table':
   arch/x86/mm/init_64.c:1119:60: error: 'altmap' undeclared (first use in this function)
    1119 |                         free_vmemmap_pages(pte_page(*pte), altmap, 0);
         |                                                            ^~~~~~
   arch/x86/mm/init_64.c:1119:60: note: each undeclared identifier is reported only once for each function it appears in
   arch/x86/mm/init_64.c: In function 'remove_pmd_table':
   arch/x86/mm/init_64.c:1155:60: warning: passing argument 2 of 'free_vmemmap_pages' makes integer from pointer without a cast [-Wint-conversion]
    1155 |                                                            altmap, PMD_ORDER);
         |                                                            ^~~~~~
         |                                                            |
         |                                                            struct vmem_altmap *
   arch/x86/mm/init_64.c:1018:74: note: expected 'unsigned int' but argument is of type 'struct vmem_altmap *'
    1018 | static void __meminit free_vmemmap_pages(struct page *page, unsigned int order,
         |                                                             ~~~~~~~~~~~~~^~~~~
   In file included from include/linux/mm.h:31,
                    from include/linux/pid_namespace.h:7,
                    from include/linux/ptrace.h:10,
                    from arch/x86/mm/init_64.c:16:
   include/linux/pgtable.h:8:25: warning: passing argument 3 of 'free_vmemmap_pages' makes pointer from integer without a cast [-Wint-conversion]
       8 | #define PMD_ORDER       (PMD_SHIFT - PAGE_SHIFT)
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~
         |                         |
         |                         int
   arch/x86/mm/init_64.c:1155:68: note: in expansion of macro 'PMD_ORDER'
    1155 |                                                            altmap, PMD_ORDER);
         |                                                                    ^~~~~~~~~
   arch/x86/mm/init_64.c:1019:37: note: expected 'struct vmem_altmap *' but argument is of type 'int'
    1019 |                 struct vmem_altmap *altmap)
         |                 ~~~~~~~~~~~~~~~~~~~~^~~~~~
   arch/x86/mm/init_64.c:1163:60: warning: passing argument 2 of 'free_vmemmap_pages' makes integer from pointer without a cast [-Wint-conversion]
    1163 |                                                            altmap, PMD_ORDER);
         |                                                            ^~~~~~
         |                                                            |
         |                                                            struct vmem_altmap *
   arch/x86/mm/init_64.c:1018:74: note: expected 'unsigned int' but argument is of type 'struct vmem_altmap *'
    1018 | static void __meminit free_vmemmap_pages(struct page *page, unsigned int order,
         |                                                             ~~~~~~~~~~~~~^~~~~
   include/linux/pgtable.h:8:25: warning: passing argument 3 of 'free_vmemmap_pages' makes pointer from integer without a cast [-Wint-conversion]
       8 | #define PMD_ORDER       (PMD_SHIFT - PAGE_SHIFT)
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~
         |                         |
         |                         int
   arch/x86/mm/init_64.c:1163:68: note: in expansion of macro 'PMD_ORDER'
    1163 |                                                            altmap, PMD_ORDER);
         |                                                                    ^~~~~~~~~
   arch/x86/mm/init_64.c:1019:37: note: expected 'struct vmem_altmap *' but argument is of type 'int'
    1019 |                 struct vmem_altmap *altmap)
         |                 ~~~~~~~~~~~~~~~~~~~~^~~~~~
   arch/x86/mm/init_64.c:1172:17: error: too many arguments to function 'remove_pte_table'
    1172 |                 remove_pte_table(pte_base, addr, next, direct, altmap);
         |                 ^~~~~~~~~~~~~~~~
   arch/x86/mm/init_64.c:1093:1: note: declared here
    1093 | remove_pte_table(pte_t *pte_start, unsigned long addr, unsigned long end,
         | ^~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MFD_STMFX
   Depends on [n]: HAS_IOMEM [=y] && I2C [=y] && OF [=n]
   Selected by [y]:
   - PINCTRL_STMFX [=y] && PINCTRL [=y] && I2C [=y] && HAS_IOMEM [=y]


vim +/free_pagetable +1050 arch/x86/mm/init_64.c

a7e6c7015bf3e0 Dan Williams            2018-03-13  1037  
a7e6c7015bf3e0 Dan Williams            2018-03-13  1038  static void __meminit free_pte_table(pte_t *pte_start, pmd_t *pmd)
ae9aae9eda2db7 Wen Congyang            2013-02-22  1039  {
ae9aae9eda2db7 Wen Congyang            2013-02-22  1040  	pte_t *pte;
ae9aae9eda2db7 Wen Congyang            2013-02-22  1041  	int i;
ae9aae9eda2db7 Wen Congyang            2013-02-22  1042  
ae9aae9eda2db7 Wen Congyang            2013-02-22  1043  	for (i = 0; i < PTRS_PER_PTE; i++) {
ae9aae9eda2db7 Wen Congyang            2013-02-22  1044  		pte = pte_start + i;
dcb32d9913b7ed Dave Hansen             2016-07-07  1045  		if (!pte_none(*pte))
ae9aae9eda2db7 Wen Congyang            2013-02-22  1046  			return;
ae9aae9eda2db7 Wen Congyang            2013-02-22  1047  	}
ae9aae9eda2db7 Wen Congyang            2013-02-22  1048  
54aa699e8094ef Bjorn Helgaas           2024-01-02  1049  	/* free a pte table */
5833bfd246878d David Hildenbrand (Arm  2026-04-28 @1050) 	free_pagetable(pmd_page(*pmd));
ae9aae9eda2db7 Wen Congyang            2013-02-22  1051  	spin_lock(&init_mm.page_table_lock);
ae9aae9eda2db7 Wen Congyang            2013-02-22  1052  	pmd_clear(pmd);
ae9aae9eda2db7 Wen Congyang            2013-02-22  1053  	spin_unlock(&init_mm.page_table_lock);
ae9aae9eda2db7 Wen Congyang            2013-02-22  1054  }
ae9aae9eda2db7 Wen Congyang            2013-02-22  1055  

:::::: The code at line 1050 was first introduced by commit
:::::: 5833bfd246878da357249441cf406b776b482aca x86/mm: drop order parameter from free_pagetable()

:::::: TO: David Hildenbrand (Arm) <david@kernel.org>
:::::: CC: David Hildenbrand (Arm) <david@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
