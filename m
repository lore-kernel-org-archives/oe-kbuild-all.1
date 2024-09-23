Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A8684A46
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Sep 2024 21:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727127712; cv=none; b=a/d9iG5OPkD2pruOhGQh63l0cewEhY6kJa3ln+qe2cZTXnrnUzNrRo1IKCVyJpdpiH2tIXXDqbt1Bem9ngH80mXI88PBaem2FvTUcoBW/lcQHH6AljA4HX9VWtg4AOkqtT7S01OK7WfOe6YOKerGJacpzG9TGYR4GqT6q9VarlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727127712; c=relaxed/simple;
	bh=ADppoYLGF/MHJfofWGRRjpEeiKCTaF35eZMT6+2ai/4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SNbA8Obtf/XpFhVC6UBK3FX8DL0IcwkQRCxC9HU/goofbMG8wgQN5sDWBhzlgdaKtRtKsp4pWS2MKQ92HHFMZNC77k7OU2txTBPvAJLMmY9UOCAG9eN0i5qdS5Rw6i2vGtptUWraxHOo+ARs3ba9eGtynWlTqOBhwafT0OwNKbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SpHDgNW9; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SpHDgNW9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727127711; x=1758663711;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ADppoYLGF/MHJfofWGRRjpEeiKCTaF35eZMT6+2ai/4=;
  b=SpHDgNW9jbJsTkibzIQXt1n5xWS8FdKkrKULA0ZBJ7ByOQqbAI3QMiQc
   si9bOMvX5SKvpeddxrUc8iizF9oWqVeHU4M7rf/keO6xnuRtgTubxWXar
   p4Sk3fYlzuYjXfLQ2zJHdGf1w2NioK/Ln6XiBosy/crx+IyeetUlCiobt
   r3mXAjjyjGMNMBUXCQ/n0Q8zRtZ0VG5+2I814lesdyTKMn2EIy5ojXKtn
   KHWC6rh6iKy/ta4nG4MNdUsOxVMW37m/PyGy+KaS/AF4wKLW436G3N0Yf
   luTQ2wJ4CQkIgNMa+3h5/w/N+B0FM/rdIGNw/1bcH4hECUWftq4Ct2+Bk
   Q==;
X-CSE-ConnectionGUID: YJIXz5cDRFqYAPULp38j7w==
X-CSE-MsgGUID: /WNwMsZ/TSSTw6EBVKwQIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="29815135"
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; 
   d="scan'208";a="29815135"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 14:41:49 -0700
X-CSE-ConnectionGUID: 46CLzn73TNWkyRPLHCd6qQ==
X-CSE-MsgGUID: Cn81zvCyStyOsJ7Lqsc8lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; 
   d="scan'208";a="75307018"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 23 Sep 2024 14:41:45 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssqoQ-000Hcl-2B;
	Mon, 23 Sep 2024 21:41:42 +0000
Date: Tue, 24 Sep 2024 05:40:55 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 1866/2441]
 drivers/dma/idxd/init.c:493:17: error: implicit declaration of function
 'iommu_enable_pasid_dma'
Message-ID: <202409240550.E7Ldalwy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   63759dec7a1be60e43e98e4257de936b546e4656
commit: 037b509f6a47c89997dd196a8a7b034e4844d1bb [1866/2441] dmaengine: idxd: Use DMA API for in-kernel PASID DMA
config: x86_64-randconfig-075-20240923 (https://download.01.org/0day-ci/archive/20240924/202409240550.E7Ldalwy-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240924/202409240550.E7Ldalwy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409240550.E7Ldalwy-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/iommu.h:16,
                    from drivers/dma/idxd/init.c:18:
   include/linux/ioasid.h:214:51: error: unknown type name 'ioasid_set_type'
     214 |                                                   ioasid_set_type type)
         |                                                   ^~~~~~~~~~~~~~~
   drivers/dma/idxd/init.c: In function 'idxd_enable_system_pasid':
>> drivers/dma/idxd/init.c:493:17: error: implicit declaration of function 'iommu_enable_pasid_dma' [-Werror=implicit-function-declaration]
     493 |         pasid = iommu_enable_pasid_dma(&idxd->pdev->dev);
         |                 ^~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/idxd/init.c: In function 'idxd_disable_system_pasid':
>> drivers/dma/idxd/init.c:505:9: error: implicit declaration of function 'iommu_disable_pasid_dma' [-Werror=implicit-function-declaration]
     505 |         iommu_disable_pasid_dma(&idxd->pdev->dev);
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/iommu_enable_pasid_dma +493 drivers/dma/idxd/init.c

   487	
   488	static int idxd_enable_system_pasid(struct idxd_device *idxd)
   489	{
   490		u32 pasid;
   491		int ret;
   492	
 > 493		pasid = iommu_enable_pasid_dma(&idxd->pdev->dev);
   494		if (pasid == INVALID_IOASID) {
   495			dev_err(&idxd->pdev->dev, "No DMA PASID %d\n", ret);
   496			return ret;
   497		}
   498		idxd->pasid = pasid;
   499	
   500		return 0;
   501	}
   502	
   503	static void idxd_disable_system_pasid(struct idxd_device *idxd)
   504	{
 > 505		iommu_disable_pasid_dma(&idxd->pdev->dev);
   506	}
   507	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
