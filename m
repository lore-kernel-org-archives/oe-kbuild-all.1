Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED879363C6B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 May 2026 04:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779338446; cv=none; b=gZ0EJAB7ZaZuJ1XzBmtmHsUWtB2e7q/mo9xQka6cAXe+tiic4g/9iGhU37sWMXwX4t2HmuuDLDgnMHy5f3E8YniAoniBc1UXtMPbM8NmuE4lzJIGh+JmTb3/ov20L/JmAjsRuVv4XyEzUbenD9t9F3TUF+uk0kTMuEUC/8MaPbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779338446; c=relaxed/simple;
	bh=qE3mCpA95Ff6cgD034AYM5aLwmUhfeXNisweHJU/JLc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NSYVZHvVYO41nPAxc6udhBBMJBHWDqaLCeX74+uoHADTn4md8+ijkd/lLcBsR3uIvlynBgcxs2aSFePTPyoUajgyhFLLPQpuFHnRrn0LHkh/b5UUoD7FbE3fsSzWLe2Jb9UDn5wIaKH/xo6H/AvPL+6mMS1lzPjmbIB4ST3B3p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lYcWlHDI; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lYcWlHDI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779338444; x=1810874444;
  h=date:from:to:cc:subject:message-id;
  bh=qE3mCpA95Ff6cgD034AYM5aLwmUhfeXNisweHJU/JLc=;
  b=lYcWlHDIe/+njUE/tRcikD5E8FS+LOKYqp7rBfiGjZ6JZEi/EWolYCD9
   asQtqFaXpmpVu1O8zamsBfSTwihSEto3mNqkGlP9XYGgcfuAc5w6yat7V
   olMo1eHAFLZBtK/n8DREFlEIdas3SOyT45c0qgNPdIng4HVJaH0vnL4Qg
   IYkc1/SFEJznqgzeVasEamETG5LBW4udDba6M5sBObcYkYNCCuqMiXg5B
   itfxfyt7mrQa1p3U5yyRvNc0pBbMZ2NlAdezCDY72aElMdNGAbH8WpsKZ
   SzesRsQfnaNisVG+VY0wDK5xN1oKZ63rzCL7VV2SWTuvkE2A+xpEmcs6n
   w==;
X-CSE-ConnectionGUID: /Xs7Rts2SgqsvPc4WVUdEQ==
X-CSE-MsgGUID: nXL5NpUKQiC/d3V6/UG6YA==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="90943645"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="90943645"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 21:40:44 -0700
X-CSE-ConnectionGUID: 8ZgUwynZTA2gyHzKz7R6AQ==
X-CSE-MsgGUID: 47mvLoSVTBaLEitxIolfgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="239406900"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 20 May 2026 21:40:42 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPvD4-000000004PJ-3G2P;
	Thu, 21 May 2026 04:40:38 +0000
Date: Thu, 21 May 2026 12:40:16 +0800
From: kernel test robot <lkp@intel.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Amir Goldstein <amir73il@gmail.com>, Christoph Hellwig <hch@lst.de>
Subject: fs/ntfs/runlist.c:1953:47-52: WARNING: conversion to bool
 not needed here
Message-ID: <202605211248.DSL7pell-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Namjae,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8bc67e4db64aa72732c474b44ea8622062c903f0
commit: 47503f989736d6c4c9f8bfca1c28d267473ccd4b ntfs: add Kconfig and Makefile
date:   3 months ago
config: um-randconfig-r063-20260521 (https://download.01.org/0day-ci/archive/20260521/202605211248.DSL7pell-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 47503f989736 ("ntfs: add Kconfig and Makefile")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605211248.DSL7pell-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/ntfs/runlist.c:1953:47-52: WARNING: conversion to bool not needed here
   fs/ntfs/runlist.c:1961:62-67: WARNING: conversion to bool not needed here
   fs/ntfs/runlist.c:1964:65-70: WARNING: conversion to bool not needed here
   fs/ntfs/runlist.c:1802:47-52: WARNING: conversion to bool not needed here
   fs/ntfs/runlist.c:1810:62-67: WARNING: conversion to bool not needed here
   fs/ntfs/runlist.c:1813:65-70: WARNING: conversion to bool not needed here
--
>> fs/ntfs/logfile.c:626:2-8: WARNING: NULL check before some freeing functions is not needed.
--
>> fs/ntfs/super.c:2519:2-8: WARNING: NULL check before some freeing functions is not needed.
   fs/ntfs/super.c:1731:2-8: WARNING: NULL check before some freeing functions is not needed.

vim +1953 fs/ntfs/runlist.c

11ccc9107dc460 Namjae Jeon 2026-02-13  1928  
11ccc9107dc460 Namjae Jeon 2026-02-13  1929  struct runlist_element *ntfs_rl_collapse_range(struct runlist_element *dst_rl, int dst_cnt,
11ccc9107dc460 Namjae Jeon 2026-02-13  1930  					s64 start_vcn, s64 len,
11ccc9107dc460 Namjae Jeon 2026-02-13  1931  					struct runlist_element **punch_rl,
11ccc9107dc460 Namjae Jeon 2026-02-13  1932  					size_t *new_rl_cnt)
11ccc9107dc460 Namjae Jeon 2026-02-13  1933  {
11ccc9107dc460 Namjae Jeon 2026-02-13  1934  	struct runlist_element *s_rl, *e_rl, *new_rl, *dst_3rd_rl;
11ccc9107dc460 Namjae Jeon 2026-02-13  1935  	s64 end_vcn;
11ccc9107dc460 Namjae Jeon 2026-02-13  1936  	int new_1st_cnt, dst_3rd_cnt, new_cnt, punch_cnt, merge_cnt, i;
11ccc9107dc460 Namjae Jeon 2026-02-13  1937  	bool begin_split, end_split, one_split_3;
11ccc9107dc460 Namjae Jeon 2026-02-13  1938  
11ccc9107dc460 Namjae Jeon 2026-02-13  1939  	if (dst_cnt < 2 ||
11ccc9107dc460 Namjae Jeon 2026-02-13  1940  	    !(dst_rl[dst_cnt - 1].lcn == LCN_ENOENT &&
11ccc9107dc460 Namjae Jeon 2026-02-13  1941  	      dst_rl[dst_cnt - 1].length == 0))
11ccc9107dc460 Namjae Jeon 2026-02-13  1942  		return ERR_PTR(-EINVAL);
11ccc9107dc460 Namjae Jeon 2026-02-13  1943  
11ccc9107dc460 Namjae Jeon 2026-02-13  1944  	end_vcn = min(start_vcn + len - 1,
11ccc9107dc460 Namjae Jeon 2026-02-13  1945  			dst_rl[dst_cnt - 1].vcn - 1);
11ccc9107dc460 Namjae Jeon 2026-02-13  1946  
11ccc9107dc460 Namjae Jeon 2026-02-13  1947  	s_rl = ntfs_rl_find_vcn_nolock(dst_rl, start_vcn);
11ccc9107dc460 Namjae Jeon 2026-02-13  1948  	if (!s_rl ||
11ccc9107dc460 Namjae Jeon 2026-02-13  1949  	    s_rl->lcn <= LCN_ENOENT ||
11ccc9107dc460 Namjae Jeon 2026-02-13  1950  	    !ntfs_rle_contain(s_rl, start_vcn))
11ccc9107dc460 Namjae Jeon 2026-02-13  1951  		return ERR_PTR(-EINVAL);
11ccc9107dc460 Namjae Jeon 2026-02-13  1952  
11ccc9107dc460 Namjae Jeon 2026-02-13 @1953  	begin_split = s_rl->vcn != start_vcn ? true : false;

:::::: The code at line 1953 was first introduced by commit
:::::: 11ccc9107dc460de28af90fac1f42404d9802735 ntfs: update runlist handling and cluster allocator

:::::: TO: Namjae Jeon <linkinjeon@kernel.org>
:::::: CC: Namjae Jeon <linkinjeon@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
