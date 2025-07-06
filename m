Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD653207
	for <oe-kbuild-all@lists.linux.dev>; Sun,  6 Jul 2025 10:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751796578; cv=none; b=E8gVBO0+DWprl+3MSUPg+1+XxNQEYpTls+sKCSK+J6dIOIgHk+MENk9WsSRL0A8iEjWISVcqs737+SbmL/yZL1VmkKiAvA9aYsF+TrmPiyYlKw+KBcih4XpvK9Z5c1WeocYq781Asq9DNnc+w+Ar1sGi9iJ5Vhz8qR3dJ3MPjgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751796578; c=relaxed/simple;
	bh=lUIHw2Kx7Q9crTZC+RLVSSIK7nPYnkrlooahFfTjiqg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=omqVbUQZ+DTdKmL9InsldjOnr3HnUbB8PVW7ZhnnMNwAQvnM5GiMmgDgWnESUrEDMozc4CbadJQD4C6yVzEn284o94h5ez0vyrS5qMF2s06R5D9BvyTcxR7dr/7RlNzaF9cHHZO218DKpwyjFaWrbjV3LaatrljcsOp5IS19xfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LI/KLVvv; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LI/KLVvv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751796576; x=1783332576;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lUIHw2Kx7Q9crTZC+RLVSSIK7nPYnkrlooahFfTjiqg=;
  b=LI/KLVvv035Yj5Q4giRDdbWmgJ5eXVvTLidwWfVFYqhn9dewf7VCnUnv
   VWhghD5t/dljsjq5EYPajtC2WUwX/7wY9JWaqvlqovdZEIBfzCYnLKxdI
   E+YQp0s8az1neUdGSbvkeoF57GzXklvRklF6oJoMaGU+vorJVpp/SrQoG
   D2qEPMpQT8vslOkfN9qjVL8RQ7xJTU8Y9dw+JLwEOUT1KxfwsbBh+EURN
   mimbHnm1lrPmMI9e6GkXBEgaGDD0QbS7Kb7Eq891noELU+2UAFZX0HRQU
   0lfQf8tkaktpEkVw1RJdKk6pu0zq/LRyQWtT88I9vnbx0xaBw1RZzLa4S
   A==;
X-CSE-ConnectionGUID: nv3EuW/lSOqm2plkkQ0U7Q==
X-CSE-MsgGUID: jnXZhibWTlC3weLThjAdwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11485"; a="54156396"
X-IronPort-AV: E=Sophos;i="6.16,291,1744095600"; 
   d="scan'208";a="54156396"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2025 03:09:35 -0700
X-CSE-ConnectionGUID: dIdNTuB2R9Kg6zicD24ZsQ==
X-CSE-MsgGUID: ltxSh2MKQ2+kGWJRmHfZ+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,291,1744095600"; 
   d="scan'208";a="160513861"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 06 Jul 2025 03:09:35 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uYMJR-00050x-0w;
	Sun, 06 Jul 2025 10:09:33 +0000
Date: Sun, 6 Jul 2025 18:08:55 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:imx93-ethos-v2 26/31] drivers/accel/ethos/ethos_drv.c:265:9:
 sparse: sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202507061841.AiZfx9FX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git imx93-ethos-v2
head:   652b6e3a8a3b0663143c380c080702c9e705be8d
commit: 0387723ea682298c3cd4749dc78bd81a012e8b8f [26/31] drm: ethos: SRAM support rework.
config: riscv-randconfig-r131-20250706 (https://download.01.org/0day-ci/archive/20250706/202507061841.AiZfx9FX-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 61529d9e36fa86782a2458e6bdeedf7f376ef4b5)
reproduce: (https://download.01.org/0day-ci/archive/20250706/202507061841.AiZfx9FX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507061841.AiZfx9FX-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zacas_zabha'
>> drivers/accel/ethos/ethos_drv.c:265:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got void [noderef] __iomem *sram @@
   drivers/accel/ethos/ethos_drv.c:265:9: sparse:     expected void const *
   drivers/accel/ethos/ethos_drv.c:265:9: sparse:     got void [noderef] __iomem *sram
>> drivers/accel/ethos/ethos_drv.c:265:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got void [noderef] __iomem *sram @@
   drivers/accel/ethos/ethos_drv.c:265:9: sparse:     expected void const *
   drivers/accel/ethos/ethos_drv.c:265:9: sparse:     got void [noderef] __iomem *sram
>> drivers/accel/ethos/ethos_drv.c:265:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void * @@     got void [noderef] __iomem *sram @@
   drivers/accel/ethos/ethos_drv.c:265:9: sparse:     expected void *
   drivers/accel/ethos/ethos_drv.c:265:9: sparse:     got void [noderef] __iomem *sram

vim +265 drivers/accel/ethos/ethos_drv.c

   243	
   244	static int ethos_reset(struct ethos_device *ethosdev)
   245	{
   246		int ret;
   247		u32 reg;
   248	
   249		writel_relaxed(0x3, ethosdev->regs + NPU_REG_RESET);
   250	
   251		ret = readl_poll_timeout(ethosdev->regs + NPU_REG_STATUS, reg, !(reg & 0x4),
   252					 USEC_PER_MSEC, USEC_PER_SEC);
   253		if (ret)
   254			return ret;
   255	
   256		if ((readl_relaxed(ethosdev->regs + NPU_REG_PROT) & 0x3) != 0x3) {
   257			dev_info(ethosdev->base.dev, "read PROT = %x\n", readl_relaxed(ethosdev->regs + NPU_REG_PROT));
   258	//		return -EINVAL;
   259		}
   260		// TODO AXI port config, defaults might work
   261		if (ethos_is_u65(ethosdev)) {
   262			writel_relaxed(0x1f3f0032, ethosdev->regs + NPU_REG_AXILIMIT0);
   263		}
   264	
 > 265		memset(ethosdev->sram, 0, ethosdev->npu_info.sram_size);
   266	
   267		return 0;
   268	}
   269	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
