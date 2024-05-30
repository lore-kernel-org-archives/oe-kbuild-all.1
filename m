Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2025118398C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 May 2024 09:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717059986; cv=none; b=Pvn64UOX1F4y6uyXEky8k+U4zGaqbWIG3+M9z01licAvA0dN7hZm5kyzGJ5NuJVnO1MeYro1RGFVNWNSFkCc2ijdRk3/zhwqdFBtzxak+LkxvpQmhI6k0o72JWAmrsLZNNHc66s/X5K382iusnHwjKS6pvvc/A72C7dtZOFH5hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717059986; c=relaxed/simple;
	bh=guL/lqICiu7SNITBX9O9XDOs/dycOTc74JgKd45RPlk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HP+Ts0Pj6MxP4XYN7gsGSrDO2FAF1xUMPpIwRP91JDvkLP9tn8/WB0MI0GXDBAHO5BDZN4vQWHJjMK2WJzj0ARr3w8oE/RsBCGVo/tGJ7UxDV78qJnvbDvdxppdOFJIM+L/YIs24rzqZ5SO2eq73XRZaWTn4KvsyfyUSsqwAHp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F+evLled; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F+evLled"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717059984; x=1748595984;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=guL/lqICiu7SNITBX9O9XDOs/dycOTc74JgKd45RPlk=;
  b=F+evLledz+ryc+olVr795fsvVxaeK1VB4KgRINOi2O73HCAj0s+A4Odl
   UBSh5IgJ+QBUOhd0J7Hj+L4T81Jl81E6008Q94ryIHkFZeAF7Q71UeMlZ
   xyOirOjU3lJo6b1oM9CYa92/ef6+6A0gC/OVop+EuEHevzfsO0bEk4wMU
   V+WEYD4ZHbOo5eUjXyoJ0/DEH5htpdXwv5jsuJZHxCUCjd9CfCdFv/ozU
   7RHRDvTaJ3rLOtS8ap1SMEai/bfUaEOBhJXJZgARxyeTQOrb9kvTBJi7Q
   JFGRVod6/EUQaA5HvRokGR+XdMgFcdL0zv/1nITmRnyb00C9mfuJTQNHl
   g==;
X-CSE-ConnectionGUID: il0A+9YaS+qWZxjyeYrxJg==
X-CSE-MsgGUID: 0YSuPRxmQk6GjkF6MPORUw==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="24939230"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="24939230"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 02:06:19 -0700
X-CSE-ConnectionGUID: BU0k80s2QsSC1UTVLq4CRw==
X-CSE-MsgGUID: 1wPvIbyjSMiB5q6/9uPZ6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="35692462"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 30 May 2024 02:06:18 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCbjj-000F2x-0r;
	Thu, 30 May 2024 09:06:15 +0000
Date: Thu, 30 May 2024 17:05:38 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mark:arm64/gicv3-nmi-prio 2/4] drivers/irqchip/irq-gic.c:611:37:
 sparse: sparse: cast truncates bits from constant value (a0a0a0a0a0a0a0a0
 becomes a0a0a0a0)
Message-ID: <202405301615.ye2brv8r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mark,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git arm64/gicv3-nmi-prio
head:   4b2d73625bdecefd2c83bc438a875de2cdeac00e
commit: 1ba736ea6b5862ec5b389646c7de0d5db52f2910 [2/4] irqchip/gic-v3: make distributor priorities variables
config: arm64-randconfig-r123-20240530 (https://download.01.org/0day-ci/archive/20240530/202405301615.ye2brv8r-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce: (https://download.01.org/0day-ci/archive/20240530/202405301615.ye2brv8r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405301615.ye2brv8r-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/irqchip/irq-gic.c:1172:44: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __percpu *[noderef] __iomem *percpu_base @@     got void [noderef] __iomem *[noderef] __percpu * @@
   drivers/irqchip/irq-gic.c:1172:44: sparse:     expected void [noderef] __percpu *[noderef] __iomem *percpu_base
   drivers/irqchip/irq-gic.c:1172:44: sparse:     got void [noderef] __iomem *[noderef] __percpu *
   drivers/irqchip/irq-gic.c:1173:43: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __percpu *[noderef] __iomem *percpu_base @@     got void [noderef] __iomem *[noderef] __percpu * @@
   drivers/irqchip/irq-gic.c:1173:43: sparse:     expected void [noderef] __percpu *[noderef] __iomem *percpu_base
   drivers/irqchip/irq-gic.c:1173:43: sparse:     got void [noderef] __iomem *[noderef] __percpu *
   drivers/irqchip/irq-gic.c:1184:26: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got void [noderef] __percpu *[noderef] __iomem * @@
   drivers/irqchip/irq-gic.c:1184:26: sparse:     expected void const [noderef] __percpu *__vpp_verify
   drivers/irqchip/irq-gic.c:1184:26: sparse:     got void [noderef] __percpu *[noderef] __iomem *
   drivers/irqchip/irq-gic.c:1184:71: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __percpu * @@     got void [noderef] __iomem * @@
   drivers/irqchip/irq-gic.c:1184:71: sparse:     expected void [noderef] __percpu *
   drivers/irqchip/irq-gic.c:1184:71: sparse:     got void [noderef] __iomem *
   drivers/irqchip/irq-gic.c:1186:26: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got void [noderef] __percpu *[noderef] __iomem * @@
   drivers/irqchip/irq-gic.c:1186:26: sparse:     expected void const [noderef] __percpu *__vpp_verify
   drivers/irqchip/irq-gic.c:1186:26: sparse:     got void [noderef] __percpu *[noderef] __iomem *
   drivers/irqchip/irq-gic.c:1186:70: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __percpu * @@     got void [noderef] __iomem * @@
   drivers/irqchip/irq-gic.c:1186:70: sparse:     expected void [noderef] __percpu *
   drivers/irqchip/irq-gic.c:1186:70: sparse:     got void [noderef] __iomem *
   drivers/irqchip/irq-gic.c:1231:43: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __percpu *__pdata @@     got void [noderef] __percpu *[noderef] __iomem *percpu_base @@
   drivers/irqchip/irq-gic.c:1231:43: sparse:     expected void [noderef] __percpu *__pdata
   drivers/irqchip/irq-gic.c:1231:43: sparse:     got void [noderef] __percpu *[noderef] __iomem *percpu_base
   drivers/irqchip/irq-gic.c:1232:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __percpu *__pdata @@     got void [noderef] __percpu *[noderef] __iomem *percpu_base @@
   drivers/irqchip/irq-gic.c:1232:42: sparse:     expected void [noderef] __percpu *__pdata
   drivers/irqchip/irq-gic.c:1232:42: sparse:     got void [noderef] __percpu *[noderef] __iomem *percpu_base
   drivers/irqchip/irq-gic.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/page-flags.h:240:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:240:46: sparse: sparse: self-comparison always evaluates to false
>> drivers/irqchip/irq-gic.c:611:37: sparse: sparse: cast truncates bits from constant value (a0a0a0a0a0a0a0a0 becomes a0a0a0a0)
   drivers/irqchip/irq-gic.c:700:37: sparse: sparse: cast truncates bits from constant value (a0a0a0a0a0a0a0a0 becomes a0a0a0a0)

vim +611 drivers/irqchip/irq-gic.c

   581	
   582	/*
   583	 * Restores the GIC distributor registers during resume or when coming out of
   584	 * idle.  Must be called before enabling interrupts.  If a level interrupt
   585	 * that occurred while the GIC was suspended is still present, it will be
   586	 * handled normally, but any edge interrupts that occurred will not be seen by
   587	 * the GIC and need to be handled by the platform-specific wakeup source.
   588	 */
   589	void gic_dist_restore(struct gic_chip_data *gic)
   590	{
   591		unsigned int gic_irqs;
   592		unsigned int i;
   593		void __iomem *dist_base;
   594	
   595		if (WARN_ON(!gic))
   596			return;
   597	
   598		gic_irqs = gic->gic_irqs;
   599		dist_base = gic_data_dist_base(gic);
   600	
   601		if (!dist_base)
   602			return;
   603	
   604		writel_relaxed(GICD_DISABLE, dist_base + GIC_DIST_CTRL);
   605	
   606		for (i = 0; i < DIV_ROUND_UP(gic_irqs, 16); i++)
   607			writel_relaxed(gic->saved_spi_conf[i],
   608				dist_base + GIC_DIST_CONFIG + i * 4);
   609	
   610		for (i = 0; i < DIV_ROUND_UP(gic_irqs, 4); i++)
 > 611			writel_relaxed((u32)REPEAT_BYTE(GICD_INT_DEF_PRI),
   612				dist_base + GIC_DIST_PRI + i * 4);
   613	
   614		for (i = 0; i < DIV_ROUND_UP(gic_irqs, 4); i++)
   615			writel_relaxed(gic->saved_spi_target[i],
   616				dist_base + GIC_DIST_TARGET + i * 4);
   617	
   618		for (i = 0; i < DIV_ROUND_UP(gic_irqs, 32); i++) {
   619			writel_relaxed(GICD_INT_EN_CLR_X32,
   620				dist_base + GIC_DIST_ENABLE_CLEAR + i * 4);
   621			writel_relaxed(gic->saved_spi_enable[i],
   622				dist_base + GIC_DIST_ENABLE_SET + i * 4);
   623		}
   624	
   625		for (i = 0; i < DIV_ROUND_UP(gic_irqs, 32); i++) {
   626			writel_relaxed(GICD_INT_EN_CLR_X32,
   627				dist_base + GIC_DIST_ACTIVE_CLEAR + i * 4);
   628			writel_relaxed(gic->saved_spi_active[i],
   629				dist_base + GIC_DIST_ACTIVE_SET + i * 4);
   630		}
   631	
   632		writel_relaxed(GICD_ENABLE, dist_base + GIC_DIST_CTRL);
   633	}
   634	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
