Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4319B1BC4B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Apr 2024 05:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712901034; cv=none; b=GHRJtran8HufXHkH41Di62060mIX0uaK2zYX9kd3tZNQr4Hcpfi1yexuz7/zuE3sPhmRkxhtznOchM3l8QODCTR1mwfnismbUF3yPhSCHTpilxpseugNCjcyigm5rgcqOsci7eTdsM0HqCh3cxNQkf9bk7nAZj2rhXvlqmA4ygw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712901034; c=relaxed/simple;
	bh=KbAWEwupZdZdgQq+3GgTtL4lPXTBfCQ8shCYXEXB1ks=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F8o7vOgpmGVdq3gVnyy6y4U0IuFtX3T+1vqdAYEJ/CmSqe389kBP1jXvaQVjM2QV0oJiOCu/OyjyDIqkRy7i1bgA281fZXvGAGOA+1q1lan22Ld9p/bkFIkjlXVfQrEk26R+rKkvjLaW1pNyp5L75FkXm/yqCsJutX4NEP/Ry2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E3RTYHHG; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E3RTYHHG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712901034; x=1744437034;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KbAWEwupZdZdgQq+3GgTtL4lPXTBfCQ8shCYXEXB1ks=;
  b=E3RTYHHGL88uMkV+W2FQbAnix2ZKbo1DBL3//GmkSLXe7jZcwis1P7w8
   MRwFpVCJz1kuX7WK/Ktq5Kgqmy3op6I0+nkPGNgWl/2U42FAvjyGKEoTw
   y9O7bN0PIgb1P3us1DEEZh+N7x+b96W3IHmdCLrYFB0P7qNtv6dEVUxPS
   7UzpIrsGT9rq7zHmGTtLAmyaosNiy2hur7vef27YRxIzIjV0BZ3Zrl7az
   +Dk6v9XPVsjrHRbWYh+Yxci/Y4XMa7atBMUp79a1U+FlO29ccHvSCZ2Vx
   ktiluPsGg52SMvB1ELVq3ovWG0BDthd2kq8ayd/FbrqzWd+x2guO8ltsc
   g==;
X-CSE-ConnectionGUID: gRV15QC3SSa44j6i8In2zQ==
X-CSE-MsgGUID: h7VUyFydSguB9uTyiDfRuA==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="19495763"
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; 
   d="scan'208";a="19495763"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 22:50:33 -0700
X-CSE-ConnectionGUID: W7y5TuxFT6K/o9+4zPjU1w==
X-CSE-MsgGUID: wR82tURVT/GAZSNiLX9jdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; 
   d="scan'208";a="25674175"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 11 Apr 2024 22:50:31 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rv9nx-0009Qu-0p;
	Fri, 12 Apr 2024 05:50:29 +0000
Date: Fri, 12 Apr 2024 13:50:13 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:clk-reset-stuff 6/6] drivers/reset/reset-mpfs.c:211:33:
 sparse: sparse: incorrect type in assignment (different address spaces)
Message-ID: <202404121335.27aF7jXr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git clk-reset-stuff
head:   d72412f7061d27a8eaf62a6526dda5e4e89a2c19
commit: d72412f7061d27a8eaf62a6526dda5e4e89a2c19 [6/6] clock, reset: microchip: move all mpfs reset code to the reset subsystem
config: powerpc-randconfig-r122-20240412 (https://download.01.org/0day-ci/archive/20240412/202404121335.27aF7jXr-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240412/202404121335.27aF7jXr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404121335.27aF7jXr-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/reset/reset-mpfs.c:144:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *base @@     got void *platform_data @@
   drivers/reset/reset-mpfs.c:144:19: sparse:     expected void [noderef] __iomem *base
   drivers/reset/reset-mpfs.c:144:19: sparse:     got void *platform_data
>> drivers/reset/reset-mpfs.c:211:33: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *platform_data @@     got void [noderef] __iomem * @@
   drivers/reset/reset-mpfs.c:211:33: sparse:     expected void *platform_data
   drivers/reset/reset-mpfs.c:211:33: sparse:     got void [noderef] __iomem *

vim +211 drivers/reset/reset-mpfs.c

   132	
   133	static int mpfs_reset_probe(struct auxiliary_device *adev,
   134				    const struct auxiliary_device_id *id)
   135	{
   136		struct device *dev = &adev->dev;
   137		struct reset_controller_dev *rcdev;
   138		struct mpfs_reset *rst;
   139	
   140		rst = devm_kzalloc(dev, sizeof(*rst), GFP_KERNEL);
   141		if (!rst)
   142			return -ENOMEM;;
   143	
 > 144		rst->base = adev->dev.platform_data;
   145	
   146		rcdev = &rst->rcdev;
   147		rcdev->dev = dev;
   148		rcdev->dev->parent = dev->parent;
   149		rcdev->ops = &mpfs_reset_ops;
   150		rcdev->of_node = dev->parent->of_node;
   151		rcdev->of_reset_n_cells = 1;
   152		rcdev->of_xlate = mpfs_reset_xlate;
   153		rcdev->nr_resets = MPFS_NUM_RESETS;
   154	
   155		return devm_reset_controller_register(dev, rcdev);
   156	}
   157	
   158	static void mpfs_reset_unregister_adev(void *_adev)
   159	{
   160		struct auxiliary_device *adev = _adev;
   161	
   162		auxiliary_device_delete(adev);
   163		auxiliary_device_uninit(adev);
   164	}
   165	
   166	static void mpfs_reset_adev_release(struct device *dev)
   167	{
   168		struct auxiliary_device *adev = to_auxiliary_dev(dev);
   169	
   170		kfree(adev);
   171	}
   172	
   173	static struct auxiliary_device *mpfs_reset_adev_alloc(struct device *clk_dev)
   174	{
   175		struct auxiliary_device *adev;
   176		int ret;
   177	
   178		adev = kzalloc(sizeof(*adev), GFP_KERNEL);
   179		if (!adev)
   180			return ERR_PTR(-ENOMEM);
   181	
   182		adev->name = "reset-mpfs";
   183		adev->dev.parent = clk_dev;
   184		adev->dev.release = mpfs_reset_adev_release;
   185		adev->id = 666u;
   186	
   187		ret = auxiliary_device_init(adev);
   188		if (ret) {
   189			kfree(adev);
   190			return ERR_PTR(ret);
   191		}
   192	
   193		return adev;
   194	}
   195	
   196	int mpfs_reset_controller_register(struct device *clk_dev, void __iomem *base)
   197	{
   198		struct auxiliary_device *adev;
   199		int ret;
   200	
   201		adev = mpfs_reset_adev_alloc(clk_dev);
   202		if (IS_ERR(adev))
   203			return PTR_ERR(adev);
   204	
   205		ret = auxiliary_device_add(adev);
   206		if (ret) {
   207			auxiliary_device_uninit(adev);
   208			return ret;
   209		}
   210	
 > 211		adev->dev.platform_data = (void __iomem *)base;
   212	
   213		return devm_add_action_or_reset(clk_dev, mpfs_reset_unregister_adev, adev);
   214	}
   215	EXPORT_SYMBOL_NS_GPL(mpfs_reset_controller_register, MCHP_CLK_MPFS);
   216	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
