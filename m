Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99FE527147D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 23:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765580620; cv=none; b=h9ednAcnazHhfWsRu2Bg3q1dwS9HsMYJq0GNzevZ50mJMPletzFM997na0p6g0fADro/D2lkKNQiyXKrzeP4jhL8MmuixSMQfnhLHHnrnPiIuG0wOzIv0wDdhCpsrZIYiZByq2QgGqwz2u9zstw46BoBiAgJkz7zRrTWjBPgWb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765580620; c=relaxed/simple;
	bh=kyBgNz82U8O6JoH0SF1gpirJJ2NdoJvSQXYDbUcZ4f4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xweezmci2mTjzXKYrrgRM/HNbLUIvc+py/4u4/JABfIvHs/Wp9oXIsoNqhKuD71A/zE2gRYAE8XpzoZoLVx1l6O1tYB+4plyGFV/XvCgCYzF95jUIW38SBBx3kylRj93ZcBc3FxpQA41H2M+z+lJP6Tj9eWDV5I9nqPkEoBRzfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kB3OVHEC; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kB3OVHEC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765580619; x=1797116619;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kyBgNz82U8O6JoH0SF1gpirJJ2NdoJvSQXYDbUcZ4f4=;
  b=kB3OVHEC4LmZOdZFNIKQHa5oPkvHZc/84gyF0coW6h1akiS/+1jwGy33
   K2XoA+kuD1XhDNNje6f4ICnAHtxMxs0amVYUe0pS8oHjs1NlPh7Z+1Gpk
   3WUJPuyCQICXhmZPWp4LVk/pRTz2XCiPP9MaYaeZQhqg8S/1WwsFVHeyJ
   vdv09uoR/oXs3vAH9070HRMAa4teP5ybXI4hx1GybqaclqwzpXuEemqTU
   h1YFT8VZDcsGUngIsHBTBTin1IhVBmIgBj/2lftc+g2NGxE9W03vGHkKU
   PrTCMXlQpv1G9UfDCI/BfK9j0e0DdoqJIc9Qc+9sX2iKcaeuoodcMKlf8
   w==;
X-CSE-ConnectionGUID: IAQD8EUnQ0qZqJ9cwOqVGw==
X-CSE-MsgGUID: 502yi3gMR42fhDUPh+m13w==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="67626345"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="67626345"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 15:03:38 -0800
X-CSE-ConnectionGUID: mN0RNS7bTtCLWTc8BmVWsA==
X-CSE-MsgGUID: 9aGIMr7KSn+i9S0lyFShcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="201692007"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 12 Dec 2025 15:03:36 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUCAg-000000006k1-05Kj;
	Fri, 12 Dec 2025 23:03:34 +0000
Date: Sat, 13 Dec 2025 07:03:16 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 5/5]
 drivers/dma-buf/dma-heap.c:47: warning: Function parameter or struct member
 'heap_dev' not described in 'dma_heap'
Message-ID: <202512130625.nktw6rTi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   da2da0badf05a4631edf06f9a37e822b20875663
commit: cefb5c96f328e7ece57ff0a5c39d554e1d6cd171 [5/5] Merge 0c6bc3725592 ("Merge tag 'ubifs-for-linus-6.8-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs") into android-mainline
config: x86_64-buildonly-randconfig-002-20251212 (https://download.01.org/0day-ci/archive/20251213/202512130625.nktw6rTi-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512130625.nktw6rTi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512130625.nktw6rTi-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/dma-buf/dma-heap.c:47: warning: Function parameter or struct member 'priv' not described in 'dma_heap'
   drivers/dma-buf/dma-heap.c:47: warning: Function parameter or struct member 'heap_devt' not described in 'dma_heap'
   drivers/dma-buf/dma-heap.c:47: warning: Function parameter or struct member 'list' not described in 'dma_heap'
   drivers/dma-buf/dma-heap.c:47: warning: Function parameter or struct member 'heap_cdev' not described in 'dma_heap'
   drivers/dma-buf/dma-heap.c:47: warning: Function parameter or struct member 'refcount' not described in 'dma_heap'
>> drivers/dma-buf/dma-heap.c:47: warning: Function parameter or struct member 'heap_dev' not described in 'dma_heap'


vim +47 drivers/dma-buf/dma-heap.c

c02a81fba74fe3 Andrew F. Davis 2019-12-03  26  
c02a81fba74fe3 Andrew F. Davis 2019-12-03  27  /**
c02a81fba74fe3 Andrew F. Davis 2019-12-03  28   * struct dma_heap - represents a dmabuf heap in the system
c02a81fba74fe3 Andrew F. Davis 2019-12-03  29   * @name:		used for debugging/device-node name
c02a81fba74fe3 Andrew F. Davis 2019-12-03  30   * @ops:		ops struct for this heap
c02a81fba74fe3 Andrew F. Davis 2019-12-03  31   * @heap_devt		heap device node
c02a81fba74fe3 Andrew F. Davis 2019-12-03  32   * @list		list head connecting to list of heaps
c02a81fba74fe3 Andrew F. Davis 2019-12-03  33   * @heap_cdev		heap char device
9d47057e55785b John Stultz     2020-05-07  34   * @heap_dev		heap device struct
c02a81fba74fe3 Andrew F. Davis 2019-12-03  35   *
c02a81fba74fe3 Andrew F. Davis 2019-12-03  36   * Represents a heap of memory from which buffers can be made.
c02a81fba74fe3 Andrew F. Davis 2019-12-03  37   */
c02a81fba74fe3 Andrew F. Davis 2019-12-03  38  struct dma_heap {
c02a81fba74fe3 Andrew F. Davis 2019-12-03  39  	const char *name;
c02a81fba74fe3 Andrew F. Davis 2019-12-03  40  	const struct dma_heap_ops *ops;
c02a81fba74fe3 Andrew F. Davis 2019-12-03  41  	void *priv;
c02a81fba74fe3 Andrew F. Davis 2019-12-03  42  	dev_t heap_devt;
c02a81fba74fe3 Andrew F. Davis 2019-12-03  43  	struct list_head list;
c02a81fba74fe3 Andrew F. Davis 2019-12-03  44  	struct cdev heap_cdev;
c700bdd2233e00 John Stultz     2020-07-25  45  	struct kref refcount;
9d47057e55785b John Stultz     2020-05-07  46  	struct device *heap_dev;
c02a81fba74fe3 Andrew F. Davis 2019-12-03 @47  };
c02a81fba74fe3 Andrew F. Davis 2019-12-03  48  

:::::: The code at line 47 was first introduced by commit
:::::: c02a81fba74fe3488ad6b08bfb5a1329005418f8 dma-buf: Add dma-buf heaps framework

:::::: TO: Andrew F. Davis <afd@ti.com>
:::::: CC: Sumit Semwal <sumit.semwal@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
