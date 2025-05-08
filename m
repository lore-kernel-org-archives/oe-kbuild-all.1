Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C01122A4C2
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 May 2025 13:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746710047; cv=none; b=JDUumGFQZ093bNGlQnFWdIMqFgRfmPOestU39UskpMxNly1OpfYfEO2DgmGQ3snBWRQ2/utyK7eFoAEsRfNFVsewZ558afR8I9tZ6Gj0w6WKP56Q9UR0Q110BLVgh8DHeFAjrRgqZdRWiTy7VShRaM9PedNki3xlk81zOVrZwG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746710047; c=relaxed/simple;
	bh=xiaCSrnVpauzwq25XP26viwbA1JOX5VnGU7T/cTkiXs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a0bW7RwEK97hR+yQ4RigGgKnOWOs0jmtc0p/hZL7K25bP1lEQ1nYwntfuAcDOJfZd84NlNFnwIiLmGl8K3T7j3FakejK6AB8r4BbclBIDg6YpNl6B0dSwvf43nZd2ThpuDtByxS85uVhOzB6/rlr29l1vlr+TGDSLqd5Cla1EA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PCYRvbFt; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PCYRvbFt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746710046; x=1778246046;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xiaCSrnVpauzwq25XP26viwbA1JOX5VnGU7T/cTkiXs=;
  b=PCYRvbFtVso9ckZF5cjglLO9N6IpvknNSZAQ9XRy5qyH/vaXAqEd25lG
   8BcXm0ZN+O+hPRXhhtS8cCkhaiokObObzf8wClfkfG2gCJ9p2sZPW4WSd
   KX7u/C25sJSc1W+LMiAgNZeErXZd2KHrpKgbdcT3KbdgI1AoDNudWm6sc
   xngZTpnM3vX3ZgtJhGaTBhb4tzZjjdXuky7EzNGphQqqNSwjmwhh1Vl6d
   S9yy2e8jd2/zfJVbhMYREaK612fwqyKmnlixj1PV6R+Fde6EQkNPy8TZp
   TU5R6YhprG8hqvzj5K+Qz8SPR6PFCw/AZARhHNg8cIYhjJ8u/XuUxYB0M
   A==;
X-CSE-ConnectionGUID: C6KCZIEsQEy5lHpGxbGPGA==
X-CSE-MsgGUID: F5rAlVjlSIStbNSjZUAn1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48199141"
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="48199141"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 06:14:02 -0700
X-CSE-ConnectionGUID: R2j9IbHdT265qKYIcs5yFA==
X-CSE-MsgGUID: 4nW73/7rTee54r8swJtFGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="136303282"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 08 May 2025 06:14:00 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uD14Y-000Az7-0l;
	Thu, 08 May 2025 13:13:58 +0000
Date: Thu, 8 May 2025 21:13:56 +0800
From: kernel test robot <lkp@intel.com>
To: Alistair Popple <apopple@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:nova/alistair-nova-rpc-with-nouveau-boot 1/5]
 drivers/gpu/drm/nouveau/nouveau_drm.c:916:7: warning: no previous prototype
 for 'nouveau_drm_nova_probe'
Message-ID: <202505082138.KmJNaG8z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova/alistair-nova-rpc-with-nouveau-boot
head:   920c47c8d7e8ea73072446347e5d0de44a0fa713
commit: 29c36cd419b242b829b9fe4d175a77d84ab94b8e [1/5] HACK: Use Nouveau for GSP initialisation
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20250508/202505082138.KmJNaG8z-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250508/202505082138.KmJNaG8z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505082138.KmJNaG8z-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/nouveau/nouveau_drm.c:916:7: warning: no previous prototype for 'nouveau_drm_nova_probe' [-Wmissing-prototypes]
     916 | void *nouveau_drm_nova_probe(struct pci_dev *pdev)
         |       ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_drm.c: In function 'nouveau_drm_nova_probe':
>> drivers/gpu/drm/nouveau/nouveau_drm.c:918:13: warning: unused variable 'ret' [-Wunused-variable]
     918 |         int ret = nouveau_drm_probe(pdev, NULL);
         |             ^~~
   drivers/gpu/drm/nouveau/nouveau_drm.c: At top level:
>> drivers/gpu/drm/nouveau/nouveau_drm.c:938:17: warning: no previous prototype for 'nouveau_drm_nova_get_cmdq' [-Wmissing-prototypes]
     938 | struct gsp_cmdq nouveau_drm_nova_get_cmdq(void *drvdata)
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/nouveau/nouveau_drm.c:985:6: warning: no previous prototype for 'nouveau_drm_nova_remove' [-Wmissing-prototypes]
     985 | void nouveau_drm_nova_remove(struct pci_dev *pdev, void *drvdata, u32 seq)
         |      ^~~~~~~~~~~~~~~~~~~~~~~


vim +/nouveau_drm_nova_probe +916 drivers/gpu/drm/nouveau/nouveau_drm.c

   915	
 > 916	void *nouveau_drm_nova_probe(struct pci_dev *pdev)
   917	{
 > 918		int ret = nouveau_drm_probe(pdev, NULL);
   919	
   920		return dev_get_drvdata(&pdev->dev);
   921	}
   922	EXPORT_SYMBOL(nouveau_drm_nova_probe);
   923	
   924	struct gsp_cmdq {
   925		void *falcon;
   926		void *shm_ptr;
   927		void *ptr;
   928		u32 size;
   929		u32 cnt;
   930		u32 seq;
   931		u32 *wptr;
   932		u32 *rptr;
   933		void *msgq_ptr;
   934		u32 *msgq_wptr;
   935		u32 *msgq_rptr;
   936	};
   937	
 > 938	struct gsp_cmdq nouveau_drm_nova_get_cmdq(void *drvdata)
   939	{
   940		struct nouveau_drm *drm = drvdata;
   941		struct nvkm_subdev *subdev = nvkm_device_subdev(drm->nvkm, NVKM_SUBDEV_GSP, 0);
   942		struct nvkm_gsp *gsp = nvkm_gsp(subdev);
   943		struct gsp_cmdq cmdq;
   944	
   945		cmdq.falcon = gsp->falcon.owner->device->pri + gsp->falcon.addr + 0xc00;
   946		cmdq.shm_ptr = gsp->shm.mem.data;
   947		cmdq.ptr = gsp->shm.cmdq.ptr;
   948		cmdq.size = gsp->shm.cmdq.size;
   949		cmdq.cnt = gsp->cmdq.cnt;
   950		cmdq.seq = gsp->cmdq.seq;
   951		cmdq.wptr = gsp->cmdq.wptr;
   952		cmdq.rptr = gsp->cmdq.rptr;
   953		cmdq.msgq_ptr = gsp->shm.msgq.ptr;
   954		cmdq.msgq_wptr = gsp->msgq.wptr;
   955		cmdq.msgq_rptr = gsp->msgq.rptr;
   956	
   957		return cmdq;
   958	}
   959	EXPORT_SYMBOL(nouveau_drm_nova_get_cmdq);
   960	
   961	void
   962	nouveau_drm_device_remove(struct nouveau_drm *drm)
   963	{
   964		struct nvkm_device *device = drm->nvkm;
   965	
   966		// drm_dev_unplug(drm->dev);
   967	
   968		// nouveau_drm_device_fini(drm);
   969		nouveau_drm_device_del(drm);
   970		nvkm_device_del(&device);
   971	}
   972	
   973	static void
   974	nouveau_drm_remove(struct pci_dev *pdev)
   975	{
   976		struct nouveau_drm *drm = pci_get_drvdata(pdev);
   977	
   978		/* revert our workaround */
   979		if (drm->old_pm_cap)
   980			pdev->pm_cap = drm->old_pm_cap;
   981		nouveau_drm_device_remove(drm);
   982		pci_disable_device(pdev);
   983	}
   984	
 > 985	void nouveau_drm_nova_remove(struct pci_dev *pdev, void *drvdata, u32 seq)
   986	{
   987		void *old_drvdata = dev_get_drvdata(&pdev->dev);
   988		struct nouveau_drm *drm = drvdata;
   989		struct nvkm_subdev *subdev;
   990		struct nvkm_gsp *gsp;
   991	
   992		if (!drvdata)
   993			return;
   994	
   995		dev_set_drvdata(&pdev->dev, drvdata);
   996		subdev = nvkm_device_subdev(drm->nvkm, NVKM_SUBDEV_GSP, 0);
   997		gsp = nvkm_gsp(subdev);
   998		gsp->cmdq.seq = seq;
   999		nouveau_drm_remove(pdev);
  1000		dev_set_drvdata(&pdev->dev, old_drvdata);
  1001	}
  1002	EXPORT_SYMBOL(nouveau_drm_nova_remove);
  1003	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
