Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF12D79C0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Sep 2024 14:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726844224; cv=none; b=rjOxZMwlK8ircDWoqfLDEx7xCyWW4iVRvSTmQenkzwtp26RL2wGqkXNdqkXcm5LE9/9QKe8hLy/+G2TM+m7wz9xqHzSfOLvyJhi0WdzC5sZ62XDz/ScBTZOsAqmo6PcIUriVrBvKL0ckv3xCXCYmZnkQyDr3TrjoQVtaVBPbWnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726844224; c=relaxed/simple;
	bh=DJQtLwc7C+EUP6aV/5pwI9cxbRoZHVl90pAiPKhvBqE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WYCD1hz4FvVa7QjF0oxdZOInulpMnHLUryAk86VqGNdPr1yncsszxIsJB0YM7q04qQBnBAR1aDUl4CV5HDUVD/RlE4j8fcU0XuCEOLhGze4r8usbY+9429vVAE6SeT0Gt7u9Fh+LruyAUWUi7VaUZu5xxC6vGmuwgqWEIT7Cjm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oD1lt2I2; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oD1lt2I2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726844223; x=1758380223;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DJQtLwc7C+EUP6aV/5pwI9cxbRoZHVl90pAiPKhvBqE=;
  b=oD1lt2I2DSs8GwyaKzfd0cvo+2CCVCikgSuyg6xHBpOl4rhcGqVlZBra
   zU/hXECupu5k6u4FUzc9kSLnBd9RUHicPRS33qzgFAhlWNKJL1rwfyJA1
   RVajviNu0k8p6FjrazabadYfvlzJIH2CJylly5AR+RSjv9JIW9ZbtUA14
   0MHw9F46Tseum00aAn/cBoi1l55114hN+hOfkacE/yyTs+HOFNavAO5cX
   3FwpyWCBBxqcZPrlt3jjO783YUcRXsiftOA+Cmn0NYgUBfirpkzHbpdg5
   zCRBvBQZZRvf+bl1l/p4yUSHOGrkgsUflUHh7mQ8Y8zLymeC1S6yzAh4X
   g==;
X-CSE-ConnectionGUID: y3lNvehAQeyJbjTgrwAmcw==
X-CSE-MsgGUID: zjtrHTHaTRKMRlX3LPpcQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="43373875"
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; 
   d="scan'208";a="43373875"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2024 07:57:01 -0700
X-CSE-ConnectionGUID: tN2b9hruQti1TmVtS3ubHg==
X-CSE-MsgGUID: I47AEPg8SdiLnZMo4C0iGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; 
   d="scan'208";a="69924858"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 20 Sep 2024 07:56:57 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1srf41-000EYZ-15;
	Fri, 20 Sep 2024 14:56:53 +0000
Date: Fri, 20 Sep 2024 22:56:32 +0800
From: kernel test robot <lkp@intel.com>
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>
Subject: [linux-next:master 11259/12481] drivers/dma/ep93xx_dma.c:1354:37:
 sparse: sparse: incorrect type in return expression (different address
 spaces)
Message-ID: <202409202250.fPlN2Erd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   62f92d634458a1e308bb699986b9147a6d670457
commit: 2e7f55ce430240a5547b8a94b4c532fc8c20b18b [11259/12481] dmaengine: cirrus: Convert to DT for Cirrus EP93xx
config: parisc-randconfig-r123-20240920 (https://download.01.org/0day-ci/archive/20240920/202409202250.fPlN2Erd-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240920/202409202250.fPlN2Erd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409202250.fPlN2Erd-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/dma/ep93xx_dma.c:1354:37: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct ep93xx_dma_engine * @@     got void [noderef] __iomem *regs @@
   drivers/dma/ep93xx_dma.c:1354:37: sparse:     expected struct ep93xx_dma_engine *
   drivers/dma/ep93xx_dma.c:1354:37: sparse:     got void [noderef] __iomem *regs

vim +1354 drivers/dma/ep93xx_dma.c

  1324	
  1325	static struct ep93xx_dma_engine *ep93xx_dma_of_probe(struct platform_device *pdev)
  1326	{
  1327		const struct ep93xx_edma_data *data;
  1328		struct device *dev = &pdev->dev;
  1329		struct ep93xx_dma_engine *edma;
  1330		struct dma_device *dma_dev;
  1331		char dma_clk_name[5];
  1332		int i;
  1333	
  1334		data = device_get_match_data(dev);
  1335		if (!data)
  1336			return ERR_PTR(dev_err_probe(dev, -ENODEV, "No device match found\n"));
  1337	
  1338		edma = devm_kzalloc(dev, struct_size(edma, channels, data->num_channels),
  1339				    GFP_KERNEL);
  1340		if (!edma)
  1341			return ERR_PTR(-ENOMEM);
  1342	
  1343		edma->m2m = data->id;
  1344		edma->num_channels = data->num_channels;
  1345		dma_dev = &edma->dma_dev;
  1346	
  1347		INIT_LIST_HEAD(&dma_dev->channels);
  1348		for (i = 0; i < edma->num_channels; i++) {
  1349			struct ep93xx_dma_chan *edmac = &edma->channels[i];
  1350	
  1351			edmac->chan.device = dma_dev;
  1352			edmac->regs = devm_platform_ioremap_resource(pdev, i);
  1353			if (IS_ERR(edmac->regs))
> 1354				return edmac->regs;
  1355	
  1356			edmac->irq = fwnode_irq_get(dev_fwnode(dev), i);
  1357			if (edmac->irq < 0)
  1358				return ERR_PTR(edmac->irq);
  1359	
  1360			edmac->edma = edma;
  1361	
  1362			if (edma->m2m)
  1363				sprintf(dma_clk_name, "m2m%u", i);
  1364			else
  1365				sprintf(dma_clk_name, "m2p%u", i);
  1366	
  1367			edmac->clk = devm_clk_get(dev, dma_clk_name);
  1368			if (IS_ERR(edmac->clk)) {
  1369				dev_err_probe(dev, PTR_ERR(edmac->clk),
  1370					      "no %s clock found\n", dma_clk_name);
  1371				return ERR_CAST(edmac->clk);
  1372			}
  1373	
  1374			spin_lock_init(&edmac->lock);
  1375			INIT_LIST_HEAD(&edmac->active);
  1376			INIT_LIST_HEAD(&edmac->queue);
  1377			INIT_LIST_HEAD(&edmac->free_list);
  1378			tasklet_setup(&edmac->tasklet, ep93xx_dma_tasklet);
  1379	
  1380			list_add_tail(&edmac->chan.device_node,
  1381				      &dma_dev->channels);
  1382		}
  1383	
  1384		return edma;
  1385	}
  1386	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
