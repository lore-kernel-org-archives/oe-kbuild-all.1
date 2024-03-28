Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1944B28DD2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Mar 2024 06:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711608000; cv=none; b=DMF+rvjkG/upby3F26fbevHmu2E+QBc5PzjDiYLOC438oyBi/NgB/hslUY1uoick4SxGbIKYCfcn6P/VClzHTFR8y4cyJeLqM89bUdNlqRyzA2kaJXPnFz6DyfqQttwq6dkhfLxkuznxG6iiDzXdprQvrRRxKwvem+4OgSvU8EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711608000; c=relaxed/simple;
	bh=pEO0bkez2YMxlgVF/N+ABzwZJFdT57+PAFsDtsSnbzA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gzhlYisDniPQeVC6rHhc6ELQd36ZqS0tC34y+JeoMI8u3Bdwlx6yDxHEvsqUAP77VCvrYIs0xA6ef+mfJI3lkro2K44CVTHFPGp6KmZ32JYyCIBKtCnYXZ9WKHb+gvRkSMpGRIi6lT4ebLc4HqxgLTcAG2FUrWINTReIqAoVvXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IA5h7fGP; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IA5h7fGP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711607998; x=1743143998;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pEO0bkez2YMxlgVF/N+ABzwZJFdT57+PAFsDtsSnbzA=;
  b=IA5h7fGPeQQlzo/WJONYhLZ3T1+k3tutF/fZloPFypnF9BwUNTfk8fAt
   kiXj+KjbtRziurgOqFs6slSUkode6J3t+Tw5Ey7KOv+ItRzwpn9QXX8hy
   0am/472DYY2ftoqTTCjS20MTHYkmZFSe8nw5Rtfv3UKsbGCzW8vAimPXD
   nK67pOu4Er8B/prlMAGRAX2nTAYY+hdw/bTA9YJ725A6kTWjCiqNfYLju
   /EaVMOax0kmJU/tM+dqa/BNpqN95JOwOamV0JBQGXFzc6YJG0JcLn5CIw
   uhvdZh9jkjrvP0MmU6n0R8vZydItNbWDwY3CWvYXjlG/TOlgaeHGztvC1
   Q==;
X-CSE-ConnectionGUID: 8ggigW3+TL+D3AxtPdkExA==
X-CSE-MsgGUID: LQ0d9yaRQWam88itavY+vA==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="10551282"
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; 
   d="scan'208";a="10551282"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 23:39:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; 
   d="scan'208";a="16435775"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 27 Mar 2024 23:39:56 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rpjQX-0001sM-2Q;
	Thu, 28 Mar 2024 06:39:53 +0000
Date: Thu, 28 Mar 2024 14:39:38 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 2261/4928]
 drivers/dma-buf/dma-heap.c:46: warning: Function parameter or struct member
 'heap_dev' not described in 'dma_heap'
Message-ID: <202403281446.fTWV1Lqx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   f98163de33c6725a7ed3c5deee265b5f92f3afcb
commit: 9d47057e55785b27694b8e0967f7fe8720bc41b3 [2261/4928] FROMLIST: dma-buf: dma-heap: Keep track of the heap device struct
config: i386-buildonly-randconfig-004-20240326 (https://download.01.org/0day-ci/archive/20240328/202403281446.fTWV1Lqx-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240328/202403281446.fTWV1Lqx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403281446.fTWV1Lqx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/dma-buf/dma-heap.c:46: warning: Function parameter or struct member 'priv' not described in 'dma_heap'
   drivers/dma-buf/dma-heap.c:46: warning: Function parameter or struct member 'heap_devt' not described in 'dma_heap'
   drivers/dma-buf/dma-heap.c:46: warning: Function parameter or struct member 'list' not described in 'dma_heap'
   drivers/dma-buf/dma-heap.c:46: warning: Function parameter or struct member 'heap_cdev' not described in 'dma_heap'
   drivers/dma-buf/dma-heap.c:46: warning: Function parameter or struct member 'refcount' not described in 'dma_heap'
>> drivers/dma-buf/dma-heap.c:46: warning: Function parameter or struct member 'heap_dev' not described in 'dma_heap'


vim +46 drivers/dma-buf/dma-heap.c

c02a81fba74fe3 Andrew F. Davis 2019-12-03  25  
c02a81fba74fe3 Andrew F. Davis 2019-12-03  26  /**
c02a81fba74fe3 Andrew F. Davis 2019-12-03  27   * struct dma_heap - represents a dmabuf heap in the system
c02a81fba74fe3 Andrew F. Davis 2019-12-03  28   * @name:		used for debugging/device-node name
c02a81fba74fe3 Andrew F. Davis 2019-12-03  29   * @ops:		ops struct for this heap
c02a81fba74fe3 Andrew F. Davis 2019-12-03  30   * @heap_devt		heap device node
c02a81fba74fe3 Andrew F. Davis 2019-12-03  31   * @list		list head connecting to list of heaps
c02a81fba74fe3 Andrew F. Davis 2019-12-03  32   * @heap_cdev		heap char device
9d47057e55785b John Stultz     2020-05-07  33   * @heap_dev		heap device struct
c02a81fba74fe3 Andrew F. Davis 2019-12-03  34   *
c02a81fba74fe3 Andrew F. Davis 2019-12-03  35   * Represents a heap of memory from which buffers can be made.
c02a81fba74fe3 Andrew F. Davis 2019-12-03  36   */
c02a81fba74fe3 Andrew F. Davis 2019-12-03  37  struct dma_heap {
c02a81fba74fe3 Andrew F. Davis 2019-12-03  38  	const char *name;
c02a81fba74fe3 Andrew F. Davis 2019-12-03  39  	const struct dma_heap_ops *ops;
c02a81fba74fe3 Andrew F. Davis 2019-12-03  40  	void *priv;
c02a81fba74fe3 Andrew F. Davis 2019-12-03  41  	dev_t heap_devt;
c02a81fba74fe3 Andrew F. Davis 2019-12-03  42  	struct list_head list;
c02a81fba74fe3 Andrew F. Davis 2019-12-03  43  	struct cdev heap_cdev;
c700bdd2233e00 John Stultz     2020-07-25  44  	struct kref refcount;
9d47057e55785b John Stultz     2020-05-07  45  	struct device *heap_dev;
c02a81fba74fe3 Andrew F. Davis 2019-12-03 @46  };
c02a81fba74fe3 Andrew F. Davis 2019-12-03  47  

:::::: The code at line 46 was first introduced by commit
:::::: c02a81fba74fe3488ad6b08bfb5a1329005418f8 dma-buf: Add dma-buf heaps framework

:::::: TO: Andrew F. Davis <afd@ti.com>
:::::: CC: Sumit Semwal <sumit.semwal@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
