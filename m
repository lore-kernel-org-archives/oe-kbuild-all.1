Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B833054785
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Aug 2026 04:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785558855; cv=none; b=rXgIUPLCEFmGhqWlyQlmKK6FwAyjQjrEUKnrm1nFWNrZnj2embBxQ23wdIjSjmLsYJpRRBM05FVec3A0x+1088OXQqhWE71EkHeXgqQUiuwh+rdDn2iRQs3vbZTkGfGE6NtXgS1WETVrqvvwPUwLzyez9mit7JXMeeZYxB8rDhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785558855; c=relaxed/simple;
	bh=UXWK/eUNDSKQCHXz9mKOEwkMGqZd0HK3m2Xc8GNmKco=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KXa31Rz82GAv3upoWmQk4kyHjfKZbD/2b6uOb5mDbDpiAaMAigbBwJn7Fq8rS1nwEwEEIxKYomJTUei4Y+SUYAGd8USBi/2RORDdFGYivZvJHO7zudF036d4mypH8ia0PEnE3Xz6QDBjUbIvrtEzAH0y8ICVr6slNm4/d1thNmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XhlLRnGr; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XhlLRnGr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785558853; x=1817094853;
  h=date:from:to:cc:subject:message-id;
  bh=UXWK/eUNDSKQCHXz9mKOEwkMGqZd0HK3m2Xc8GNmKco=;
  b=XhlLRnGrAiJD28CdHIukFmTV6vX6jUtdm4T9I7A7QP9sDQI+6PkGOp8B
   I61fFkriihQ53K4POytAving3SgYA4exrN9XU/5CqqnRFHgX1oimFFVXI
   /pMnKbYSb1zYywbweGA5W7zIF5bcrr4dU5S8OnId9TRxtYS5X5nvEKuuC
   jBUhy+0kX4R1ya3DWQR1gjTLQPPH4rZtkeCjkQEAfnCbZidBTkbbT49ey
   XRnBuo/P+hrgWuCrkqTIULvdzKr7rNbnmVMwkwEqPHPT+XPX/+8tqsA+5
   o92SiXpz4d4UojniK5qcQufVOcrUuqh6TRVPPM4AkoPWp3TtBzVTHC9c9
   A==;
X-CSE-ConnectionGUID: hS1q70iQT8qL7EliTNbC+Q==
X-CSE-MsgGUID: XhilHMYvQaKiTE5MCCAXEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11861"; a="86040728"
X-IronPort-AV: E=Sophos;i="6.25,197,1779174000"; 
   d="scan'208";a="86040728"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 21:34:12 -0700
X-CSE-ConnectionGUID: bj3fNMUxTqivGudQewyiSA==
X-CSE-MsgGUID: WLXuzs38Tb+RA7GfGtesRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,197,1779174000"; 
   d="scan'208";a="265804869"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 31 Jul 2026 21:34:11 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wq1QG-000000002jp-0eJe;
	Sat, 01 Aug 2026 04:34:08 +0000
Date: Sat, 01 Aug 2026 12:33:26 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Palmer <daniel@0x0f.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chenxing:mstar_v6_5_reorder 278/700]
 drivers/irqchip/irq-msc313-pm-wakeup.c:132:9: warning: ignoring return value
 of 'request_irq' declared with attribute 'warn_unused_result'
Message-ID: <202608011202.Oet4bIzN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/linux-chenxing/linux.git mstar_v6_5_reorder
head:   1a5c60e65ea399670a5384b869c4958338af2799
commit: f140c99a8d0eb90029eb3e9ebc6077300aaf3d53 [278/700] ARM: mstar: Add header for pmsleep area registers
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260801/202608011202.Oet4bIzN-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260801/202608011202.Oet4bIzN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608011202.Oet4bIzN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/irqchip/irq-msc313-pm-wakeup.c: In function 'msc313_pm_wakeup_intc_of_init':
>> drivers/irqchip/irq-msc313-pm-wakeup.c:132:9: warning: ignoring return value of 'request_irq' declared with attribute 'warn_unused_result' [-Wunused-result]
     132 |         request_irq(irq, msc313_pm_wakeup_intc_chainedhandler, IRQF_SHARED,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     133 |                                 "pmsleep", domain);
         |                                 ~~~~~~~~~~~~~~~~~~
--
>> drivers/pinctrl/mstar/pinctrl-msc313-pm.c:44:27: warning: 'pm_irin_groups' defined but not used [-Wunused-const-variable=]
      44 | static const char * const pm_irin_groups[] = {
         |                           ^~~~~~~~~~~~~~
>> drivers/pinctrl/mstar/pinctrl-msc313-pm.c:40:27: warning: 'pm_spi_groups' defined but not used [-Wunused-const-variable=]
      40 | static const char * const pm_spi_groups[] = {
         |                           ^~~~~~~~~~~~~
>> drivers/pinctrl/mstar/pinctrl-msc313-pm.c:36:27: warning: 'pm_uart_groups' defined but not used [-Wunused-const-variable=]
      36 | static const char * const pm_uart_groups[] = {
         |                           ^~~~~~~~~~~~~~


vim +132 drivers/irqchip/irq-msc313-pm-wakeup.c

106aac5fe9efb3c Daniel Palmer 2020-11-23   97  
106aac5fe9efb3c Daniel Palmer 2020-11-23   98  static int __init msc313_pm_wakeup_intc_of_init(struct device_node *node,
106aac5fe9efb3c Daniel Palmer 2020-11-23   99  				   struct device_node *parent)
106aac5fe9efb3c Daniel Palmer 2020-11-23  100  {
106aac5fe9efb3c Daniel Palmer 2020-11-23  101  	int ret = 0, irq;
106aac5fe9efb3c Daniel Palmer 2020-11-23  102  	struct regmap *pmsleep;
106aac5fe9efb3c Daniel Palmer 2020-11-23  103  	struct msc313_sleep_intc *intc;
106aac5fe9efb3c Daniel Palmer 2020-11-23  104  	struct irq_domain *domain;
106aac5fe9efb3c Daniel Palmer 2020-11-23  105  
106aac5fe9efb3c Daniel Palmer 2020-11-23  106  	irq = of_irq_get(node, 0);
106aac5fe9efb3c Daniel Palmer 2020-11-23  107  	if (irq <= 0)
106aac5fe9efb3c Daniel Palmer 2020-11-23  108  		return irq;
106aac5fe9efb3c Daniel Palmer 2020-11-23  109  
106aac5fe9efb3c Daniel Palmer 2020-11-23  110  	pmsleep = syscon_regmap_lookup_by_phandle(node, "mstar,pmsleep");
106aac5fe9efb3c Daniel Palmer 2020-11-23  111  	if (IS_ERR(pmsleep))
106aac5fe9efb3c Daniel Palmer 2020-11-23  112  		return PTR_ERR(pmsleep);
106aac5fe9efb3c Daniel Palmer 2020-11-23  113  
106aac5fe9efb3c Daniel Palmer 2020-11-23  114  	intc = kzalloc(sizeof(*intc), GFP_KERNEL);
106aac5fe9efb3c Daniel Palmer 2020-11-23  115  	if (!intc)
106aac5fe9efb3c Daniel Palmer 2020-11-23  116  		return -ENOMEM;
106aac5fe9efb3c Daniel Palmer 2020-11-23  117  
106aac5fe9efb3c Daniel Palmer 2020-11-23  118  	intc->mask = regmap_field_alloc(pmsleep, mask_field);
106aac5fe9efb3c Daniel Palmer 2020-11-23  119  	intc->type = regmap_field_alloc(pmsleep, type_field);
106aac5fe9efb3c Daniel Palmer 2020-11-23  120  	intc->status = regmap_field_alloc(pmsleep, status_field);
106aac5fe9efb3c Daniel Palmer 2020-11-23  121  
106aac5fe9efb3c Daniel Palmer 2020-11-23  122  	/* The masks survive deep sleep so clear them. */
106aac5fe9efb3c Daniel Palmer 2020-11-23  123  	regmap_field_write(intc->mask, ~0);
106aac5fe9efb3c Daniel Palmer 2020-11-23  124  
106aac5fe9efb3c Daniel Palmer 2020-11-23  125  	domain = irq_domain_add_linear(node, NUM_IRQ,
106aac5fe9efb3c Daniel Palmer 2020-11-23  126  			&msc313_pm_wakeup_intc_domain_ops, intc);
106aac5fe9efb3c Daniel Palmer 2020-11-23  127  	if (!domain) {
106aac5fe9efb3c Daniel Palmer 2020-11-23  128  		ret = -ENOMEM;
106aac5fe9efb3c Daniel Palmer 2020-11-23  129  		goto out_free;
106aac5fe9efb3c Daniel Palmer 2020-11-23  130  	}
106aac5fe9efb3c Daniel Palmer 2020-11-23  131  
106aac5fe9efb3c Daniel Palmer 2020-11-23 @132  	request_irq(irq, msc313_pm_wakeup_intc_chainedhandler, IRQF_SHARED,
106aac5fe9efb3c Daniel Palmer 2020-11-23  133  				"pmsleep", domain);
106aac5fe9efb3c Daniel Palmer 2020-11-23  134  
106aac5fe9efb3c Daniel Palmer 2020-11-23  135  	return 0;
106aac5fe9efb3c Daniel Palmer 2020-11-23  136  
106aac5fe9efb3c Daniel Palmer 2020-11-23  137  out_free:
106aac5fe9efb3c Daniel Palmer 2020-11-23  138  	kfree(intc);
106aac5fe9efb3c Daniel Palmer 2020-11-23  139  	return ret;
106aac5fe9efb3c Daniel Palmer 2020-11-23  140  }
106aac5fe9efb3c Daniel Palmer 2020-11-23  141  

:::::: The code at line 132 was first introduced by commit
:::::: 106aac5fe9efb3c824bae041d1a3ea81eb52b25f irqchip: MStar wakeup intc

:::::: TO: Daniel Palmer <daniel@0x0f.com>
:::::: CC: Daniel Palmer <daniel@0x0f.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
