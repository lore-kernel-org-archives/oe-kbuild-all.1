Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017171E991A
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Mar 2025 23:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741045800; cv=none; b=S1d+4hmXA1duJKbedAQ5gl+EwuGjmGKpUvCMjQ0pKEigAXI5fREUQGZuEdtUchERnGscBe7izr9/BvS/Q1rXAn66XJnkAaM0tFtS/uHsGJxL/RwjBCXZZpRGO0wkGjAoM0uvk1QFn5ZX6jehWi5KyARp9+nV2MY31imXQcBLN9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741045800; c=relaxed/simple;
	bh=ajpworp3RkuZxWCUltroWvZ2CHThuFoVI3kMfJOFY4g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hfBN8iMV3jQ7FZILTOO2Yc0hFAaXwfsraCKFNhZ16IjS1dE3WKHrT6UzIRnNtbAYewMia8qdHvM1dbJelNi2GBts+twu4GXNs8B+GOBfFuMyvO+skjI7HSRYN18oleCkJ/436UeCEoIWL/PVOniVTfW/5hAfJWH5gedo61AFoE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H3Tc7Mf7; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H3Tc7Mf7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741045798; x=1772581798;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ajpworp3RkuZxWCUltroWvZ2CHThuFoVI3kMfJOFY4g=;
  b=H3Tc7Mf7z5cv+Tg5PB6PuB8zs7YJGpH0KHOy521aNNOKbuJv9ouVRon2
   6S+nid+fdWkLDwB1S0UtnBr0A/2e7oMogW9z5rRLmv1RoeUUBkWSN26Sm
   AWxpOlzub3HiTXhc6n8DqURwAh7ND+6rQInkEGpFs+c8aQZDjjUZfhhsE
   mHhKS56iuDkwJSc7yCaSFykCDYbq5sw9IRMz3XTKPonYjJwQNZIrCqeJB
   FkFZhZVWSgbr+jJxrm11JSnVOvZEIdzio8AQlkzSrIdOKsjMCoXXlKyfG
   HkZXjHBHf2SwzNyXuG7wF1aRS5JLhwGgzCgKfrrdMR4FclMiCxIxTqcNs
   Q==;
X-CSE-ConnectionGUID: ruLZVlkbQSulRUVFc6bTGg==
X-CSE-MsgGUID: 9XUnfJi0SzWbvosXFQWJFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="41652195"
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; 
   d="scan'208";a="41652195"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 15:49:56 -0800
X-CSE-ConnectionGUID: I6/AVyA3T2WFxRZtriTsOA==
X-CSE-MsgGUID: NwlHPHZERXSVU4tFDhwjKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="118042208"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 03 Mar 2025 15:49:56 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpFXl-000J3E-0M;
	Mon, 03 Mar 2025 23:49:53 +0000
Date: Tue, 4 Mar 2025 07:49:08 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 59/89] drivers/irqchip/irq-renesas-rzv2h.c:484:99:
 error: passing argument 4 of 'irq_domain_create_hierarchy' from incompatible
 pointer type
Message-ID: <202503040726.5vaEiMBp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   2e34f839068291b65952cdcabb82b977d40d165c
commit: d6c501a336104227712b722d4549298e70ea8b02 [59/89] drop irq_domain_add_hierarchy
config: x86_64-buildonly-randconfig-006-20250304 (https://download.01.org/0day-ci/archive/20250304/202503040726.5vaEiMBp-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250304/202503040726.5vaEiMBp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503040726.5vaEiMBp-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/irqchip/irq-renesas-rzv2h.c: In function 'rzv2h_icu_init':
>> drivers/irqchip/irq-renesas-rzv2h.c:484:99: error: passing argument 4 of 'irq_domain_create_hierarchy' from incompatible pointer type [-Werror=incompatible-pointer-types]
     484 |         irq_domain = irq_domain_create_hierarchy(of_fwnode_handle(parent_domain), 0, ICU_NUM_IRQ, node,
         |                                                                                                   ^~~~
         |                                                                                                   |
         |                                                                                                   struct device_node *
   In file included from include/linux/of_irq.h:8,
                    from include/linux/irqchip.h:17,
                    from drivers/irqchip/irq-renesas-rzv2h.c:17:
   include/linux/irqdomain.h:595:67: note: expected 'struct fwnode_handle *' but argument is of type 'struct device_node *'
     595 |                                             struct fwnode_handle *fwnode,
         |                                             ~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   cc1: some warnings being treated as errors
--
   drivers/irqchip/irq-stm32mp-exti.c: In function 'stm32mp_exti_probe':
>> drivers/irqchip/irq-stm32mp-exti.c:687:43: error: passing argument 4 of 'irq_domain_create_hierarchy' from incompatible pointer type [-Werror=incompatible-pointer-types]
     687 |                                           np, &stm32mp_exti_domain_ops,
         |                                           ^~
         |                                           |
         |                                           struct device_node *
   In file included from include/linux/of_irq.h:8,
                    from include/linux/irqchip.h:17,
                    from drivers/irqchip/irq-stm32mp-exti.c:13:
   include/linux/irqdomain.h:595:67: note: expected 'struct fwnode_handle *' but argument is of type 'struct device_node *'
     595 |                                             struct fwnode_handle *fwnode,
         |                                             ~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   cc1: some warnings being treated as errors
--
   drivers/irqchip/irq-ti-sci-intr.c: In function 'ti_sci_intr_irq_domain_probe':
>> drivers/irqchip/irq-ti-sci-intr.c:277:85: error: passing argument 4 of 'irq_domain_create_hierarchy' from incompatible pointer type [-Werror=incompatible-pointer-types]
     277 |         domain = irq_domain_create_hierarchy(of_fwnode_handle(parent_domain), 0, 0, dev_of_node(dev),
         |                                                                                     ^~~~~~~~~~~~~~~~
         |                                                                                     |
         |                                                                                     struct device_node *
   In file included from include/linux/of_irq.h:8,
                    from include/linux/irqchip.h:17,
                    from drivers/irqchip/irq-ti-sci-intr.c:13:
   include/linux/irqdomain.h:595:67: note: expected 'struct fwnode_handle *' but argument is of type 'struct device_node *'
     595 |                                             struct fwnode_handle *fwnode,
         |                                             ~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   cc1: some warnings being treated as errors


vim +/irq_domain_create_hierarchy +484 drivers/irqchip/irq-renesas-rzv2h.c

   423	
   424	static int rzv2h_icu_init(struct device_node *node, struct device_node *parent)
   425	{
   426		struct irq_domain *irq_domain, *parent_domain;
   427		struct rzv2h_icu_priv *rzv2h_icu_data;
   428		struct platform_device *pdev;
   429		struct reset_control *resetn;
   430		int ret;
   431	
   432		pdev = of_find_device_by_node(node);
   433		if (!pdev)
   434			return -ENODEV;
   435	
   436		parent_domain = irq_find_host(parent);
   437		if (!parent_domain) {
   438			dev_err(&pdev->dev, "cannot find parent domain\n");
   439			ret = -ENODEV;
   440			goto put_dev;
   441		}
   442	
   443		rzv2h_icu_data = devm_kzalloc(&pdev->dev, sizeof(*rzv2h_icu_data), GFP_KERNEL);
   444		if (!rzv2h_icu_data) {
   445			ret = -ENOMEM;
   446			goto put_dev;
   447		}
   448	
   449		rzv2h_icu_data->irqchip = &rzv2h_icu_chip;
   450	
   451		rzv2h_icu_data->base = devm_of_iomap(&pdev->dev, pdev->dev.of_node, 0, NULL);
   452		if (IS_ERR(rzv2h_icu_data->base)) {
   453			ret = PTR_ERR(rzv2h_icu_data->base);
   454			goto put_dev;
   455		}
   456	
   457		ret = rzv2h_icu_parse_interrupts(rzv2h_icu_data, node);
   458		if (ret) {
   459			dev_err(&pdev->dev, "cannot parse interrupts: %d\n", ret);
   460			goto put_dev;
   461		}
   462	
   463		resetn = devm_reset_control_get_exclusive(&pdev->dev, NULL);
   464		if (IS_ERR(resetn)) {
   465			ret = PTR_ERR(resetn);
   466			goto put_dev;
   467		}
   468	
   469		ret = reset_control_deassert(resetn);
   470		if (ret) {
   471			dev_err(&pdev->dev, "failed to deassert resetn pin, %d\n", ret);
   472			goto put_dev;
   473		}
   474	
   475		pm_runtime_enable(&pdev->dev);
   476		ret = pm_runtime_resume_and_get(&pdev->dev);
   477		if (ret < 0) {
   478			dev_err(&pdev->dev, "pm_runtime_resume_and_get failed: %d\n", ret);
   479			goto pm_disable;
   480		}
   481	
   482		raw_spin_lock_init(&rzv2h_icu_data->lock);
   483	
 > 484		irq_domain = irq_domain_create_hierarchy(of_fwnode_handle(parent_domain), 0, ICU_NUM_IRQ, node,
   485						      &rzv2h_icu_domain_ops, rzv2h_icu_data);
   486		if (!irq_domain) {
   487			dev_err(&pdev->dev, "failed to add irq domain\n");
   488			ret = -ENOMEM;
   489			goto pm_put;
   490		}
   491	
   492		/*
   493		 * coccicheck complains about a missing put_device call before returning, but it's a false
   494		 * positive. We still need &pdev->dev after successfully returning from this function.
   495		 */
   496		return 0;
   497	
   498	pm_put:
   499		pm_runtime_put(&pdev->dev);
   500	pm_disable:
   501		pm_runtime_disable(&pdev->dev);
   502		reset_control_assert(resetn);
   503	put_dev:
   504		put_device(&pdev->dev);
   505	
   506		return ret;
   507	}
   508	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
