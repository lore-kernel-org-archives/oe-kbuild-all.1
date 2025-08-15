Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B85F1EBA14
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Aug 2025 09:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755251265; cv=none; b=QQU2PSACMQN2aP2GqrDPrVK0htfx+1Xi+4TiunSBC5ZkZiBOwn0ccjANAfOT9ww/Zc5FD/eSv57dtZAg/E3YKdcYWxRglV4ayFe8//R8A5jDE5NQEiXwz9BQJZv1W6Zoly7Qqf91EPyynoF/CFz+5A89FxOJ4973akSBPC7bZzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755251265; c=relaxed/simple;
	bh=QRYWkYTYZGYEzJcy0hM5wYxZUotsYanSU1g6TyjZZ0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tZ5jTW1h0DKiFxQ/b84SPNzFnZcYnIGZRPg7OWHsnBNeu9c51tRStPByjLNQ9j9wSbborecNL9f5BrnL8s511MJed57eGG9qCQVwXaHd8Fnlgdi/r4sU1xJ9h08xCz0SnQ5+EbU77Zkh1j811Nh2JkSYT3R7gJWXAJAMpipan/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yn5/uWuX; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yn5/uWuX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755251265; x=1786787265;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QRYWkYTYZGYEzJcy0hM5wYxZUotsYanSU1g6TyjZZ0Q=;
  b=Yn5/uWuXXOnhhP+j1ZnyFYOoDJKm4Tw+K52JZCGXnos6IUjKzHxf78BB
   C4Pf+Dwezgn84o5mev3t5rzRINAjaYOGtL4+BkkNytcy4sJWssYu78l6r
   iQrlfKOzpv/AnDOUQmeerzNFt7QqSMVierYmILgvrbYVMAaODSIh+8enp
   d3VsKe18/H0jBmW33vy/98a+nWu2udP5U7VfIQROfvB7fNSibv8Oa8704
   QrPMuE4hmFVzwwqm/fQDW+Gyy3s29mXf3vuq1MPHUGyWKxOdG3OiMAr07
   cPzWj5cGBffM908CyTD0T4hrp1+srRtyh4p7ZO0uAmRCiACWwm8l3yhfS
   A==;
X-CSE-ConnectionGUID: Re1lr3grTluY1tyQ0Sl9MQ==
X-CSE-MsgGUID: elSeNG7mSdiX9eqo+ZX2Nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="80154288"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="80154288"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2025 02:47:44 -0700
X-CSE-ConnectionGUID: ecQnslLdSUaGNvNeCu3DVA==
X-CSE-MsgGUID: D5xgS35sTD6NgaOAvObtKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="197833835"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 15 Aug 2025 02:47:42 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umr2C-000Bp4-06;
	Fri, 15 Aug 2025 09:47:40 +0000
Date: Fri, 15 Aug 2025 17:47:19 +0800
From: kernel test robot <lkp@intel.com>
To: Dongsheng Yang <dongsheng.yang@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev, Mikulas Patocka <mpatocka@redhat.com>
Subject: [linux-next:master 2532/2770] drivers/md/dm-pcache/cache_dev.c:52:6:
 warning: variable 'ret' is used uninitialized whenever 'if' condition is
 false
Message-ID: <202508151712.qMqD87iI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1357b2649c026b51353c84ddd32bc963e8999603
commit: 6fb8fbbaf147fe4153177320ee354c457605800a [2532/2770] dm-pcache: add persistent cache target in device-mapper
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20250815/202508151712.qMqD87iI-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 93d24b6b7b148c47a2fa228a4ef31524fa1d9f3f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250815/202508151712.qMqD87iI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508151712.qMqD87iI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/md/dm-pcache/cache_dev.c:52:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
      52 |         if (!*vaddr)
         |             ^~~~~~~
   drivers/md/dm-pcache/cache_dev.c:56:9: note: uninitialized use occurs here
      56 |         return ret;
         |                ^~~
   drivers/md/dm-pcache/cache_dev.c:52:2: note: remove the 'if' if its condition is always true
      52 |         if (!*vaddr)
         |         ^~~~~~~~~~~~
      53 |                 ret = -ENOMEM;
   drivers/md/dm-pcache/cache_dev.c:24:9: note: initialize the variable 'ret' to silence this warning
      24 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.


vim +52 drivers/md/dm-pcache/cache_dev.c

    18	
    19	static int build_vmap(struct dax_device *dax_dev, long total_pages, void **vaddr)
    20	{
    21		struct page **pages;
    22		long i = 0, chunk;
    23		unsigned long pfn;
    24		int ret;
    25	
    26		pages = vmalloc_array(total_pages, sizeof(struct page *));
    27		if (!pages)
    28			return -ENOMEM;
    29	
    30		do {
    31			chunk = dax_direct_access(dax_dev, i, total_pages - i,
    32						  DAX_ACCESS, NULL, &pfn);
    33			if (chunk <= 0) {
    34				ret = chunk ? chunk : -EINVAL;
    35				goto out_free;
    36			}
    37	
    38			if (!pfn_valid(pfn)) {
    39				ret = -EOPNOTSUPP;
    40				goto out_free;
    41			}
    42	
    43			while (chunk-- && i < total_pages) {
    44				pages[i++] = pfn_to_page(pfn);
    45				pfn++;
    46				if (!(i & 15))
    47					cond_resched();
    48			}
    49		} while (i < total_pages);
    50	
    51		*vaddr = vmap(pages, total_pages, VM_MAP, PAGE_KERNEL);
  > 52		if (!*vaddr)
    53			ret = -ENOMEM;
    54	out_free:
    55		vfree(pages);
    56		return ret;
    57	}
    58	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
