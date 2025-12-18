Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A24A33D50C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Dec 2025 14:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766066418; cv=none; b=drfa5hf9nfYNoi8/DC5L590b1BpwSrOPf1U90bcLr+ZUJFnt23dgugpoIUeA5Wvp6Kps/SAX7In+Vr9LtGTpnZlPFyDvnMw7bpIyzXj/GVNiD88ZMyuAP6y3t/iRfBUcrNi1lqREy3XRXCDGBMkd9+t597aZWHsA8NwmvaLx6hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766066418; c=relaxed/simple;
	bh=L0JTfCKk95tGXdgDLrU3WQckv16km3q2X6saGTdiBdU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hYPo4+RK5tCzz6qggFSY/+bPqqDNDG+KxEspxuTkDbp6zRtyNXd/hUsa6L9SbXZDMXj7L0sqMvyfYvc73UdG/NgoVs/bKIqG3tjdMkkMMygiwwTx7sq2ycJ7unAzRKfVrDb8DlDR6hjWMZSeaPHQ4JfyBU7i2NmXnyarVl8/s2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nvizdsZ5; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nvizdsZ5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766066415; x=1797602415;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L0JTfCKk95tGXdgDLrU3WQckv16km3q2X6saGTdiBdU=;
  b=nvizdsZ5hACFjhAC+OEif30ubCWkLw4fY+wx+fhm2pa+9xy7eUOCnlF1
   HajCK9vaNi7ilnxmwrtLUil82u9BLyYPznRgvNpyKXw2tjBEChasqRIj8
   e2hyXwXECaDeesm8IdNfOOuJOPsRSlrQDelOxXbiAYK/zl+AmNk7iLVMS
   Ux0vT+fW/Y1L0KbXTra2B5oG5ppWEWYyzvmj6vqQ3EM9K9Xx7X2Of5jMk
   LWTWuFhG6237jJzvjtDWEQSmiSUz4AHMAZWHhTOm9kFYgyn7Kn7AqM6id
   H+NkQC4BFOm8Ei5mHcA4Q+yTCS/7pXRmWPpOdylxqCF5SLnRY3tCW/1f/
   A==;
X-CSE-ConnectionGUID: MBtcK6KfTQiEWDQ7DITw6g==
X-CSE-MsgGUID: D+1StUybSxSL4RjF2yy3lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="71878448"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; 
   d="scan'208";a="71878448"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 06:00:12 -0800
X-CSE-ConnectionGUID: 7GTP1fTAQ8iiRm+tyWe7BA==
X-CSE-MsgGUID: cn/a88SOQcCVXFF1CsLZew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; 
   d="scan'208";a="197736133"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 18 Dec 2025 06:00:11 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWEY5-000000003zU-05jg;
	Thu, 18 Dec 2025 14:00:09 +0000
Date: Thu, 18 Dec 2025 15:00:01 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 50/50] kernel/dma/swiotlb.c:1461:
 warning: Function parameter or member 'pool' not described in
 'swiotlb_del_transient'
Message-ID: <202512181433.4BDW2ph5-lkp@intel.com>
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
head:   5d719013902eb006756873427de3fc5cc5566531
commit: 2f831790e2636c9b6820ca88cb47acb24a88e1c0 [50/50] swiotlb: reduce swiotlb pool lookups
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251218/202512181433.4BDW2ph5-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251218/202512181433.4BDW2ph5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512181433.4BDW2ph5-lkp@intel.com/

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
