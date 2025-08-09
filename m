Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D9E1DA3D
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Aug 2025 05:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754715782; cv=none; b=b6rZh4KShfHOhTFzUos7TCNGyoTkA9Ea4fbM2dCf/yQf6dEp5n2dalNNkitBb0BHwHXucmPNi7WmyfTXb2ZE8UINc6R7yitWaSyDQcaLUdXkLvgMBM9N+U5j8FpTWDebTA9KF936Lo3wPG7QO3geDlsAuSAjH3tJcUgUPvS/Fmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754715782; c=relaxed/simple;
	bh=xlOcPAuQ0+8dR9jEcWfDDlqnRLOJQVS4XRrIzTheuiI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hUlkHrQiYD9SBqu7KDMT9U4BlW5lnhnboztHr4oItb65tJkf8zdtPSCQyeNR8LjqYiD6YMLbenaKI3QL4YYJ7AktvkR4+7xFzjX69HqaGACsG7RB+s0OB2tvwfNAy5qlZfjZuf8UFOFhU/7ypRPDLIb0vzVq9SdR1KMu3YBrqKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BOP7dqkc; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BOP7dqkc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754715781; x=1786251781;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xlOcPAuQ0+8dR9jEcWfDDlqnRLOJQVS4XRrIzTheuiI=;
  b=BOP7dqkcRamPJ6nZRoKHWgsjZD0Do+pBJzG8Wd3+w2aqGBZ27Te5ufZP
   2Igh5klaiH5Tg3mgVWUpsyood6MqdSCbncTs/ffqbiQeuo0EcLFVBe3Lg
   jDx+UQD1SBvvLoGqJEgEyY1FlgJMmrulHPQe2JkoZQ/T1qZf8A6sqPEHG
   RgZReLQ412HCSpRl7H4KfoOL7G5YRqfNtzvN1D/K2oKSZ/JiePu4NxzvU
   k/3l9BrqLfTNTXwc1/FxPZEQA22eEAveyjuQcif2V+vONJ+u22ZNw5Y+g
   VSAA8iCKVMEuL9HjGSkkGxwPKkFkm0n1oz5mNOrWKo+G1OcuhmrJ+mw4F
   A==;
X-CSE-ConnectionGUID: 7DYh17xWS3eebP5FPa19Wg==
X-CSE-MsgGUID: H5vjc1udRNqv4uQniD5Q3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="68139692"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="68139692"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2025 22:03:01 -0700
X-CSE-ConnectionGUID: DiwJ9uyJRvWyU5rkNUCW3w==
X-CSE-MsgGUID: iuMQOAniTpWurwLBqI0Z9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="189179200"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 08 Aug 2025 22:02:59 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukbiH-0004Wq-0N;
	Sat, 09 Aug 2025 05:02:06 +0000
Date: Sat, 9 Aug 2025 13:01:10 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:nth_page 6/13] mm/hugetlb.c:3239:13: warning:
 unused variable 'nid'
Message-ID: <202508091217.rgyNDt6Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux nth_page
head:   0058c4860f2af0228513afaef99b542e793cb94b
commit: b33d11a2b10a7ea8d8000ab2aa597bf21a1dd6cc [6/13] mm/hugetlb:
config: sh-defconfig (https://download.01.org/0day-ci/archive/20250809/202508091217.rgyNDt6Y-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250809/202508091217.rgyNDt6Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508091217.rgyNDt6Y-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/hugetlb.c: In function 'hugetlb_folio_init_tail_vmemmap':
>> mm/hugetlb.c:3239:13: warning: unused variable 'nid' [-Wunused-variable]
    3239 |         int nid = folio_nid(folio);
         |             ^~~
>> mm/hugetlb.c:3238:24: warning: unused variable 'zone' [-Wunused-variable]
    3238 |         enum zone_type zone = zone_idx(folio_zone(folio));
         |                        ^~~~


vim +/nid +3239 mm/hugetlb.c

aa888a74977a8f Andi Kleen        2008-07-23  3232  
fde1c4ecf91640 Usama Arif        2023-09-13  3233  /* Initialize [start_page:end_page_number] tail struct pages of a hugepage */
fde1c4ecf91640 Usama Arif        2023-09-13  3234  static void __init hugetlb_folio_init_tail_vmemmap(struct folio *folio,
fde1c4ecf91640 Usama Arif        2023-09-13  3235  					unsigned long start_page_number,
fde1c4ecf91640 Usama Arif        2023-09-13  3236  					unsigned long end_page_number)
fde1c4ecf91640 Usama Arif        2023-09-13  3237  {
fde1c4ecf91640 Usama Arif        2023-09-13 @3238  	enum zone_type zone = zone_idx(folio_zone(folio));
fde1c4ecf91640 Usama Arif        2023-09-13 @3239  	int nid = folio_nid(folio);
fde1c4ecf91640 Usama Arif        2023-09-13  3240  	unsigned long head_pfn = folio_pfn(folio);
fde1c4ecf91640 Usama Arif        2023-09-13  3241  	unsigned long pfn, end_pfn = head_pfn + end_page_number;
fde1c4ecf91640 Usama Arif        2023-09-13  3242  	int ret;
fde1c4ecf91640 Usama Arif        2023-09-13  3243  
fde1c4ecf91640 Usama Arif        2023-09-13  3244  	for (pfn = head_pfn + start_page_number; pfn < end_pfn; pfn++) {
fde1c4ecf91640 Usama Arif        2023-09-13  3245  		struct page *page = pfn_to_page(pfn);
fde1c4ecf91640 Usama Arif        2023-09-13  3246  
b33d11a2b10a7e David Hildenbrand 2025-08-07  3247  		__ClearPageReserved(page);
fde1c4ecf91640 Usama Arif        2023-09-13  3248  		prep_compound_tail((struct page *)folio, pfn - head_pfn);
fde1c4ecf91640 Usama Arif        2023-09-13  3249  		ret = page_ref_freeze(page, 1);
fde1c4ecf91640 Usama Arif        2023-09-13  3250  		VM_BUG_ON(!ret);
fde1c4ecf91640 Usama Arif        2023-09-13  3251  	}
fde1c4ecf91640 Usama Arif        2023-09-13  3252  }
fde1c4ecf91640 Usama Arif        2023-09-13  3253  

:::::: The code at line 3239 was first introduced by commit
:::::: fde1c4ecf91640e5a95ec36b71ec2e8ec379ce40 mm: hugetlb: skip initialization of gigantic tail struct pages if freed by HVO

:::::: TO: Usama Arif <usama.arif@bytedance.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
