Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681A1BE65
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Apr 2024 04:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714364787; cv=none; b=RAvUZZMPfD1q/YwzKii8LF5EAQGrNMuKS7k1XI2FMeG9GRYUx2S5OttwcsHwkW+04+D5a4fPUNvpi7VXXqLTVaY2RCRG9SfOCACcHPS7lXcOhpZ5YQ7k3Rkpdg8LiGHqKCOdNVCrW1aZLqTf1xf3S3Xxvp+aD6FhlLLKSX4zY7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714364787; c=relaxed/simple;
	bh=gwkq7RJYzfQUaSp7yQZMRaav8dOcuFEAO5Sn97+iLNg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CSd6HNra44IvwFvmM7+8hs5ZYC4I1Fnj5O7lR76HJIYpP5Vo/2dGFWGhXxqRJdBzDQiXKBJybhEeYd+V8lHTLucwfop2d4gC4NII6nTVd5HrSCYOth3/JVNsuiZuFaXb2cKnPxE3DXri/zWUvOQmW09xbU/l2SbxQ8rcMW6nZ/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=npQ2MFV2; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="npQ2MFV2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714364787; x=1745900787;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gwkq7RJYzfQUaSp7yQZMRaav8dOcuFEAO5Sn97+iLNg=;
  b=npQ2MFV2BVeVlgGzyDrsP5kg+hOuzYugcvkSuMHMF9ARBTKvj5u5nhw3
   RKL+F0vKyHuPn3WkXVTT00weOvu+YQn504blkedQJ7pwqRdg/rOVh7OZv
   WK8dMIyshBuestO4MFSlfKRTF/mJaP4e3qcJ4jgzG4S44mpc3EfahE4ox
   xCyq/5NtFQxWYyoHvEJH/HX2h2a984l6rPOZLKJaXCfQigY2kCYs9cFYW
   zG/bWWmsbkOkZRDz1jZa1Nu+ZNoSc/cKXGTDaOEJgrsB3l/v0fF+S1N01
   aOcofRprcUGjLU3zuxFYdc/99B8ejnFFaTaxUqobdCGkzdrAxpaEx3M9f
   Q==;
X-CSE-ConnectionGUID: i07TUsKuSs6pzrJAenXvBg==
X-CSE-MsgGUID: FJTyXS8ASLWqrZHvbmoCiA==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="27465541"
X-IronPort-AV: E=Sophos;i="6.07,238,1708416000"; 
   d="scan'208";a="27465541"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2024 21:26:27 -0700
X-CSE-ConnectionGUID: wInJ0NsTTRWw9Tr14SXaNA==
X-CSE-MsgGUID: ll37BANHQTmSi+6APqg3bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,238,1708416000"; 
   d="scan'208";a="30657153"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 28 Apr 2024 21:26:26 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1Ias-0006wY-2J;
	Mon, 29 Apr 2024 04:26:22 +0000
Date: Mon, 29 Apr 2024 12:26:10 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-1.0.x-imx 5709/11728]
 drivers/phy/freescale/phy-fsl-imx9-dphy-rx.c:463:25: error:
 'dw_dphy_rx_of_match' undeclared here (not in a function); did you mean
 'dw_dphy_of_match'?
Message-ID: <202404291228.zlQce2Yg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-1.0.x-imx
head:   37770f55ac9c4f6cd958eb5544939207eed8478f
commit: b54285687522c3323609c2b26e083a6751abf3e6 [5709/11728] LF-10587-06: phy: freescale: add MIPI DPHY Rx driver for iMX9 family
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240429/202404291228.zlQce2Yg-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240429/202404291228.zlQce2Yg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404291228.zlQce2Yg-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/phy/freescale/phy-fsl-imx9-dphy-rx.c:11:
>> drivers/phy/freescale/phy-fsl-imx9-dphy-rx.c:463:25: error: 'dw_dphy_rx_of_match' undeclared here (not in a function); did you mean 'dw_dphy_of_match'?
     463 | MODULE_DEVICE_TABLE(of, dw_dphy_rx_of_match);
         |                         ^~~~~~~~~~~~~~~~~~~
   include/linux/module.h:244:15: note: in definition of macro 'MODULE_DEVICE_TABLE'
     244 | extern typeof(name) __mod_##type##__##name##_device_table               \
         |               ^~~~
>> include/linux/module.h:244:21: error: '__mod_of__dw_dphy_rx_of_match_device_table' aliased to undefined symbol 'dw_dphy_rx_of_match'
     244 | extern typeof(name) __mod_##type##__##name##_device_table               \
         |                     ^~~~~~
   drivers/phy/freescale/phy-fsl-imx9-dphy-rx.c:463:1: note: in expansion of macro 'MODULE_DEVICE_TABLE'
     463 | MODULE_DEVICE_TABLE(of, dw_dphy_rx_of_match);
         | ^~~~~~~~~~~~~~~~~~~


vim +463 drivers/phy/freescale/phy-fsl-imx9-dphy-rx.c

   457	
   458	static const struct of_device_id dw_dphy_of_match[] = {
   459		{ .compatible = "fsl,imx93-dphy-rx", .data = &imx93_dphy_drvdata},
   460		{ .compatible = "fsl,imx95-dphy-rx", .data = &imx95_dphy_drvdata},
   461		{ /* sentinel */ }
   462	};
 > 463	MODULE_DEVICE_TABLE(of, dw_dphy_rx_of_match);
   464	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
