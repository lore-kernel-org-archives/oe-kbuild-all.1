Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59AACD27E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Sep 2025 02:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758766918; cv=none; b=usctxD/WZ1DnjuHgJBUg1+imKU/vrxy33DqODd/yBgiChmBj1rO5zbyhXtF2CxV1yO1Qz8+fBlgSow/0/6XDvJFjf+88LpCIT6YmLP6pJLUVXZyjTwocHx9qLTYkUcYRFYTmAwWJrmuBY0zz3XpKeEfAPL3+OkLIJ3pbTY5bxyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758766918; c=relaxed/simple;
	bh=Ii0QN1IR0AmwxSdyadl539Gq1B91ajpD72ryFa81tLg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LwwCCXCmk5wd/GuWlpzeBqlSl/99T53RvCRflh5WGgyF8EAmwULKgyMq/nIcVMp3qpQU7zFPjZA/LQRgjpeOs5X0jF1yRhnb6u7hzSXLsQgMfBVRf7FwJeKp12irxOCUrgz5J/abC8/kpwiRKBKGxEJxZ9TKmzODbUxmUFSsOQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MA4lWFyG; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MA4lWFyG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758766916; x=1790302916;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ii0QN1IR0AmwxSdyadl539Gq1B91ajpD72ryFa81tLg=;
  b=MA4lWFyGNbqJvLVLY0rkwvnX845R42N2zjCR4iAy/JEnGm9K/ALIX/Jk
   9REldwAXFZfBOOlh6BOG/he8w9kwR5ZGI11KxTMA/UnUTCw1HMtIF6Qki
   xsSSqgBPlXKGxYTclBHg5BqHAg1cO3hcFODWWt6AzjQaHa0ApaxWBI7yO
   /NP65MIdDHpTmcCqCIo8QdmXggV5qhnDl2lIy7nLVKvfwU27dk2AiH9kH
   24VtogBOV2McBEtCzUqlZGTnUOHBgh2NLkYRLmP+aQh3mxKwfJADqWaBB
   ES0lnKs2BoQHjei4CYoDCLqK+PNAnTZHK43E1502odSiyB1cbGN7H48gr
   Q==;
X-CSE-ConnectionGUID: v+nk81w3T9K1iofAgqNDAg==
X-CSE-MsgGUID: t8/BuQoSRuOc0l4UOc5WRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61128334"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="61128334"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 19:21:55 -0700
X-CSE-ConnectionGUID: qs8qvFhkReWqdHNo1FejJQ==
X-CSE-MsgGUID: sE1U1rfjQ5e6CCPffSVVlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; 
   d="scan'208";a="207946771"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 24 Sep 2025 19:21:55 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v1bcG-0004qH-0q;
	Thu, 25 Sep 2025 02:21:52 +0000
Date: Thu, 25 Sep 2025 10:21:05 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 621/621] kernel/dma/swiotlb.c:1461:
 warning: Function parameter or member 'pool' not described in
 'swiotlb_del_transient'
Message-ID: <202509251048.9NxfcLd6-lkp@intel.com>
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
head:   c0d272ce3eccf953d7a018ca541277ee00a95c71
commit: 2f831790e2636c9b6820ca88cb47acb24a88e1c0 [621/621] swiotlb: reduce swiotlb pool lookups
config: x86_64-anolis-intel-cloud-devel-6.6 (https://download.01.org/0day-ci/archive/20250925/202509251048.9NxfcLd6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250925/202509251048.9NxfcLd6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509251048.9NxfcLd6-lkp@intel.com/

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
