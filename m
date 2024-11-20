Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8EF1BC58
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Nov 2024 01:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732065153; cv=none; b=I13d45r6y0Wv6TcNQtQt6tE0lHi4VNPrBQR9TXmrnvn5qkuq7f8jSejMgGhmwik2nNu7TBgfpqXKmSPX19Cvo0k6aLUXfaYl1lO9aOUjeWTfUBRejo9awVPWx6nubcDv3C9xnyucSSJbLHxQK07IoqYztezpdGLi0lErhEcnSg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732065153; c=relaxed/simple;
	bh=z1H+xGpWyRTkDSLyunhwnG1KSu+ugg40JQxw5FZMKU4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OBeuX81wXv+j1zz4Lj+/6qI3iT9u3R5c/1xawLEyaTli73m/PCZ0glcAUYRb/Hx2QEqywUUZBKVIFVzhstMOtPzm/J8nw225esOK2wlgigy/RkNKPw9eZLXNU06RpTdWwGdCi75nfduZ8E4x/DNXRwR8Ek3AD/XJ+2QxdYEWh68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M40z0J47; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M40z0J47"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732065152; x=1763601152;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z1H+xGpWyRTkDSLyunhwnG1KSu+ugg40JQxw5FZMKU4=;
  b=M40z0J47zfx9iYeCYdg6mJ0RaJt33vUCZNydR+SV+JwDv9+QZDos1ES9
   EAUdmf5aysDMHUG3aFUi4LGu+a6vMn2qdXKRvPRxwiEFbrlS3iJlAjuYM
   ScE9l6fY1u1ZYy4S4bIE2uPDbkHndvjeq74AxidG4pmvOPJev97FwOfXo
   hHG4XDXcnT2CvDZN+pswqaP7J1/B9d+TyLSUjjPjIihLfuPSxk79TiaLg
   CcbuuxhtGZPNEpfOOFzChrYXtLIJzbFz1O7buNQvJZRhUvlcL2qcp6KPp
   DQ4q4gSdESdjMt6Z5HR8/aY2iYUtkQDRGmCc6cb+m6FCLmqKdx0XdmpPO
   g==;
X-CSE-ConnectionGUID: B0MuZzGRTSuk5AujQRptyw==
X-CSE-MsgGUID: d4dnMoVoSr2ZqzFhFjtVOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="54602152"
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; 
   d="scan'208";a="54602152"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2024 17:12:30 -0800
X-CSE-ConnectionGUID: Hs9XzVi+Tpuatz90syS6zw==
X-CSE-MsgGUID: K/z4Kz4eR1CN2M4+uuR34A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="94805479"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 19 Nov 2024 17:12:29 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDZGc-0000Oh-1M;
	Wed, 20 Nov 2024 01:12:26 +0000
Date: Wed, 20 Nov 2024 09:11:48 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Dave Jiang <dave.jiang@intel.com>
Subject: [jgunthorpe:fwctl 20/23] drivers/cxl/core/memdev.c:1067: undefined
 reference to `auxiliary_device_init'
Message-ID: <202411191902.lsih7Yrv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux fwctl
head:   e4450fb1459bf712009c7cb1461643287e0f9e75
commit: e7b7ae31414a4f3db3fecb2bab0a2f101fff1bcf [20/23] cxl: Create an auxiliary device for fwctl_cxl
config: x86_64-randconfig-003-20241119 (https://download.01.org/0day-ci/archive/20241119/202411191902.lsih7Yrv-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241119/202411191902.lsih7Yrv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411191902.lsih7Yrv-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `devm_cxl_add_memdev':
>> drivers/cxl/core/memdev.c:1067: undefined reference to `auxiliary_device_init'
>> ld: drivers/cxl/core/memdev.c:1071: undefined reference to `__auxiliary_device_add'


vim +1067 drivers/cxl/core/memdev.c

  1031	
  1032	struct cxl_memdev *devm_cxl_add_memdev(struct device *host,
  1033					       struct cxl_dev_state *cxlds)
  1034	{
  1035		struct auxiliary_device *adev;
  1036		struct cxl_memdev *cxlmd;
  1037		struct device *dev;
  1038		struct cdev *cdev;
  1039		int rc;
  1040	
  1041		cxlmd = cxl_memdev_alloc(cxlds, &cxl_memdev_fops);
  1042		if (IS_ERR(cxlmd))
  1043			return cxlmd;
  1044	
  1045		dev = &cxlmd->dev;
  1046		rc = dev_set_name(dev, "mem%d", cxlmd->id);
  1047		if (rc)
  1048			goto err;
  1049	
  1050		/*
  1051		 * Activate ioctl operations, no cxl_memdev_rwsem manipulation
  1052		 * needed as this is ordered with cdev_add() publishing the device.
  1053		 */
  1054		cxlmd->cxlds = cxlds;
  1055		cxlds->cxlmd = cxlmd;
  1056	
  1057		cdev = &cxlmd->cdev;
  1058		rc = cdev_device_add(cdev, dev);
  1059		if (rc)
  1060			goto err;
  1061	
  1062		adev = &cxlds->cxl_mbox.adev;
  1063		adev->id = cxlmd->id;
  1064		adev->name = CXL_ADEV_NAME;
  1065		adev->dev.parent = dev;
  1066	
> 1067		rc = auxiliary_device_init(adev);
  1068		if (rc)
  1069			goto err;
  1070	
> 1071		rc = auxiliary_device_add(adev);
  1072		if (rc)
  1073			goto aux_err;
  1074	
  1075		rc = devm_add_action_or_reset(host, cxl_memdev_unregister, cxlmd);
  1076		if (rc)
  1077			return ERR_PTR(rc);
  1078		return cxlmd;
  1079	
  1080	aux_err:
  1081		auxiliary_device_uninit(adev);
  1082	
  1083	err:
  1084		/*
  1085		 * The cdev was briefly live, shutdown any ioctl operations that
  1086		 * saw that state.
  1087		 */
  1088		cxl_memdev_shutdown(dev);
  1089		put_device(dev);
  1090		return ERR_PTR(rc);
  1091	}
  1092	EXPORT_SYMBOL_NS_GPL(devm_cxl_add_memdev, CXL);
  1093	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
