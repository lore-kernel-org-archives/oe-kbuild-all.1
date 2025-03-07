Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBECE219E98
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Mar 2025 18:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741372729; cv=none; b=P+KfKA6ib+OmuQAeTRlcP1054tF7UvklzvMjVp//Cv6t+iQFIOE7iFijH7COVh+eMCCHfUESFvD+Jnj1ZRhcQHpiZw4sgWu+Bt6B6fxcc1Q9LUMNRwhrkTMWjxinP3DUGYHPA153w6MRJiEip4KznC9kYqCFkOXqlORvGPTTaaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741372729; c=relaxed/simple;
	bh=r7dcldOhANKEkZ4dRi/fH2du0vrXWes+A6Jc06AVwDA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Wui4JIjLVwSB2xFbnlFceRkYQWPbY7PK7rkyyeEEE09En7maW60UqgzVikEFKvMsMNpIcbS1TaVMOiljAdyp4PonjhZ/Z9qLeHtoQTzDoMnhixXOanflObcntkXXX5zz19PZo6UOhoQ4eLON8LSwYJPPZ6ezook2rIufxxm4NEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HzaxIrHJ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HzaxIrHJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741372728; x=1772908728;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r7dcldOhANKEkZ4dRi/fH2du0vrXWes+A6Jc06AVwDA=;
  b=HzaxIrHJ2HD1xXs2cHu+65kqPRGng4ztCb9D3BxXAafdHItFk8TiOTOS
   7LGQdimfrbQzjbBf1ULhGDvXcYjmXMTtkzXUatgRqJcYLnTSxBGbcdE5Y
   S3a5FogwVrw707biYREFLXUxdl7JinHxhYUJ5+TxmVCzu35KGNVIX6jRt
   clwxOWq0z2hbIDLiINp2S5PeS7qgXPTgN29rMsROT3dL2wGoVkUSsjdcJ
   NxbPFeaMKlOyqyIBBZJBp5JQRaduMzyBfKS8hjqbLzZoLiLMV8t4AphIT
   CeY5Oyt/Ej1ZODAslERWlv0Jp+twDdqKbmXJ//xw/SarK+AfBh/JvBFHU
   Q==;
X-CSE-ConnectionGUID: Po8OW0FsQsujGakyrmiMQg==
X-CSE-MsgGUID: W4e7W3DHQTSkJq9rwgk9qA==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="42573538"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="42573538"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 10:38:47 -0800
X-CSE-ConnectionGUID: IMw6SSneTa+Jnql2XyF5gQ==
X-CSE-MsgGUID: GVFPRx1MRU24n2/Zlh59Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="150349545"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 07 Mar 2025 10:38:46 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqcaf-0000vb-2l;
	Fri, 07 Mar 2025 18:38:35 +0000
Date: Sat, 8 Mar 2025 02:38:08 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Skeggs <bskeggs@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Dave Airlie <airlied@redhat.com>
Subject: [jfern:nova-core-experiments 192/411]
 drivers/gpu/drm/nouveau/nouveau_drm.c:824:1: warning: label
 'fail_drm_dev_init' defined but not used
Message-ID: <202503080248.u5FhxSv3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova-core-experiments
head:   3b93174b3502247b0c46bd54a7cf5f4105274edb
commit: d5f4619b33f18fda53df3bd2b5608cc78d5798b0 [192/411] drm/nouveau/nvkm: move pci probe() enable/disable handling from drm
config: csky-randconfig-002-20250307 (https://download.01.org/0day-ci/archive/20250308/202503080248.u5FhxSv3-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250308/202503080248.u5FhxSv3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503080248.u5FhxSv3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/nouveau/nouveau_drm.c: In function 'nouveau_drm_probe':
>> drivers/gpu/drm/nouveau/nouveau_drm.c:824:1: warning: label 'fail_drm_dev_init' defined but not used [-Wunused-label]
     824 | fail_drm_dev_init:
         | ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_drm.c: In function 'nouveau_drm_device_remove':
   drivers/gpu/drm/nouveau/nouveau_drm.c:836:29: warning: unused variable 'device' [-Wunused-variable]
     836 |         struct nvkm_device *device = drm->nvkm;
         |                             ^~~~~~
   drivers/gpu/drm/nouveau/nouveau_drm.c: At top level:
   drivers/gpu/drm/nouveau/nouveau_drm.c:484:1: warning: 'nouveau_driver' defined but not used [-Wunused-const-variable=]
     484 | nouveau_driver = {
         | ^~~~~~~~~~~~~~


vim +/fail_drm_dev_init +824 drivers/gpu/drm/nouveau/nouveau_drm.c

   786	
   787	static int nouveau_drm_probe(struct pci_dev *pdev,
   788				     const struct pci_device_id *pent)
   789	{
   790		struct nvkm_device *device;
   791		struct nouveau_drm *drm;
   792		int ret;
   793	
   794		/* We need to check that the chipset is supported before booting
   795		 * fbdev off the hardware, as there's no way to put it back.
   796		 */
   797		ret = nvkm_device_pci_driver.probe(pdev, NULL);
   798		if (ret)
   799			return ret;
   800	
   801		device = pci_get_drvdata(pdev);
   802	
   803		if (nouveau_atomic)
   804			driver_pci.driver_features |= DRIVER_ATOMIC;
   805	
   806		drm = nouveau_drm_device_new(&driver_pci, &pdev->dev, device);
   807		if (IS_ERR(drm)) {
   808			ret = PTR_ERR(drm);
   809			goto fail_nvkm;
   810		}
   811	
   812		ret = nouveau_drm_device_init(drm);
   813		if (ret)
   814			goto fail_drm;
   815	
   816		if (drm->device.impl->ram_size <= 32 * 1024 * 1024)
   817			drm_fbdev_ttm_setup(drm->dev, 8);
   818		else
   819			drm_fbdev_ttm_setup(drm->dev, 32);
   820	
   821		quirk_broken_nv_runpm(pdev);
   822		return 0;
   823	
 > 824	fail_drm_dev_init:
   825		nouveau_drm_device_fini(drm);
   826	fail_drm:
   827		nouveau_drm_device_del(drm);
   828	fail_nvkm:
   829		nvkm_device_del(&device);
   830		return ret;
   831	}
   832	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
