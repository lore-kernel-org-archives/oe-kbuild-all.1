Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E5E11722
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 14:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693490514; x=1725026514;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LM79lv8uvdi+rJkCf2jtKsSehGH2d2Dn1BDPV1QEWls=;
  b=d93SRJboABSznyB1SsSyJP7/mrbptSsFfRLApFpYwjZzJ4yt4QK5GwWy
   awBOS22Mg7iM6kHdIfXWPbCgBHIbMOIxLLVfW1ucNCU5/j/0B8/bIk3TP
   hG+KR0gkcJWljvdPf9btidsnGur4nc0K7vzNf4Ow7wbH4i6IGwLNruTZd
   KW0QT0DnUDc3pGLcL7zoMTQJvuNOe2gHMjg9f/vxtLckMfC7zFNXSNFsP
   Tkll5AGkVM1cZDZIo49RxSfi110/ZvLtVDo19URDZStGDnyPzKRMlYz5f
   yU/kNG9D/3UQy2PeiiA1+xLqHevUa1fZ5CxXj0SSL4h6Q4Vyv7oS873Hp
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="374869507"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; 
   d="scan'208";a="374869507"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 07:01:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="774580012"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; 
   d="scan'208";a="774580012"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 31 Aug 2023 07:01:51 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbiF3-0000DV-2l;
	Thu, 31 Aug 2023 14:01:49 +0000
Date: Thu, 31 Aug 2023 22:01:31 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/639 3312/24603]
 drivers/irqchip/irq-imx-irqsteer.c:193:27: error: use of undeclared
 identifier 'irqsteer_data'
Message-ID: <202308312133.TMwtVoiO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Fugang,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc pr/639
head:   857fbf7cebaba3b1ffccc558deee1d13ac0e11d7
commit: 5e46c8d4031866e0084fcdeb68ca1998f158aa9d [3312/24603] MLK-17290-01 irqchip: imx-irqsteer: add runtime pm support
config: riscv-randconfig-r015-20230831 (https://download.01.org/0day-ci/archive/20230831/202308312133.TMwtVoiO-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308312133.TMwtVoiO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308312133.TMwtVoiO-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/irqchip/irq-imx-irqsteer.c:193:27: error: use of undeclared identifier 'irqsteer_data'
           ret = clk_prepare_enable(irqsteer_data->ipg_clk);
                                    ^
>> drivers/irqchip/irq-imx-irqsteer.c:385:21: error: use of undeclared identifier 'imx_irqsteer_runtime_suspend'; did you mean 'pm_generic_runtime_suspend'?
           SET_RUNTIME_PM_OPS(imx_irqsteer_runtime_suspend,
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
                              pm_generic_runtime_suspend
   include/linux/pm.h:341:21: note: expanded from macro 'SET_RUNTIME_PM_OPS'
           .runtime_suspend = suspend_fn, \
                              ^
   include/linux/pm_runtime.h:33:12: note: 'pm_generic_runtime_suspend' declared here
   extern int pm_generic_runtime_suspend(struct device *dev);
              ^
>> drivers/irqchip/irq-imx-irqsteer.c:386:7: error: use of undeclared identifier 'imx_irqsteer_runtime_resume'
                              imx_irqsteer_runtime_resume, NULL)
                              ^
   3 errors generated.


vim +/irqsteer_data +193 drivers/irqchip/irq-imx-irqsteer.c

   182	
   183	#ifdef CONFIG_PM_SLEEP
   184	static int imx_irqsteer_chans_enable(struct irqsteer_data *data)
   185	{
   186		return 0;
   187	}
   188	#else
   189	static int imx_irqsteer_chans_enable(struct irqsteer_data *data)
   190	{
   191		int ret;
   192	
 > 193		ret = clk_prepare_enable(irqsteer_data->ipg_clk);
   194		if (ret) {
   195			dev_err(data->dev, "failed to enable ipg clk: %d\n", ret);
   196			return ret;
   197		}
   198	
   199		/* steer all IRQs into configured channel */
   200		writel_relaxed(BIT(data->channel), data->regs + CHANCTRL);
   201	
   202		/* read back CHANCTRL register cannot reflact on HW register
   203		 * real value due to the HW action, so add one flag here.
   204		 */
   205		data->inited = true;
   206		return 0;
   207	}
   208	#endif
   209	
   210	static int imx_irqsteer_probe(struct platform_device *pdev)
   211	{
   212		struct device_node *np = pdev->dev.of_node;
   213		struct irqsteer_data *data;
   214		u32 irqs_num;
   215		int i, ret;
   216	
   217		data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
   218		if (!data)
   219			return -ENOMEM;
   220	
   221		data->chip = imx_irqsteer_irq_chip;
   222		data->chip.parent_device = &pdev->dev;
   223		data->dev = &pdev->dev;
   224		data->inited = false;
   225		data->regs = devm_platform_ioremap_resource(pdev, 0);
   226		if (IS_ERR(data->regs)) {
   227			dev_err(&pdev->dev, "failed to initialize reg\n");
   228			return PTR_ERR(data->regs);
   229		}
   230	
   231		data->ipg_clk = devm_clk_get(&pdev->dev, "ipg");
   232		if (IS_ERR(data->ipg_clk))
   233			return dev_err_probe(&pdev->dev, PTR_ERR(data->ipg_clk),
   234					     "failed to get ipg clk\n");
   235	
   236		ret = imx_irqsteer_attach_pd(data);
   237		if (ret < 0 && ret == -EPROBE_DEFER)
   238			return ret;
   239	
   240		ret = device_reset(&pdev->dev);
   241		if (ret == -EPROBE_DEFER)
   242			return ret;
   243	
   244		raw_spin_lock_init(&data->lock);
   245	
   246		ret = of_property_read_u32(np, "fsl,num-irqs", &irqs_num);
   247		if (ret)
   248			return ret;
   249		ret = of_property_read_u32(np, "fsl,channel", &data->channel);
   250		if (ret)
   251			return ret;
   252	
   253		/*
   254		 * There is one output irq for each group of 64 inputs.
   255		 * One register bit map can represent 32 input interrupts.
   256		 */
   257		data->irq_count = DIV_ROUND_UP(irqs_num, 64);
   258		data->reg_num = irqs_num / 32;
   259	
   260		if (IS_ENABLED(CONFIG_PM_SLEEP)) {
   261			data->saved_reg = devm_kzalloc(&pdev->dev,
   262						sizeof(u32) * data->reg_num,
   263						GFP_KERNEL);
   264			if (!data->saved_reg)
   265				return -ENOMEM;
   266		}
   267	
   268		ret = imx_irqsteer_chans_enable(data);
   269		if (ret)
   270			return ret;
   271	
   272		data->domain = irq_domain_add_linear(np, data->reg_num * 32,
   273						     &imx_irqsteer_domain_ops, data);
   274		if (!data->domain) {
   275			dev_err(&pdev->dev, "failed to create IRQ domain\n");
   276			ret = -ENOMEM;
   277			goto out;
   278		}
   279	
   280		if (!data->irq_count || data->irq_count > CHAN_MAX_OUTPUT_INT) {
   281			ret = -EINVAL;
   282			goto out;
   283		}
   284	
   285		for (i = 0; i < data->irq_count; i++) {
   286			data->irq[i] = irq_of_parse_and_map(np, i);
   287			if (!data->irq[i]) {
   288				ret = -EINVAL;
   289				goto out;
   290			}
   291	
   292			irq_set_chained_handler_and_data(data->irq[i],
   293							 imx_irqsteer_irq_handler,
   294							 data);
   295		}
   296	
   297		platform_set_drvdata(pdev, data);
   298	
   299		pm_runtime_enable(&pdev->dev);
   300		return 0;
   301	out:
   302		clk_disable_unprepare(data->ipg_clk);
   303		return ret;
   304	}
   305	
   306	static int imx_irqsteer_remove(struct platform_device *pdev)
   307	{
   308		struct irqsteer_data *irqsteer_data = platform_get_drvdata(pdev);
   309		int i;
   310	
   311		for (i = 0; i < irqsteer_data->irq_count; i++)
   312			irq_set_chained_handler_and_data(irqsteer_data->irq[i],
   313							 NULL, NULL);
   314	
   315		irq_domain_remove(irqsteer_data->domain);
   316	
   317		return pm_runtime_force_suspend(&pdev->dev);
   318	}
   319	
   320	#ifdef CONFIG_PM_SLEEP
   321	static void imx_irqsteer_init(struct irqsteer_data *data)
   322	{
   323		/* steer all IRQs into configured channel */
   324		writel_relaxed(BIT(data->channel), data->regs + CHANCTRL);
   325	
   326		/* read back CHANCTRL register cannot reflact on HW register
   327		 * real value due to the HW action, so add one flag here.
   328		 */
   329		data->inited = true;
   330	}
   331	
   332	static void imx_irqsteer_save_regs(struct irqsteer_data *data)
   333	{
   334		int i;
   335	
   336		for (i = 0; i < data->reg_num; i++)
   337			data->saved_reg[i] = readl_relaxed(data->regs +
   338							CHANMASK(i, data->reg_num));
   339	}
   340	
   341	static void imx_irqsteer_restore_regs(struct irqsteer_data *data)
   342	{
   343		int i;
   344	
   345		writel_relaxed(BIT(data->channel), data->regs + CHANCTRL);
   346		for (i = 0; i < data->reg_num; i++)
   347			writel_relaxed(data->saved_reg[i],
   348				       data->regs + CHANMASK(i, data->reg_num));
   349	}
   350	
   351	static int imx_irqsteer_runtime_suspend(struct device *dev)
   352	{
   353		struct irqsteer_data *irqsteer_data = dev_get_drvdata(dev);
   354	
   355		imx_irqsteer_save_regs(irqsteer_data);
   356		clk_disable_unprepare(irqsteer_data->ipg_clk);
   357	
   358		return 0;
   359	}
   360	
   361	static int imx_irqsteer_runtime_resume(struct device *dev)
   362	{
   363		struct irqsteer_data *irqsteer_data = dev_get_drvdata(dev);
   364		int ret;
   365	
   366		ret = clk_prepare_enable(irqsteer_data->ipg_clk);
   367		if (ret) {
   368			dev_err(dev, "failed to enable ipg clk: %d\n", ret);
   369			return ret;
   370		}
   371	
   372		/* don't need restore registers when first sub_irq requested */
   373		if (!irqsteer_data->inited)
   374			imx_irqsteer_init(irqsteer_data);
   375		else
   376			imx_irqsteer_restore_regs(irqsteer_data);
   377	
   378		return 0;
   379	}
   380	#endif
   381	
   382	static const struct dev_pm_ops imx_irqsteer_pm_ops = {
   383		SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
   384					      pm_runtime_force_resume)
 > 385		SET_RUNTIME_PM_OPS(imx_irqsteer_runtime_suspend,
 > 386				   imx_irqsteer_runtime_resume, NULL)
   387	};
   388	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
