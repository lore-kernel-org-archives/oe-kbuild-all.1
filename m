Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83941D5178
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Jan 2026 22:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767651928; cv=none; b=rgGfKt3zkHqiDDko2RbVfPdmDQB7BwdCd+kbhpq5zFNyFc4zSq46paeHkVYkmLmv83//si8Ouc061z2YE1J5ogky+MBJFLMo9HAIkZ2NDCwZsCj+uHOr14xLJCxFZTQfPyaJ+0q9CokPZj87g0e/T46/KePK8MbmQcZEcTzhZEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767651928; c=relaxed/simple;
	bh=W59mWtKiQaUIxutUw8hmtwpdnRyrHjdHEgpg+KUZ4kU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WhgPiOBJKhdQLmw+TcTMzor6ek79cJegmCzh5QGu8dAs/xk/GPMQs5RcuUdWrA5I2onnclqwLZz+FULxSOXfptiC0IyYoVC7k69J/eF/kZWQ1bK7CUfF2f3kRlKkXBHDuTuAJK20eDcb4griShKs7oQKgCf/7rCO4u4aCTXB1+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ehXrubQ3; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ehXrubQ3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767651927; x=1799187927;
  h=date:from:to:cc:subject:message-id;
  bh=W59mWtKiQaUIxutUw8hmtwpdnRyrHjdHEgpg+KUZ4kU=;
  b=ehXrubQ3sBmdrxxn9Bt8ZcABadGYwkHsAB7IWz90DWDu+HjQBXHOgUMP
   mOe5cdJQvs+bTfCvSJBzf34xT0oxs8p+sOaRDwUnknBCyhjIZw+fYF6YP
   uXcnyPjLgaBxjFtASS4x8+31/gicSvuMhmT/UcWg9xZk7moBRUMCjAej2
   OluR6n5MEZ+S1jpW9LJyWcwlmjZCYVAZpIzaYhLzmx6T811QavH/ks28A
   YJxCaUQCdV2tTuhjvAD9qgc9qgBbkAPssRqTaEWyHYuflpii6uRKg3IGC
   8PkwE8ToHDjqDQ5XRkcIQkRdM2KVqjUHCgcWs4HCqlRHXtxdyimRmXUtU
   Q==;
X-CSE-ConnectionGUID: MW3RPJnVTTalocMhu7cTmw==
X-CSE-MsgGUID: +3Dize0gQTqlNn2YuW0JFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="72882928"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="72882928"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 14:25:26 -0800
X-CSE-ConnectionGUID: vYylKGS0RWqc7wmcbBm1zA==
X-CSE-MsgGUID: 49iycNktSv+/JlPUWmDeVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="202551695"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 05 Jan 2026 14:25:25 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vct0s-000000001XJ-2Fi1;
	Mon, 05 Jan 2026 22:25:22 +0000
Date: Tue, 06 Jan 2026 06:24:41 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 2/2] mm/rmap.c:1948: warning:
 Function parameter or member 'folio' not described in
 'try_to_unmap_zero_folio'
Message-ID: <202601060616.vGMoh3Ev-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Kaihao,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   c0fb027197aee899e12b0f1e3e712b4e4aac28b3
commit: 4601451ef45b862d745f9debf25290dc75e0de9f [2/2] anolis: mm: add switch for file zero page
config: x86_64-anolis-intel-cloud-devel-6.6 (https://download.01.org/0day-ci/archive/20260106/202601060616.vGMoh3Ev-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260106/202601060616.vGMoh3Ev-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601060616.vGMoh3Ev-lkp@intel.com/

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
