Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1521DFF0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Dec 2025 04:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766033408; cv=none; b=m8ijQM+I48wgSL/Hh1ZdGGg/KHvW3FEe3qbNBaiImzYXFfAJWtVvVmxvDdPMgthXdwc7fXP7hvcDo+JmFGYljzjuIEaHmr1U57xIcbNDEp0LF01Sjum/i6sv648GleBYa0CWN7B/GlTLiRQd7lCdsa/K/yuphRoS0iMjNEeM4w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766033408; c=relaxed/simple;
	bh=ealkDfAhJE7fDd/Z0rC0EDSaZVQJvZ/veg7WPfL9qxM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WXTI4Q/QZmtS7HT0PQ013jzT/eCS8esOemz0V1UR3dO79WHPQ76Z/9YHDyy0a7t1MhUnWQYylW0IdiPufCERG5fjbNj4ZOz5iNdVg3rX45cWPx7yyjQtsNC2xQV1tzJHxa/D5YHzCkEdZQmdXqXcCUeraMPOXCo65YPT+Wt77IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K0aKsTeh; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K0aKsTeh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766033407; x=1797569407;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ealkDfAhJE7fDd/Z0rC0EDSaZVQJvZ/veg7WPfL9qxM=;
  b=K0aKsTehWC5L2h7QPfO/3PomkE3XHS5AQCWdmLil5lVq9TE+SC1W18sW
   da8tLllJbX9bmQhV9HRxls+BanGP2yRmM3rCPcgd66C9sNJMLZcBEBORK
   iwj3nEMbu/PE97btpYTNEGaheWYq93bmWx4RsN0m2rGPm6UGmBqedFfiU
   TiCL0Dx8uPGie5PDr2IcIAzK1zQ8FDojxwRF8I7+1lyynFJRPxCWNr1g0
   42hMVzg2ysFWKfIy94ZwcfdkOE/Wbh/mJ6WjDF/M86RsDh2+7iBwvyzfw
   DHDFESqF1ayK0Hl/aO85RwPP7Yd2WG3XjbJzj7LW3QrNaWO8Ns+jUGsrC
   g==;
X-CSE-ConnectionGUID: 47nwlJaZQuS6ikymJurf5w==
X-CSE-MsgGUID: wrPPBEXUReKd1wAvvx0LXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="79438023"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="79438023"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 20:50:06 -0800
X-CSE-ConnectionGUID: 1n2CZ4NcR0i2iUSg7jt9NQ==
X-CSE-MsgGUID: CabBMGEmTf6Ub3l0hxEZ/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="198377321"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 17 Dec 2025 20:50:05 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vW5xi-000000003qW-3K4G;
	Thu, 18 Dec 2025 04:50:02 +0000
Date: Thu, 18 Dec 2025 05:49:26 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-CWF-RDT-ANBZ24559 0/25] htmldocs:
 ./mm/rmap.c:1948: warning: Function parameter or member 'folio' not
 described in 'try_to_unmap_zero_folio'
Message-ID: <202512180556.3nzqdrVE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-CWF-RDT-ANBZ24559
head:   48fa9d861c1eb99e9f682fb2623142fb456aa0eb
commit: 4601451ef45b862d745f9debf25290dc75e0de9f [0/25] anolis: mm: add switch for file zero page
reproduce: (https://download.01.org/0day-ci/archive/20251218/202512180556.3nzqdrVE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512180556.3nzqdrVE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Error: Cannot open file ./include/linux/page-flags.h
   Error: Cannot open file ./include/linux/mm.h
   Error: Cannot open file ./include/linux/mm.h
   Error: Cannot open file ./include/linux/page_ref.h
   Error: Cannot open file ./include/linux/mmzone.h
>> ./mm/rmap.c:1948: warning: Function parameter or member 'folio' not described in 'try_to_unmap_zero_folio'
>> ./mm/rmap.c:1948: warning: expecting prototype for try_to_unmap_zeropage(). Prototype was for try_to_unmap_zero_folio() instead
   ./mm/balloon_compaction.c:199: warning: Function parameter or member 'first_page' not described in 'balloon_page_list_dequeue_cont'
   Error: Cannot open file ./include/linux/padata.h
   Error: Cannot open file ./include/linux/printk.h
   Error: Cannot open file ./include/linux/workqueue.h
   Error: Cannot open file ./include/linux/xarray.h


vim +1948 ./mm/rmap.c

52629506420ce32 Joonsoo Kim 2014-01-21  1933  
5a9179f41b5d5d8 Kaihao Bai  2022-08-15  1934  /**
5a9179f41b5d5d8 Kaihao Bai  2022-08-15  1935   * try_to_unmap_zeropage - try to remove all page table mappings to a zero page
5a9179f41b5d5d8 Kaihao Bai  2022-08-15  1936   * with the same offset. If the flag doesn't contain TTU_ZEROPAGE, this function
5a9179f41b5d5d8 Kaihao Bai  2022-08-15  1937   * does no thing.
5a9179f41b5d5d8 Kaihao Bai  2022-08-15  1938   * @page: the page to get unmapped
5a9179f41b5d5d8 Kaihao Bai  2022-08-15  1939   * @flags: action and flags
5a9179f41b5d5d8 Kaihao Bai  2022-08-15  1940   *
5a9179f41b5d5d8 Kaihao Bai  2022-08-15  1941   * Tries to remove all the page table entries which are mapping zero
5a9179f41b5d5d8 Kaihao Bai  2022-08-15  1942   * page with the same offset, used in the pageout path.  Caller must hold the page
5a9179f41b5d5d8 Kaihao Bai  2022-08-15  1943   * lock of the newly allocated page.
5a9179f41b5d5d8 Kaihao Bai  2022-08-15  1944   *
5a9179f41b5d5d8 Kaihao Bai  2022-08-15  1945   * During rmap_walk, it holds the i_mmap_sem to avoid modify VMA which not expected.
5a9179f41b5d5d8 Kaihao Bai  2022-08-15  1946   */
4601451ef45b862 Kaihao Bai  2022-08-29  1947  void try_to_unmap_zero_folio(struct folio *folio, enum ttu_flags flags)
5a9179f41b5d5d8 Kaihao Bai  2022-08-15 @1948  {
5a9179f41b5d5d8 Kaihao Bai  2022-08-15  1949  	struct rmap_walk_control rwc = {
5a9179f41b5d5d8 Kaihao Bai  2022-08-15  1950  		.rmap_one = try_to_unmap_one,
5a9179f41b5d5d8 Kaihao Bai  2022-08-15  1951  		.arg = (void *)flags,
5a9179f41b5d5d8 Kaihao Bai  2022-08-15  1952  	};
5a9179f41b5d5d8 Kaihao Bai  2022-08-15  1953  
5a9179f41b5d5d8 Kaihao Bai  2022-08-15  1954  	if (!(flags & TTU_ZEROPAGE))
5a9179f41b5d5d8 Kaihao Bai  2022-08-15  1955  		return;
5a9179f41b5d5d8 Kaihao Bai  2022-08-15  1956  
5a9179f41b5d5d8 Kaihao Bai  2022-08-15  1957  	rmap_walk(folio, &rwc);
5a9179f41b5d5d8 Kaihao Bai  2022-08-15  1958  }
5a9179f41b5d5d8 Kaihao Bai  2022-08-15  1959  

:::::: The code at line 1948 was first introduced by commit
:::::: 5a9179f41b5d5d87f917484399fac6f5c9711654 anolis: mm: support unmapping zeropage of the same file offset

:::::: TO: Kaihao Bai <carlo.bai@linux.alibaba.com>
:::::: CC: winterddd <tianruidong@linux.alibaba.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
