Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD8B199951
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Dec 2024 18:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733855725; cv=none; b=RqAuFid396yHrRkwGYBZHGHy4H4rdCP1R4rS6q5FZe2b0TlbDYcdfSp9hgLFkWyR47WTvAWWtgenPuxESUfrWnPYeTYsmst9hdtxwT2GBATyhjXGiRWTfHjQrarKDcSVQzOQxw8cdNlhiknjzm0u5yLasp5gkSiK8O+sicurJMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733855725; c=relaxed/simple;
	bh=FdRhiTf0H0C251ouPst6kpD29MZnOFFx0UOQiwCT1/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sY/h7hihAZhTfzwo2rZC7xSzjOfUtaTgBbxWdD81H7ge0NmDbGESv/9x47R4i3XCSsx1KFLYP7pRdc1PhlmnZIyhBjniNgNkKTQkxfH/LXBqNXRSslqOB4errmCz8e7BJi88Z934QfqDPwvzoFPGph5RJjDkm5GnM5DJY73NeGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IqkgUM7w; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IqkgUM7w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733855723; x=1765391723;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FdRhiTf0H0C251ouPst6kpD29MZnOFFx0UOQiwCT1/E=;
  b=IqkgUM7wSoeEd/bbDgVM1tvlO9tobsuB+2ou3L7+zuj7zRWw28G3gnwb
   uenyHzeNzLMuZjhpN4wFuvOSCQYfuiYrIOCyAaR7yJuruo8y9zIvb/xHO
   L9dUSQ5cumNVZfkWu12OHueM6vJmaxwaijaQ/lW77QE4jKdgFnn/bfX3F
   tHE9P82CpQKhtyVtAjyU8VJc2qQBUh9lCrYUrwrpB5HU/Ky2F/gGBtdWs
   fomS85trhCl4mZMcLEdUxrPYVFRoeesAF1csubrJvG69fOhcecq0cGOO9
   jt41gX6iUefJdYiBQM6bNENVLR0JaiQh/ZLK1kFHkeCNCOqmcDuWBEGId
   Q==;
X-CSE-ConnectionGUID: ClBVmqmeT4+sieGXmwR44Q==
X-CSE-MsgGUID: G/YqYrjFRzS7W5rNQg/9gg==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="37901796"
X-IronPort-AV: E=Sophos;i="6.12,223,1728975600"; 
   d="scan'208";a="37901796"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 10:35:23 -0800
X-CSE-ConnectionGUID: qMcCP1BFTf6GYnBNbWFPfQ==
X-CSE-MsgGUID: uQSxdHw8SI2pdZwNqnwP6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,223,1728975600"; 
   d="scan'208";a="95321237"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 10 Dec 2024 10:35:18 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tL54l-0005r9-3A;
	Tue, 10 Dec 2024 18:35:15 +0000
Date: Wed, 11 Dec 2024 02:34:16 +0800
From: kernel test robot <lkp@intel.com>
To: Chen Wang <unicornxw@gmail.com>, u.kleine-koenig@baylibre.com,
	aou@eecs.berkeley.edu, arnd@arndb.de, unicorn_wang@outlook.com,
	conor+dt@kernel.org, guoren@kernel.org, inochiama@outlook.com,
	krzk+dt@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com,
	robh@kernel.org, tglx@linutronix.de, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	chao.wei@sophgo.com, xiaoguang.xing@sophgo.com,
	fengchun.li@sophgo.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 2/3] irqchip: Add the Sophgo SG2042 MSI interrupt
 controller
Message-ID: <202412110248.fdcNDwnt-lkp@intel.com>
References: <c882fe329932409131be76ce47b81a6155595ce4.1733726057.git.unicorn_wang@outlook.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c882fe329932409131be76ce47b81a6155595ce4.1733726057.git.unicorn_wang@outlook.com>

Hi Chen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on fac04efc5c793dccbd07e2d59af9f90b7fc0dca4]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Wang/dt-bindings-interrupt-controller-Add-Sophgo-SG2042-MSI/20241209-151429
base:   fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
patch link:    https://lore.kernel.org/r/c882fe329932409131be76ce47b81a6155595ce4.1733726057.git.unicorn_wang%40outlook.com
patch subject: [PATCH v2 2/3] irqchip: Add the Sophgo SG2042 MSI interrupt controller
config: arm-randconfig-r131-20241210 (https://download.01.org/0day-ci/archive/20241211/202412110248.fdcNDwnt-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241211/202412110248.fdcNDwnt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412110248.fdcNDwnt-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/irqchip/irq-sg2042-msi.c:64:9: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/irqchip/irq-sg2042-msi.c:64:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/irqchip/irq-sg2042-msi.c:64:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/irqchip/irq-sg2042-msi.c:64:9: sparse:     got unsigned int *

vim +/__iomem +64 drivers/irqchip/irq-sg2042-msi.c

    58	
    59	static void sg2042_msi_irq_ack(struct irq_data *d)
    60	{
    61		struct sg2042_msi_data *data  = irq_data_get_irq_chip_data(d);
    62		int bit_off = d->hwirq - data->irq_first;
    63	
  > 64		writel(1 << bit_off, (unsigned int *)data->reg_clr);
    65	
    66		irq_chip_ack_parent(d);
    67	}
    68	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
