Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1555A2F3B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Apr 2023 09:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681291332; x=1712827332;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Bdp+oIiPK0heG2qZMSswWQmpe4VigV/KezzACSDdhuo=;
  b=Sv3OGv/UIugDnn+9j6UiKDuIAz85unUGTJVJhvM1KyE0KzPOvRkj4JZc
   ajb1DNKsIiWjmyyxKD5uqvq5WNrHZEH7DuY6fryjgvq0oAGGs08eoXQHk
   /V/Bi+DmquTvA7t9R0Bvja9vXgRRVgnp5qSyhzMERIj/sawtEPPCEu2Vi
   S6fOyW6ep3wdjXkrohHAsNYaYNoLwEBqJXYq+UcN7Z8NmwDwRdD31PrkK
   jZl6Ssq7Dbn2XxijBddXZ5nqQJoxgxR8DKxzaY0UEzTN446rs6UdrdlTR
   6rRcZxDd3sVe8Lc3/7mmo+G+d8SWoIWZhFVWDbDLkrq2JqEPjlPQKvQDX
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="341335351"
X-IronPort-AV: E=Sophos;i="5.98,338,1673942400"; 
   d="scan'208";a="341335351"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2023 02:22:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="682422859"
X-IronPort-AV: E=Sophos;i="5.98,338,1673942400"; 
   d="scan'208";a="682422859"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 12 Apr 2023 02:22:09 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmWfz-000XZF-2h;
	Wed, 12 Apr 2023 09:22:03 +0000
Date: Wed, 12 Apr 2023 17:21:20 +0800
From: kernel test robot <lkp@intel.com>
To: Evgeniy Baskov <baskov@ispras.ru>
Cc: oe-kbuild-all@lists.linux.dev, Ard Biesheuvel <ardb@kernel.org>
Subject: [ardb:tmp-crypto-x86-local-labels 5/52]
 arch/x86/mm/ident_map.c:19:8: warning: no previous prototype for
 'ident_split_large_pmd'
Message-ID: <202304121737.BDRxFRv5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git tmp-crypto-x86-local-labels
head:   05c1b94d2afb1f4e0b2ce8bd48a8097df4288166
commit: c448fe451e6a81717f1f5593498d062f2deeeb98 [5/52] x86/boot: Support 4KB pages for identity mapping
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230412/202304121737.BDRxFRv5-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/commit/?id=c448fe451e6a81717f1f5593498d062f2deeeb98
        git remote add ardb git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git
        git fetch --no-tags ardb tmp-crypto-x86-local-labels
        git checkout c448fe451e6a81717f1f5593498d062f2deeeb98
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304121737.BDRxFRv5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/mm/init_64.c:61:
>> arch/x86/mm/ident_map.c:19:8: warning: no previous prototype for 'ident_split_large_pmd' [-Wmissing-prototypes]
      19 | pte_t *ident_split_large_pmd(struct x86_mapping_info *info,
         |        ^~~~~~~~~~~~~~~~~~~~~
>> arch/x86/mm/ident_map.c:102:8: warning: no previous prototype for 'ident_split_large_pud' [-Wmissing-prototypes]
     102 | pmd_t *ident_split_large_pud(struct x86_mapping_info *info,
         |        ^~~~~~~~~~~~~~~~~~~~~


vim +/ident_split_large_pmd +19 arch/x86/mm/ident_map.c

    18	
  > 19	pte_t *ident_split_large_pmd(struct x86_mapping_info *info,
    20				     pmd_t *pmdp, unsigned long page_addr)
    21	{
    22		unsigned long pmd_addr, page_flags;
    23		pte_t *pte;
    24	
    25		pte = (pte_t *)info->alloc_pgt_page(info->context);
    26		if (!pte)
    27			return NULL;
    28	
    29		pmd_addr = page_addr & PMD_MASK;
    30	
    31		/* Not a large page - clear PSE flag */
    32		page_flags = pmd_flags(*pmdp) & ~_PSE;
    33		ident_pte_init(info, pte, pmd_addr, pmd_addr + PMD_SIZE, page_flags);
    34	
    35		return pte;
    36	}
    37	
    38	static int ident_pmd_init(struct x86_mapping_info *info, pmd_t *pmd_page,
    39				  unsigned long addr, unsigned long end,
    40				  unsigned long flags)
    41	{
    42		unsigned long next;
    43		bool new_table = 0;
    44	
    45		for (; addr < end; addr = next) {
    46			pmd_t *pmd = pmd_page + pmd_index(addr);
    47			pte_t *pte;
    48	
    49			next = (addr & PMD_MASK) + PMD_SIZE;
    50			if (next > end)
    51				next = end;
    52	
    53			/*
    54			 * Use 2M pages if 4k pages are not allowed or
    55			 * we are not mapping extra, i.e. address and size are aligned.
    56			 */
    57	
    58			if (!info->allow_4kpages ||
    59			    (!(addr & ~PMD_MASK) && next == addr + PMD_SIZE)) {
    60	
    61				pmd_t pmdval;
    62	
    63				addr &= PMD_MASK;
    64				pmdval = __pmd((addr - info->offset) | flags | _PSE);
    65				set_pmd(pmd, pmdval);
    66				continue;
    67			}
    68	
    69			/*
    70			 * If currently mapped page is large, we need to split it.
    71			 * The case when we don't can remap 2M page to 2M page
    72			 * with different flags is already covered above.
    73			 *
    74			 * If there's nothing mapped to desired address,
    75			 * we need to allocate new page table.
    76			 */
    77	
    78			if (pmd_large(*pmd)) {
    79				pte = ident_split_large_pmd(info, pmd, addr);
    80				new_table = 1;
    81			} else if (!pmd_present(*pmd)) {
    82				pte = (pte_t *)info->alloc_pgt_page(info->context);
    83				new_table = 1;
    84			} else {
    85				pte = pte_offset_kernel(pmd, 0);
    86				new_table = 0;
    87			}
    88	
    89			if (!pte)
    90				return -ENOMEM;
    91	
    92			ident_pte_init(info, pte, addr, next, flags);
    93	
    94			if (new_table)
    95				set_pmd(pmd, __pmd(__pa(pte) | info->kernpg_flag));
    96		}
    97	
    98		return 0;
    99	}
   100	
   101	
 > 102	pmd_t *ident_split_large_pud(struct x86_mapping_info *info,
   103				     pud_t *pudp, unsigned long page_addr)
   104	{
   105		unsigned long pud_addr, page_flags;
   106		pmd_t *pmd;
   107	
   108		pmd = (pmd_t *)info->alloc_pgt_page(info->context);
   109		if (!pmd)
   110			return NULL;
   111	
   112		pud_addr = page_addr & PUD_MASK;
   113	
   114		/* Not a large page - clear PSE flag */
   115		page_flags = pud_flags(*pudp) & ~_PSE;
   116		ident_pmd_init(info, pmd, pud_addr, pud_addr + PUD_SIZE, page_flags);
   117	
   118		return pmd;
   119	}
   120	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
