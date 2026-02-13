Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F1734D915
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Feb 2026 11:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770981270; cv=none; b=m80xACwM89Mh89k4cs2nRZAkG8pOhkNdSjX5dKcjH2Lnq/HF2DbiVDpauClD8dWr14JG2XE8lak9H5N0T6QbZSniG4J7oGffdXGWPPad+OYK83DzNdg3a4lruoJ+Zgn0CybAWJyhnJPOaVvCl2die/Ng4+byBsgLRNHFZ/AbufQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770981270; c=relaxed/simple;
	bh=uiqwiT5byzjtipmC89VnzpC4xf0yxn41WF2sdb70VqA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BLCVdnq5uuGCBLbh4LdrsZ88jVhVsaXdSfy8mUCbYipTstp+gpm4SJTsP8SXYjHxvppolPkhzjLqTfjapNxQ8FqdI3gy3BIpgeHVdumhTgA6iaPw4nMqLJeCQTqvbdzDQWymoqEKwzTAjm5n56BDOESqVNSP4Co1WC3V6kiuoEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LAgcV8X6; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LAgcV8X6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770981269; x=1802517269;
  h=date:from:to:cc:subject:message-id;
  bh=uiqwiT5byzjtipmC89VnzpC4xf0yxn41WF2sdb70VqA=;
  b=LAgcV8X6jseerXlNkvll8bcrccdR1OX8wTXzFamic/JMLu33OBdWlnQG
   4e0dS3Jk0TAxK281TUwmYFMHUSv8kYyXWpShU9dLU0Y5m84vpoT4oxO9p
   Pn+uHHIs+/ZlsVWJatuhtxhxX76MxdurcrqDaIaKraAFE38xekmIjaSPc
   ilFNBlWYEdjCsFslh+XASM3vyVS6EpCzR/MZevfi30UCIEF5XEvYS+qED
   APb/qgv43iKYPC7vyBscpn6mXv/+0uxr2ahgF5lLmt1bhiMVzw7XmfemW
   SKk1Rp1w9K2aExKpqzKmXr56gkxT46C/4i+5crgZtsfGneIcLC93QSg6E
   Q==;
X-CSE-ConnectionGUID: isBiVgrKT3GBoIoHfhDwHQ==
X-CSE-MsgGUID: ZXu/2aDUT62xjfc2efQ6zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="76005216"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; 
   d="scan'208";a="76005216"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 03:14:27 -0800
X-CSE-ConnectionGUID: pJCVRIrNRNip0OJRHTRG7w==
X-CSE-MsgGUID: MW1YBTBATVSWUEe23gWOqg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 13 Feb 2026 03:14:25 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqr7v-00000000vKA-15e7;
	Fri, 13 Feb 2026 11:14:23 +0000
Date: Fri, 13 Feb 2026 19:13:35 +0800
From: kernel test robot <lkp@intel.com>
To: Kiryl Shutsemau <kas@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kas:pte_size 15/16] mm/vmalloc.c:806:24: error: implicit
 declaration of function 'p4d_pfn'; did you mean 'pud_pfn'?
Message-ID: <202602131951.QwpUbxKx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git pte_size
head:   f562d70c53ccc0213b4afbf20fc312d85f9972bb
commit: abf3930fa6ed33226e0965bedc64f461c3647656 [15/16] tmp
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20260213/202602131951.QwpUbxKx-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260213/202602131951.QwpUbxKx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602131951.QwpUbxKx-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/vmalloc.c: In function 'vmalloc_to_pfn':
>> mm/vmalloc.c:806:24: error: implicit declaration of function 'p4d_pfn'; did you mean 'pud_pfn'? [-Wimplicit-function-declaration]
     806 |                 return p4d_pfn(*p4d) + ((addr & ~P4D_MASK) >> PTE_SHIFT);
         |                        ^~~~~~~
         |                        pud_pfn


vim +806 mm/vmalloc.c

   776	
   777	/*
   778	 * Map a vmalloc()-space virtual address to the physical page frame number.
   779	 */
   780	unsigned long vmalloc_to_pfn(const void *vmalloc_addr)
   781	{
   782		unsigned long addr = (unsigned long) vmalloc_addr;
   783		pgd_t *pgd = pgd_offset_k(addr);
   784		p4d_t *p4d;
   785		pud_t *pud;
   786		pmd_t *pmd;
   787		pte_t *ptep, pte;
   788	
   789		/*
   790		 * XXX we might need to change this if we add VIRTUAL_BUG_ON for
   791		 * architectures that do not vmalloc module space
   792		 */
   793		VIRTUAL_BUG_ON(!is_vmalloc_or_module_addr(vmalloc_addr));
   794	
   795		if (pgd_none(*pgd))
   796			return 0;
   797		if (WARN_ON_ONCE(pgd_leaf(*pgd)))
   798			return 0; /* XXX: no allowance for huge pgd */
   799		if (WARN_ON_ONCE(pgd_bad(*pgd)))
   800			return 0;
   801	
   802		p4d = p4d_offset(pgd, addr);
   803		if (p4d_none(*p4d))
   804			return 0;
   805		if (p4d_leaf(*p4d))
 > 806			return p4d_pfn(*p4d) + ((addr & ~P4D_MASK) >> PTE_SHIFT);
   807		if (WARN_ON_ONCE(p4d_bad(*p4d)))
   808			return 0;
   809	
   810		pud = pud_offset(p4d, addr);
   811		if (pud_none(*pud))
   812			return 0;
   813		if (pud_leaf(*pud))
   814			return pud_pfn(*pud) + ((addr & ~PUD_MASK) >> PTE_SHIFT);
   815		if (WARN_ON_ONCE(pud_bad(*pud)))
   816			return 0;
   817	
   818		pmd = pmd_offset(pud, addr);
   819		if (pmd_none(*pmd))
   820			return 0;
   821		if (pmd_leaf(*pmd))
   822			return pmd_pfn(*pmd) + ((addr & ~PMD_MASK) >> PTE_SHIFT);
   823		if (WARN_ON_ONCE(pmd_bad(*pmd)))
   824			return 0;
   825	
   826		ptep = pte_offset_kernel(pmd, addr);
   827		pte = ptep_get(ptep);
   828		if (pte_present(pte))
   829			return pte_pfn(pte);
   830	
   831		return 0;
   832	}
   833	EXPORT_SYMBOL(vmalloc_to_pfn);
   834	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
