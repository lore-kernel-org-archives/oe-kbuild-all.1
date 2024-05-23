Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E1C4C74
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 May 2024 01:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716426994; cv=none; b=HPs1w8kJP8z4NMldVLX7x9fsk6JKypXat3h8eQVOzg1ZkkBanBgQ0szXzeT/975SIKka7scbD3yg3J6G9h8YWfjyn5sX5N9od0APTfwrScAiN23KUqxtXxGOlmXmtIhFy0xOTor/0VKhryDVUGMHQkSDRKWgfVsAisUm83JVqfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716426994; c=relaxed/simple;
	bh=VDYPkoQgEskprRgLEety+3g2cusPueYNu+N/znI2YHM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UygET9f0wXySb/YIyl0JccvmLnI1SaxYQI+kkH3vDS6iDa6PyJOQt27CNALqbVTG1k5Lkvo1r17RA5XeUMj000gdRTZImIENIvFD7tnCa8y1CsPpCRZfcl21ICvJdVHzNZw1QZxD4EUmOWtdvI8kR1wpYSibQn4Q2nDHIz6VVCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X3ci73vK; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X3ci73vK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716426992; x=1747962992;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VDYPkoQgEskprRgLEety+3g2cusPueYNu+N/znI2YHM=;
  b=X3ci73vKlGy35P06I6IJ/3wZtzAt6wMCcAqTyR9mGV7AX5ZjyJP5ntPt
   fl/3voZ25coeln1y5JUuPuK9aOuHQ/sLArp3r2yHN1Sp2f9LvoFsomjNn
   d6A+01r8g2dO7mqbL3jZ4ZRb5mzel1gY221Ov6v2f8qNKoyuzBAX+lHdN
   K8cN7YUjOwk+/YAF2jVtyqcFrYt5eAGkxvuTD/et7jZvLwJswz5A+Frnk
   HmrqHv9sW+Th8nV+usNhbnTgWBIZghofQ5onKdHKqKfr+u/MzMwrjsNME
   UN+2UXkNbjVJiKOyk6nVsOSskAkMJoj7/AF2csOCoqGjGIOTqk+8uhtai
   Q==;
X-CSE-ConnectionGUID: PgOLiOaURfy45uM83D5CCA==
X-CSE-MsgGUID: gAAdjDC0TI29tTctZ44B6Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="12830151"
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; 
   d="scan'208";a="12830151"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 18:16:32 -0700
X-CSE-ConnectionGUID: xiN7LnR7TrKQVIa8lQSrww==
X-CSE-MsgGUID: Z2bvapWPTrymvBbhMo9g8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; 
   d="scan'208";a="33947600"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 22 May 2024 18:16:31 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s9x4G-0002JB-12;
	Thu, 23 May 2024 01:16:28 +0000
Date: Thu, 23 May 2024 09:16:24 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yongqiang Liu <liuyongqiang13@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 19459/22464]
 mm/memory_hotplug.c:1278:30: warning: 'start' may be used uninitialized
Message-ID: <202405230933.fLM0leXg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   80ab23a867e779b7d5f818a57bd578a57143becb
commit: 5f0e34d2aceec67c169be7599d82f0e8519c37f7 [19459/22464] mm/sparsemem: fix 'mem_section' will never be NULL gcc 12 warning
config: x86_64-buildonly-randconfig-003-20240523 (https://download.01.org/0day-ci/archive/20240523/202405230933.fLM0leXg-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240523/202405230933.fLM0leXg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405230933.fLM0leXg-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All warnings (new ones prefixed by >>):

   mm/memory_hotplug.c: In function '__remove_section':
   mm/memory_hotplug.c:481:23: warning: variable 'start_pfn' set but not used [-Wunused-but-set-variable]
     481 |         unsigned long start_pfn;
         |                       ^~~~~~~~~
   mm/memory_hotplug.c: In function 'test_pages_in_a_zone':
>> mm/memory_hotplug.c:1278:30: warning: 'start' may be used uninitialized [-Wmaybe-uninitialized]
    1278 |                 *valid_start = start;
         |                 ~~~~~~~~~~~~~^~~~~~~
   mm/memory_hotplug.c:1245:23: note: 'start' was declared here
    1245 |         unsigned long start, end;
         |                       ^~~~~


vim +/start +1278 mm/memory_hotplug.c

5c755e9fd81381 Badari Pulavarty  2008-07-23  1236  
0c0e6195896535 KAMEZAWA Hiroyuki 2007-10-16  1237  /*
deb88a2a19e858 Toshi Kani        2017-02-03  1238   * Confirm all pages in a range [start, end) belong to the same zone.
a96dfddbcc0433 Toshi Kani        2017-02-03  1239   * When true, return its valid [start, end).
0c0e6195896535 KAMEZAWA Hiroyuki 2007-10-16  1240   */
a96dfddbcc0433 Toshi Kani        2017-02-03  1241  int test_pages_in_a_zone(unsigned long start_pfn, unsigned long end_pfn,
a96dfddbcc0433 Toshi Kani        2017-02-03  1242  			 unsigned long *valid_start, unsigned long *valid_end)
0c0e6195896535 KAMEZAWA Hiroyuki 2007-10-16  1243  {
5f0f2887f4de95 Andrew Banman     2015-12-29  1244  	unsigned long pfn, sec_end_pfn;
a96dfddbcc0433 Toshi Kani        2017-02-03  1245  	unsigned long start, end;
0c0e6195896535 KAMEZAWA Hiroyuki 2007-10-16  1246  	struct zone *zone = NULL;
0c0e6195896535 KAMEZAWA Hiroyuki 2007-10-16  1247  	struct page *page;
0c0e6195896535 KAMEZAWA Hiroyuki 2007-10-16  1248  	int i;
deb88a2a19e858 Toshi Kani        2017-02-03  1249  	for (pfn = start_pfn, sec_end_pfn = SECTION_ALIGN_UP(start_pfn + 1);
0c0e6195896535 KAMEZAWA Hiroyuki 2007-10-16  1250  	     pfn < end_pfn;
deb88a2a19e858 Toshi Kani        2017-02-03  1251  	     pfn = sec_end_pfn, sec_end_pfn += PAGES_PER_SECTION) {
5f0f2887f4de95 Andrew Banman     2015-12-29  1252  		/* Make sure the memory section is present first */
5f0f2887f4de95 Andrew Banman     2015-12-29  1253  		if (!present_section_nr(pfn_to_section_nr(pfn)))
5f0f2887f4de95 Andrew Banman     2015-12-29  1254  			continue;
5f0f2887f4de95 Andrew Banman     2015-12-29  1255  		for (; pfn < sec_end_pfn && pfn < end_pfn;
0c0e6195896535 KAMEZAWA Hiroyuki 2007-10-16  1256  		     pfn += MAX_ORDER_NR_PAGES) {
0c0e6195896535 KAMEZAWA Hiroyuki 2007-10-16  1257  			i = 0;
0c0e6195896535 KAMEZAWA Hiroyuki 2007-10-16  1258  			/* This is just a CONFIG_HOLES_IN_ZONE check.*/
5f0f2887f4de95 Andrew Banman     2015-12-29  1259  			while ((i < MAX_ORDER_NR_PAGES) &&
5f0f2887f4de95 Andrew Banman     2015-12-29  1260  				!pfn_valid_within(pfn + i))
0c0e6195896535 KAMEZAWA Hiroyuki 2007-10-16  1261  				i++;
d6d8c8a48291b9 zhong jiang       2017-02-24  1262  			if (i == MAX_ORDER_NR_PAGES || pfn + i >= end_pfn)
0c0e6195896535 KAMEZAWA Hiroyuki 2007-10-16  1263  				continue;
65e9b09942c6df Mikhail Zaslonko  2019-02-13  1264  			/* Check if we got outside of the zone */
65e9b09942c6df Mikhail Zaslonko  2019-02-13  1265  			if (zone && !zone_spans_pfn(zone, pfn + i))
65e9b09942c6df Mikhail Zaslonko  2019-02-13  1266  				return 0;
0c0e6195896535 KAMEZAWA Hiroyuki 2007-10-16  1267  			page = pfn_to_page(pfn + i);
0c0e6195896535 KAMEZAWA Hiroyuki 2007-10-16  1268  			if (zone && page_zone(page) != zone)
0c0e6195896535 KAMEZAWA Hiroyuki 2007-10-16  1269  				return 0;
a96dfddbcc0433 Toshi Kani        2017-02-03  1270  			if (!zone)
a96dfddbcc0433 Toshi Kani        2017-02-03  1271  				start = pfn + i;
0c0e6195896535 KAMEZAWA Hiroyuki 2007-10-16  1272  			zone = page_zone(page);
a96dfddbcc0433 Toshi Kani        2017-02-03  1273  			end = pfn + MAX_ORDER_NR_PAGES;
0c0e6195896535 KAMEZAWA Hiroyuki 2007-10-16  1274  		}
5f0f2887f4de95 Andrew Banman     2015-12-29  1275  	}
deb88a2a19e858 Toshi Kani        2017-02-03  1276  
a96dfddbcc0433 Toshi Kani        2017-02-03  1277  	if (zone) {
a96dfddbcc0433 Toshi Kani        2017-02-03 @1278  		*valid_start = start;
d6d8c8a48291b9 zhong jiang       2017-02-24  1279  		*valid_end = min(end, end_pfn);
0c0e6195896535 KAMEZAWA Hiroyuki 2007-10-16  1280  		return 1;
a96dfddbcc0433 Toshi Kani        2017-02-03  1281  	} else {
deb88a2a19e858 Toshi Kani        2017-02-03  1282  		return 0;
0c0e6195896535 KAMEZAWA Hiroyuki 2007-10-16  1283  	}
a96dfddbcc0433 Toshi Kani        2017-02-03  1284  }
0c0e6195896535 KAMEZAWA Hiroyuki 2007-10-16  1285  

:::::: The code at line 1278 was first introduced by commit
:::::: a96dfddbcc04336bbed50dc2b24823e45e09e80c base/memory, hotplug: fix a kernel oops in show_valid_zones()

:::::: TO: Toshi Kani <toshi.kani@hpe.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
