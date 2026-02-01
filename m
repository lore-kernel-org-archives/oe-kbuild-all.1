Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E1E28E0F
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Feb 2026 01:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769910701; cv=none; b=sPsuOIp4QkEANpvis4HBTPlztuPpaCEaDuReO7ZbJOXPuAerAxQMzLtRi2rAtGI29WNbDBRjbLqxFO2wdE5CNMwBeUwyeqj5QrXf7D0ksEvTmKoNL1Rp1vj51+DU1X7aNLRtPmRgdyx0IDnqnubzBZ/C6Iftdg0AZtAzgUNBkms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769910701; c=relaxed/simple;
	bh=KDNPC6unyZCXf6HmUnc/bIRPIxIhQcPF/hjr3xju/XE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JmyumCqvduinDO0MITt3EsCd6DXm644XbXsjsJtNv8ywBe+9gvK+NZdz+M4vIgLZ0j+Gs4hw96oCubine+2B9qtIq02D0u4mD6xgUUBfhqcLc/lHnEBjjKEb1g/pylUKHtlsjOeVMAAGFrCO+tSSfRLee/qSceJ8TYUM41GsCNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l++1tD8w; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l++1tD8w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769910700; x=1801446700;
  h=date:from:to:cc:subject:message-id;
  bh=KDNPC6unyZCXf6HmUnc/bIRPIxIhQcPF/hjr3xju/XE=;
  b=l++1tD8wV4dmAqqX/BzmN4Dgjk624XLiS5SN0CY3OtHYyMepyGZOVtI4
   gu/PBrLeGF9+/okV4W0XpUKjDkcMQFVA+VkoCCsJJ+gUPFaEL3AKjgjbD
   Gy0efDCQxuZxWRPuY6pBd2ufIy2Iov0RjhMfGdLW2Iycyhz0vIYyvZCxS
   Yikwsmfoq1FxFLU38jr5R2WbBK/o0ibrAyHWbsKoFnHNTJCSTSnGKVJg0
   an2KXbJTvcvSgbQ8Hcu5iR9IYIp5VpIAYBrLij1ISgMonh7wpEouD9oJ0
   ZhX7e3FdLIZD+gNhAYkCamHqsboiaTOBcmk13qaFJuEySqNt/LFZLGtv5
   w==;
X-CSE-ConnectionGUID: LjgrcfzkQ8Ce96fgHJo52A==
X-CSE-MsgGUID: QOPuAS9UQX6cBbMSGkjAmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11688"; a="71200430"
X-IronPort-AV: E=Sophos;i="6.21,266,1763452800"; 
   d="scan'208";a="71200430"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2026 17:51:39 -0800
X-CSE-ConnectionGUID: oVHpIg+nSASzN4RUgUFx3Q==
X-CSE-MsgGUID: lvE7Phy4QjKEE1s03goMCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,266,1763452800"; 
   d="scan'208";a="209158294"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 31 Jan 2026 17:51:37 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmMch-00000000eX2-1IIT;
	Sun, 01 Feb 2026 01:51:35 +0000
Date: Sun, 01 Feb 2026 09:50:43 +0800
From: kernel test robot <lkp@intel.com>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>
Subject: drivers/irqchip/irq-aspeed-scu-ic.c:107:27: warning:
 variable 'mask' set but not used
Message-ID: <202602010957.9uuKqUkG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   162b42445b585cd89f45475848845db353539605
commit: b2a0c13f8b4fc3f6c8b279fdc4395a5fa57dda5d irqchip/aspeed-scu-ic: Add support for AST2700 SCU interrupt controllers
date:   5 months ago
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260201/202602010957.9uuKqUkG-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260201/202602010957.9uuKqUkG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602010957.9uuKqUkG-lkp@intel.com/

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
