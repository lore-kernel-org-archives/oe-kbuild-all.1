Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3AA1E51D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Sep 2024 11:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726141976; cv=none; b=nEKywmNbcW6uLtFkdLlipsdraOQ63zIB5Lgu0gSMobl1zk5Dg9Omdr3B+4p+YEUlx6IUDV+ceOxH/+fEJqy1I4Se0ErNGhxlN/RYlyOrZbJrSiVZiff2l1oOP5xGeVE4MtO9diFJY+xJMfW8yHrb5g++2NPpL8d8eob2FwAzMu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726141976; c=relaxed/simple;
	bh=x1WoGwHptdA20cq1tbSn4Ae9s1rud9QxfQ2UZR8ydR0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TWOC/USGpWGoc5iPqbA0VDDsnM32Upwn1PIj0Vag8+qKPRBTNHKgiTwXwS7W3Ahd3C0xbJ6fRZqBnfePHSQY0uZqGmE0xNVCKhp07RYICLlpCEm1eHeYdUjd//NRKVtVi+MQjs3iEoxtx4K5yWkxFJ4nt9WQExW1/bvEf6/lIWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GI9XT46Y; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GI9XT46Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726141975; x=1757677975;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x1WoGwHptdA20cq1tbSn4Ae9s1rud9QxfQ2UZR8ydR0=;
  b=GI9XT46YWfCf7v8e9CG7KDmn6HAw/BtjQALS2DeKpmXoiAdqM1hXGG+v
   I4D+PDU59fqVDqGI/PaczTqxTJPtd6RudGOhTvPI7RSihjMeBwqUIj0/d
   8bIrignh1nYcG64fGQJvWttwF9hCYFsG0j/MLdyfs5mEpi08kP+SXE7w9
   ZEvOrCy+jL2ODLn6qBM3C9GWdpZ3AaVLg1md+QcrElOg/hw4fxcoFOUIv
   BEOqJVViEJhVdpmZThRgOmvwlHMAdOlElCoSHPNf2G79M2n7JBXJJzDP/
   sIY2qdfwYZIhH7481qDidELklFgu2+2ZsDKFNgIXm3TUHZhjQkLApLCmn
   Q==;
X-CSE-ConnectionGUID: 6V3KefzKSOCYgwhdCit3YQ==
X-CSE-MsgGUID: 2C+3T0cDQzqpHRIBm+BnUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="42503358"
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; 
   d="scan'208";a="42503358"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 04:52:54 -0700
X-CSE-ConnectionGUID: NeFe4Y+dQaafk/8Z8XmFvA==
X-CSE-MsgGUID: 20bcinYgRv+xc3YsHty3Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; 
   d="scan'208";a="67305824"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 12 Sep 2024 04:52:53 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soiNX-000562-1t;
	Thu, 12 Sep 2024 11:52:51 +0000
Date: Thu, 12 Sep 2024 19:52:09 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 14560/15119]
 drivers/media/pci/intel/ipu6/../ipu-bus.c:169:18: error: 'struct device' has
 no member named 'dma_ops'
Message-ID: <202409122236.F7PlPlxn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   3669ba03ddfc0ea94d6685f802b229564b807ebe
commit: 60e566f1ebecf5c38e7718cc52e5a482505b6742 [14560/15119] CHROMIUM: media: add Intel IPU6 drivers
config: x86_64-randconfig-013-20240912 (https://download.01.org/0day-ci/archive/20240912/202409122236.F7PlPlxn-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240912/202409122236.F7PlPlxn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409122236.F7PlPlxn-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/pci/intel/ipu6/../ipu-bus.c: In function 'ipu_bus_initialize_device':
>> drivers/media/pci/intel/ipu6/../ipu-bus.c:169:18: error: 'struct device' has no member named 'dma_ops'
     169 |         adev->dev.dma_ops = &ipu_dma_ops;
         |                  ^


vim +169 drivers/media/pci/intel/ipu6/../ipu-bus.c

   152	
   153	struct ipu_bus_device *ipu_bus_initialize_device(struct pci_dev *pdev,
   154							 struct device *parent,
   155							 void *pdata,
   156							 struct ipu_buttress_ctrl *ctrl,
   157							 char *name, unsigned int nr)
   158	{
   159		struct ipu_bus_device *adev;
   160		struct ipu_device *isp = pci_get_drvdata(pdev);
   161	
   162		adev = kzalloc(sizeof(*adev), GFP_KERNEL);
   163		if (!adev)
   164			return ERR_PTR(-ENOMEM);
   165	
   166		adev->dev.parent = parent;
   167		adev->dev.bus = &ipu_bus;
   168		adev->dev.release = ipu_bus_release;
 > 169		adev->dev.dma_ops = &ipu_dma_ops;
   170		adev->dma_mask = DMA_BIT_MASK(isp->secure_mode ?
   171					      IPU_MMU_ADDRESS_BITS :
   172					      IPU_MMU_ADDRESS_BITS_NON_SECURE);
   173		adev->dev.dma_mask = &adev->dma_mask;
   174		adev->dev.dma_parms = pdev->dev.dma_parms;
   175		adev->dev.coherent_dma_mask = adev->dma_mask;
   176		adev->ctrl = ctrl;
   177		adev->pdata = pdata;
   178		adev->isp = isp;
   179		mutex_init(&adev->resume_lock);
   180		dev_set_name(&adev->dev, "%s%d", name, nr);
   181	
   182		device_initialize(&adev->dev);
   183		pm_runtime_forbid(&adev->dev);
   184		pm_runtime_enable(&adev->dev);
   185	
   186		return adev;
   187	}
   188	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
