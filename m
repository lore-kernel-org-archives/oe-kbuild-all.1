Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19B42FE579
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 02:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766371815; cv=none; b=TAnZLFqfL1hffYXxbAef4yH70dIlAXAaE9wlKlQFeaS76wEvKQBCRjoOcR16KOdAfp12NSRp3VKcyjuiALXTnN2xH0wutS25XNKgrx/YnNnzlN05tHEf06G7a5AizZQm7XDXpyd5wvuyfMQW7Qd22Yr1qxeu1rA1/ycT0GJTDOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766371815; c=relaxed/simple;
	bh=crUHIu1JD2Y9x75sbPvasZBm1bK0XoyoFqA0ZxLqnl4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qQjcpVF7L3b0vZujsK7F1q5wT3EbOYgT6ntIvAQiXIbPPT2WzDUrxbfY7A9+SXIIlH8SOy8IGmGLOul2v50Qr2mYKYT37xvNPZbgKAEKovL7WlryNY38/pNdltL7n5TmDXtItnoM6JU32k0/RQaancKSX2ZziWA82vc0+SPDs/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=juO0PM++; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="juO0PM++"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766371814; x=1797907814;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=crUHIu1JD2Y9x75sbPvasZBm1bK0XoyoFqA0ZxLqnl4=;
  b=juO0PM++RiiBGScogTWsw9PqT8KFVVr42V5jzAcSyNUKMy0PizKusGNX
   mr2NyQFW8JP3bhZJR03ptWmQbjzOawv8jO26FTLumjF6rLacQd1DHWX+F
   Y18N/KjwlUzyFLDIuD7u/vuSf0QzGVbowrCZHTtRKliP0QmblmNUpAjW5
   3WUX/bQdKJhbw/QX9zBdlz/prMgWmZxUGMuRSxYr4ulpo+0ereMrzJHHp
   h1HcThHI2fmh2FyriKqq65KaVUGqAHy5OdWKoE8SyMxRRVHsTUyR3Wn8n
   YVo97zZNbl7/r0Z1zdWmu8U9eSRJ5EZ9MdWyH52NTuAUGyBbTSOLChTLE
   w==;
X-CSE-ConnectionGUID: NdVq3eHERMKQwD1qUY6kTg==
X-CSE-MsgGUID: fqRZd85ITkWqr49R3tPrPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="85812442"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="85812442"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 18:50:13 -0800
X-CSE-ConnectionGUID: XsSSr1sRTxiDnAn1k7Nh9w==
X-CSE-MsgGUID: F6WaU1GOTM6QY7bOhD5zrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="222902646"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 21 Dec 2025 18:50:12 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXVzu-000000005LM-2DxA;
	Mon, 22 Dec 2025 02:50:10 +0000
Date: Mon, 22 Dec 2025 03:49:31 +0100
From: kernel test robot <lkp@intel.com>
To: alexs@kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:thp1 1/1] mm/huge_memory.c:1286:40: error: 'addr'
 undeclared; did you mean 'haddr'?
Message-ID: <202512220357.XNBifMz3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git thp1
head:   92bbb3ed72c8bba724b402ec1693356bcaae871a
commit: 92bbb3ed72c8bba724b402ec1693356bcaae871a [1/1] merge HPAGE_PMD_MASK into addr
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251222/202512220357.XNBifMz3-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512220357.XNBifMz3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512220357.XNBifMz3-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/huge_memory.c: In function 'vma_alloc_anon_folio_pmd':
>> mm/huge_memory.c:1286:40: error: 'addr' undeclared (first use in this function); did you mean 'haddr'?
    1286 |                 folio_zero_user(folio, addr);
         |                                        ^~~~
         |                                        haddr
   mm/huge_memory.c:1286:40: note: each undeclared identifier is reported only once for each function it appears in


vim +1286 mm/huge_memory.c

74d2fad1334d12b Toshi Kani       2016-10-07  1252  
ebcfc63d6bca3cc Dev Jain         2024-10-08  1253  static struct folio *vma_alloc_anon_folio_pmd(struct vm_area_struct *vma,
92bbb3ed72c8bba Alex Shi         2025-12-16  1254  		unsigned long haddr)
71e3aac0724ffe8 Andrea Arcangeli 2011-01-13  1255  {
ebcfc63d6bca3cc Dev Jain         2024-10-08  1256  	gfp_t gfp = vma_thp_gfp_mask(vma);
ebcfc63d6bca3cc Dev Jain         2024-10-08  1257  	const int order = HPAGE_PMD_ORDER;
ebcfc63d6bca3cc Dev Jain         2024-10-08  1258  	struct folio *folio;
71e3aac0724ffe8 Andrea Arcangeli 2011-01-13  1259  
92bbb3ed72c8bba Alex Shi         2025-12-16  1260  	folio = vma_alloc_folio(gfp, order, vma, haddr);
00501b531c47239 Johannes Weiner  2014-08-08  1261  
ebcfc63d6bca3cc Dev Jain         2024-10-08  1262  	if (unlikely(!folio)) {
ebcfc63d6bca3cc Dev Jain         2024-10-08  1263  		count_vm_event(THP_FAULT_FALLBACK);
ebcfc63d6bca3cc Dev Jain         2024-10-08  1264  		count_mthp_stat(order, MTHP_STAT_ANON_FAULT_FALLBACK);
ebcfc63d6bca3cc Dev Jain         2024-10-08  1265  		return NULL;
ebcfc63d6bca3cc Dev Jain         2024-10-08  1266  	}
00501b531c47239 Johannes Weiner  2014-08-08  1267  
ebcfc63d6bca3cc Dev Jain         2024-10-08  1268  	VM_BUG_ON_FOLIO(!folio_test_large(folio), folio);
cfe3236d32d07bf Kefeng Wang      2023-03-02  1269  	if (mem_cgroup_charge(folio, vma->vm_mm, gfp)) {
cfe3236d32d07bf Kefeng Wang      2023-03-02  1270  		folio_put(folio);
6b251fc96cf2cdf Andrea Arcangeli 2015-09-04  1271  		count_vm_event(THP_FAULT_FALLBACK);
85b9f46e8ea4516 David Rientjes   2020-04-06  1272  		count_vm_event(THP_FAULT_FALLBACK_CHARGE);
ebcfc63d6bca3cc Dev Jain         2024-10-08  1273  		count_mthp_stat(order, MTHP_STAT_ANON_FAULT_FALLBACK);
ebcfc63d6bca3cc Dev Jain         2024-10-08  1274  		count_mthp_stat(order, MTHP_STAT_ANON_FAULT_FALLBACK_CHARGE);
ebcfc63d6bca3cc Dev Jain         2024-10-08  1275  		return NULL;
6b251fc96cf2cdf Andrea Arcangeli 2015-09-04  1276  	}
cfe3236d32d07bf Kefeng Wang      2023-03-02  1277  	folio_throttle_swaprate(folio, gfp);
00501b531c47239 Johannes Weiner  2014-08-08  1278  
5708d96da20b99b Zi Yan           2024-10-11  1279         /*
c51a4f11e6d8246 Zi Yan           2024-12-09  1280  	* When a folio is not zeroed during allocation (__GFP_ZERO not used)
c51a4f11e6d8246 Zi Yan           2024-12-09  1281  	* or user folios require special handling, folio_zero_user() is used to
c51a4f11e6d8246 Zi Yan           2024-12-09  1282  	* make sure that the page corresponding to the faulting address will be
c51a4f11e6d8246 Zi Yan           2024-12-09  1283  	* hot in the cache after zeroing.
5708d96da20b99b Zi Yan           2024-10-11  1284  	*/
c51a4f11e6d8246 Zi Yan           2024-12-09  1285  	if (user_alloc_needs_zeroing())
ebcfc63d6bca3cc Dev Jain         2024-10-08 @1286  		folio_zero_user(folio, addr);
52f37629fd3c7b2 Minchan Kim      2013-04-29  1287  	/*
cfe3236d32d07bf Kefeng Wang      2023-03-02  1288  	 * The memory barrier inside __folio_mark_uptodate makes sure that
78fefd04c123493 Kefeng Wang      2024-06-18  1289  	 * folio_zero_user writes become visible before the set_pmd_at()
52f37629fd3c7b2 Minchan Kim      2013-04-29  1290  	 * write.
52f37629fd3c7b2 Minchan Kim      2013-04-29  1291  	 */
cfe3236d32d07bf Kefeng Wang      2023-03-02  1292  	__folio_mark_uptodate(folio);
ebcfc63d6bca3cc Dev Jain         2024-10-08  1293  	return folio;
ebcfc63d6bca3cc Dev Jain         2024-10-08  1294  }
ebcfc63d6bca3cc Dev Jain         2024-10-08  1295  

:::::: The code at line 1286 was first introduced by commit
:::::: ebcfc63d6bca3cce1bfca30092712f3468b4ecff mm: abstract THP allocation

:::::: TO: Dev Jain <dev.jain@arm.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
