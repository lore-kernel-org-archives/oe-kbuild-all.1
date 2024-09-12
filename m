Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ABD21A76A4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Sep 2024 13:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726147624; cv=none; b=bAR3imCGwa9/LqNc/JFlgb+YP1TdWM4CHf1Pu/HLcVQHmwWs9yHnj6cklL0zVGK3Hft3cFHkHXg8tTWbOMjGpqb5AX77pzVgQ/BitYn98WK7Bnq5Esp0bSc3ey4RRqArTKFYzXndQvC+VCAcHYDIx5RPPO0TQ7en+MW26WGHn9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726147624; c=relaxed/simple;
	bh=fYZ3FYSmCGF2/F5pXNsP25JdV/ESS5CsojGVTLiGkAE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RpORTCEHYv1HufKzN9Wryi5sf99Wt0YTk8GbklSWPvr6ujYR1WBhzCqV+MPAO28JjxXoMUq//yzj9Kl2S2houa8cEEM0lGeE7D6z69hndF9qopANoKQREqHgBHDY/DHTWEzFFaVPINNF9uY0jo9Q1i22YDPPcfO5a36qqCFkEcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HBfaBeIO; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HBfaBeIO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726147623; x=1757683623;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fYZ3FYSmCGF2/F5pXNsP25JdV/ESS5CsojGVTLiGkAE=;
  b=HBfaBeIOWZWz84cFV135tgVnPIyziVgU1wI6ys1L2MLUoVNg+I5UBJqS
   ltc8Jedp1DSjyRi2TzKzLiT3elivlmCRsQNGDbpnEBY5OUUupCQL4hKm3
   +bC/qstOkU6/QF4lzFMbh1fvnKSqMby3e6OdE2Tit2yr1xBFwmvvVzP5f
   93PAOAfM9W9L8TmcbSjZbHVXbt6wDjqTCl1EOVyaNWWfutZ7kl8Av7NkB
   Dq8N6pzFFnQdq6QCpwTIucCxCjHChk4Cj0QEZ9O5vZBIPnKH3NT8Kv7F6
   JOpjoI7uvy+gDwpKmaODmiySyx4DPPAeiZBtNnGMHoCEacPiRWec8dYxc
   A==;
X-CSE-ConnectionGUID: 3s1F6NLBQ4K/YXsq5GAY4w==
X-CSE-MsgGUID: qNAesaBBRQ6Oy73uJLHSNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="24873067"
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; 
   d="scan'208";a="24873067"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 06:27:02 -0700
X-CSE-ConnectionGUID: 86bN+JjeQoaRG00QLdr1wQ==
X-CSE-MsgGUID: TCUtiK/IQsiwuNaN0NaFdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; 
   d="scan'208";a="72519616"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 12 Sep 2024 06:27:01 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sojqc-0005DS-1R;
	Thu, 12 Sep 2024 13:26:58 +0000
Date: Thu, 12 Sep 2024 21:26:48 +0800
From: kernel test robot <lkp@intel.com>
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>
Subject: [linux-next:master 11144/11623] drivers/dma/ep93xx_dma.c:1365:51:
 warning: '%u' directive writing between 1 and 8 bytes into a region of size
 2
Message-ID: <202409122133.NctarRoK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   57f962b956f1d116cd64d5c406776c4975de549d
commit: 4e8ad5ed845beead6211d2121598fa84e40bca70 [11144/11623] dmaengine: cirrus: Convert to DT for Cirrus EP93xx
config: powerpc-randconfig-r036-20220117 (https://download.01.org/0day-ci/archive/20240912/202409122133.NctarRoK-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240912/202409122133.NctarRoK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409122133.NctarRoK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/dma/ep93xx_dma.c: In function 'ep93xx_dma_of_probe':
>> drivers/dma/ep93xx_dma.c:1365:51: warning: '%u' directive writing between 1 and 8 bytes into a region of size 2 [-Wformat-overflow=]
    1365 |                         sprintf(dma_clk_name, "m2p%u", i);
         |                                                   ^~
   drivers/dma/ep93xx_dma.c:1365:47: note: directive argument in the range [0, 16777216]
    1365 |                         sprintf(dma_clk_name, "m2p%u", i);
         |                                               ^~~~~~~
   drivers/dma/ep93xx_dma.c:1365:25: note: 'sprintf' output between 5 and 12 bytes into a destination of size 5
    1365 |                         sprintf(dma_clk_name, "m2p%u", i);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/ep93xx_dma.c:1363:51: warning: '%u' directive writing between 1 and 8 bytes into a region of size 2 [-Wformat-overflow=]
    1363 |                         sprintf(dma_clk_name, "m2m%u", i);
         |                                                   ^~
   drivers/dma/ep93xx_dma.c:1363:47: note: directive argument in the range [0, 16777216]
    1363 |                         sprintf(dma_clk_name, "m2m%u", i);
         |                                               ^~~~~~~
   drivers/dma/ep93xx_dma.c:1363:25: note: 'sprintf' output between 5 and 12 bytes into a destination of size 5
    1363 |                         sprintf(dma_clk_name, "m2m%u", i);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +1365 drivers/dma/ep93xx_dma.c

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
  1354				return edmac->regs;
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
> 1365				sprintf(dma_clk_name, "m2p%u", i);
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
