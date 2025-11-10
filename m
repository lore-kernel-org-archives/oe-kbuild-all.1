Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585F919ADBA
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Nov 2025 11:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762774238; cv=none; b=LarRhRd2Kv7CEO1svHKWPdb8bAs6wCuCbFPLp1ABVH6g9JxKzDksZWfOAXzZT5qA3sqd0PtaLZEYqb6OrORsh7aFh6U+5CcWpbRAVin1TKB2JUof0hwMfpTNxeAiQDjzzLvxPRQyP4IYegzqqZVnq5CAG7kLHeot6GPWzamrbEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762774238; c=relaxed/simple;
	bh=qCR7AxjyMZW5jIiA17k3W8dAA69Dv/DFqLcnu/NsCOw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LJ3RyPUgz/Cak8CRwWumPkXRIrRNme0wyfIOFqvbFDiHN1mmXx+/ZINu3g94oW8YDnnxdO3vTcvQK0WzTVNJjTHMTAg0BOTSUk/GIxIl7zlDjP7gfCPz+VBuB55g2EobdJ3cRDxl7PSxAGNUVrFQzo1xcOVdzFLPJ8cYQrUOtR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AS4bMg1q; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AS4bMg1q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762774236; x=1794310236;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qCR7AxjyMZW5jIiA17k3W8dAA69Dv/DFqLcnu/NsCOw=;
  b=AS4bMg1qjIFQg8Dacw3SqhBgiUqRf9smfzygkcXMrS8qQlQbdOX+UMig
   H32Rz3BFuCMJiW7pGJOojtshH1F6BBRz3RJnJcMLA2X8fN0mGe2KV+KC4
   2FT4fz1mQYGEUXGug3SW9hV0TZMR04s6HqyVVNPx6N2BaEF3iuMKIWxGj
   OLkOY7h8aFCZLc5/ZdEI4MdjY4pyCvv5ofWjhBc8+tnxRTnzxSknO/tx9
   zn9fgVIS0i7Wx0UK6lT6XJ2IZyYfURLWveN1ZLHfASJl+7kjYarch+y2+
   hQckbes6K5xxEI1OEh7MI/aZB/sInJli01ByvVmFJn7b4G/2g+vpUB5kY
   Q==;
X-CSE-ConnectionGUID: GrTwjKO+TqinPTJEzUgTqg==
X-CSE-MsgGUID: O291bwfQSOyZ8slq5Xb/Rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11608"; a="68681002"
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="68681002"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 03:30:35 -0800
X-CSE-ConnectionGUID: nQdneNGcQpG3eozmn8hvvQ==
X-CSE-MsgGUID: znTVYEm+RSK6QA51qtZ/LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="187958639"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 10 Nov 2025 03:30:35 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vIQ6S-0000LL-17;
	Mon, 10 Nov 2025 11:30:32 +0000
Date: Mon, 10 Nov 2025 19:29:56 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Ze Zuo <zuoze1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3126/3126] mm/shmem.c:1699:50: error: too many
 arguments to function call, expected 3, have 4
Message-ID: <202511101918.i2LTDdWk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   f750bb89c43eea8f7e0424615516674781c72f7b
commit: 2896144b31df6748c5d0e6df7991c4a31a54b371 [3126/3126] mempolicy: alloc_pages_mpol() for NUMA policy without vma
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20251110/202511101918.i2LTDdWk-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251110/202511101918.i2LTDdWk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511101918.i2LTDdWk-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/shmem.c:1699:50: error: too many arguments to function call, expected 3, have 4
    1699 |         folio = swap_cluster_readahead(swap, gfp, mpol, ilx);
         |                 ~~~~~~~~~~~~~~~~~~~~~~                  ^~~
   mm/swap.h:101:29: note: 'swap_cluster_readahead' declared here
     101 | static inline struct folio *swap_cluster_readahead(swp_entry_t entry,
         |                             ^                      ~~~~~~~~~~~~~~~~~~
     102 |                                 gfp_t gfp_mask, struct vm_fault *vmf)
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +1699 mm/shmem.c

  1687	
  1688	static struct mempolicy *shmem_get_pgoff_policy(struct shmem_inode_info *info,
  1689				pgoff_t index, unsigned int order, pgoff_t *ilx);
  1690	
  1691	static struct folio *shmem_swapin_cluster(swp_entry_t swap, gfp_t gfp,
  1692				struct shmem_inode_info *info, pgoff_t index)
  1693	{
  1694		struct mempolicy *mpol;
  1695		pgoff_t ilx;
  1696		struct folio *folio;
  1697	
  1698		mpol = shmem_get_pgoff_policy(info, index, 0, &ilx);
> 1699		folio = swap_cluster_readahead(swap, gfp, mpol, ilx);
  1700		mpol_cond_put(mpol);
  1701	
  1702		return folio;
  1703	}
  1704	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
