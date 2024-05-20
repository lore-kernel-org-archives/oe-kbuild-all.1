Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E772F23
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 May 2024 01:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716170341; cv=none; b=mfFFIs23qPneABMGwVI6lnUJNl+9zbLHdA920Q0S7W/4o2lQOjSQuo3wQ0th39FpNjn0BGmm2wGMoTYxdCNa55QwpsyxV2+SeaIDBtQxH+D8Xw45q0+BcVD3/Thbw3GbRMSlkBvbhCTzxbGDtUQRG2u4pzJEY7M72K/3XWDMmlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716170341; c=relaxed/simple;
	bh=1HT6w+bXuFUpPHwgvLsX+YE5uQJTwTFle+zIZps7Uxc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mj56aipd3npJ3zlnH3HzhpTHEXPXVn/UV6Bm3V5eSXQnvIPuKvNpbYIL5N4xj3Hjijp2n7FB1GjkZJ7OMGx+OMnPy2GMvTSG5wOFcAXV3ZkP43Aqi+vGXxJTGyB/a7GRYxr1OhuDMQc6hhucPyps/A7uz2USDUcx+mtk2M+5yaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CequzHFq; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CequzHFq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716170341; x=1747706341;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1HT6w+bXuFUpPHwgvLsX+YE5uQJTwTFle+zIZps7Uxc=;
  b=CequzHFqRq/62yu+o5t7JNtK5W+B03q+nDzXa2UjQIE1ZWhdc6H9m63D
   +yor3u9RdeI8MRleiiiVa/H+kOwf0PW7vkZqb1TMSFr0B2W/rDg4V1QGl
   7KBxK6z/pdA697qT+7BuM0m+fqcpO+SVdNQ1VGirY++ofbDsgiWzrR22l
   KQ/VVNyN6LHrcJpcW6lX4Tt3wwZq4ROAZAo3SY+BRI/jZWKcm3D+icGVF
   p+/Ps/BdsfylgOrAAIxVHlZ75ihkaOUV7LxK/wmFmOzY+DWLe/MwfZdsv
   DK+wSUf2FwjBgTtTtTkkbROwDLak2oGRa0+fJMQ4xLSEL5MJ2VvcCdrNa
   A==;
X-CSE-ConnectionGUID: lZJUUGaNQOOwW7ZL3HLPcA==
X-CSE-MsgGUID: q8MLsjHDSJW+GUX+2esvXA==
X-IronPort-AV: E=McAfee;i="6600,9927,11077"; a="16068870"
X-IronPort-AV: E=Sophos;i="6.08,174,1712646000"; 
   d="scan'208";a="16068870"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2024 18:59:00 -0700
X-CSE-ConnectionGUID: jJSI69i3QlKbj4wKkSxCEw==
X-CSE-MsgGUID: r0bTJ4HqRLyBGRD9qkqdfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,174,1712646000"; 
   d="scan'208";a="32799724"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 19 May 2024 18:58:59 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s8sIQ-0004R8-0i;
	Mon, 20 May 2024 01:58:44 +0000
Date: Mon, 20 May 2024 09:57:50 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:page_mapcount 3/9] fs/proc/internal.h:172:29:
 error: implicit declaration of function 'folio_entire_mapcount'
Message-ID: <202405200939.shuq8ZAH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux page_mapcount
head:   1171bcc67b5d6372f0ebb9a4f6d6a51aa9654090
commit: 1cab4fe6abdd27c1736a35914765ef6358fa45ce [3/9] fs/proc: move page_mapcount() to fs/proc/internal.h
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20240520/202405200939.shuq8ZAH-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240520/202405200939.shuq8ZAH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405200939.shuq8ZAH-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/proc/proc_tty.c:16:
   fs/proc/internal.h: In function 'folio_precise_page_mapcount':
>> fs/proc/internal.h:172:29: error: implicit declaration of function 'folio_entire_mapcount' [-Werror=implicit-function-declaration]
     172 |                 mapcount += folio_entire_mapcount(folio);
         |                             ^~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/folio_entire_mapcount +172 fs/proc/internal.h

   144	
   145	/**
   146	 * folio_precise_page_mapcount() - Number of mappings of this folio page.
   147	 * @folio: The folio.
   148	 * @page: The page.
   149	 *
   150	 * The number of present user page tables that reference this page as tracked
   151	 * via the RMAP: either referenced directly (PTE) or as part of a larger
   152	 * area that covers this page (e.g., PMD).
   153	 *
   154	 * Use this function only for the calculation of existing statistics
   155	 * (USS, PSS, mapcount_max) and for debugging purposes (/proc/kpagecount).
   156	 *
   157	 * Do not add new users.
   158	 *
   159	 * Returns: The number of mappings of this folio page. 0 for
   160	 * folios that are not mapped to user space or are not tracked via the RMAP
   161	 * (e.g., shared zeropage).
   162	 */
   163	static inline int folio_precise_page_mapcount(struct folio *folio,
   164			struct page *page)
   165	{
   166		int mapcount = atomic_read(&page->_mapcount) + 1;
   167	
   168		/* Handle page_has_type() pages */
   169		if (mapcount < PAGE_MAPCOUNT_RESERVE + 1)
   170			mapcount = 0;
   171		if (folio_test_large(folio))
 > 172			mapcount += folio_entire_mapcount(folio);
   173	
   174		return mapcount;
   175	}
   176	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
