Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77BB522A1D5
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Dec 2025 03:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764644762; cv=none; b=GyGjSaQRBO4UOF53XIT1bds53xYBKx0qGuwjsvexY8NbC7PSXBZuhtuAOFcMRWka5S+B5DknQzVaPxJX1DZR/28OCNca/1FyVZpq4Jg9Gan5bBVyqr4cRbZp8XxgcMXH8Ue/H4s5l5YgLWQhpgy8jbFeBNwyCFG6QaZ2YhACgT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764644762; c=relaxed/simple;
	bh=t3hFmhnhG0luxgBHVVDSHtZK5ppauNaDbQ7CVKIChMM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lxlQ0xDztp9O1LjY5awj60o+JwLMLxohDsx0a4W9QGJrdBbAFjM4ZTwfwosnyQ+SrupW0IDVB8uYOuyTZR+HUT8nIhCNz45pBD5SHTk+E5t7qiaQehuZXwVCMXE7JHcC2b6S7bgdkeKXUAQUIGQhfZSo1C1gqWRwA640atQSPCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YKisK3AG; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YKisK3AG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764644761; x=1796180761;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t3hFmhnhG0luxgBHVVDSHtZK5ppauNaDbQ7CVKIChMM=;
  b=YKisK3AGMAMt32qfX1hVIVjj71UJgfYyH4EZCI+KWwLqykXccmjJCDwI
   UWMvYrFQomcynLUPTGkyDSkUTXuOkWcvToVFjjZadu5ZlmEZ6rP10OJz4
   m9X4bYGyoBefyNgcoh+P2bfTctOQHHaI0s2ih3Dh1Z/5BS6PuTveCMGhN
   u3O3SrnjCgZn5UWHod2ApawkoFV3oxkhk3tZy0pUywA7PGSKhV0iFlSco
   GxH2UlBzToKE+JDT8NpTpVVG0zo5NOBHbdHQ2jcRt05in5Rrn9zoY6sg0
   Wu/IakHaXTeJsZGnRayF9nSGsiSXByuabJm3WZOZr4StKPIWYSv3TASmL
   A==;
X-CSE-ConnectionGUID: h7EoQvHnQC+ZnbY/f9MWdw==
X-CSE-MsgGUID: JQ0E+tYFRZen0WFWiaKeXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="89249733"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="89249733"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 19:05:54 -0800
X-CSE-ConnectionGUID: CCza0ibuSKqIjUhiPtJgQw==
X-CSE-MsgGUID: pEkVZ/7WQMusjzwsUXQXVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="198453102"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 01 Dec 2025 19:05:52 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQGi6-000000009MP-1Tt2;
	Tue, 02 Dec 2025 03:05:50 +0000
Date: Tue, 2 Dec 2025 11:04:51 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 1/1] mm/rmap.c:1948: warning: Function
 parameter or member 'folio' not described in 'try_to_unmap_zero_folio'
Message-ID: <202512021011.RuA0E9Vv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kaihao,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   f8b46025836b24add69b8d09beae8fd836ae26e3
commit: 4601451ef45b862d745f9debf25290dc75e0de9f [1/1] anolis: mm: add switch for file zero page
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20251202/202512021011.RuA0E9Vv-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512021011.RuA0E9Vv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512021011.RuA0E9Vv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/rmap.c:1948: warning: Function parameter or member 'folio' not described in 'try_to_unmap_zero_folio'
>> mm/rmap.c:1948: warning: expecting prototype for try_to_unmap_zeropage(). Prototype was for try_to_unmap_zero_folio() instead


vim +1948 mm/rmap.c

52629506420ce3 Joonsoo Kim 2014-01-21  1933  
5a9179f41b5d5d Kaihao Bai  2022-08-15  1934  /**
5a9179f41b5d5d Kaihao Bai  2022-08-15  1935   * try_to_unmap_zeropage - try to remove all page table mappings to a zero page
5a9179f41b5d5d Kaihao Bai  2022-08-15  1936   * with the same offset. If the flag doesn't contain TTU_ZEROPAGE, this function
5a9179f41b5d5d Kaihao Bai  2022-08-15  1937   * does no thing.
5a9179f41b5d5d Kaihao Bai  2022-08-15  1938   * @page: the page to get unmapped
5a9179f41b5d5d Kaihao Bai  2022-08-15  1939   * @flags: action and flags
5a9179f41b5d5d Kaihao Bai  2022-08-15  1940   *
5a9179f41b5d5d Kaihao Bai  2022-08-15  1941   * Tries to remove all the page table entries which are mapping zero
5a9179f41b5d5d Kaihao Bai  2022-08-15  1942   * page with the same offset, used in the pageout path.  Caller must hold the page
5a9179f41b5d5d Kaihao Bai  2022-08-15  1943   * lock of the newly allocated page.
5a9179f41b5d5d Kaihao Bai  2022-08-15  1944   *
5a9179f41b5d5d Kaihao Bai  2022-08-15  1945   * During rmap_walk, it holds the i_mmap_sem to avoid modify VMA which not expected.
5a9179f41b5d5d Kaihao Bai  2022-08-15  1946   */
4601451ef45b86 Kaihao Bai  2022-08-29  1947  void try_to_unmap_zero_folio(struct folio *folio, enum ttu_flags flags)
5a9179f41b5d5d Kaihao Bai  2022-08-15 @1948  {
5a9179f41b5d5d Kaihao Bai  2022-08-15  1949  	struct rmap_walk_control rwc = {
5a9179f41b5d5d Kaihao Bai  2022-08-15  1950  		.rmap_one = try_to_unmap_one,
5a9179f41b5d5d Kaihao Bai  2022-08-15  1951  		.arg = (void *)flags,
5a9179f41b5d5d Kaihao Bai  2022-08-15  1952  	};
5a9179f41b5d5d Kaihao Bai  2022-08-15  1953  
5a9179f41b5d5d Kaihao Bai  2022-08-15  1954  	if (!(flags & TTU_ZEROPAGE))
5a9179f41b5d5d Kaihao Bai  2022-08-15  1955  		return;
5a9179f41b5d5d Kaihao Bai  2022-08-15  1956  
5a9179f41b5d5d Kaihao Bai  2022-08-15  1957  	rmap_walk(folio, &rwc);
5a9179f41b5d5d Kaihao Bai  2022-08-15  1958  }
5a9179f41b5d5d Kaihao Bai  2022-08-15  1959  

:::::: The code at line 1948 was first introduced by commit
:::::: 5a9179f41b5d5d87f917484399fac6f5c9711654 anolis: mm: support unmapping zeropage of the same file offset

:::::: TO: Kaihao Bai <carlo.bai@linux.alibaba.com>
:::::: CC: winterddd <tianruidong@linux.alibaba.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
