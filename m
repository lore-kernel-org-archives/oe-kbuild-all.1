Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95C223314B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Nov 2025 10:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763979962; cv=none; b=CQyKGxvSsnDjqyZg6Qut83H26XCzZKOYS1QW0br9jZAXzi6XbsfozNUPgkronyz6CmtGI7mKBvjt28D3S0ppIvMX7g64lvd/gpGcnfbPLhE0K95IAfhp9VN0X0ukQrKVv2WaeLLSG/Rx9eveTo3Xfu35NXrDsmvpiSh+ji/Cwm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763979962; c=relaxed/simple;
	bh=lVTuT/lxoqEKZX8Yzb/Oy9YIAliiRQOdeiMrgRCuWRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JvaFo4Nyv5FayRtwfqywucetbpQGuiqqnHn2upW2X29D9qsx1m/k3pTCRAL/mvFA6M5DnnQCeXbu/YledVSy+ZXVR3Rw4iEqU4zoDS/47+yzls985p9/rCz8MwCcjdaCbBiG4cXnYvcLwH1sAaLqJSqT+J53C8xPLKPqn3esiZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gXZl9gqQ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gXZl9gqQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763979961; x=1795515961;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lVTuT/lxoqEKZX8Yzb/Oy9YIAliiRQOdeiMrgRCuWRc=;
  b=gXZl9gqQOHw70P2ATGUP7vVEisupjA4swDHKRpcAfkE7PxpabPFH1z+G
   OtqBDwkRIhHWBCVH7xDk07i6L5cwAp6S55yK46kxAHxC0Fth5T09Hi5KJ
   h9SFcH0KlNhxAUA7biDZGH4m6rqh7JU5JYoRLZSSpdOGIowrVA7xtB+0V
   wO1hwYoXod3cQgyGd6uvzfXpIJ3Y7TPahoZPCYS0GVkwUj8EVcpB7fGcS
   jKpD7XCWXs0jhi0xcNcPcnA1cvT42j6N8ox34fT9EzqFts38HxsBQCn5b
   1buBHdichVaZiBf+aM1aiBd1vHUi1cH0Q2HRd5Zivj6qy/f7pMcYC375T
   g==;
X-CSE-ConnectionGUID: oZTaepk3RPeJmW/oaB/QGA==
X-CSE-MsgGUID: yP9nrYFAQdCldatthGqfbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="66053108"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="66053108"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 02:26:00 -0800
X-CSE-ConnectionGUID: krID0nZ7Sz6omiIDr3CRPQ==
X-CSE-MsgGUID: J2ky/35dS1+s9FtQAofq4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="196585312"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 24 Nov 2025 02:25:59 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNTld-000000000bd-1ftu;
	Mon, 24 Nov 2025 10:25:57 +0000
Date: Mon, 24 Nov 2025 18:25:25 +0800
From: kernel test robot <lkp@intel.com>
To: Yang Shi <yang@os.amperecomputing.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [v4 PATCH] arm64: mm: show direct mapping use in /proc/meminfo
Message-ID: <202511241832.5dxem2Dj-lkp@intel.com>
References: <20251121193437.2147939-1-yang@os.amperecomputing.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121193437.2147939-1-yang@os.amperecomputing.com>

Hi Yang,

kernel test robot noticed the following build errors:

[auto build test ERROR on v6.18-rc6]
[also build test ERROR on linus/master next-20251121]
[cannot apply to arm64/for-next/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yang-Shi/arm64-mm-show-direct-mapping-use-in-proc-meminfo/20251122-033637
base:   v6.18-rc6
patch link:    https://lore.kernel.org/r/20251121193437.2147939-1-yang%40os.amperecomputing.com
patch subject: [v4 PATCH] arm64: mm: show direct mapping use in /proc/meminfo
config: arm64-randconfig-r053-20251124 (https://download.01.org/0day-ci/archive/20251124/202511241832.5dxem2Dj-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251124/202511241832.5dxem2Dj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511241832.5dxem2Dj-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/mm/mmu.c:244:35: error: unknown type name 'dm_type_t'
     244 |                                   dm_type_t type)
         |                                   ^~~~~~~~~
   arch/arm64/mm/mmu.c:249:35: error: unknown type name 'dm_type_t'
     249 |                                   dm_type_t type)
         |                                   ^~~~~~~~~
   arch/arm64/mm/mmu.c: In function 'alloc_init_cont_pte':
>> arch/arm64/mm/mmu.c:318:25: error: implicit declaration of function 'dm_meminfo_add'; did you mean 'si_meminfo_node'? [-Werror=implicit-function-declaration]
     318 |                         dm_meminfo_add(addr, (next - addr), CONT_PTE);
         |                         ^~~~~~~~~~~~~~
         |                         si_meminfo_node
   arch/arm64/mm/mmu.c: In function 'split_contpte':
>> arch/arm64/mm/mmu.c:632:9: error: implicit declaration of function 'dm_meminfo_sub' [-Werror=implicit-function-declaration]
     632 |         dm_meminfo_sub(addr, CONT_PTE_SIZE, CONT_PTE);
         |         ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +318 arch/arm64/mm/mmu.c

   276	
   277	static void alloc_init_cont_pte(pmd_t *pmdp, unsigned long addr,
   278					unsigned long end, phys_addr_t phys,
   279					pgprot_t prot,
   280					phys_addr_t (*pgtable_alloc)(enum pgtable_type),
   281					int flags)
   282	{
   283		unsigned long next;
   284		pmd_t pmd = READ_ONCE(*pmdp);
   285		pte_t *ptep;
   286	
   287		BUG_ON(pmd_sect(pmd));
   288		if (pmd_none(pmd)) {
   289			pmdval_t pmdval = PMD_TYPE_TABLE | PMD_TABLE_UXN | PMD_TABLE_AF;
   290			phys_addr_t pte_phys;
   291	
   292			if (flags & NO_EXEC_MAPPINGS)
   293				pmdval |= PMD_TABLE_PXN;
   294			BUG_ON(!pgtable_alloc);
   295			pte_phys = pgtable_alloc(TABLE_PTE);
   296			ptep = pte_set_fixmap(pte_phys);
   297			init_clear_pgtable(ptep);
   298			ptep += pte_index(addr);
   299			__pmd_populate(pmdp, pte_phys, pmdval);
   300		} else {
   301			BUG_ON(pmd_bad(pmd));
   302			ptep = pte_set_fixmap_offset(pmdp, addr);
   303		}
   304	
   305		do {
   306			pgprot_t __prot = prot;
   307	
   308			next = pte_cont_addr_end(addr, end);
   309	
   310			/* use a contiguous mapping if the range is suitably aligned */
   311			if ((((addr | next | phys) & ~CONT_PTE_MASK) == 0) &&
   312			    (flags & NO_CONT_MAPPINGS) == 0)
   313				__prot = __pgprot(pgprot_val(prot) | PTE_CONT);
   314	
   315			init_pte(ptep, addr, next, phys, __prot);
   316	
   317			if (pgprot_val(__prot) & PTE_CONT)
 > 318				dm_meminfo_add(addr, (next - addr), CONT_PTE);
   319			else
   320				dm_meminfo_add(addr, (next - addr), PTE);
   321	
   322			ptep += pte_index(next) - pte_index(addr);
   323			phys += next - addr;
   324		} while (addr = next, addr != end);
   325	
   326		/*
   327		 * Note: barriers and maintenance necessary to clear the fixmap slot
   328		 * ensure that all previous pgtable writes are visible to the table
   329		 * walker.
   330		 */
   331		pte_clear_fixmap();
   332	}
   333	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
