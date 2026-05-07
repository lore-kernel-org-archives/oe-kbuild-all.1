Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE7D2DFA2F
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 May 2026 08:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778142117; cv=none; b=K9a+GkW7kR82TSbn6/z1DzQJETBIS9p6MplQM0MlG3wWXZF5R1H4zhAgF7D4dkUHZdO1kDNpl/JEBmOcT2Xi7BR63dKgmTEMbMlr+MDUdAYIencWZUQWU5Hceg0/xRaFM9x2PNKSXy+UbyTRsH5orG3YKAIC8bp2LTKGpWKuay4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778142117; c=relaxed/simple;
	bh=jf9tPC/B1/Q7GF1atBHyPaWE932zA/QAY9+cliSKWZA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Fk+I+4if4xARS5SzPl0ehlzWn0EneTVKxjUQPKiCCPdfmbkHs+CSiulZnEgrBeqi76jtf2b5AasmYgs0vMt0+/nqq5koH4Gp8NWDTNy7hQM6hXjegUifY550/giIWF9O3ansLf0BMGc7lhE+29RKtHqRp6vopnBlhL2+hCqjXqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dfcbVxcP; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dfcbVxcP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778142115; x=1809678115;
  h=date:from:to:cc:subject:message-id;
  bh=jf9tPC/B1/Q7GF1atBHyPaWE932zA/QAY9+cliSKWZA=;
  b=dfcbVxcP+FtdYDa/ZZxTJtgQ5mhQrQLM9gnS5y7pNZWJs+CDvIhojMvF
   kBiqk5t0TYG8SYXPBgHLyPT3b+dx3NHPmHzNyo256eTq/yaL1d6qXFt2e
   IhpgwgENpR1DHj6KPoPnONN1bV3n6SEpw4lefkUNepwpCoQUncNoMENAo
   TkPbCrDZOuBgq0Cjn48YPhCyC+yHeZ17qEGZtTMXY1iFIfpFoHhnEfBv3
   NhpCXImh7bkUR5AkAF5dShrhXGaduKvnEd2Uu769T8ctI+ixEp1R4fB66
   MrRnS/nKx2z5LjFJf2+LGJZoT5zT3siLSAhy17xq2sG07nwAF21eCUNGm
   g==;
X-CSE-ConnectionGUID: pvx1FgetQNSXDxMLdzA7LQ==
X-CSE-MsgGUID: NVIDnCwPSZm/XLP3/4ehtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="96516431"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="96516431"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 01:21:55 -0700
X-CSE-ConnectionGUID: jDsLhH3ATIy0Iol6W1ffuA==
X-CSE-MsgGUID: gvdaYtC5QD6XWtLrC+Q8Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="232029042"
Received: from lkp-server01.sh.intel.com (HELO 8365ac1094ea) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 07 May 2026 01:21:53 -0700
Received: from kbuild by 8365ac1094ea with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKtzT-0000000007V-1qgs;
	Thu, 07 May 2026 08:21:51 +0000
Date: Thu, 07 May 2026 16:21:07 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 2/2]
 drivers/irqchip/irq-aspeed-scu-ic.c:107:27: warning: variable 'mask' set but
 not used
Message-ID: <202605071647.njqdwoi5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Ryan,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   45943b04c976bbe025ab4de8b416e589ae35b2e2
commit: b2a0c13f8b4fc3f6c8b279fdc4395a5fa57dda5d [2/2] irqchip/aspeed-scu-ic: Add support for AST2700 SCU interrupt controllers
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260507/202605071647.njqdwoi5-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260507/202605071647.njqdwoi5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: b2a0c13f8b4f ("irqchip/aspeed-scu-ic: Add support for AST2700 SCU interrupt controllers")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605071647.njqdwoi5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/irqchip/irq-aspeed-scu-ic.c: In function 'aspeed_scu_ic_irq_handler_split':
>> drivers/irqchip/irq-aspeed-scu-ic.c:107:27: warning: variable 'mask' set but not used [-Wunused-but-set-variable]
     107 |         unsigned int sts, mask;
         |                           ^~~~


vim +/mask +107 drivers/irqchip/irq-aspeed-scu-ic.c

   101	
   102	static void aspeed_scu_ic_irq_handler_split(struct irq_desc *desc)
   103	{
   104		struct aspeed_scu_ic *scu_ic = irq_desc_get_handler_data(desc);
   105		struct irq_chip *chip = irq_desc_get_chip(desc);
   106		unsigned long bit, enabled, max, status;
 > 107		unsigned int sts, mask;
   108	
   109		chained_irq_enter(chip, desc);
   110	
   111		mask = scu_ic->irq_enable;
   112		sts = readl(scu_ic->base + scu_ic->isr);
   113		enabled = sts & scu_ic->irq_enable;
   114		sts = readl(scu_ic->base + scu_ic->isr);
   115		status = sts & enabled;
   116	
   117		bit = scu_ic->irq_shift;
   118		max = scu_ic->num_irqs + bit;
   119	
   120		for_each_set_bit_from(bit, &status, max) {
   121			generic_handle_domain_irq(scu_ic->irq_domain, bit - scu_ic->irq_shift);
   122			/* Clear interrupt */
   123			writel(BIT(bit), scu_ic->base + scu_ic->isr);
   124		}
   125	
   126		chained_irq_exit(chip, desc);
   127	}
   128	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
