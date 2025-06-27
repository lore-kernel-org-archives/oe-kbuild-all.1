Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98792DD5EB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Jun 2025 17:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751044469; cv=none; b=TbGi+qs9e9wKZBS+S8Or6fHPiUBPhIyhLkk5ZyKP1xLDZrml056xTbaPxROliIt0McBWDcaxZnhWDbTZG1TlZZ6oxhKnPiX1EbT75qipcwRQDk9oPFY7ZCz6v5yuOLw7TI8hzZl0T4A0iQTEipz2Bdjcgh2bxgd6jNwHAZksS1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751044469; c=relaxed/simple;
	bh=rnXIo/Y3qaMSoSrm3uhVJH65bTaWa7zwMHYFoPaBIwU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QKSfHcDkcUz19CGqwmcgrI8upTTyHAjq6fmW9qrCrSaM8QEnh5H4dGiSEOqvrX+KgNmlzY+wVUpI+SpHlRX6Tb/gw4XLfZyDVF39gKFlXdHhJpTBWkNGX2321YfTd+YpC2gIX9gnqvkmoC6GDjN87pN0TzHRS8oGgcfUkH09xqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Po4Si7ve; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Po4Si7ve"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751044468; x=1782580468;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rnXIo/Y3qaMSoSrm3uhVJH65bTaWa7zwMHYFoPaBIwU=;
  b=Po4Si7veK/stfHd5a2qGP9UFguH0ZV4WkIkGx6Puv/tpS6b/NqdxOScx
   4wgg+BoRS/7Rw/ci8Hvh4kQit/nhP3V7lzG/G74bWVq/jFvXkCmqY18XY
   xL3e/Z9HpO774X3Q/URSfeJVN/gzHToYQXeLlLOsHJ7vXeMbj+qRojS9u
   cgPUUCmBqZsv5cu7SLCFAqcMqS7zuX/pwjQCi3iOFMm9E9nKMZrtcSieo
   r5H/ZWaGD+gGcD8DCN2dIOrj7d57h5soGvqWJoZmMGb1CToJoyXoNeh6w
   shh19yWY3kDyVEAhp/eWP+0quZ+Z/rSMg4cyas+m7Uu/O9So2w17UKsaA
   Q==;
X-CSE-ConnectionGUID: PtBMdBeWR+OHMBIereyMUw==
X-CSE-MsgGUID: xusiTJVFTU6bNEvx+LgQLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="63961443"
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="63961443"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 10:14:27 -0700
X-CSE-ConnectionGUID: tdQ0P9vJTb6pIONdj4Bt6Q==
X-CSE-MsgGUID: Nxdb2WxxRKiG4Pd5yYzr5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="153036513"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 27 Jun 2025 10:14:26 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVCed-000WPW-2a;
	Fri, 27 Jun 2025 17:14:23 +0000
Date: Sat, 28 Jun 2025 01:14:17 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:dmabuf-rw-v1-test 10/16] drivers/nvme/host/pci.c:661:4:
 error: call to undeclared function '__dma_sync_single_for_cpu'; ISO C99 and
 later do not support implicit function declarations
Message-ID: <202506280133.m6Dijaql-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux dmabuf-rw-v1-test
head:   949fb10351aae03bf6ca32fb3c4a714ebaefc9e9
commit: f968cc15459963b2511327450d713bef7ea9e0d3 [10/16] nvme-pci: implement support for user passed dma vec
config: i386-buildonly-randconfig-005-20250627 (https://download.01.org/0day-ci/archive/20250628/202506280133.m6Dijaql-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250628/202506280133.m6Dijaql-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506280133.m6Dijaql-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/nvme/host/pci.c:661:4: error: call to undeclared function '__dma_sync_single_for_cpu'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     661 |                         __dma_sync_single_for_cpu(dev, dma_addr, dma_len, dir);
         |                         ^
   drivers/nvme/host/pci.c:661:4: note: did you mean 'dma_sync_single_for_cpu'?
   include/linux/dma-mapping.h:415:20: note: 'dma_sync_single_for_cpu' declared here
     415 | static inline void dma_sync_single_for_cpu(struct device *dev, dma_addr_t addr,
         |                    ^
>> drivers/nvme/host/pci.c:663:4: error: call to undeclared function '__dma_sync_single_for_device'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     663 |                         __dma_sync_single_for_device(dev, dma_addr,
         |                         ^
   drivers/nvme/host/pci.c:663:4: note: did you mean 'dma_sync_single_for_device'?
   include/linux/dma-mapping.h:419:20: note: 'dma_sync_single_for_device' declared here
     419 | static inline void dma_sync_single_for_device(struct device *dev,
         |                    ^
   drivers/nvme/host/pci.c:3424:41: warning: shift count >= width of type [-Wshift-count-overflow]
    3424 |                 dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
         |                                                       ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:73:54: note: expanded from macro 'DMA_BIT_MASK'
      73 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                                      ^ ~~~
   1 warning and 2 errors generated.


vim +/__dma_sync_single_for_cpu +661 drivers/nvme/host/pci.c

   639	
   640	static void nvme_sync_dma(struct nvme_dev *nvme_dev, struct request *req,
   641				  enum dma_data_direction dir)
   642	{
   643		bool for_cpu = dir == DMA_FROM_DEVICE;
   644		struct device *dev = nvme_dev->dev;
   645		struct bio *bio = req->bio;
   646		int offset, length;
   647		struct dmavec *dmav;
   648	
   649		if (!dma_dev_need_sync(dev))
   650			return;
   651	
   652		offset = bio->bi_iter.bi_bvec_done;
   653		length = blk_rq_payload_bytes(req);
   654		dmav = &bio->bi_dmavec[bio->bi_iter.bi_idx];
   655	
   656		while (length) {
   657			u64 dma_addr = dmav->addr + offset;
   658			int dma_len = min(dmav->len - offset, length);
   659	
   660			if (for_cpu)
 > 661				__dma_sync_single_for_cpu(dev, dma_addr, dma_len, dir);
   662			else
 > 663				__dma_sync_single_for_device(dev, dma_addr,
   664							     dma_len, dir);
   665	
   666			length -= dma_len;
   667		}
   668	}
   669	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
