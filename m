Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28CB0208A7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Dec 2024 03:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733801677; cv=none; b=gwGK8LRymRhoK9qn2ADgJq3IMOle7h3o3+kg/fVB/lHpdzTMpGWlv6r6CDtod9/WFeEzu1h6DM9tiG3W65OkfWgMJpqE90OPL/z6gnlWYV8skp3vPFGhDVQaMma5+8xV0LXTb8ss1qx6Vsvp052yejs6lcsRIDtV32NMiNlx3s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733801677; c=relaxed/simple;
	bh=ZTzWUoE++qWyi8cXQxL/3I+mXhx6k+M0mecrG1FHbGI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mA6OeGyFzZ3ALshltRZRQrR/dKff8/akG86Ao5Bf/2lca5G3joPLseknV5+zNZjaTavye4Kr2MmaHaw03ly9lLeI7K82CBSBkJE1YgmhSsfVIKym91KID+VJ/SRXRINT+IgktT6/IPOtbQU/kR7rG4NDOrwLPadTMobx8gy4M/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lixue8XL; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lixue8XL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733801676; x=1765337676;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZTzWUoE++qWyi8cXQxL/3I+mXhx6k+M0mecrG1FHbGI=;
  b=lixue8XLQ+UKE9+VTZ5Dm1VcX8R6M7qRTWktVPs+t0O1CehBdWg5+DbS
   FpMwBJ3IfKqCo+7WD5uEU5Wj0TIIWU1+bzU6StXdg16OxkLRvlYzAZ1WU
   rsc37GBpJ3iJkBI02LVX2YlUZGBNRe8Rv/70vTn0EAnFl5Wt71PPXJMcv
   v4EWiC3qPaYyg/PjFs2sLUypzHA8QD+NuYhgFt91qx2n0OMubjdZOV+xx
   1GqMBpAxDe00EPdPzl5VERftSMAAcOz5Zj38oVxoDTseXusottIvv/qJg
   78acy1DBXkoJUNdXOFJ3i3ZGRyhHtRU5nCHquJ2euzRnIRI8GxcZiEl9R
   w==;
X-CSE-ConnectionGUID: Qu+bW2f/R3Ceglxqc7/6kw==
X-CSE-MsgGUID: LZd5RNv+SBOErdzAI4rxNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="45526389"
X-IronPort-AV: E=Sophos;i="6.12,221,1728975600"; 
   d="scan'208";a="45526389"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 19:34:35 -0800
X-CSE-ConnectionGUID: p8k1JFbXRamaXQqSN3Gx3w==
X-CSE-MsgGUID: REmaxjhVQHW433WerSBkDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,221,1728975600"; 
   d="scan'208";a="100223337"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 09 Dec 2024 19:34:33 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKr15-00054N-1h;
	Tue, 10 Dec 2024 03:34:31 +0000
Date: Tue, 10 Dec 2024 11:34:27 +0800
From: kernel test robot <lkp@intel.com>
To: Philipp Stanner <pstanner@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [linux-next:master 661/2442]
 drivers/gpu/drm/loongson/lsdc_drv.c:237:28: sparse: sparse: incorrect type
 in return expression (different address spaces)
Message-ID: <202412101132.GMUw6CW5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d1486dca38afd08ca279ae94eb3a397f10737824
commit: ca053ee3c6a7a877754e6f444ce5f520e3c0a856 [661/2442] drm/lsdc: Request PCI BAR
config: sparc64-randconfig-r131-20241209 (https://download.01.org/0day-ci/archive/20241210/202412101132.GMUw6CW5-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241210/202412101132.GMUw6CW5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412101132.GMUw6CW5-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/loongson/lsdc_drv.c:237:28: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct lsdc_device * @@     got void [noderef] __iomem *reg_base @@
   drivers/gpu/drm/loongson/lsdc_drv.c:237:28: sparse:     expected struct lsdc_device *
   drivers/gpu/drm/loongson/lsdc_drv.c:237:28: sparse:     got void [noderef] __iomem *reg_base

vim +237 drivers/gpu/drm/loongson/lsdc_drv.c

   191	
   192	static struct lsdc_device *
   193	lsdc_create_device(struct pci_dev *pdev,
   194			   const struct lsdc_desc *descp,
   195			   const struct drm_driver *driver)
   196	{
   197		struct lsdc_device *ldev;
   198		struct drm_device *ddev;
   199		int ret;
   200	
   201		ldev = devm_drm_dev_alloc(&pdev->dev, driver, struct lsdc_device, base);
   202		if (IS_ERR(ldev))
   203			return ldev;
   204	
   205		ldev->dc = pdev;
   206		ldev->descp = descp;
   207	
   208		ddev = &ldev->base;
   209	
   210		loongson_gfxpll_create(ddev, &ldev->gfxpll);
   211	
   212		ret = lsdc_get_dedicated_vram(ldev, pdev, descp);
   213		if (ret) {
   214			drm_err(ddev, "Init VRAM failed: %d\n", ret);
   215			return ERR_PTR(ret);
   216		}
   217	
   218		ret = aperture_remove_conflicting_devices(ldev->vram_base,
   219							  ldev->vram_size,
   220							  driver->name);
   221		if (ret) {
   222			drm_err(ddev, "Remove firmware framebuffers failed: %d\n", ret);
   223			return ERR_PTR(ret);
   224		}
   225	
   226		ret = lsdc_ttm_init(ldev);
   227		if (ret) {
   228			drm_err(ddev, "Memory manager init failed: %d\n", ret);
   229			return ERR_PTR(ret);
   230		}
   231	
   232		lsdc_gem_init(ddev);
   233	
   234		/* Bar 0 of the DC device contains the MMIO register's base address */
   235		ldev->reg_base = pcim_iomap_region(pdev, 0, "lsdc");
   236		if (IS_ERR(ldev->reg_base))
 > 237			return ldev->reg_base;
   238	
   239		spin_lock_init(&ldev->reglock);
   240	
   241		ret = lsdc_mode_config_init(ddev, descp);
   242		if (ret)
   243			return ERR_PTR(ret);
   244	
   245		ret = lsdc_modeset_init(ldev, descp->num_of_crtc, descp->funcs,
   246					loongson_vblank);
   247		if (ret)
   248			return ERR_PTR(ret);
   249	
   250		drm_mode_config_reset(ddev);
   251	
   252		return ldev;
   253	}
   254	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
