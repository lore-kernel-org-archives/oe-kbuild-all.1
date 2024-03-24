Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCCD28E7
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Mar 2024 11:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711280256; cv=none; b=Chi7Pm0YOtaJA9jFHiOqZfZ6TSee/quRZOpqmNzbjx7dt7+EQDAV/HUSEWpTHSS8qHcselUj/Iuk4IzCZs7zJPTXMgeuYE3s+66RmlFQBzQX7lUoVk1ybcgMIYayGqHmKvo7wxnjp8TUg6W4Ee3fZTrVTWc9TUZfOaAO/8TP+fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711280256; c=relaxed/simple;
	bh=tVNhKLE2ci4opjk2frCG9YiUAreGIpVmgoLTlE+Emas=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Va938MGlfafM4sR0BkuzaaQKA7UcHVqQXpKchq8nRaMdTv8kVVlEZvdZqqhGPHwDzh7rwzO/IIdInHs2FmGDSDyTbQtMBvXsvoSIAiEUBcunsaUdpAUslRTx+kDvxMVsawe1heeBKjN0njQx3bYLmwfI4fOsYDuZoFnCZuUhVyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G9bPH3Yb; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G9bPH3Yb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711280255; x=1742816255;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tVNhKLE2ci4opjk2frCG9YiUAreGIpVmgoLTlE+Emas=;
  b=G9bPH3YbbRv2T+n0n5sphfCc2ABg8QaKQjT4eXbhCw6YR28jH8kj2HcZ
   l5QYU7uU6BFoVYFoaXTJgq9ROcCk9HNGF/HqpkO4L93Z6HQUtPHJwKICi
   NFsV9gqby27xl19sRgHva9RRUAccVyACd6c25KMukhxDIrmfSn3Jk/+49
   9Ls1Wcyp72j7Rya+z/ocuRlf/hUTxMIiHq8K8aTNJ+7zRmqH3i/AR48X7
   WMPWxnGuxXDyBe/eReVcKZNI45AvVdFExzC2Ua9qimilSRwQu8Ud/q44P
   cNnK9xGXuCG2xUoL7BoAdjZz9a2syTEf9SdVE8CUvuh+7E2tnHurFiOMl
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11022"; a="6408824"
X-IronPort-AV: E=Sophos;i="6.07,151,1708416000"; 
   d="scan'208";a="6408824"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2024 04:37:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,151,1708416000"; 
   d="scan'208";a="38454492"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 24 Mar 2024 04:37:33 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1roMAM-000Lo7-1N;
	Sun, 24 Mar 2024 11:37:30 +0000
Date: Sun, 24 Mar 2024 19:36:40 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-block:scsi-limits 20/23]
 drivers/scsi/hisi_sas/hisi_sas_v3_hw.c:2902:42: error: too few arguments to
 function call, expected 2, have 1
Message-ID: <202403241932.GzyD2W8G-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/block.git scsi-limits
head:   d56272297e728376fca28b0998de7fe9642c6dee
commit: 1d2296d51677f5461596f2d1570fd3ed08a9470e [20/23] libata: switch to using ->device_configure
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240324/202403241932.GzyD2W8G-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240324/202403241932.GzyD2W8G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403241932.GzyD2W8G-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/scsi/hisi_sas/hisi_sas_v3_hw.c:2902:42: error: too few arguments to function call, expected 2, have 1
    2902 |         int ret = hisi_sas_device_configure(sdev);
         |                   ~~~~~~~~~~~~~~~~~~~~~~~~~     ^
   drivers/scsi/hisi_sas/hisi_sas.h:646:5: note: 'hisi_sas_device_configure' declared here
     646 | int hisi_sas_device_configure(struct scsi_device *sdev,
         |     ^                         ~~~~~~~~~~~~~~~~~~~~~~~~~
     647 |                 struct queue_limits *lim);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/hisi_sas/hisi_sas_v3_hw.c:4796:45: warning: shift count >= width of type [-Wshift-count-overflow]
    4796 |         rc = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
         |                                                    ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:77:54: note: expanded from macro 'DMA_BIT_MASK'
      77 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                                      ^ ~~~
   1 warning and 1 error generated.


vim +2902 drivers/scsi/hisi_sas/hisi_sas_v3_hw.c

  2896	
  2897	static int device_configure_v3_hw(struct scsi_device *sdev,
  2898			struct queue_limits *lim)
  2899	{
  2900		struct Scsi_Host *shost = dev_to_shost(&sdev->sdev_gendev);
  2901		struct hisi_hba *hisi_hba = shost_priv(shost);
> 2902		int ret = hisi_sas_device_configure(sdev);
  2903		struct device *dev = hisi_hba->dev;
  2904	
  2905		if (ret)
  2906			return ret;
  2907	
  2908		if (sdev->type == TYPE_ENCLOSURE)
  2909			return 0;
  2910	
  2911		if (!device_link_add(&sdev->sdev_gendev, dev,
  2912				     DL_FLAG_PM_RUNTIME | DL_FLAG_RPM_ACTIVE)) {
  2913			if (pm_runtime_enabled(dev)) {
  2914				dev_info(dev, "add device link failed, disable runtime PM for the host\n");
  2915				pm_runtime_disable(dev);
  2916			}
  2917		}
  2918	
  2919		return 0;
  2920	}
  2921	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
