Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E6D2D0C92
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Dec 2025 06:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766124720; cv=none; b=oxrk+IgHYEHSv2/gUjq/ORjhVK/7eh30xbcMtBsfZYjeORyuCEqC+Lfge83akDn7WigwpqLvGK92oxWDxXjujVsc49kTbevnDU1CygJB3hv2pC9f3BJ488YvvUvDgv+o/QL+st4TW+G09NPVhR91UMnkjxtdb8KwS7Kktod/5O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766124720; c=relaxed/simple;
	bh=EpQVUrWagoojIOUL6rFvQ6e1CEhJrEsMFmk7OOdicDc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o2TJCgr1Nd+lLO0WYHqVls5rHgoFIXoPf+mDzudhaxJEiPVpIAldlWRz8oC+eObLSZhIoT0GWbSud3SLCeuGd10xeTKIcBvDCiBNNtdImLkxC3hWhB8mwEk2Bc7utRG5K9ZGxTbPBBfzX3TheF136RsfEHdH0ddxXO0lkGUuqco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UNSE7trU; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UNSE7trU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766124719; x=1797660719;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EpQVUrWagoojIOUL6rFvQ6e1CEhJrEsMFmk7OOdicDc=;
  b=UNSE7trU5vqHpSUKlE6+NcmS15gIzBe7RbBG5bH8nwHntgWU2NAmQyEd
   Wq7tX9gcJfvvUTZ7lkl64CUgTI2VmAMu5jkkTPuZ1rf3KYpW+aHgxuRan
   iEv+zdRCj0BYWwouiKmR432gyutB8zCpObhsq7rSblYLfjupkLIhVcDV1
   Iwr/2MZo/7QWzPIrxA7GFQiqM9kwdOTiOgfn47iGqgrzXmXurYysiHZKd
   FRwRBiM0ESjZuNEqZRZAzb6mYQ8X0VRNjLQ0/Z+7Nrvk8HaR/gAiH5Yyl
   fVn7tFn2jAIMYPK/KNTDwAMPlKc1NZv99gcTt7UjiJhDqm1+odV0at1em
   g==;
X-CSE-ConnectionGUID: EYNgugZaQ/asMaCL+LAdwA==
X-CSE-MsgGUID: cDioLTcaTL6pdkL9t7o4qA==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="55661912"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="55661912"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 22:11:58 -0800
X-CSE-ConnectionGUID: P5n2zM2oT86qB7h0kYd5yA==
X-CSE-MsgGUID: uisrA9W0QuiZqiIhs1Vfpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="197934916"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 18 Dec 2025 22:11:57 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWTiU-00000000373-39Nf;
	Fri, 19 Dec 2025 06:11:54 +0000
Date: Fri, 19 Dec 2025 14:11:46 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 0/4] kernel/dma/swiotlb.c:1461:
 warning: Function parameter or member 'pool' not described in
 'swiotlb_del_transient'
Message-ID: <202512191421.6cevhAEQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Michael,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   a2dd3d028a03896d70974c70f36eebc729c1d69f
commit: 2f831790e2636c9b6820ca88cb47acb24a88e1c0 [0/4] swiotlb: reduce swiotlb pool lookups
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20251219/202512191421.6cevhAEQ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251219/202512191421.6cevhAEQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512191421.6cevhAEQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/dma/swiotlb.c:1461: warning: Function parameter or member 'pool' not described in 'swiotlb_del_transient'


vim +1461 kernel/dma/swiotlb.c

79636caad3618e Petr Tesarik   2023-08-01  1448  
79636caad3618e Petr Tesarik   2023-08-01  1449  /**
79636caad3618e Petr Tesarik   2023-08-01  1450   * swiotlb_del_transient() - delete a transient memory pool
79636caad3618e Petr Tesarik   2023-08-01  1451   * @dev:	Device which mapped the buffer.
79636caad3618e Petr Tesarik   2023-08-01  1452   * @tlb_addr:	Physical address within a bounce buffer.
79636caad3618e Petr Tesarik   2023-08-01  1453   *
79636caad3618e Petr Tesarik   2023-08-01  1454   * Check whether the address belongs to a transient SWIOTLB memory pool.
79636caad3618e Petr Tesarik   2023-08-01  1455   * If yes, then delete the pool.
79636caad3618e Petr Tesarik   2023-08-01  1456   *
79636caad3618e Petr Tesarik   2023-08-01  1457   * Return: %true if @tlb_addr belonged to a transient pool that was released.
79636caad3618e Petr Tesarik   2023-08-01  1458   */
2f831790e2636c Michael Kelley 2024-07-08  1459  static bool swiotlb_del_transient(struct device *dev, phys_addr_t tlb_addr,
2f831790e2636c Michael Kelley 2024-07-08  1460  		struct io_tlb_pool *pool)
79636caad3618e Petr Tesarik   2023-08-01 @1461  {
79636caad3618e Petr Tesarik   2023-08-01  1462  	if (!pool->transient)
79636caad3618e Petr Tesarik   2023-08-01  1463  		return false;
79636caad3618e Petr Tesarik   2023-08-01  1464  
79636caad3618e Petr Tesarik   2023-08-01  1465  	dec_used(dev->dma_io_tlb_mem, pool->nslabs);
79636caad3618e Petr Tesarik   2023-08-01  1466  	swiotlb_del_pool(dev, pool);
79636caad3618e Petr Tesarik   2023-08-01  1467  	return true;
79636caad3618e Petr Tesarik   2023-08-01  1468  }
79636caad3618e Petr Tesarik   2023-08-01  1469  

:::::: The code at line 1461 was first introduced by commit
:::::: 79636caad3618e2b38457f6e298c9b31ba82b489 swiotlb: if swiotlb is full, fall back to a transient memory pool

:::::: TO: Petr Tesarik <petr.tesarik.ext@huawei.com>
:::::: CC: Christoph Hellwig <hch@lst.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
