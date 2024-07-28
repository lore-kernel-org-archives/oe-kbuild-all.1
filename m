Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED22A3B1AC
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Jul 2024 18:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722189802; cv=none; b=TY1c+pGNhEKiQiwqct+fYYUnYIrv9Wnh/oapLdzxSt0PDi2Phssszbw72VRVxIypP3D9fwf6ANxktSuadI0eTZOPdzoB1oTRRN9Dfc/aSNqMJWnCQC1kx53XuGGLzGy/KxwVR+fLY0BOJB5KqUYRNelAhQmsD5hE0h16d2WpNUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722189802; c=relaxed/simple;
	bh=csNZrzmphXa3uGleid9LEBG9Hzb76O1UIwKQNl21+Zo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aRpaA5PDJFDJF3cTztKdG/xwwJirLfuoV0vRVUPSsbtoDwrdl5nKaekWYUBOuefms6PyulssQMYJxAdzAvgvKJlxYx3AQuU3zd5/rFwNgVz9+0U/SMqnl2fJjvZvPot41RmQzpHhdgJldbUmUE5MIG1t7xGX8vjl3CKZQClwj4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X8ErhJ79; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X8ErhJ79"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722189802; x=1753725802;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=csNZrzmphXa3uGleid9LEBG9Hzb76O1UIwKQNl21+Zo=;
  b=X8ErhJ79JGwfJk+/39KoylgP5jkBdPMm8kURrDna4BWcViCwWWPFg53g
   ff5M65dK++3U5M+5oUV+AucgxrbvCthtODVeqmvJMKVrNWQkmGy8i5BZn
   nEgQh/WCiKswFVPKF0DVl8sGxO6cDqHnsUWX9tgH47ffLFImeie82NPie
   +bXP7BLdyd6P/l5qCjr8ck2gcbbtGMWFbLdkzwSJ5UvrVntfF8KrwMn8f
   7R1C+JckG+vfkhx2Idj4TpfJKT2P9tCRPK23ilva8IPAEr8+2qpgPRfv4
   7RjSZpmlM3LsJhh/BakobgxvIHipeJbjfAYNa1NlSk5ypvHSJLg14r+6R
   w==;
X-CSE-ConnectionGUID: Wdm1mP/5Tb+0aVqDSmaBXg==
X-CSE-MsgGUID: HPitvV4NTJunxhy5OEZYpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11147"; a="20066251"
X-IronPort-AV: E=Sophos;i="6.09,244,1716274800"; 
   d="scan'208";a="20066251"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2024 11:03:21 -0700
X-CSE-ConnectionGUID: mhttphoVR12GIP6d/GYGXQ==
X-CSE-MsgGUID: 20F9d78cQt2B2A147slymQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,244,1716274800"; 
   d="scan'208";a="58579591"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 28 Jul 2024 11:03:17 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sY8Ej-000r24-2w;
	Sun, 28 Jul 2024 18:03:13 +0000
Date: Mon, 29 Jul 2024 02:03:09 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Skeggs <bskeggs@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [drm-misc:drm-misc-next 2/37]
 drivers/gpu/drm/nouveau/nouveau_platform.c:29:13: warning: unused variable
 'ret'
Message-ID: <202407290133.IJZAiy24-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
head:   61671d85def2960bbf52db22e9e45b3bf8a5ceb5
commit: 961ae5f9807bb15af0065485785725768a7269b9 [2/37] drm/nouveau: handle pci/tegra drm_dev_{alloc, register} from common code
config: arm-randconfig-004-20240728 (https://download.01.org/0day-ci/archive/20240729/202407290133.IJZAiy24-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240729/202407290133.IJZAiy24-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407290133.IJZAiy24-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/nouveau/nouveau_platform.c: In function 'nouveau_platform_probe':
>> drivers/gpu/drm/nouveau/nouveau_platform.c:29:13: warning: unused variable 'ret' [-Wunused-variable]
      29 |         int ret;
         |             ^~~


vim +/ret +29 drivers/gpu/drm/nouveau/nouveau_platform.c

8ba9ff11632cb0 Alexandre Courbot 2014-06-26  23  
8ba9ff11632cb0 Alexandre Courbot 2014-06-26  24  static int nouveau_platform_probe(struct platform_device *pdev)
8ba9ff11632cb0 Alexandre Courbot 2014-06-26  25  {
e396ecd178c6c8 Alexandre Courbot 2015-09-04  26  	const struct nvkm_device_tegra_func *func;
870571a5698b2e Thierry Reding    2016-02-24  27  	struct nvkm_device *device = NULL;
8ba9ff11632cb0 Alexandre Courbot 2014-06-26  28  	struct drm_device *drm;
43a70661eaa64a Ben Skeggs        2015-08-20 @29  	int ret;
8ba9ff11632cb0 Alexandre Courbot 2014-06-26  30  
e396ecd178c6c8 Alexandre Courbot 2015-09-04  31  	func = of_device_get_match_data(&pdev->dev);
e396ecd178c6c8 Alexandre Courbot 2015-09-04  32  
e396ecd178c6c8 Alexandre Courbot 2015-09-04  33  	drm = nouveau_platform_device_create(func, pdev, &device);
43a70661eaa64a Ben Skeggs        2015-08-20  34  	if (IS_ERR(drm))
43a70661eaa64a Ben Skeggs        2015-08-20  35  		return PTR_ERR(drm);
8ba9ff11632cb0 Alexandre Courbot 2014-06-26  36  
43a70661eaa64a Ben Skeggs        2015-08-20  37  	return 0;
8ba9ff11632cb0 Alexandre Courbot 2014-06-26  38  }
8ba9ff11632cb0 Alexandre Courbot 2014-06-26  39  

:::::: The code at line 29 was first introduced by commit
:::::: 43a70661eaa64aa4e36e421eee3b9ded3190837b drm/nouveau/tegra: merge platform setup from nouveau drm

:::::: TO: Ben Skeggs <bskeggs@redhat.com>
:::::: CC: Ben Skeggs <bskeggs@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
