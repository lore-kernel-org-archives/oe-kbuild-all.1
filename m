Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9CC881E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Jan 2025 02:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736648826; cv=none; b=u03ZJMfxWQj/WcVLGjNd7vMLku/5+ybWB4+TB92gGJm20kZKk01oLgTR7zJztJQlvSCzY+xGsYbPm7fZV1iNo+ulIcZVYMZ2cEKCEhEhLBz3B6cBEvDdcRgh/1wkc19U4NkZf3YJh5XtUKSZdUUalf6v6P6FKDUmnH/ZT5lxkak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736648826; c=relaxed/simple;
	bh=hgLRpLIOo76iyhXHD+lkSY+eW6h1hjsR8m+HN8XjnFU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iKfhRA3M5OOS6P82D2MKWaaT6zcOcsIAv41mC2udNupDsmaV+9X2a8ZpFQzLhdaGPpYPH5fODhHzBngg3P6C3tVgYX5yg1XCqbdna67DGCvZxd1hRf4mDZz69sPg5JM0ewzc6TVkJ7PXJzMbAqihifCFSgJqWLG6TQ4QjNQ+TKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YasN5EmQ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YasN5EmQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736648824; x=1768184824;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=hgLRpLIOo76iyhXHD+lkSY+eW6h1hjsR8m+HN8XjnFU=;
  b=YasN5EmQXslDNh+UdH5B9k0TOt46+nY7S7V1IoxqHfA381ZyqNM1I3Ui
   iJrFd1ELgXTKNBKLcMW9U/gpqld/JY+Ffo/8GbX2S6ZHZulOc+Gtw6Zpg
   eX7zfsCdGtfAO/83ocQdOr4gDcRx2Sy5hXtZpphuTq9ip66DmRFlu8OZl
   PeTovVVuxY+NxCQmHK+5VurXqOM2RiBajIjcxd1FX71Ki6d3xpJeS9Pps
   Hhiiz6QquND5eDXC8gqhO+2aCBrkyUvU81m3IvLpemcb0RBraANB4PbyG
   +PP9TkpMLFSCQZOibTV4cTWxTNO5ym7JSm0Gl7dmS+C1NOThuxCyoDmlF
   w==;
X-CSE-ConnectionGUID: 8QdPG0txRdOm0uJ61isNqw==
X-CSE-MsgGUID: 1KV2LUVqSyii8M9nA0D89Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="36788368"
X-IronPort-AV: E=Sophos;i="6.12,308,1728975600"; 
   d="scan'208";a="36788368"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 18:27:04 -0800
X-CSE-ConnectionGUID: qb9fM7S8RfWZccCdY8GxBg==
X-CSE-MsgGUID: E3ulPa8URgiQb+vefNFbiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,308,1728975600"; 
   d="scan'208";a="104143333"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 11 Jan 2025 18:27:02 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWngo-000LTr-2m;
	Sun, 12 Jan 2025 02:26:58 +0000
Date: Sun, 12 Jan 2025 10:26:09 +0800
From: kernel test robot <lkp@intel.com>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] spmi: Fix controller->node != parent->node breakage
Message-ID: <202501121029.AZEll6tS-lkp@intel.com>
References: <20250111-topic-spmi_node_breakage-v1-1-3f60111a1d19@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250111-topic-spmi_node_breakage-v1-1-3f60111a1d19@oss.qualcomm.com>

Hi Konrad,

kernel test robot noticed the following build errors:

[auto build test ERROR on 2b88851f583d3c4e40bcd40cfe1965241ec229dd]

url:    https://github.com/intel-lab-lkp/linux/commits/Konrad-Dybcio/spmi-Fix-controller-node-parent-node-breakage/20250111-192215
base:   2b88851f583d3c4e40bcd40cfe1965241ec229dd
patch link:    https://lore.kernel.org/r/20250111-topic-spmi_node_breakage-v1-1-3f60111a1d19%40oss.qualcomm.com
patch subject: [PATCH] spmi: Fix controller->node != parent->node breakage
config: i386-buildonly-randconfig-001-20250112 (https://download.01.org/0day-ci/archive/20250112/202501121029.AZEll6tS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250112/202501121029.AZEll6tS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501121029.AZEll6tS-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/spmi/spmi-mtk-pmif.c: In function 'mtk_spmi_probe':
>> drivers/spmi/spmi-mtk-pmif.c:456:55: warning: passing argument 2 of 'devm_spmi_controller_alloc' makes pointer from integer without a cast [-Wint-conversion]
     456 |         ctrl = devm_spmi_controller_alloc(&pdev->dev, sizeof(*arb));
         |                                                       ^~~~~~~~~~~~
         |                                                       |
         |                                                       unsigned int
   In file included from drivers/spmi/spmi-mtk-pmif.c:11:
   include/linux/spmi.h:125:72: note: expected 'struct device_node *' but argument is of type 'unsigned int'
     125 |                                                    struct device_node *node,
         |                                                    ~~~~~~~~~~~~~~~~~~~~^~~~
>> drivers/spmi/spmi-mtk-pmif.c:456:16: error: too few arguments to function 'devm_spmi_controller_alloc'
     456 |         ctrl = devm_spmi_controller_alloc(&pdev->dev, sizeof(*arb));
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spmi.h:124:25: note: declared here
     124 | struct spmi_controller *devm_spmi_controller_alloc(struct device *parent,
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/spmi/hisi-spmi-controller.c: In function 'spmi_controller_probe':
>> drivers/spmi/hisi-spmi-controller.c:271:60: error: expected ')' before 'sizeof'
     271 |                                           pdev->dev.of_node
         |                                                            ^
         |                                                            )
     272 |                                           sizeof(*spmi_controller));
         |                                           ~~~~~~            
   drivers/spmi/hisi-spmi-controller.c:270:42: note: to match this '('
     270 |         ctrl = devm_spmi_controller_alloc(&pdev->dev,
         |                                          ^
>> drivers/spmi/hisi-spmi-controller.c:270:16: error: too few arguments to function 'devm_spmi_controller_alloc'
     270 |         ctrl = devm_spmi_controller_alloc(&pdev->dev,
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/spmi/hisi-spmi-controller.c:13:
   include/linux/spmi.h:124:25: note: declared here
     124 | struct spmi_controller *devm_spmi_controller_alloc(struct device *parent,
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/devm_spmi_controller_alloc +456 drivers/spmi/spmi-mtk-pmif.c

504eb71e4717ddf James Lo               2021-12-16  448  
b45b3ccef8c063d James Lo               2021-12-16  449  static int mtk_spmi_probe(struct platform_device *pdev)
b45b3ccef8c063d James Lo               2021-12-16  450  {
b45b3ccef8c063d James Lo               2021-12-16  451  	struct pmif *arb;
b45b3ccef8c063d James Lo               2021-12-16  452  	struct spmi_controller *ctrl;
b45b3ccef8c063d James Lo               2021-12-16  453  	int err, i;
b45b3ccef8c063d James Lo               2021-12-16  454  	u32 chan_offset;
b45b3ccef8c063d James Lo               2021-12-16  455  
ffdfbafdc4f46a9 Fei Shao               2023-12-06 @456  	ctrl = devm_spmi_controller_alloc(&pdev->dev, sizeof(*arb));
ffdfbafdc4f46a9 Fei Shao               2023-12-06  457  	if (IS_ERR(ctrl))
ffdfbafdc4f46a9 Fei Shao               2023-12-06  458  		return PTR_ERR(ctrl);
b45b3ccef8c063d James Lo               2021-12-16  459  
b45b3ccef8c063d James Lo               2021-12-16  460  	arb = spmi_controller_get_drvdata(ctrl);
b45b3ccef8c063d James Lo               2021-12-16  461  	arb->data = device_get_match_data(&pdev->dev);
b45b3ccef8c063d James Lo               2021-12-16  462  	if (!arb->data) {
b45b3ccef8c063d James Lo               2021-12-16  463  		dev_err(&pdev->dev, "Cannot get drv_data\n");
ffdfbafdc4f46a9 Fei Shao               2023-12-06  464  		return -EINVAL;
b45b3ccef8c063d James Lo               2021-12-16  465  	}
b45b3ccef8c063d James Lo               2021-12-16  466  
b45b3ccef8c063d James Lo               2021-12-16  467  	arb->base = devm_platform_ioremap_resource_byname(pdev, "pmif");
ffdfbafdc4f46a9 Fei Shao               2023-12-06  468  	if (IS_ERR(arb->base))
ffdfbafdc4f46a9 Fei Shao               2023-12-06  469  		return PTR_ERR(arb->base);
b45b3ccef8c063d James Lo               2021-12-16  470  
b45b3ccef8c063d James Lo               2021-12-16  471  	arb->spmimst_base = devm_platform_ioremap_resource_byname(pdev, "spmimst");
ffdfbafdc4f46a9 Fei Shao               2023-12-06  472  	if (IS_ERR(arb->spmimst_base))
ffdfbafdc4f46a9 Fei Shao               2023-12-06  473  		return PTR_ERR(arb->spmimst_base);
b45b3ccef8c063d James Lo               2021-12-16  474  
b45b3ccef8c063d James Lo               2021-12-16  475  	arb->nclks = ARRAY_SIZE(pmif_clock_names);
b45b3ccef8c063d James Lo               2021-12-16  476  	for (i = 0; i < arb->nclks; i++)
b45b3ccef8c063d James Lo               2021-12-16  477  		arb->clks[i].id = pmif_clock_names[i];
b45b3ccef8c063d James Lo               2021-12-16  478  
e821d50ab5b956e Yu-Che Cheng           2023-12-06  479  	err = clk_bulk_get(&pdev->dev, arb->nclks, arb->clks);
b45b3ccef8c063d James Lo               2021-12-16  480  	if (err) {
b45b3ccef8c063d James Lo               2021-12-16  481  		dev_err(&pdev->dev, "Failed to get clocks: %d\n", err);
ffdfbafdc4f46a9 Fei Shao               2023-12-06  482  		return err;
b45b3ccef8c063d James Lo               2021-12-16  483  	}
b45b3ccef8c063d James Lo               2021-12-16  484  
b45b3ccef8c063d James Lo               2021-12-16  485  	err = clk_bulk_prepare_enable(arb->nclks, arb->clks);
b45b3ccef8c063d James Lo               2021-12-16  486  	if (err) {
b45b3ccef8c063d James Lo               2021-12-16  487  		dev_err(&pdev->dev, "Failed to enable clocks: %d\n", err);
e821d50ab5b956e Yu-Che Cheng           2023-12-06  488  		goto err_put_clks;
b45b3ccef8c063d James Lo               2021-12-16  489  	}
b45b3ccef8c063d James Lo               2021-12-16  490  
b45b3ccef8c063d James Lo               2021-12-16  491  	ctrl->cmd = pmif_arb_cmd;
b45b3ccef8c063d James Lo               2021-12-16  492  	ctrl->read_cmd = pmif_spmi_read_cmd;
b45b3ccef8c063d James Lo               2021-12-16  493  	ctrl->write_cmd = pmif_spmi_write_cmd;
b45b3ccef8c063d James Lo               2021-12-16  494  
b45b3ccef8c063d James Lo               2021-12-16  495  	chan_offset = PMIF_CHAN_OFFSET * arb->data->soc_chan;
b45b3ccef8c063d James Lo               2021-12-16  496  	arb->chan.ch_sta = PMIF_SWINF_0_STA + chan_offset;
b45b3ccef8c063d James Lo               2021-12-16  497  	arb->chan.wdata = PMIF_SWINF_0_WDATA_31_0 + chan_offset;
b45b3ccef8c063d James Lo               2021-12-16  498  	arb->chan.rdata = PMIF_SWINF_0_RDATA_31_0 + chan_offset;
b45b3ccef8c063d James Lo               2021-12-16  499  	arb->chan.ch_send = PMIF_SWINF_0_ACC + chan_offset;
b45b3ccef8c063d James Lo               2021-12-16  500  	arb->chan.ch_rdy = PMIF_SWINF_0_VLD_CLR + chan_offset;
b45b3ccef8c063d James Lo               2021-12-16  501  
f200fff8d019f27 Nícolas F. R. A. Prado 2023-12-06  502  	raw_spin_lock_init(&arb->lock);
f200fff8d019f27 Nícolas F. R. A. Prado 2023-12-06  503  
b45b3ccef8c063d James Lo               2021-12-16  504  	platform_set_drvdata(pdev, ctrl);
b45b3ccef8c063d James Lo               2021-12-16  505  
b45b3ccef8c063d James Lo               2021-12-16  506  	err = spmi_controller_add(ctrl);
b45b3ccef8c063d James Lo               2021-12-16  507  	if (err)
b45b3ccef8c063d James Lo               2021-12-16  508  		goto err_domain_remove;
b45b3ccef8c063d James Lo               2021-12-16  509  
b45b3ccef8c063d James Lo               2021-12-16  510  	return 0;
b45b3ccef8c063d James Lo               2021-12-16  511  
b45b3ccef8c063d James Lo               2021-12-16  512  err_domain_remove:
b45b3ccef8c063d James Lo               2021-12-16  513  	clk_bulk_disable_unprepare(arb->nclks, arb->clks);
e821d50ab5b956e Yu-Che Cheng           2023-12-06  514  err_put_clks:
e821d50ab5b956e Yu-Che Cheng           2023-12-06  515  	clk_bulk_put(arb->nclks, arb->clks);
b45b3ccef8c063d James Lo               2021-12-16  516  	return err;
b45b3ccef8c063d James Lo               2021-12-16  517  }
b45b3ccef8c063d James Lo               2021-12-16  518  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
