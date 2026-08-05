Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B323AC0E9
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Aug 2026 01:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785895072; cv=none; b=RjYR2NpBdFticI9gjLGgDxHGQ0ThoDVyr7gDZ4a93p5dRKmDQ0Oa/tvwE1HJO9e8YVrTSrEzhpc1nZwZ8FMJj2CVr0b9NubX0bTvhqNvchpgUdbEANaS7Uf8QKoJtp9FFQytCPuoSkF127nBmmlkzXD+vUgcaSzY0XnEMOdX3kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785895072; c=relaxed/simple;
	bh=6ur17QxgySpBUI4K6M3yZnt1GyZadHJcgDgGprc7OGw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Pc/WOub9S+ppgGiJ5JX1+XZj030N1j/i/CTPEvkaYeSvL2X5XuY9LjCmDGNg3FlqRb13IRDcfk0AefSIGTW27r/UYjk68ZWino3MVM0pUjhagIhlx2krPjfGP7xth0Uj3Dt0/5/WjbyU7MS/BtWNM7zzMIoAlrkai2C95YOIQwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iJ1JPvp4; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iJ1JPvp4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785895069; x=1817431069;
  h=date:from:to:cc:subject:message-id;
  bh=6ur17QxgySpBUI4K6M3yZnt1GyZadHJcgDgGprc7OGw=;
  b=iJ1JPvp4ccGRVUYp+THBi3kxY+RkskERVCH4haBVUPs81i9ZUS/e12Zk
   GgXeKNLl0MRiRG3p98xa25br++0AhR/4FnO2GQcTHBoGmFkjZ3eNzQAjd
   fg835x+5ZiQ0ZXxwHQyVQAytM0MI3+uFmzw8rO4W9Krdr3dVdZZ/u+XEE
   kQmtNGxwGOjmSp1yHzvz+k12auh34/cIcQMGGuxubuKOnj54UCvgNoFNT
   XHDfx5Ay06Elqi+5787q0eTzXl7t5dGiHHvkGu7c05Vjjzr0AMEE/6wsE
   OJposQhb9zklXKXUqSd/ItJDQ/WpWJFEoO0LpWIJjSSRix9n2QIVn3o//
   A==;
X-CSE-ConnectionGUID: 2ueRiTD3SuCDap/u3ch61Q==
X-CSE-MsgGUID: GcwUI90BQsyqy6CQu/humw==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="90346483"
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; 
   d="scan'208";a="90346483"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 18:57:49 -0700
X-CSE-ConnectionGUID: 2Dk6eV81QDiHZu5sAvavFg==
X-CSE-MsgGUID: Z4M0h+cYS2iHJODm7RuwAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; 
   d="scan'208";a="259011159"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 04 Aug 2026 18:57:46 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrQt6-000000004JW-0soz;
	Wed, 05 Aug 2026 01:57:44 +0000
Date: Wed, 05 Aug 2026 03:57:29 +0200
From: kernel test robot <lkp@intel.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: mm/memory-failure.c:1841:51: warning: passing argument 1 of
 'folio_test_hugetlb_raw_hwp_unreliable' discards 'const' qualifier from
 pointer target type
Message-ID: <202608050339.xne6JmYC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Matthew-Wilcox-Oracle/hugetlbfs-Set-mapping-folio-order/20260804-172347
head:   6bf87769bcecfb8455f6ece8025ec19bdf1468cb
commit: a2cb2ad150519951a14725d0213ba0b0afe13c71 mm: Handle hugetlb correctly in is_page_hwpoison()
date:   17 hours ago
config: x86_64-rhel-9.4-bpf (https://download.01.org/0day-ci/archive/20260805/202608050339.xne6JmYC-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260805/202608050339.xne6JmYC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608050339.xne6JmYC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/memory-failure.c: In function 'hugetlb_page_hwpoison':
>> mm/memory-failure.c:1841:51: warning: passing argument 1 of 'folio_test_hugetlb_raw_hwp_unreliable' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
    1841 |         if (folio_test_hugetlb_raw_hwp_unreliable(folio))
         |                                                   ^~~~~
   In file included from include/linux/migrate.h:8,
                    from mm/memory-failure.c:52:
   include/linux/hugetlb.h:598:48: note: expected 'struct folio *' but argument is of type 'const struct folio *'
     598 | bool folio_test_hugetlb_##flname(struct folio *folio)           \
         |                                  ~~~~~~~~~~~~~~^~~~~
   include/linux/hugetlb.h:634:9: note: in expansion of macro 'TESTHPAGEFLAG'
     634 |         TESTHPAGEFLAG(uname, flname)                            \
         |         ^~~~~~~~~~~~~
   include/linux/hugetlb.h:646:1: note: in expansion of macro 'HPAGEFLAG'
     646 | HPAGEFLAG(RawHwpUnreliable, raw_hwp_unreliable)
         | ^~~~~~~~~
>> mm/memory-failure.c:1846:42: warning: passing argument 1 of 'raw_hwp_list_head' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
    1846 |         raw_hwp_head = raw_hwp_list_head(folio);
         |                                          ^~~~~
   mm/memory-failure.c:1820:66: note: expected 'struct folio *' but argument is of type 'const struct folio *'
    1820 | static inline struct llist_head *raw_hwp_list_head(struct folio *folio)
         |                                                    ~~~~~~~~~~~~~~^~~~~


vim +1841 mm/memory-failure.c

161df60e9e8965 Naoya Horiguchi         2022-07-14  1824  
a2cb2ad1505199 Matthew Wilcox (Oracle  2026-07-07  1825) /*
a2cb2ad1505199 Matthew Wilcox (Oracle  2026-07-07  1826)  * Check if a given @page in a hugetlb folio is HWPOISON.
a2cb2ad1505199 Matthew Wilcox (Oracle  2026-07-07  1827)  */
a2cb2ad1505199 Matthew Wilcox (Oracle  2026-07-07  1828) bool hugetlb_page_hwpoison(const struct folio *folio, const struct page *page)
b79f8eb408d046 Jiaqi Yan               2023-07-13  1829  {
b79f8eb408d046 Jiaqi Yan               2023-07-13  1830  	struct llist_head *raw_hwp_head;
b79f8eb408d046 Jiaqi Yan               2023-07-13  1831  	struct raw_hwp_page *p;
b79f8eb408d046 Jiaqi Yan               2023-07-13  1832  	bool ret = false;
b79f8eb408d046 Jiaqi Yan               2023-07-13  1833  
b79f8eb408d046 Jiaqi Yan               2023-07-13  1834  	if (!folio_test_hwpoison(folio))
b79f8eb408d046 Jiaqi Yan               2023-07-13  1835  		return false;
b79f8eb408d046 Jiaqi Yan               2023-07-13  1836  
b79f8eb408d046 Jiaqi Yan               2023-07-13  1837  	/*
b79f8eb408d046 Jiaqi Yan               2023-07-13  1838  	 * When RawHwpUnreliable is set, kernel lost track of which subpages
b79f8eb408d046 Jiaqi Yan               2023-07-13  1839  	 * are HWPOISON. So return as if ALL subpages are HWPOISONed.
b79f8eb408d046 Jiaqi Yan               2023-07-13  1840  	 */
b79f8eb408d046 Jiaqi Yan               2023-07-13 @1841  	if (folio_test_hugetlb_raw_hwp_unreliable(folio))
b79f8eb408d046 Jiaqi Yan               2023-07-13  1842  		return true;
b79f8eb408d046 Jiaqi Yan               2023-07-13  1843  
b79f8eb408d046 Jiaqi Yan               2023-07-13  1844  	mutex_lock(&mf_mutex);
b79f8eb408d046 Jiaqi Yan               2023-07-13  1845  
b79f8eb408d046 Jiaqi Yan               2023-07-13 @1846  	raw_hwp_head = raw_hwp_list_head(folio);
b79f8eb408d046 Jiaqi Yan               2023-07-13  1847  	llist_for_each_entry(p, raw_hwp_head->first, node) {
b79f8eb408d046 Jiaqi Yan               2023-07-13  1848  		if (page == p->page) {
b79f8eb408d046 Jiaqi Yan               2023-07-13  1849  			ret = true;
b79f8eb408d046 Jiaqi Yan               2023-07-13  1850  			break;
b79f8eb408d046 Jiaqi Yan               2023-07-13  1851  		}
b79f8eb408d046 Jiaqi Yan               2023-07-13  1852  	}
b79f8eb408d046 Jiaqi Yan               2023-07-13  1853  
b79f8eb408d046 Jiaqi Yan               2023-07-13  1854  	mutex_unlock(&mf_mutex);
b79f8eb408d046 Jiaqi Yan               2023-07-13  1855  
b79f8eb408d046 Jiaqi Yan               2023-07-13  1856  	return ret;
b79f8eb408d046 Jiaqi Yan               2023-07-13  1857  }
b79f8eb408d046 Jiaqi Yan               2023-07-13  1858  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
