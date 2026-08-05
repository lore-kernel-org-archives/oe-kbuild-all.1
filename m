Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320A53749F7
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Aug 2026 14:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785940171; cv=none; b=hYztFulamZq0JkN3egCYVPFNlC4EHHiQXJIKtmEY1oJSSjLKA0lXO+0FW2xBzSJxoQsYSi1QlAL589LGTyC2wFDlCHrCzX0Zd001xPA/NuLSM7JA/0f1L/4Pud/NozB3FqEHqDYHJ51iUECzLKBaz9ROxPXhIMKd3yJAjYjkXvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785940171; c=relaxed/simple;
	bh=sONdTTo7yqgnaNC3RGlXk3c4XYte3l6nj64B//XIyPk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=D3eBKcv+s+6BTb9ys5kXm7toSkG7wnzFKZlRKFgKsiYWMx+/0twoR11Yy5hdTBjt9XyXJ66F7f3R68L7kTDUT9v6KRyL+gUtOtrBzWbS+8dR1+rmDFH0oPgrZUULaX6mKpv24guq3zsfQ/WeOkTCuZbK1ROqVz+jm4I04QlsOp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K6CYkMEF; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K6CYkMEF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785940169; x=1817476169;
  h=date:from:to:cc:subject:message-id;
  bh=sONdTTo7yqgnaNC3RGlXk3c4XYte3l6nj64B//XIyPk=;
  b=K6CYkMEFvuDccShJqDTb7Ob0KSNd4emnT7bcCaUvRAXwk9KIOqEKps9R
   dbD+MdkagD4/bnK7rl1iaCZYCSJMKhkTZLuPPyDEzBG6Y9gc+qThPBwcM
   8p3pWRooDWnIOmCBDo+tzIEpLPy6hs8oQJ0NYtzlwPZI3pPmqLKY8l8gD
   JUoeLKdBOCZFlHGd766DEGaZNCsENhCoyyrnO42ZWdZ9Rxan6U8fc5jP1
   GDlSL/b8dcn64xGRRrZpWmUxd+SR56zu9fpi5L3wdPExAYmERDpmzLA37
   89ElEhsb15mCZbwTmneNckd1+djm461Z7RoZOb+nNaqr24uYffBNqlL/1
   w==;
X-CSE-ConnectionGUID: 01lYvxN3SteZH3vS+Rq1GA==
X-CSE-MsgGUID: VO6oWIbDR6SUHecOPtzCBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="86288572"
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; 
   d="scan'208";a="86288572"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 07:29:20 -0700
X-CSE-ConnectionGUID: FrxzoZPLRqC33XnvjlByJg==
X-CSE-MsgGUID: IeSL8HbwSZGTgRvjOtzwsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; 
   d="scan'208";a="257955977"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 05 Aug 2026 07:29:18 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrccO-000000004P8-2UM2;
	Wed, 05 Aug 2026 14:29:16 +0000
Date: Wed, 05 Aug 2026 16:29:00 +0200
From: kernel test robot <lkp@intel.com>
To: Muchun Song <songmuchun@bytedance.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: mm/sparse.c:318:undefined reference to
 `section_nr_vmemmap_pages'
Message-ID: <202608051654.DSn2IgRz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Muchun-Song/mm-sparse-relax-struct-mem_section-size-constraints/20260804-161543
head:   9fb4c3dd521d645a8c059d98341ac40c994553fd
commit: 1fec22c19562335916faf464266d71391544c6d7 mm/sparse-vmemmap: support section-based vmemmap optimization
date:   30 hours ago
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260805/202608051654.DSn2IgRz-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260805/202608051654.DSn2IgRz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608051654.DSn2IgRz-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390x-linux-gnu-ld: mm/sparse.o: in function `sparse_init_nid':
>> mm/sparse.c:318:(.init.text+0x24c): undefined reference to `section_nr_vmemmap_pages'


vim +318 mm/sparse.c

   287	
   288	/*
   289	 * Initialize sparse on a specific node. The node spans [pnum_begin, pnum_end)
   290	 * And number of present sections in this node is map_count.
   291	 */
   292	static void __init sparse_init_nid(int nid, unsigned long pnum_begin,
   293					   unsigned long pnum_end,
   294					   unsigned long map_count)
   295	{
   296		unsigned long pnum;
   297	
   298		if (sparse_usage_init(nid, map_count))
   299			panic("Failed to allocate usemap for node %d\n", nid);
   300	
   301		sparse_vmemmap_init_nid_early(nid);
   302	
   303		for_each_present_section_nr(pnum_begin, pnum) {
   304			struct mem_section *ms;
   305			unsigned long pfn = section_nr_to_pfn(pnum);
   306	
   307			if (pnum >= pnum_end)
   308				break;
   309	
   310			ms = __nr_to_section(pnum);
   311			if (!preinited_vmemmap_section(ms)) {
   312				struct page *map;
   313	
   314				map = __populate_section_memmap(pfn, PAGES_PER_SECTION,
   315								nid, NULL, NULL);
   316				if (!map)
   317					panic("Failed to allocate memmap for section %lu\n", pnum);
 > 318				memmap_boot_pages_add(section_nr_vmemmap_pages(pfn, PAGES_PER_SECTION,
   319									       NULL, NULL));
   320				sparse_init_early_section(nid, map, pnum, 0);
   321			}
   322		}
   323		sparse_usage_fini();
   324	}
   325	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
