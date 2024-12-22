Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD20018E054
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Dec 2024 14:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734877573; cv=none; b=Xi4BZM9ROPPsXH6Xv6/RoAQMCsvIDFxn7IzgDhX0IodoMJEYyGTqfXEMDrQWetQ2ZHBCvleVpDZIcnNbwnw+5CVLnTeX0Uj1e5dOKGtZQX5Urh7hVU6oIUPuPNqB6qDZKyIl0rb3UCp3cnfNeg0DAuxgxHR7Y2tI9jHLDzsQ+XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734877573; c=relaxed/simple;
	bh=ECbutcvh7A4E6XJyKaAFycQe1pyw7vVJ7WUWp0NzLXs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k7r/i92V3oSQgTFDuWiYJPg1fbY2zQr6Mf3Vvjac9WPeqd7KPTTtiy2H651/v7S6NPrIqNgifLGCgi+hN2wk/DjSN8nVjN3H203kbm5SYUm4wdm6FOP/HKvZjSntWgSbNC7qPXg0uKD51hlIHcL7qiqj5mJRCHh0C3nCKeHJDlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SuNVv+XC; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SuNVv+XC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734877572; x=1766413572;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ECbutcvh7A4E6XJyKaAFycQe1pyw7vVJ7WUWp0NzLXs=;
  b=SuNVv+XCINlK4qHTeXCw7aHS+H1vd4B1PCA/fMIzVbt9+JRyTMfFBCSn
   0laSmFZW4vd2YSrFsSiefwqzjStWkbApB+jH0gWJ/duXuIv1pi4lExiBH
   wJeo0E46+ftSvzTKWTEYHLrWZMEGgtDX156pFjrA8oHNOxgF9jvH+VAWU
   xZenZv3RFiOG50EKP8eJMuk082DoNOsTnyHHC9Ludx6Z8ApcLXQFI7FPV
   CcSIfX0nTmDoK6QIK5nVPuzpOlP+TqOcu35irbIRe2zu/NxI2E2P+9IQ9
   KrofiYvOAK1NQnoqGrQftmaAhAjQcLjr6O0rC0KwfBPlKF3HpxTAVM5e9
   A==;
X-CSE-ConnectionGUID: Vn7KOqGRR1uQn35UnFNf7g==
X-CSE-MsgGUID: +/Tky7UTTxiJZzTRaAkwfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11294"; a="46738930"
X-IronPort-AV: E=Sophos;i="6.12,255,1728975600"; 
   d="scan'208";a="46738930"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2024 06:26:11 -0800
X-CSE-ConnectionGUID: 0AMTwSfjQaKIDmpo36qOmA==
X-CSE-MsgGUID: n0mL2FRORpaqnsw7jgxX4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="104039647"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 22 Dec 2024 06:26:09 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPMuF-00030F-14;
	Sun, 22 Dec 2024 14:26:07 +0000
Date: Sun, 22 Dec 2024 22:25:38 +0800
From: kernel test robot <lkp@intel.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Mike Rapoport <rppt@kernel.org>
Subject: [rppt:execmem/x86-rox/v8 3/6] arch/x86/mm/pat/set_memory.c:1314:17:
 error: implicit declaration of function 'collapse_page_count'; did you mean
 'update_page_count'?
Message-ID: <202412222227.GhIMiwUp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git execmem/x86-rox/v8
head:   6c4eb6e17cdd71fe4df151523bb69db507c52b8c
commit: 84b77b5e5004c02f0f731ca69c66a8d8f4bcbc6c [3/6] x86/mm/pat: Restore large pages after fragmentation
config: x86_64-buildonly-randconfig-004-20241222 (https://download.01.org/0day-ci/archive/20241222/202412222227.GhIMiwUp-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241222/202412222227.GhIMiwUp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412222227.GhIMiwUp-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/mm/pat/set_memory.c: In function 'collapse_pmd_page':
>> arch/x86/mm/pat/set_memory.c:1314:17: error: implicit declaration of function 'collapse_page_count'; did you mean 'update_page_count'? [-Werror=implicit-function-declaration]
    1314 |                 collapse_page_count(PG_LEVEL_2M);
         |                 ^~~~~~~~~~~~~~~~~~~
         |                 update_page_count
   cc1: some warnings being treated as errors


vim +1314 arch/x86/mm/pat/set_memory.c

  1251	
  1252	static int collapse_pmd_page(pmd_t *pmd, unsigned long addr,
  1253				     struct list_head *pgtables)
  1254	{
  1255		pmd_t _pmd, old_pmd;
  1256		pte_t *pte, first;
  1257		unsigned long pfn;
  1258		pgprot_t pgprot;
  1259		int i = 0;
  1260	
  1261		addr &= PMD_MASK;
  1262		pte = pte_offset_kernel(pmd, addr);
  1263		first = *pte;
  1264		pfn = pte_pfn(first);
  1265	
  1266		/* Make sure alignment is suitable */
  1267		if (PFN_PHYS(pfn) & ~PMD_MASK)
  1268			return 0;
  1269	
  1270		/* The page is 4k intentionally */
  1271		if (pte_flags(first) & _PAGE_KERNEL_4K)
  1272			return 0;
  1273	
  1274		/* Check that the rest of PTEs are compatible with the first one */
  1275		for (i = 1, pte++; i < PTRS_PER_PTE; i++, pte++) {
  1276			pte_t entry = *pte;
  1277	
  1278			if (!pte_present(entry))
  1279				return 0;
  1280			if (pte_flags(entry) != pte_flags(first))
  1281				return 0;
  1282			if (pte_pfn(entry) != pte_pfn(first) + i)
  1283				return 0;
  1284		}
  1285	
  1286		old_pmd = *pmd;
  1287	
  1288		/* Success: set up a large page */
  1289		pgprot = pgprot_4k_2_large(pte_pgprot(first));
  1290		pgprot_val(pgprot) |= _PAGE_PSE;
  1291		_pmd = pfn_pmd(pfn, pgprot);
  1292		set_pmd(pmd, _pmd);
  1293	
  1294		/* Queue the page table to be freed after TLB flush */
  1295		list_add(&page_ptdesc(pmd_page(old_pmd))->pt_list, pgtables);
  1296	
  1297		if (IS_ENABLED(CONFIG_X86_32) && !SHARED_KERNEL_PMD) {
  1298			struct page *page;
  1299	
  1300			/* Update all PGD tables to use the same large page */
  1301			list_for_each_entry(page, &pgd_list, lru) {
  1302				pgd_t *pgd = (pgd_t *)page_address(page) + pgd_index(addr);
  1303				p4d_t *p4d = p4d_offset(pgd, addr);
  1304				pud_t *pud = pud_offset(p4d, addr);
  1305				pmd_t *pmd = pmd_offset(pud, addr);
  1306				/* Something is wrong if entries doesn't match */
  1307				if (WARN_ON(pmd_val(old_pmd) != pmd_val(*pmd)))
  1308					continue;
  1309				set_pmd(pmd, _pmd);
  1310			}
  1311		}
  1312	
  1313		if (pfn_range_is_mapped(pfn, pfn + 1))
> 1314			collapse_page_count(PG_LEVEL_2M);
  1315	
  1316		return 1;
  1317	}
  1318	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
