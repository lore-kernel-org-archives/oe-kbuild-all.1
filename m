Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1211945027
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Aug 2024 05:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723180728; cv=none; b=m8yYEzZaKJeEa4xfDqN+TXBqUsu7C9XqHqADmsMdBdf8ORsk/lPVP3ioPdIIEscr+r/y34Y7qKtK1q9C0cTw+yNd7Mr1ex8CQWrTjzgDPR52aa1T/ZlEkEU8IwRS9a73NqXZmkVB5V9FrdtSEYSIqwe4bv4t+TDvs+KQZZLzgp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723180728; c=relaxed/simple;
	bh=Juxbp9ak2PjN3dOT3DogVKDt7Et+DZA9MF8N4cmAajg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f/I5x24QqcfcWnacWxTjnr+wj2JineHsNhRAl8x0pjK3GaxbZgkvMiHWTfqkcF+tzgwoyU/kkKPlu5sPs6ml8MdbrJvoM0doQ4KE7dhOs/qs9Fh5dHqh9VsdqqYO9XWHN49pqd4l+GibHmnZOtfkA1yEEjDx4ekDXYw3ix+StXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d+rKYhnQ; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d+rKYhnQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723180727; x=1754716727;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Juxbp9ak2PjN3dOT3DogVKDt7Et+DZA9MF8N4cmAajg=;
  b=d+rKYhnQwnB0vc4aY/BCYqr/NGNjiD0PhV7xVzFM7/5d77KlFbggr++0
   0pBclVkeTl5OmJKBe6OdPnG3wM2y/OJ20mnxIq9d+2g4jOiHCVowPXzeA
   DDAPMMNMcFXJ8AFt11FPkMOOBRqsQI2+vDEITMocswiatJZSr4q1IkMsK
   9biCravZJYlWbvXwlhJn85nARSY1hLc2mIkdZqWgMSh/OhYTDTwnopheC
   8d+14NtvHZxIbQsIBXaHjYSi1ixIyVLHyZEUwNKDMo5bp3Bj9LUT75pbP
   KHyTDoG2i6Jl72nFkoSxm+W7W/wFtBF3haEAmfPl/9SYzryMVp7M66z6d
   A==;
X-CSE-ConnectionGUID: PEBjDFrXTKm1JFxrIrDIQw==
X-CSE-MsgGUID: 1aGE8EwlQhCDf5H74KT63A==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="32018746"
X-IronPort-AV: E=Sophos;i="6.09,275,1716274800"; 
   d="scan'208";a="32018746"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 22:18:46 -0700
X-CSE-ConnectionGUID: p6v3+DmsRcyuW/Mkv1Wrow==
X-CSE-MsgGUID: RJmQARAORKuOEYS47asw6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,275,1716274800"; 
   d="scan'208";a="57116779"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 08 Aug 2024 22:18:45 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1scI1S-0006rU-27;
	Fri, 09 Aug 2024 05:18:42 +0000
Date: Fri, 9 Aug 2024 13:17:59 +0800
From: kernel test robot <lkp@intel.com>
To: Barry Song <21cnbao@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 1/2] mm: collect the number of anon large folios
Message-ID: <202408091325.dYV3OVPV-lkp@intel.com>
References: <20240808010457.228753-2-21cnbao@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240808010457.228753-2-21cnbao@gmail.com>

Hi Barry,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on next-20240807]
[also build test ERROR on v6.11-rc2]
[cannot apply to akpm-mm/mm-everything linus/master v6.11-rc2 v6.11-rc1 v6.10]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Barry-Song/mm-collect-the-number-of-anon-large-folios/20240808-090627
base:   next-20240807
patch link:    https://lore.kernel.org/r/20240808010457.228753-2-21cnbao%40gmail.com
patch subject: [PATCH RFC 1/2] mm: collect the number of anon large folios
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240809/202408091325.dYV3OVPV-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240809/202408091325.dYV3OVPV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408091325.dYV3OVPV-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/rmap.c: In function 'folio_add_new_anon_rmap':
>> mm/rmap.c:1470:9: error: implicit declaration of function 'mod_mthp_stat'; did you mean 'mod_memcg_state'? [-Wimplicit-function-declaration]
    1470 |         mod_mthp_stat(folio_order(folio), MTHP_STAT_NR_ANON, 1);
         |         ^~~~~~~~~~~~~
         |         mod_memcg_state
>> mm/rmap.c:1470:43: error: 'MTHP_STAT_NR_ANON' undeclared (first use in this function)
    1470 |         mod_mthp_stat(folio_order(folio), MTHP_STAT_NR_ANON, 1);
         |                                           ^~~~~~~~~~~~~~~~~
   mm/rmap.c:1470:43: note: each undeclared identifier is reported only once for each function it appears in
   mm/rmap.c: In function '__folio_remove_rmap':
   mm/rmap.c:1587:51: error: 'MTHP_STAT_NR_ANON' undeclared (first use in this function)
    1587 |                 mod_mthp_stat(folio_order(folio), MTHP_STAT_NR_ANON, -1);
         |                                                   ^~~~~~~~~~~~~~~~~


vim +1470 mm/rmap.c

  1402	
  1403	/**
  1404	 * folio_add_new_anon_rmap - Add mapping to a new anonymous folio.
  1405	 * @folio:	The folio to add the mapping to.
  1406	 * @vma:	the vm area in which the mapping is added
  1407	 * @address:	the user virtual address mapped
  1408	 * @flags:	The rmap flags
  1409	 *
  1410	 * Like folio_add_anon_rmap_*() but must only be called on *new* folios.
  1411	 * This means the inc-and-test can be bypassed.
  1412	 * The folio doesn't necessarily need to be locked while it's exclusive
  1413	 * unless two threads map it concurrently. However, the folio must be
  1414	 * locked if it's shared.
  1415	 *
  1416	 * If the folio is pmd-mappable, it is accounted as a THP.
  1417	 */
  1418	void folio_add_new_anon_rmap(struct folio *folio, struct vm_area_struct *vma,
  1419			unsigned long address, rmap_t flags)
  1420	{
  1421		const int nr = folio_nr_pages(folio);
  1422		const bool exclusive = flags & RMAP_EXCLUSIVE;
  1423		int nr_pmdmapped = 0;
  1424	
  1425		VM_WARN_ON_FOLIO(folio_test_hugetlb(folio), folio);
  1426		VM_WARN_ON_FOLIO(!exclusive && !folio_test_locked(folio), folio);
  1427		VM_BUG_ON_VMA(address < vma->vm_start ||
  1428				address + (nr << PAGE_SHIFT) > vma->vm_end, vma);
  1429	
  1430		/*
  1431		 * VM_DROPPABLE mappings don't swap; instead they're just dropped when
  1432		 * under memory pressure.
  1433		 */
  1434		if (!folio_test_swapbacked(folio) && !(vma->vm_flags & VM_DROPPABLE))
  1435			__folio_set_swapbacked(folio);
  1436		__folio_set_anon(folio, vma, address, exclusive);
  1437	
  1438		if (likely(!folio_test_large(folio))) {
  1439			/* increment count (starts at -1) */
  1440			atomic_set(&folio->_mapcount, 0);
  1441			if (exclusive)
  1442				SetPageAnonExclusive(&folio->page);
  1443		} else if (!folio_test_pmd_mappable(folio)) {
  1444			int i;
  1445	
  1446			for (i = 0; i < nr; i++) {
  1447				struct page *page = folio_page(folio, i);
  1448	
  1449				/* increment count (starts at -1) */
  1450				atomic_set(&page->_mapcount, 0);
  1451				if (exclusive)
  1452					SetPageAnonExclusive(page);
  1453			}
  1454	
  1455			/* increment count (starts at -1) */
  1456			atomic_set(&folio->_large_mapcount, nr - 1);
  1457			atomic_set(&folio->_nr_pages_mapped, nr);
  1458		} else {
  1459			/* increment count (starts at -1) */
  1460			atomic_set(&folio->_entire_mapcount, 0);
  1461			/* increment count (starts at -1) */
  1462			atomic_set(&folio->_large_mapcount, 0);
  1463			atomic_set(&folio->_nr_pages_mapped, ENTIRELY_MAPPED);
  1464			if (exclusive)
  1465				SetPageAnonExclusive(&folio->page);
  1466			nr_pmdmapped = nr;
  1467		}
  1468	
  1469		__folio_mod_stat(folio, nr, nr_pmdmapped);
> 1470		mod_mthp_stat(folio_order(folio), MTHP_STAT_NR_ANON, 1);
  1471	}
  1472	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
