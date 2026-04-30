Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C274D1FF1B5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Apr 2026 05:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777526509; cv=none; b=Z15R6ldTLWJaXEaoGQbgsXoeX4IQ1N/WAVVhxUkDiuk9uBhOfcahDtQLr5ji2Tu22ZNIfC9Y7/2XeZJMwIIRCCsWgr2KemMsYQfyEqafhwWBiz7KUJWCG5MURZwBs+XyY6SU3Uo5LXK5BkzJhfoLUbFYaRV2t91xj10w7zA3Fbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777526509; c=relaxed/simple;
	bh=Fv4TTg14uFbageXmZ6/Rt5fmEV2cjVk5xI33mKA8YYU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=X+pOaaZw12YclJr8IukM8Hw77MC5BZIxZfAF5R3OluNI/E6bQ54FVj+Dabvv4kglzDLazmJigJoWRnilnXywzGQ/ZErMISbqZk+AvaQ49SrNKwvocg2Xc3RxSbhYBNeUqwVn68diOdPUil3lEe4SzQHRxiU7QXwJXJirMWa7t4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=deFd39pl; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="deFd39pl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777526508; x=1809062508;
  h=date:from:to:cc:subject:message-id;
  bh=Fv4TTg14uFbageXmZ6/Rt5fmEV2cjVk5xI33mKA8YYU=;
  b=deFd39plhYt4/8MeSjSkEP41TEE43YSwyPMvBZx39xGMph8a8l13tjWt
   GEc99Yx20i6uMn9YZgPntQQviBI5STNW/GfzFzrIdK4Hah+kQysRylgNi
   f5YmeBpUjj+0aoeBpdKPzOYqMXF36QMbT48kN9SRHhGt91CA5hsXengJq
   SjnIK0LD+9oqNSEzIW/tGhhy47lkNMTsFr0xH6rdd6vRv8SZ5a4SnxJ3T
   SzTgJrQRas0Wy6QZbz6zROZ7LRG/UV9Y5pbxbuBxYWdpRoaqITIdUnz8w
   oJozoDt2Mjm4jZ1An09VZmcYD744sMpI/PJaO34cvoc/a254DDwwb673Y
   A==;
X-CSE-ConnectionGUID: CKm/X/mkQkK29Hq2j8w24A==
X-CSE-MsgGUID: gqtPiHP5T0Wl0kBqdkkzzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="78179158"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="78179158"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 22:21:47 -0700
X-CSE-ConnectionGUID: 2FXugqGkRaaMRvjnnQSkyA==
X-CSE-MsgGUID: zZYfF+7WSoa3uUPurWofnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="231338561"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 29 Apr 2026 22:21:45 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIJqJ-00000000BzA-1lao;
	Thu, 30 Apr 2026 05:21:43 +0000
Date: Thu, 30 Apr 2026 13:21:00 +0800
From: kernel test robot <lkp@intel.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:b4/bootmem_info 2/11]
 arch/x86/mm/init_64.c:1168:60: warning: passing argument 2 of
 'free_vmemmap_pages' makes integer from pointer without a cast
Message-ID: <202604301341.Lme8nX4f-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/davidhildenbrand/linux b4/bootmem_info
head:   80cd9eaf52f7ea07b36881a937059d7075ac110a
commit: fe143d8e7106022f9b66e9c6db02af801fd277f4 [2/11] x86/mm: fix freeing of PMD-sized vmemmap pages
config: x86_64-randconfig-072-20260430 (https://download.01.org/0day-ci/archive/20260430/202604301341.Lme8nX4f-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604301341.Lme8nX4f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604301341.Lme8nX4f-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/mm/init_64.c: In function 'remove_pte_table':
   arch/x86/mm/init_64.c:1132:60: error: 'altmap' undeclared (first use in this function)
    1132 |                         free_vmemmap_pages(pte_page(*pte), altmap, 0);
         |                                                            ^~~~~~
   arch/x86/mm/init_64.c:1132:60: note: each undeclared identifier is reported only once for each function it appears in
   arch/x86/mm/init_64.c: In function 'remove_pmd_table':
>> arch/x86/mm/init_64.c:1168:60: warning: passing argument 2 of 'free_vmemmap_pages' makes integer from pointer without a cast [-Wint-conversion]
    1168 |                                                            altmap, PMD_ORDER);
         |                                                            ^~~~~~
         |                                                            |
         |                                                            struct vmem_altmap *
   arch/x86/mm/init_64.c:1031:74: note: expected 'unsigned int' but argument is of type 'struct vmem_altmap *'
    1031 | static void __meminit free_vmemmap_pages(struct page *page, unsigned int order,
         |                                                             ~~~~~~~~~~~~~^~~~~
   In file included from include/linux/mm.h:31,
                    from include/linux/pid_namespace.h:7,
                    from include/linux/ptrace.h:10,
                    from arch/x86/mm/init_64.c:16:
>> include/linux/pgtable.h:8:25: warning: passing argument 3 of 'free_vmemmap_pages' makes pointer from integer without a cast [-Wint-conversion]
       8 | #define PMD_ORDER       (PMD_SHIFT - PAGE_SHIFT)
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~
         |                         |
         |                         int
   arch/x86/mm/init_64.c:1168:68: note: in expansion of macro 'PMD_ORDER'
    1168 |                                                            altmap, PMD_ORDER);
         |                                                                    ^~~~~~~~~
   arch/x86/mm/init_64.c:1032:37: note: expected 'struct vmem_altmap *' but argument is of type 'int'
    1032 |                 struct vmem_altmap *altmap)
         |                 ~~~~~~~~~~~~~~~~~~~~^~~~~~
   arch/x86/mm/init_64.c:1176:60: warning: passing argument 2 of 'free_vmemmap_pages' makes integer from pointer without a cast [-Wint-conversion]
    1176 |                                                            altmap, PMD_ORDER);
         |                                                            ^~~~~~
         |                                                            |
         |                                                            struct vmem_altmap *
   arch/x86/mm/init_64.c:1031:74: note: expected 'unsigned int' but argument is of type 'struct vmem_altmap *'
    1031 | static void __meminit free_vmemmap_pages(struct page *page, unsigned int order,
         |                                                             ~~~~~~~~~~~~~^~~~~
>> include/linux/pgtable.h:8:25: warning: passing argument 3 of 'free_vmemmap_pages' makes pointer from integer without a cast [-Wint-conversion]
       8 | #define PMD_ORDER       (PMD_SHIFT - PAGE_SHIFT)
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~
         |                         |
         |                         int
   arch/x86/mm/init_64.c:1176:68: note: in expansion of macro 'PMD_ORDER'
    1176 |                                                            altmap, PMD_ORDER);
         |                                                                    ^~~~~~~~~
   arch/x86/mm/init_64.c:1032:37: note: expected 'struct vmem_altmap *' but argument is of type 'int'
    1032 |                 struct vmem_altmap *altmap)
         |                 ~~~~~~~~~~~~~~~~~~~~^~~~~~
   arch/x86/mm/init_64.c:1185:17: error: too many arguments to function 'remove_pte_table'
    1185 |                 remove_pte_table(pte_base, addr, next, direct, altmap);
         |                 ^~~~~~~~~~~~~~~~
   arch/x86/mm/init_64.c:1106:1: note: declared here
    1106 | remove_pte_table(pte_t *pte_start, unsigned long addr, unsigned long end,
         | ^~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MFD_STMFX
   Depends on [n]: HAS_IOMEM [=y] && I2C [=y] && OF [=n]
   Selected by [y]:
   - PINCTRL_STMFX [=y] && PINCTRL [=y] && I2C [=y] && HAS_IOMEM [=y]


vim +/free_vmemmap_pages +1168 arch/x86/mm/init_64.c

  1147	
  1148	static void __meminit
  1149	remove_pmd_table(pmd_t *pmd_start, unsigned long addr, unsigned long end,
  1150			 bool direct, struct vmem_altmap *altmap)
  1151	{
  1152		unsigned long next, pages = 0;
  1153		pte_t *pte_base;
  1154		pmd_t *pmd;
  1155	
  1156		pmd = pmd_start + pmd_index(addr);
  1157		for (; addr < end; addr = next, pmd++) {
  1158			next = pmd_addr_end(addr, end);
  1159	
  1160			if (!pmd_present(*pmd))
  1161				continue;
  1162	
  1163			if (pmd_leaf(*pmd)) {
  1164				if (IS_ALIGNED(addr, PMD_SIZE) &&
  1165				    IS_ALIGNED(next, PMD_SIZE)) {
  1166					if (!direct)
  1167						free_vmemmap_pages(pmd_page(*pmd),
> 1168								   altmap, PMD_ORDER);
  1169	
  1170					spin_lock(&init_mm.page_table_lock);
  1171					pmd_clear(pmd);
  1172					spin_unlock(&init_mm.page_table_lock);
  1173					pages++;
  1174				} else if (vmemmap_pmd_is_unused(addr, next)) {
  1175						free_vmemmap_pages(pmd_page(*pmd),
  1176								   altmap, PMD_ORDER);
  1177						spin_lock(&init_mm.page_table_lock);
  1178						pmd_clear(pmd);
  1179						spin_unlock(&init_mm.page_table_lock);
  1180				}
  1181				continue;
  1182			}
  1183	
  1184			pte_base = (pte_t *)pmd_page_vaddr(*pmd);
  1185			remove_pte_table(pte_base, addr, next, direct, altmap);
  1186			free_pte_table(pte_base, pmd);
  1187		}
  1188	
  1189		/* Call free_pmd_table() in remove_pud_table(). */
  1190		if (direct)
  1191			update_page_count(PG_LEVEL_2M, -pages);
  1192	}
  1193	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
