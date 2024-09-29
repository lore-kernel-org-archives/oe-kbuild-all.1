Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F253FB1B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Sep 2024 05:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727587635; cv=none; b=sEKPcvf2DpG3NYoCtfPqZLD0wmuANtL6kOcYixMwmZTV2mTDfKQ/7XUrHmtbQDRdJP8voFPk/wPDT05jkEMPgH5VQdY8FSzm7qF+RgePomMem8l6y6LU24ObWu829n1cMWNon99yQpIvDlu7XTcsQNnTvlDfdC73EoDuQQ9cxOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727587635; c=relaxed/simple;
	bh=kGGSxU5LYKRmge62xMO9Ips+8zjisggMCzVR5VfQcQI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UFYqloW+bINdNnWvM9Xr2VMKTeZZMm2EYuo9R3nVdiH8gt+6Fqryg4NipfDxPuDIFyMGNLVEahknqYrO1Fh/cI4K5MHf7oHaQTGkUvIEntkZwnymt12ir5G1t8RW8/CtiJvr00MiGKE4zCiq02wBETw07xqueWcrISz8oRUpwlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OYYDpi/J; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OYYDpi/J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727587634; x=1759123634;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kGGSxU5LYKRmge62xMO9Ips+8zjisggMCzVR5VfQcQI=;
  b=OYYDpi/JNgQcsLiiqR1CChFob6R86X1V3lw0yO8H8FSiZnnm3l7+W6PV
   kH6thzTuvE7yzcEEDtnaNxiZ8aUi7IrnqylVzRUr99eIQXO2ZQM3isNk/
   5emtVEittB2gu3V922RaBXed8W/ig5GCAy/do04rFKVpX9Mb5vUjETCgY
   N05+7lMGX1XvzNRiAMZgzsG54fIFWt+dCW9NQhdcEgL5pgkk7FumO4OCb
   q9KyrFi5Wt3ii/M39vyKA3IRzm6NVO5iXmTlJCpPJU38N1wunmDkHDlqS
   bG98qun2XxpfOPQAKFu/o3YScyh1sLI8QR6/1F8X7MtMDvy579it2+ick
   Q==;
X-CSE-ConnectionGUID: DmbzhXAgQxmkhGUT3DcVYg==
X-CSE-MsgGUID: 2lj7k9glQQGum6JYh2YBRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="30485901"
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="30485901"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 22:27:13 -0700
X-CSE-ConnectionGUID: X0Cd4T3WR7yUEdhOEEgU/Q==
X-CSE-MsgGUID: QQLG5IfGQ0KkCxYZCVqvLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="73265868"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 28 Sep 2024 22:27:12 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sumSc-000Num-0A;
	Sun, 29 Sep 2024 05:27:10 +0000
Date: Sun, 29 Sep 2024 13:26:10 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Dongxu Sun <sundongxu3@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 22702/30000]
 drivers/irqchip/irq-mbigen.c:122:11: sparse: sparse: symbol
 'vtimer_cpu_mask' was not declared. Should it be static?
Message-ID: <202409291341.axFxcmaf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   dc55753ca59725e5130059dc4c520e8a91c655c0
commit: 212e82b2357f9103ddb3b759c37ae518831f701b [22702/30000] mbigen: vtimer mbigen driver support
config: arm64-randconfig-r131-20240925 (https://download.01.org/0day-ci/archive/20240929/202409291341.axFxcmaf-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240929/202409291341.axFxcmaf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409291341.axFxcmaf-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/irqchip/irq-mbigen.c:122:11: sparse: sparse: symbol 'vtimer_cpu_mask' was not declared. Should it be static?
   drivers/irqchip/irq-mbigen.c:318:34: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *base @@     got void *chip_data @@
   drivers/irqchip/irq-mbigen.c:318:34: sparse:     expected void [noderef] __iomem *base
   drivers/irqchip/irq-mbigen.c:318:34: sparse:     got void *chip_data
   drivers/irqchip/irq-mbigen.c:330:34: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *base @@     got void *chip_data @@
   drivers/irqchip/irq-mbigen.c:330:34: sparse:     expected void [noderef] __iomem *base
   drivers/irqchip/irq-mbigen.c:330:34: sparse:     got void *chip_data
   drivers/irqchip/irq-mbigen.c:362:31: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *base @@     got void *chip_data @@
   drivers/irqchip/irq-mbigen.c:362:31: sparse:     expected void [noderef] __iomem *base
   drivers/irqchip/irq-mbigen.c:362:31: sparse:     got void *chip_data
   drivers/irqchip/irq-mbigen.c:435:65: sparse: sparse: incorrect type in argument 5 (different address spaces) @@     expected void *chip_data @@     got void [noderef] __iomem *base @@
   drivers/irqchip/irq-mbigen.c:435:65: sparse:     expected void *chip_data
   drivers/irqchip/irq-mbigen.c:435:65: sparse:     got void [noderef] __iomem *base

vim +/vtimer_cpu_mask +122 drivers/irqchip/irq-mbigen.c

   121	
 > 122	cpumask_t vtimer_cpu_mask;
   123	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
