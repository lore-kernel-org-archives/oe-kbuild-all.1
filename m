Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA681632E7
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Jul 2026 11:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783595232; cv=none; b=J7HcwajNgbochR+Oqnf7vCJj7MSap5o330qQ+nqm6s8t5p27kKhjVWDWzTgp7afcZJlvDwhl3OpsDeRF9xnMTkomMqwWxgGSzmTYH8LRugZ1f7ZEDLToJYOUv5FL1mGmPpJGM3sVwtPJw0bVrGDENjlurxHQsy0B54mSfVXIgYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783595232; c=relaxed/simple;
	bh=xeouGua9hCpsY/oWgszGM6yAdTp1zxmbLdiNlv9uRRs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CUvvVNwcBMEZLt8RXlgRyFJOD929y0urXxGGxd2NRtC6sN6O/MVrugR/x0/CUQWEhZsDD2xbXccYsT/nKkhA9vdhZ23OmLUSUD5LVbENG66ZHBq/qNUsN4onvbPyiyK22VJfBtlybgGV1Q7Z/vHubxTiydHxWAsZd01Wsu08dL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jt0Zyocl; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jt0Zyocl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783595231; x=1815131231;
  h=date:from:to:cc:subject:message-id;
  bh=xeouGua9hCpsY/oWgszGM6yAdTp1zxmbLdiNlv9uRRs=;
  b=jt0ZyoclQFmkNrCqfLAALJaik17ahyWyfFfAkyLobAUZiPvnzlXtCBcz
   axti2mltOjUGbcJIhDAmcQ7RMwQ20GV8bXTW6Fd+bsRcebcaViw/WlYrM
   cdFi7vf18SD8i51JU5TDvKxWMvMbRa84GHWWwrPMSHnGHQZhl7Bc9kqPw
   jUGcP0mSygSPNbynDkglbvskS9UAW5MDNV2gwor+Ya7TCYFYUnlSj8usS
   XF51G5ByxYdxHP9wmM+i82EKzVfpklz5E1Zex/VQgWX5uQhO6YlGUcUYE
   emzV1nG/OfYCylSXa0WDpse0zKbDuTLlB7S9C82IaR/xoAF0tznbn0P2x
   w==;
X-CSE-ConnectionGUID: 5pQDki3wTT6ptXWtMJ4ZKA==
X-CSE-MsgGUID: /G3Mt4aWRyW+56xeisEjVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="101701694"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="101701694"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 04:07:11 -0700
X-CSE-ConnectionGUID: swKVpNkKQSirGtjkKWru+w==
X-CSE-MsgGUID: 5gCuhQoeT2anLl8QU9Lcfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="277785951"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 09 Jul 2026 04:07:08 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whmav-00000000Han-3Fpq;
	Thu, 09 Jul 2026 11:07:05 +0000
Date: Thu, 09 Jul 2026 19:06:14 +0800
From: kernel test robot <lkp@intel.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 "David Hildenbrand (Arm)" <david@kernel.org>
Subject: [davidhildenbrand:folded_pgtable 22/32]
 arch/x86/mm/pat/set_memory.c:1678:18: warning: variable 'pud_pgprot' set but
 not used
Message-ID: <202607091858.TwedThVk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/davidhildenbrand/linux folded_pgtable
head:   0551ca68b7552b7d71f1d2882635809a573d6c79
commit: 4592f8382e98e634f99ec4a27fa786304b128bb6 [22/32] x86: mm: skip pud setup when using folded pagetable
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20260709/202607091858.TwedThVk-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260709/202607091858.TwedThVk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607091858.TwedThVk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/mm/pat/set_memory.c: In function 'populate_pud':
>> arch/x86/mm/pat/set_memory.c:1678:18: warning: variable 'pud_pgprot' set but not used [-Wunused-but-set-variable]
    1678 |         pgprot_t pud_pgprot;
         |                  ^~~~~~~~~~


vim +/pud_pgprot +1678 arch/x86/mm/pat/set_memory.c

4b23538d88c87d arch/x86/mm/pageattr.c Borislav Petkov 2013-10-31  1671  
4547833602fdd3 arch/x86/mm/pageattr.c Kiryl Shutsemau 2017-03-17  1672  static int populate_pud(struct cpa_data *cpa, unsigned long start, p4d_t *p4d,
4b23538d88c87d arch/x86/mm/pageattr.c Borislav Petkov 2013-10-31  1673  			pgprot_t pgprot)
4b23538d88c87d arch/x86/mm/pageattr.c Borislav Petkov 2013-10-31  1674  {
4b23538d88c87d arch/x86/mm/pageattr.c Borislav Petkov 2013-10-31  1675  	pud_t *pud;
4b23538d88c87d arch/x86/mm/pageattr.c Borislav Petkov 2013-10-31  1676  	unsigned long end;
e535ec0899d1fe arch/x86/mm/pageattr.c Matt Fleming    2016-09-20  1677  	long cur_pages = 0;
f5b2831d654167 arch/x86/mm/pageattr.c Juergen Gross   2014-11-03 @1678  	pgprot_t pud_pgprot;
4b23538d88c87d arch/x86/mm/pageattr.c Borislav Petkov 2013-10-31  1679  
4b23538d88c87d arch/x86/mm/pageattr.c Borislav Petkov 2013-10-31  1680  	end = start + (cpa->numpages << PAGE_SHIFT);
4b23538d88c87d arch/x86/mm/pageattr.c Borislav Petkov 2013-10-31  1681  
4b23538d88c87d arch/x86/mm/pageattr.c Borislav Petkov 2013-10-31  1682  	/*
4b23538d88c87d arch/x86/mm/pageattr.c Borislav Petkov 2013-10-31  1683  	 * Not on a Gb page boundary? => map everything up to it with
4b23538d88c87d arch/x86/mm/pageattr.c Borislav Petkov 2013-10-31  1684  	 * smaller pages.
4b23538d88c87d arch/x86/mm/pageattr.c Borislav Petkov 2013-10-31  1685  	 */
4b23538d88c87d arch/x86/mm/pageattr.c Borislav Petkov 2013-10-31  1686  	if (start & (PUD_SIZE - 1)) {
4b23538d88c87d arch/x86/mm/pageattr.c Borislav Petkov 2013-10-31  1687  		unsigned long pre_end;
4b23538d88c87d arch/x86/mm/pageattr.c Borislav Petkov 2013-10-31  1688  		unsigned long next_page = (start + PUD_SIZE) & PUD_MASK;
4b23538d88c87d arch/x86/mm/pageattr.c Borislav Petkov 2013-10-31  1689  
4b23538d88c87d arch/x86/mm/pageattr.c Borislav Petkov 2013-10-31  1690  		pre_end   = min_t(unsigned long, end, next_page);
4b23538d88c87d arch/x86/mm/pageattr.c Borislav Petkov 2013-10-31  1691  		cur_pages = (pre_end - start) >> PAGE_SHIFT;
4b23538d88c87d arch/x86/mm/pageattr.c Borislav Petkov 2013-10-31  1692  		cur_pages = min_t(int, (int)cpa->numpages, cur_pages);
4b23538d88c87d arch/x86/mm/pageattr.c Borislav Petkov 2013-10-31  1693  
4547833602fdd3 arch/x86/mm/pageattr.c Kiryl Shutsemau 2017-03-17  1694  		pud = pud_offset(p4d, start);
4b23538d88c87d arch/x86/mm/pageattr.c Borislav Petkov 2013-10-31  1695  
4b23538d88c87d arch/x86/mm/pageattr.c Borislav Petkov 2013-10-31  1696  		/*
4b23538d88c87d arch/x86/mm/pageattr.c Borislav Petkov 2013-10-31  1697  		 * Need a PMD page?
4b23538d88c87d arch/x86/mm/pageattr.c Borislav Petkov 2013-10-31  1698  		 */
4b23538d88c87d arch/x86/mm/pageattr.c Borislav Petkov 2013-10-31  1699  		if (pud_none(*pud))
4b23538d88c87d arch/x86/mm/pageattr.c Borislav Petkov 2013-10-31  1700  			if (alloc_pmd_page(pud))
4b23538d88c87d arch/x86/mm/pageattr.c Borislav Petkov 2013-10-31  1701  				return -1;
4b23538d88c87d arch/x86/mm/pageattr.c Borislav Petkov 2013-10-31  1702  
4b23538d88c87d arch/x86/mm/pageattr.c Borislav Petkov 2013-10-31  1703  		cur_pages = populate_pmd(cpa, start, pre_end, cur_pages,
4b23538d88c87d arch/x86/mm/pageattr.c Borislav Petkov 2013-10-31  1704  					 pud, pgprot);
4b23538d88c87d arch/x86/mm/pageattr.c Borislav Petkov 2013-10-31  1705  		if (cur_pages < 0)
4b23538d88c87d arch/x86/mm/pageattr.c Borislav Petkov 2013-10-31  1706  			return cur_pages;
4b23538d88c87d arch/x86/mm/pageattr.c Borislav Petkov 2013-10-31  1707  
4b23538d88c87d arch/x86/mm/pageattr.c Borislav Petkov 2013-10-31  1708  		start = pre_end;
4b23538d88c87d arch/x86/mm/pageattr.c Borislav Petkov 2013-10-31  1709  	}
4b23538d88c87d arch/x86/mm/pageattr.c Borislav Petkov 2013-10-31  1710  
4b23538d88c87d arch/x86/mm/pageattr.c Borislav Petkov 2013-10-31  1711  	/* We mapped them all? */
4b23538d88c87d arch/x86/mm/pageattr.c Borislav Petkov 2013-10-31  1712  	if (cpa->numpages == cur_pages)
4b23538d88c87d arch/x86/mm/pageattr.c Borislav Petkov 2013-10-31  1713  		return cur_pages;
4b23538d88c87d arch/x86/mm/pageattr.c Borislav Petkov 2013-10-31  1714  
4547833602fdd3 arch/x86/mm/pageattr.c Kiryl Shutsemau 2017-03-17  1715  	pud = pud_offset(p4d, start);
f5b2831d654167 arch/x86/mm/pageattr.c Juergen Gross   2014-11-03  1716  	pud_pgprot = pgprot_4k_2_large(pgprot);
4b23538d88c87d arch/x86/mm/pageattr.c Borislav Petkov 2013-10-31  1717  

:::::: The code at line 1678 was first introduced by commit
:::::: f5b2831d654167d77da8afbef4d2584897b12d0c x86: Respect PAT bit when copying pte values between large and normal pages

:::::: TO: Juergen Gross <jgross@suse.com>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
