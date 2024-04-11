Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E055960DE9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Apr 2024 03:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712807587; cv=none; b=ocy4vJYPXwqSjSqwQn0MVG5jtsYEXXxK7yQODIhKp69plk72kpOrssu+HKs/VzQRr+IfnEuVH+AJB8kicLCfyh6/+qAb5vAwXLVz1vll2iaB6ynKekWZKM50rA/1mGpEBUitdt06r0nVG+PTykd6Rb7nMFjVQ9SvYiXaHsOmSsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712807587; c=relaxed/simple;
	bh=6TxJ6COfxdu6lKr8ORCAi750A/1Qg9hxe/ieubLa9MU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e9d3doeylboUY8ZYnPNq7TOsNYn/yezjrrUs6TpPKkYwS2P93OPDzvDDK+uVwDSAPni/g/rcCE1Q+Z9S0YJ3WMcODeMsBVoBRZwc904CuYVycmNzEpJIYMV8VfxVzCAiP2Y2rROk8K1ItiL2ZuJ/wUT6LsJRdMfISYqcBVHPLYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m6zBYS/K; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m6zBYS/K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712807586; x=1744343586;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6TxJ6COfxdu6lKr8ORCAi750A/1Qg9hxe/ieubLa9MU=;
  b=m6zBYS/KqpBp0KNZ+vEFuu7GqX3GKzk8SvVN4+320kzmy45QkyczJQ1Q
   XoSC671Hdxk3Bq58VkbaNOuJWxZCihLhRb+ygz0kel0ih5q4Q2RF55iEO
   1jhzQv+gJULlyIsZVaYhmGa997A6STUZz1kDF8QPyUIS47RdeNbTkdx15
   enWppEL5TeWvAdlvwZ2jMZKKAoVA2R1Pt2kW6VHTUmAtHod3739MiEp/9
   XWtueoAfZ2fRtZRPW3VscpXtdw4HLfTxrqsTXOtTLD8vhSxhqMEC/3Ywr
   ia+ZObCpBX6+F+7qDebt4qU0hVh0yCz+6h24yoVAROe4AKQRyJ4fn4WYB
   g==;
X-CSE-ConnectionGUID: S+Dl5QLcQxuLThZo8rlSpQ==
X-CSE-MsgGUID: Wld3zUZVRZ+g7gnzgQB40g==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8420892"
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; 
   d="scan'208";a="8420892"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 20:53:05 -0700
X-CSE-ConnectionGUID: YUJk/f2wQb2HbdlKltfH6g==
X-CSE-MsgGUID: l0spxivGRpSWASifAXEwlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; 
   d="scan'208";a="25255331"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 10 Apr 2024 20:53:04 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rulUj-0008Bi-1m;
	Thu, 11 Apr 2024 03:53:01 +0000
Date: Thu, 11 Apr 2024 11:52:23 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:clk-reset-stuff 6/6] drivers/reset/reset-mpfs.c:144:19:
 sparse: sparse: incorrect type in assignment (different address spaces)
Message-ID: <202404111135.TLoWq77k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git clk-reset-stuff
head:   0dfe04a18b7c2cda3245498035e77d9f9cb33a85
commit: 0dfe04a18b7c2cda3245498035e77d9f9cb33a85 [6/6] clock, reset: microchip: move all mpfs reset code to the reset subsystem
config: arm-randconfig-r121-20240411 (https://download.01.org/0day-ci/archive/20240411/202404111135.TLoWq77k-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240411/202404111135.TLoWq77k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404111135.TLoWq77k-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/reset/reset-mpfs.c:144:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *base @@     got void *platform_data @@
   drivers/reset/reset-mpfs.c:144:19: sparse:     expected void [noderef] __iomem *base
   drivers/reset/reset-mpfs.c:144:19: sparse:     got void *platform_data
>> drivers/reset/reset-mpfs.c:211:33: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *platform_data @@     got void [noderef] __iomem *base @@
   drivers/reset/reset-mpfs.c:211:33: sparse:     expected void *platform_data
   drivers/reset/reset-mpfs.c:211:33: sparse:     got void [noderef] __iomem *base

vim +144 drivers/reset/reset-mpfs.c

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
 > 211		adev->dev.platform_data = base;
   212	
   213		return devm_add_action_or_reset(clk_dev, mpfs_reset_unregister_adev, adev);
   214	}
   215	EXPORT_SYMBOL_NS_GPL(mpfs_reset_controller_register, MCHP_CLK_MPFS);
   216	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
