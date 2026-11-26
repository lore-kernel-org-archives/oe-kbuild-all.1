Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795652838;
	b=C/muPmOS1wEVNPtAj+msrNYtzvvKvV4ktuqwIS9ItrgZU8uPWPjKVRp5d5QXOnkmx9K1
	 jMZHn5znOZ7wlWQhtPewnI08C9x4CGgCFh+EpupVDdps6VAp7glYIrKsC87bzL9Cok5gA
	 iG704B82fAToSptOirKTz3Sxf9TEmrLluFnJUSKhGZncTAdKUIqTD1HToMgprdb1UOsZy
	 FTe+j1+tLDMVhIAeFBYmaNICpc+uHZoNpLVCG3AcRkmAQHG4koqZ7AuaOSmrUJ7c4uQs+
	 L6vyN6LpYq/YILdAxuOZhzYQSeh0jeVrO65a6C3fsMJ0dAXhz0oFHz+xGjQctT7+57A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795652838;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=4yg+chZWXuIA5k+bDuQb27tz2by8oENbuame6ho1ty0=;
	b=NqQPdzO24vI5kPyBnC6EhEUzxlzCrGozNG+QUC4/JABZNLNGQLTa6G4YMx51Ya3PgeBL
	 QK5rrTOd7A1Q33TN2O0WctlEi2nmYgM53QkNnKGMFnCLVnMiy/fjQKQkH9eycXa6Tcaer
	 7bkzspfmJe5uxZDQT1hzeBF+WDhn1j/ywbTxKYe7kWEFXEY3P6Sl4Utb2Ch5KILtJ+fYI
	 DMyJqKAxAN0sbWfoGqQzHBDO4v0cS026ntl1W/xoqgPQsO+2RgGuiyqnEcgMDprKqFJbi
	 FNndHkNFcGEn89Ag5Jz3SZPSslWewUl3z7JOGDGC/AI7Khxw1+s+sSh6Gh8mQjHHPFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KTZPUZEH;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB223606A321
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Nov 2026 00:27:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB223606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KTZPUZEH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795652836; x=1827188836;
  h=date:from:to:cc:subject:message-id;
  bh=HT/ChmHRXeW0ORv15IXDwrXWZACOTiHLJUdAwkyQFg4=;
  b=KTZPUZEHIURbkpsTZKBnCrw7K7ZKDjDCiNf+ikyr/MU5p+ruwYxXPm1N
   d/Wz7R9wNsUvrDynRpkpdupa1FKrqtSMVcO1E9+/Sss8LexLoJgQ5Cisc
   UnIdvvA//xRSQWGT9viYcnBjP1wF+QeqQ18DBlDy6gJsuFDbc/N+n6Ee8
   XHuT9j2cBKvCFUQhZswKr+tcXWXv3FO3O6Jtb/17q7rVDqBMYaBDTZSJ9
   C+EMp7vQJ80+DFdzOZDE+mzh/UyF+br213UD1rGyoGJuuwtnvnWyIIR4Z
   xtDZ74dgRkF5OX/CWGVl2ZZ0ezA2whMpBfhwAVY4jBBN4q0rx8IJ8nY+5
   A==;
X-CSE-ConnectionGUID: 8VMAiUjkSrGLCSgIqUdcmw==
X-CSE-MsgGUID: occyNb00QmWOBeaiUqLJCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4451877"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4451877"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 16:27:16 -0800
X-CSE-ConnectionGUID: HuHJb3yPS5qcSinSw4jwSA==
X-CSE-MsgGUID: 5GWuN7TRQcaKfSy+/r1pUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="11882066"
Received: from igk-lkp-server01.igk.intel.com (HELO a03d4d989450) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 25 Nov 2026 16:27:14 -0800
Received: from kbuild by a03d4d989450 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWNKQ-000000000Al-3uPN;
	Thu, 26 Nov 2026 00:27:10 +0000
Date: Thu, 26 Nov 2026 01:26:23 +0100
From: kernel test robot <lkp@intel.com>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: drivers/gpu/drm/omapdrm/dss/dsi.c:4933:2-9: line 4933 is
 redundant because platform_get_irq() already prints an error
Message-ID: <20261126012255.5iEGIm0r-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ebb7a8dc1e74c705daffe11c2faf38ec2628f838
commit: af8296450df7678c94ae03054887639e3d4d35de drm/omap: dsi: print errors with device prefix
date:   9 weeks ago
config: powerpc-randconfig-r2104-20261125 (https://download.01.org/0day-ci/archive/20261126/20261126012255.5iEGIm0r-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: af8296450df7 ("drm/omap: dsi: print errors with device prefix")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261126012255.5iEGIm0r-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/omapdrm/dss/dsi.c:4933:2-9: line 4933 is redundant because platform_get_irq() already prints an error

vim +4933 drivers/gpu/drm/omapdrm/dss/dsi.c

  4917	
  4918		dsi_mem = platform_get_resource_byname(pdev, IORESOURCE_MEM, "proto");
  4919		dsi->proto_base = devm_ioremap_resource(dev, dsi_mem);
  4920		if (IS_ERR(dsi->proto_base))
  4921			return PTR_ERR(dsi->proto_base);
  4922	
  4923		dsi->phy_base = devm_platform_ioremap_resource_byname(pdev, "phy");
  4924		if (IS_ERR(dsi->phy_base))
  4925			return PTR_ERR(dsi->phy_base);
  4926	
  4927		dsi->pll_base = devm_platform_ioremap_resource_byname(pdev, "pll");
  4928		if (IS_ERR(dsi->pll_base))
  4929			return PTR_ERR(dsi->pll_base);
  4930	
  4931		dsi->irq = platform_get_irq(pdev, 0);
  4932		if (dsi->irq < 0) {
> 4933			dev_err(dsi->dev, "platform_get_irq failed\n");
  4934			return -ENODEV;
  4935		}
  4936	
  4937		r = devm_request_irq(dev, dsi->irq, omap_dsi_irq_handler,
  4938				     IRQF_SHARED, dev_name(dev), dsi);
  4939		if (r < 0) {
  4940			dev_err(dsi->dev, "request_irq failed\n");
  4941			return r;
  4942		}
  4943	
  4944		dsi->vdds_dsi_reg = devm_regulator_get(dev, "vdd");
  4945		if (IS_ERR(dsi->vdds_dsi_reg)) {
  4946			if (PTR_ERR(dsi->vdds_dsi_reg) != -EPROBE_DEFER)
  4947				dev_err(dsi->dev, "can't get DSI VDD regulator\n");
  4948			return PTR_ERR(dsi->vdds_dsi_reg);
  4949		}
  4950	
  4951		soc = soc_device_match(dsi_soc_devices);
  4952		if (soc)
  4953			dsi->data = soc->data;
  4954		else
  4955			dsi->data = of_match_node(dsi_of_match, dev->of_node)->data;
  4956	
  4957		d = dsi->data->modules;
  4958		while (d->address != 0 && d->address != dsi_mem->start)
  4959			d++;
  4960	
  4961		if (d->address == 0) {
  4962			dev_err(dsi->dev, "unsupported DSI module\n");
  4963			return -ENODEV;
  4964		}
  4965	
  4966		dsi->module_id = d->id;
  4967	
  4968		if (dsi->data->model == DSI_MODEL_OMAP4 ||
  4969		    dsi->data->model == DSI_MODEL_OMAP5) {
  4970			struct device_node *np;
  4971	
  4972			/*
  4973			 * The OMAP4/5 display DT bindings don't reference the padconf
  4974			 * syscon. Our only option to retrieve it is to find it by name.
  4975			 */
  4976			np = of_find_node_by_name(NULL,
  4977				dsi->data->model == DSI_MODEL_OMAP4 ?
  4978				"omap4_padconf_global" : "omap5_padconf_global");
  4979			if (!np)
  4980				return -ENODEV;
  4981	
  4982			dsi->syscon = syscon_node_to_regmap(np);
  4983			of_node_put(np);
  4984		}
  4985	
  4986		/* DSI VCs initialization */
  4987		for (i = 0; i < ARRAY_SIZE(dsi->vc); i++)
  4988			dsi->vc[i].source = DSI_VC_SOURCE_L4;
  4989	
  4990		r = dsi_get_clocks(dsi);
  4991		if (r)
  4992			return r;
  4993	
  4994		pm_runtime_enable(dev);
  4995	
  4996		/* DSI on OMAP3 doesn't have register DSI_GNQ, set number
  4997		 * of data to 3 by default */
  4998		if (dsi->data->quirks & DSI_QUIRK_GNQ) {
  4999			dsi_runtime_get(dsi);
  5000			/* NB_DATA_LANES */
  5001			dsi->num_lanes_supported = 1 + REG_GET(dsi, DSI_GNQ, 11, 9);
  5002			dsi_runtime_put(dsi);
  5003		} else {
  5004			dsi->num_lanes_supported = 3;
  5005		}
  5006	
  5007		dsi->host.ops = &omap_dsi_host_ops;
  5008		dsi->host.dev = &pdev->dev;
  5009	
  5010		r = dsi_probe_of(dsi);
  5011		if (r) {
  5012			dev_err(dsi->dev, "Invalid DSI DT data\n");
  5013			goto err_pm_disable;
  5014		}
  5015	
  5016		r = mipi_dsi_host_register(&dsi->host);
  5017		if (r < 0) {
  5018			dev_err(&pdev->dev, "failed to register DSI host: %d\n", r);
  5019			goto err_pm_disable;
  5020		}
  5021	
  5022		r = dsi_init_output(dsi);
  5023		if (r)
  5024			goto err_dsi_host_unregister;
  5025	
  5026		r = component_add(&pdev->dev, &dsi_component_ops);
  5027		if (r)
  5028			goto err_uninit_output;
  5029	
  5030		return 0;
  5031	
  5032	err_uninit_output:
  5033		dsi_uninit_output(dsi);
  5034	err_dsi_host_unregister:
  5035		mipi_dsi_host_unregister(&dsi->host);
  5036	err_pm_disable:
  5037		pm_runtime_disable(dev);
  5038		return r;
  5039	}
  5040	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
