Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EEFB1552E4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Sep 2024 16:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727366794; cv=none; b=my0T/6DHHfzPR0NPp7cq3+jCsCqRtb+e9xKtBSEUySh8ITNHIa61Lf/j4YCkEnFg1j/0tzZtGK0wKxAMr5/sYMX8AbhSZ2kSTTEV7Drwze57P953NUcq0aE3m4olzeQ4nDM49r3I7cML1AzPYA23JSKzkiCGkAPuzNM0zaefecs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727366794; c=relaxed/simple;
	bh=5gXN89gY9zRr+iSqIH/dJe1+mWVedRXUKzsADSjC5Fg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CDb0X32hs3j1aQS0hMOkenXicJhPw+G3clkygIiaMRFJGOG433w8JEk7Y8nn9n7Ux6HXdFbjkAXmMVwp1w4/hVLdcdSbFuFCTl8w+D0F9CJfwKmtCu+QPjC5gxrOW5HS1GVc9nU7Ngh2uK28JD2u4hfqp51b1193X2XSjnCQ+vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N9JoGXoZ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N9JoGXoZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727366792; x=1758902792;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5gXN89gY9zRr+iSqIH/dJe1+mWVedRXUKzsADSjC5Fg=;
  b=N9JoGXoZ6n7Hlj17v1Pvuhunw5o+RabhlWr1TSzdwW04PYJmAYkwB0k9
   hHfkbYPCw6vYsFg3z7IAnXMvm8G8J2vXSItCwvphOh243QBNx+0VZexiJ
   ZRAPCRF21eGh4WgNBkcyL2N6xofnOHYEhdVUnVVBeD/i8+NY091+YYaLW
   3jDjVTG9CEgzJOKa70u+/Q45rzD37t5dq+fE4iLpKvnRriZPGb9a9ZnxE
   n6e5t5Z00mC+FRO/E+m+ZG8NA7jqgmS7jtSv6XhfRWXFgsSADSNUyKWRe
   sELusuWKHzhwxcMmXt9G2254JVfG+hcjphQGbIQFVdGtilwiUOpPMEYuS
   g==;
X-CSE-ConnectionGUID: 0r2iEFCmQSmHA962SoQzoA==
X-CSE-MsgGUID: NOPj5WYdTBmUIgnUjaSWdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="25982712"
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; 
   d="scan'208";a="25982712"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 09:06:30 -0700
X-CSE-ConnectionGUID: 2iiiNbjqRAq95D0tNZc7LA==
X-CSE-MsgGUID: 35p7xD4CS1uS3B9GbnflLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; 
   d="scan'208";a="72526441"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 26 Sep 2024 09:06:27 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1str0b-000Kuv-0S;
	Thu, 26 Sep 2024 16:06:25 +0000
Date: Fri, 27 Sep 2024 00:05:42 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 232/2443]
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c:728:31: error: 'struct device' has
 no member named 'iommu_fwspec'
Message-ID: <202409262306.PD5PWMZv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   9d665359e14c559b74a94a55057e9c0fbd31a81a
commit: af26f4f021e66233136ec1ec03363a08cbef4da0 [232/2443] iommu: Move iommu_fwspec to struct dev_iommu
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240926/202409262306.PD5PWMZv-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240926/202409262306.PD5PWMZv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409262306.PD5PWMZv-lkp@intel.com/

Note: the opencloudos/linux-5.4/lts/5.4.119-20.0009.spr HEAD 9d665359e14c559b74a94a55057e9c0fbd31a81a builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c:310:5: warning: no previous prototype for 'mdp5_disable' [-Wmissing-prototypes]
     310 | int mdp5_disable(struct mdp5_kms *mdp5_kms)
         |     ^~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c:326:5: warning: no previous prototype for 'mdp5_enable' [-Wmissing-prototypes]
     326 | int mdp5_enable(struct mdp5_kms *mdp5_kms)
         |     ^~~~~~~~~~~
   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c: In function 'modeset_init':
   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c:469:35: warning: variable 'hw_cfg' set but not used [-Wunused-but-set-variable]
     469 |         const struct mdp5_cfg_hw *hw_cfg;
         |                                   ^~~~~~
   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c: In function 'mdp5_kms_init':
>> drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c:728:31: error: 'struct device' has no member named 'iommu_fwspec'
     728 |                 if (!iommu_dev->iommu_fwspec)
         |                               ^~


vim +728 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c

e2dd9f9ffa7fff drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja       2015-10-26  677  
06c0dd96bfbba8 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Rob Clark           2013-11-30  678  struct msm_kms *mdp5_kms_init(struct drm_device *dev)
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja       2016-06-14  679  {
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja       2016-06-14  680  	struct msm_drm_private *priv = dev->dev_private;
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja       2016-06-14  681  	struct platform_device *pdev;
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja       2016-06-14  682  	struct mdp5_kms *mdp5_kms;
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja       2016-06-14  683  	struct mdp5_cfg *config;
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja       2016-06-14  684  	struct msm_kms *kms;
667ce33e57d0de drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Rob Clark           2016-09-28  685  	struct msm_gem_address_space *aspace;
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja       2016-06-14  686  	int irq, i, ret;
518304cbf3b245 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c Jeffrey Hugo        2019-07-08  687  	struct device *iommu_dev;
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja       2016-06-14  688  
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja       2016-06-14  689  	/* priv->kms would have been populated by the MDP5 driver */
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja       2016-06-14  690  	kms = priv->kms;
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja       2016-06-14  691  	if (!kms)
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja       2016-06-14  692  		return NULL;
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja       2016-06-14  693  
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja       2016-06-14  694  	mdp5_kms = to_mdp5_kms(to_mdp_kms(kms));
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja       2016-06-14  695  
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja       2016-06-14  696  	mdp_kms_init(&mdp5_kms->base, &kms_funcs);
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja       2016-06-14  697  
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja       2016-06-14  698  	pdev = mdp5_kms->pdev;
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja       2016-06-14  699  
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja       2016-06-14  700  	irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja       2016-06-14  701  	if (irq < 0) {
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja       2016-06-14  702  		ret = irq;
6a41da17e87dee drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c Mamta Shukla        2018-10-20  703  		DRM_DEV_ERROR(&pdev->dev, "failed to get irq: %d\n", ret);
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja       2016-06-14  704  		goto fail;
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja       2016-06-14  705  	}
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja       2016-06-14  706  
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja       2016-06-14  707  	kms->irq = irq;
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja       2016-06-14  708  
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja       2016-06-14  709  	config = mdp5_cfg_get_config(mdp5_kms->cfg);
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja       2016-06-14  710  
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja       2016-06-14  711  	/* make sure things are off before attaching iommu (bootloader could
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja       2016-06-14  712  	 * have left things on, in which case we'll start getting faults if
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja       2016-06-14  713  	 * we don't disable):
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja       2016-06-14  714  	 */
d68fe15b1878ac drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja       2017-07-28  715  	pm_runtime_get_sync(&pdev->dev);
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja       2016-06-14  716  	for (i = 0; i < MDP5_INTF_NUM_MAX; i++) {
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja       2016-06-14  717  		if (mdp5_cfg_intf_is_virtual(config->hw->intf.connect[i]) ||
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja       2016-06-14  718  		    !config->hw->intf.base[i])
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja       2016-06-14  719  			continue;
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja       2016-06-14  720  		mdp5_write(mdp5_kms, REG_MDP5_INTF_TIMING_ENGINE_EN(i), 0);
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja       2016-06-14  721  
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja       2016-06-14  722  		mdp5_write(mdp5_kms, REG_MDP5_INTF_FRAME_LINE_COUNT_EN(i), 0x3);
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja       2016-06-14  723  	}
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja       2016-06-14  724  	mdelay(16);
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja       2016-06-14  725  
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja       2016-06-14  726  	if (config->platform.iommu) {
518304cbf3b245 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c Jeffrey Hugo        2019-07-08  727  		iommu_dev = &pdev->dev;
518304cbf3b245 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c Jeffrey Hugo        2019-07-08 @728  		if (!iommu_dev->iommu_fwspec)
518304cbf3b245 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c Jeffrey Hugo        2019-07-08  729  			iommu_dev = iommu_dev->parent;
518304cbf3b245 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c Jeffrey Hugo        2019-07-08  730  
518304cbf3b245 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c Jeffrey Hugo        2019-07-08  731  		aspace = msm_gem_address_space_create(iommu_dev,
667ce33e57d0de drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Rob Clark           2016-09-28  732  				config->platform.iommu, "mdp5");
667ce33e57d0de drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Rob Clark           2016-09-28  733  		if (IS_ERR(aspace)) {
667ce33e57d0de drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Rob Clark           2016-09-28  734  			ret = PTR_ERR(aspace);
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja       2016-06-14  735  			goto fail;
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja       2016-06-14  736  		}
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja       2016-06-14  737  
f59f62d592a055 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Rob Clark           2017-06-13  738  		kms->aspace = aspace;
667ce33e57d0de drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Rob Clark           2016-09-28  739  
667ce33e57d0de drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Rob Clark           2016-09-28  740  		ret = aspace->mmu->funcs->attach(aspace->mmu, iommu_ports,
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja       2016-06-14  741  				ARRAY_SIZE(iommu_ports));
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja       2016-06-14  742  		if (ret) {
6a41da17e87dee drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c Mamta Shukla        2018-10-20  743  			DRM_DEV_ERROR(&pdev->dev, "failed to attach iommu: %d\n",
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja       2016-06-14  744  				ret);
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja       2016-06-14  745  			goto fail;
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja       2016-06-14  746  		}
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja       2016-06-14  747  	} else {
6a41da17e87dee drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c Mamta Shukla        2018-10-20  748  		DRM_DEV_INFO(&pdev->dev,
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja       2016-06-14  749  			 "no iommu, fallback to phys contig buffers for scanout\n");
52a8988de97f5e drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Luis de Bethencourt 2018-01-17  750  		aspace = NULL;
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja       2016-06-14  751  	}
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja       2016-06-14  752  
3c352b66905b29 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Rob Clark           2017-10-20  753  	pm_runtime_put_sync(&pdev->dev);
d68fe15b1878ac drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja       2017-07-28  754  
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja       2016-06-14  755  	ret = modeset_init(mdp5_kms);
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja       2016-06-14  756  	if (ret) {
6a41da17e87dee drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c Mamta Shukla        2018-10-20  757  		DRM_DEV_ERROR(&pdev->dev, "modeset_init failed: %d\n", ret);
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja       2016-06-14  758  		goto fail;
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja       2016-06-14  759  	}
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja       2016-06-14  760  
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja       2016-06-14  761  	dev->mode_config.min_width = 0;
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja       2016-06-14  762  	dev->mode_config.min_height = 0;
9708ebbe1728e5 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Rob Clark           2016-11-05  763  	dev->mode_config.max_width = 0xffff;
9708ebbe1728e5 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Rob Clark           2016-11-05  764  	dev->mode_config.max_height = 0xffff;
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja       2016-06-14  765  
1bf6ad622b9be5 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Daniel Vetter       2017-05-09  766  	dev->driver->get_vblank_timestamp = drm_calc_vbltimestamp_from_scanoutpos;
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja       2016-06-14  767  	dev->driver->get_scanout_position = mdp5_get_scanoutpos;
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja       2016-06-14  768  	dev->driver->get_vblank_counter = mdp5_get_vblank_counter;
2bab52af6fe68c drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c Brian Masney        2019-05-31  769  	dev->max_vblank_count = 0; /* max_vblank_count is set on each CRTC */
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja       2016-06-14  770  	dev->vblank_disable_immediate = true;
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja       2016-06-14  771  
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja       2016-06-14  772  	return kms;
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja       2016-06-14  773  fail:
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja       2016-06-14  774  	if (kms)
392ae6e0efa5e2 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja       2016-06-14  775  		mdp5_kms_destroy(kms);
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja       2016-06-14  776  	return ERR_PTR(ret);
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja       2016-06-14  777  }
aec095ecbcc706 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c  Archit Taneja       2016-06-14  778  

:::::: The code at line 728 was first introduced by commit
:::::: 518304cbf3b2452e1e592e06bed65baced0a530d drm/msm/mdp5: Find correct node for creating gem address space

:::::: TO: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
:::::: CC: Rob Clark <robdclark@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
