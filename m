Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBAD1370
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Sep 2024 00:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726273296; cv=none; b=bKUcHWHIZs+MawJB0z/X3gavTX70bGitonmFG8Frc8H1HGbQNGTqsUBkJGaQm6Ku/4eyNJOduXpZsR7WilHA9WANnQOOo5W1yra3Dp6fYlR6m5eDA/7sXMBIStApC3Gj9TbYx9xLDLSb0zIIFvKsDUasBuXsIH4Vsr6JJRijeBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726273296; c=relaxed/simple;
	bh=ryc3gDeq6nu0A8YbX6CGI3w7HE+S3MMxzkp1oTUbJcA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FhZh/Ctfl+sAxeheiy+AK+CaHYnui6SslSyMFHwKKiWptbNJcCQaREJ8Ac76kiUnveFMILrGWwwjX2V1tZqsqDW9tGEqNS+Ns7blfeYoA8xmM3C02j3GGFF1Lfwqw623yz6BP3dh4bA+8RB7j634rnpp/dDSNmb5NgxuaK+yg4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fPp9uS6B; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fPp9uS6B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726273295; x=1757809295;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ryc3gDeq6nu0A8YbX6CGI3w7HE+S3MMxzkp1oTUbJcA=;
  b=fPp9uS6BJ/GC/hgE86Fd/JwNEYWZ/fHeq6K1jjLhTvXBwovyIt9gliWB
   QNk0kVa20eYnwLn4DF/1W1qTyHyl9x8z1wHbp2va5u2dNqeHlM/C0sc6r
   aJGL+DId78TMmP9pn+yYPpuagdTTYV5WnNgUHIdbxgrM0SHsOA0z5Yd38
   PiP9hHN/XwgeD4tARiQHQk4x+Hl+91R73axsfRE33yVIWFJeTsNxT/9gV
   m8M/EUjNwyHXzqqSfeU8iP+fPNqTwhG3ThT7so7jSiC7trqooFnVJYmyl
   nleDG+N+djUVyW+EHpQxnMEmt0XKiOvIhdtvH1BnGRAtdT0mBFYJKSjzt
   Q==;
X-CSE-ConnectionGUID: Vl45V++oRvGIrodDBwamoA==
X-CSE-MsgGUID: zYInDvlLR1yxlqLsOTM7vg==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="25125731"
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; 
   d="scan'208";a="25125731"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 17:21:35 -0700
X-CSE-ConnectionGUID: re1KqVEtTHe64m/4nJtZlQ==
X-CSE-MsgGUID: UV6d4CvrQgi11KpJc7L0kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; 
   d="scan'208";a="68110402"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 13 Sep 2024 17:21:33 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spGXa-0007BY-2C;
	Sat, 14 Sep 2024 00:21:30 +0000
Date: Sat, 14 Sep 2024 08:21:10 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Hongchen Zhang <zhanghongchen@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 19206/30000]
 drivers/gpu/drm/inspur/inspur_drm_drv.c:30:13: warning: no previous
 prototype for 'inspur_drm_interrupt'
Message-ID: <202409140804.IiV0APec-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hongchen,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   5a1d9701155c6908c76c68951170f10279685143
commit: b9d65551a3adfa87a7c5d33391187ee60a1b501d [19206/30000] drm: add inspur drm driver support
config: arm64-randconfig-002-20240914 (https://download.01.org/0day-ci/archive/20240914/202409140804.IiV0APec-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409140804.IiV0APec-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409140804.IiV0APec-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/inspur/inspur_drm_drv.c:30:13: warning: no previous prototype for 'inspur_drm_interrupt' [-Wmissing-prototypes]
      30 | irqreturn_t inspur_drm_interrupt(int irq, void *arg)
         |             ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/inspur/inspur_drm_drv.c: In function 'inspur_pci_probe':
   drivers/gpu/drm/inspur/inspur_drm_drv.c:379:36: warning: unused variable 'priv' [-Wunused-variable]
     379 |         struct inspur_drm_private *priv;
         |                                    ^~~~


vim +/inspur_drm_interrupt +30 drivers/gpu/drm/inspur/inspur_drm_drv.c

    27	
    28	
    29	DEFINE_DRM_GEM_FOPS(inspur_fops);
  > 30	irqreturn_t inspur_drm_interrupt(int irq, void *arg)
    31	{
    32		struct drm_device *dev = (struct drm_device *)arg;
    33		struct inspur_drm_private *priv =
    34			(struct inspur_drm_private *)dev->dev_private;
    35		u32 status;
    36	
    37		status = readl(priv->mmio + INSPUR_RAW_INTERRUPT);
    38	
    39		if (status & INSPUR_RAW_INTERRUPT_VBLANK(1)) {
    40			writel(INSPUR_RAW_INTERRUPT_VBLANK(1),
    41			       priv->mmio + INSPUR_RAW_INTERRUPT);
    42			drm_handle_vblank(dev, 0);
    43		}
    44	
    45		return IRQ_HANDLED;
    46	}
    47	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
