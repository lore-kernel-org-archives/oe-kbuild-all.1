Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F7D2E64A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Feb 2025 14:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739715619; cv=none; b=d1ERrGg41nNMFvYAfWU5oonr9yYxPN4Nex0AqVcbfraYoh1dWKYGqrSPjUNJ8Zjf4Zq8Pmn8wEHkf/ESsVcIRmy6jX8o4fim1EXlldjThTZYUCI9N+SJmW1+up2ctc6dvJDMHm/M4M207vVj56Jhc0ULAwd7iYecvIb9+Ugk3Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739715619; c=relaxed/simple;
	bh=IzBH/SwGX2xUtkUXrpBUwuISKNIZnbGT434jzqsY2A0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dHCQMEh+3DHpGpYpMINwyq/cSb61nHe3SLxcuZePTqLuV5jmo0fCN89UkqgtF7r8HPq3xbQTuerdObiReLM0PZniqRJiUiPJR64Nv7whi5cTPfeuGpZ6ScoK6V0m4bOgEuXwxAglLfwZ4mWH3cywlvJQDTSjCiGICY/Ey0zN59o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MX501sif; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MX501sif"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739715618; x=1771251618;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IzBH/SwGX2xUtkUXrpBUwuISKNIZnbGT434jzqsY2A0=;
  b=MX501sif+tCaAVn3Uo2LQ1ZDtlPZYPCWbEIfCvyPf1M2J3pLIxgQgl6F
   xFGrr+G7hMsw5WwNSTwnxKbZE+xVpQWgfAHmTLiTZFdANk/pdbNrM96o/
   9eIr0UlkjHJG8Db24qxwgUUddeBH0v5tk+ogMSgRjmqr/G7r4OPAi+Bce
   p9kZpZ/l8nguwADhm+oxCU+GLtCFdQrjg2LYeCL3qrUCVMM71gMbbtTWq
   2DsqgPdHOMn7hbvcNMRmCcoJPGRbQh4XNvoi6da3bEjufF2RlqRDr+7Yv
   WON8lEPDcQBxyN5wGOiRynGHkwvoEj/oP9j8BTkPh1mFRlkworfKwvmJn
   w==;
X-CSE-ConnectionGUID: pcL4r4QATfyBVZLIPQXOtg==
X-CSE-MsgGUID: 5o08SKKqQ6es0j6KhuwvJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="43242155"
X-IronPort-AV: E=Sophos;i="6.13,291,1732608000"; 
   d="scan'208";a="43242155"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2025 06:20:17 -0800
X-CSE-ConnectionGUID: 3tFgAREIT1yhzuUdXjEA6Q==
X-CSE-MsgGUID: SeIvs0UVTm+FogwR0ER7uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,291,1732608000"; 
   d="scan'208";a="118914487"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 16 Feb 2025 06:20:16 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjfVF-001BzD-2E;
	Sun, 16 Feb 2025 14:20:13 +0000
Date: Sun, 16 Feb 2025 22:19:23 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:mm_id_6.14 5/13] mm/page_alloc.c:976:20: warning:
 this statement may fall through
Message-ID: <202502162207.5aJRjcne-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux mm_id_6.14
head:   dcbc194183fd7526f260cc629aabff9d3300083e
commit: c599962b8dd50874ba583ccb6eb6cd9d2e973d45 [5/13] mm: move hugetlb specific things in folio to page[3]
config: riscv-randconfig-002-20250216 (https://download.01.org/0day-ci/archive/20250216/202502162207.5aJRjcne-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250216/202502162207.5aJRjcne-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502162207.5aJRjcne-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/page_alloc.c: In function 'free_tail_page_prepare':
>> mm/page_alloc.c:976:20: warning: this statement may fall through [-Wimplicit-fallthrough=]
     976 |                 if (IS_ENABLED(CONFIG_HUGETLB_PAGE))
         |                    ^
   mm/page_alloc.c:978:9: note: here
     978 |         default:
         |         ^~~~~~~


vim +976 mm/page_alloc.c

   931	
   932	static int free_tail_page_prepare(struct page *head_page, struct page *page)
   933	{
   934		struct folio *folio = (struct folio *)head_page;
   935		int ret = 1;
   936	
   937		/*
   938		 * We rely page->lru.next never has bit 0 set, unless the page
   939		 * is PageTail(). Let's make sure that's true even for poisoned ->lru.
   940		 */
   941		BUILD_BUG_ON((unsigned long)LIST_POISON1 & 1);
   942	
   943		if (!is_check_pages_enabled()) {
   944			ret = 0;
   945			goto out;
   946		}
   947		switch (page - head_page) {
   948		case 1:
   949			/* the first tail page: these may be in place of ->mapping */
   950			if (unlikely(folio_entire_mapcount(folio))) {
   951				bad_page(page, "nonzero entire_mapcount");
   952				goto out;
   953			}
   954			if (unlikely(folio_large_mapcount(folio))) {
   955				bad_page(page, "nonzero large_mapcount");
   956				goto out;
   957			}
   958			if (unlikely(atomic_read(&folio->_nr_pages_mapped))) {
   959				bad_page(page, "nonzero nr_pages_mapped");
   960				goto out;
   961			}
   962			if (unlikely(atomic_read(&folio->_pincount))) {
   963				bad_page(page, "nonzero pincount");
   964				goto out;
   965			}
   966			break;
   967		case 2:
   968			/* the second tail page: deferred_list overlaps ->mapping */
   969			if (unlikely(!list_empty(&folio->_deferred_list))) {
   970				bad_page(page, "on deferred list");
   971				goto out;
   972			}
   973			break;
   974		case 3:
   975			/* the third tail page: hugetlb specifics overlaps ->mappings */
 > 976			if (IS_ENABLED(CONFIG_HUGETLB_PAGE))
   977				break;
   978		default:
   979			if (page->mapping != TAIL_MAPPING) {
   980				bad_page(page, "corrupted mapping in tail page");
   981				goto out;
   982			}
   983			break;
   984		}
   985		if (unlikely(!PageTail(page))) {
   986			bad_page(page, "PageTail not set");
   987			goto out;
   988		}
   989		if (unlikely(compound_head(page) != head_page)) {
   990			bad_page(page, "compound_head not consistent");
   991			goto out;
   992		}
   993		ret = 0;
   994	out:
   995		page->mapping = NULL;
   996		clear_compound_head(page);
   997		return ret;
   998	}
   999	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
