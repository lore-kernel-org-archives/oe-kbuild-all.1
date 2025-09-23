Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F2526C3AC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Sep 2025 03:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758599737; cv=none; b=P2p6TF7TSpsWSGFfoVjnO/dAO5aeflNvvQhFNjoy1uo0LobdSC2WcKBw4pQQVhoXfZ38e20J+rkYTOF/r+fOiA+RUThFwNbfWsCYadbMHXvCgjbxyRcwlcHb43ZXlXSD+wPjMEnoLWghERCz0N5mBLICN40xtExN7/+83xozIhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758599737; c=relaxed/simple;
	bh=aFPq79KHjwjxvVmKaE0Jv5Dqoiv9tGPrkqRrEFxCixc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IFssjnYNhmYnG8q+tVfwevBSopFxSdqj6u/xrLt7Hu5qjH8LEvOzEI7+WF/ov6k3FArijOMDGcu7TNPsR7YZPJC/JQ658MkQ8gz+1zmtyzBjiNUwjj/Ak1lWmcoYPwegaA7PO5xhu2Bx8DvbK/qc8Z9NDRVR+gdlWx+9ltQTQmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=POns/eig; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="POns/eig"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758599735; x=1790135735;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aFPq79KHjwjxvVmKaE0Jv5Dqoiv9tGPrkqRrEFxCixc=;
  b=POns/eig8BcNVGqr00s7oYpkivff7/jQQp6VYadZHsCNYalUifN+WVFu
   n+VB8hJcjmBc/MpUNRu7a42GPz8c/gsDs4fZ3hgKgvLMsC1IkZgTWe5lH
   o72u7Pep09RYI03x8VukzEBTz7EvrB7aLFeDD03XXiIdmBM8svKKNqDoG
   nPdYvxhcmCsvWvxQypAw9aUMKZ0ijTrPioM7FX7I39AIpzNjZIm0fxvny
   8Z22VLdgbgT55tH6M3QfptD9EVJRmI/kY1+oVnAhwx0eIA6X7RWHlin7J
   tMpBR+1mgYWGNSo3gHHVpAvkIGJ5QKRUSMxbwRxr+JNkYK2OIBBIHDg4b
   Q==;
X-CSE-ConnectionGUID: XL9r2dqhSpuImS5rXtNt8A==
X-CSE-MsgGUID: Na5bXhGHRsGeUVItpW49Tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64676222"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64676222"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 20:55:33 -0700
X-CSE-ConnectionGUID: OmHAPvlQQum0HFvXApZfHQ==
X-CSE-MsgGUID: NNc70WwYQLiuX1hpqqsXUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,286,1751266800"; 
   d="scan'208";a="213815273"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 22 Sep 2025 20:55:32 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0u7m-0002j7-0f;
	Tue, 23 Sep 2025 03:55:30 +0000
Date: Tue, 23 Sep 2025 11:55:18 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 123/123] mm/rmap.c:1948: warning:
 Function parameter or member 'folio' not described in
 'try_to_unmap_zero_folio'
Message-ID: <202509231102.aFYJxAWJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   9b3db453632000dc689f48634f7e31f84c375e37
commit: 4601451ef45b862d745f9debf25290dc75e0de9f [123/123] anolis: mm: add switch for file zero page
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20250923/202509231102.aFYJxAWJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250923/202509231102.aFYJxAWJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509231102.aFYJxAWJ-lkp@intel.com/

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
