Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3860415852B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Sep 2024 12:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726576815; cv=none; b=qQ7ASf36UNLP+GzPZ22h+Y0MD1JXKjGUaBvcCKE1pYaFKmuNSR1bOAfwL4JHJgJAGOg/MEzwJAwrARiuot2MgItaoOwxf8zvqbiATcZ4lvEdn8nrsWcIRWp8JzNG8lcm4VNQzRAwsmB29H8EQVLnJaMfE7dJKXmTr/U0FdxIWQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726576815; c=relaxed/simple;
	bh=etrwk9gFrvDg7dM+VyjrZYI157TreJuSnoz6zEtrodg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PFXXWCJqvCLC4iGEZlYsuDi4BDX5q9o18gd3SNF102gjY57VRUjTHjKrt4mW6aE853oltlD4IQL8A5f6syTzWXyri6pepSdkwshZdd+Dc3qiHQ7zxZ3BNIc2zDZ7DBGj2aHJb8aCL5TLs9Xzo6sr1iYRvpzndmsUcMkAFlTnn3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TgExq+Qt; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TgExq+Qt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726576813; x=1758112813;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=etrwk9gFrvDg7dM+VyjrZYI157TreJuSnoz6zEtrodg=;
  b=TgExq+Qt5o5+K92wN/Kbnz5ZXi8u/dmQK0mB9CqyG8JmK0s0iuzK9OOi
   2NThcFm9ajTbh3UL8XpdPJR/27jcAuDgIaEx3RgisUOzMRX0oWB6cKAR6
   lAbYAKPu5TmSSY1QzIRw2L1o0u8D9sL++fiCd3F1wwAXYWjuTkBom6+Rh
   RKKofhldbdPvcHJ8Qofy5pk3pV0tc+3QXByVT5MdWiwWjnKZcQxULuPQe
   A+I4OJ2vigLSk/J5t8B7WG7kyQepy6siUyP+Va2vVGfWzHTOSVI1O2g05
   2pyiWnA5eW217v+jfAvDySWGafY9/mxBrTru5N3D3G1KEqUNHVvWr9qJ5
   w==;
X-CSE-ConnectionGUID: /nw5FCFdSdymhyqhCT0dOA==
X-CSE-MsgGUID: ToLYd0/uSD22jwDgn5yGew==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="24963953"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="24963953"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2024 05:40:11 -0700
X-CSE-ConnectionGUID: 6/4tbs/7SJaJXT/DBNIVLQ==
X-CSE-MsgGUID: dYJv6a21RB60Z+fXOSsuMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="73753862"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 17 Sep 2024 05:40:10 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqXV2-000B8M-0f;
	Tue, 17 Sep 2024 12:40:08 +0000
Date: Tue, 17 Sep 2024 20:39:14 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [linux-next:master 11947/12283] drivers/dma/ep93xx_dma.c:1409:74:
 warning: '%u' directive output may be truncated writing between 1 and 8
 bytes into a region of size 2
Message-ID: <202409172024.pU8U5beA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4f3e012d4cfd1d9bf837870c961f462ca9f23ebe
commit: d7333f9d33772ba93f0144b1e3969866f80fdb9a [11947/12283] dmaengine: cirrus: use snprintf() to calm down gcc 13.3.0
config: arm-ep93xx_defconfig (https://download.01.org/0day-ci/archive/20240917/202409172024.pU8U5beA-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240917/202409172024.pU8U5beA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409172024.pU8U5beA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/dma/ep93xx_dma.c: In function 'ep93xx_dma_of_probe':
>> drivers/dma/ep93xx_dma.c:1409:74: warning: '%u' directive output may be truncated writing between 1 and 8 bytes into a region of size 2 [-Wformat-truncation=]
    1409 |                         snprintf(dma_clk_name, sizeof(dma_clk_name), "m2p%u", i);
         |                                                                          ^~
   drivers/dma/ep93xx_dma.c:1409:70: note: directive argument in the range [0, 20259280]
    1409 |                         snprintf(dma_clk_name, sizeof(dma_clk_name), "m2p%u", i);
         |                                                                      ^~~~~~~
   drivers/dma/ep93xx_dma.c:1409:25: note: 'snprintf' output between 5 and 12 bytes into a destination of size 5
    1409 |                         snprintf(dma_clk_name, sizeof(dma_clk_name), "m2p%u", i);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/ep93xx_dma.c:1407:74: warning: '%u' directive output may be truncated writing between 1 and 8 bytes into a region of size 2 [-Wformat-truncation=]
    1407 |                         snprintf(dma_clk_name, sizeof(dma_clk_name), "m2m%u", i);
         |                                                                          ^~
   drivers/dma/ep93xx_dma.c:1407:70: note: directive argument in the range [0, 20259280]
    1407 |                         snprintf(dma_clk_name, sizeof(dma_clk_name), "m2m%u", i);
         |                                                                      ^~~~~~~
   drivers/dma/ep93xx_dma.c:1407:25: note: 'snprintf' output between 5 and 12 bytes into a destination of size 5
    1407 |                         snprintf(dma_clk_name, sizeof(dma_clk_name), "m2m%u", i);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +1409 drivers/dma/ep93xx_dma.c

  1368	
  1369	static struct ep93xx_dma_engine *ep93xx_dma_of_probe(struct platform_device *pdev)
  1370	{
  1371		const struct ep93xx_edma_data *data;
  1372		struct device *dev = &pdev->dev;
  1373		struct ep93xx_dma_engine *edma;
  1374		struct dma_device *dma_dev;
  1375		char dma_clk_name[5];
  1376		int i;
  1377	
  1378		data = device_get_match_data(dev);
  1379		if (!data)
  1380			return ERR_PTR(dev_err_probe(dev, -ENODEV, "No device match found\n"));
  1381	
  1382		edma = devm_kzalloc(dev, struct_size(edma, channels, data->num_channels),
  1383				    GFP_KERNEL);
  1384		if (!edma)
  1385			return ERR_PTR(-ENOMEM);
  1386	
  1387		edma->m2m = data->id;
  1388		edma->num_channels = data->num_channels;
  1389		dma_dev = &edma->dma_dev;
  1390	
  1391		INIT_LIST_HEAD(&dma_dev->channels);
  1392		for (i = 0; i < edma->num_channels; i++) {
  1393			struct ep93xx_dma_chan *edmac = &edma->channels[i];
  1394	
  1395			edmac->chan.device = dma_dev;
  1396			edmac->regs = devm_platform_ioremap_resource(pdev, i);
  1397			if (IS_ERR(edmac->regs))
  1398				return edmac->regs;
  1399	
  1400			edmac->irq = fwnode_irq_get(dev_fwnode(dev), i);
  1401			if (edmac->irq < 0)
  1402				return ERR_PTR(edmac->irq);
  1403	
  1404			edmac->edma = edma;
  1405	
  1406			if (edma->m2m)
  1407				snprintf(dma_clk_name, sizeof(dma_clk_name), "m2m%u", i);
  1408			else
> 1409				snprintf(dma_clk_name, sizeof(dma_clk_name), "m2p%u", i);
  1410	
  1411			edmac->clk = devm_clk_get(dev, dma_clk_name);
  1412			if (IS_ERR(edmac->clk)) {
  1413				dev_err_probe(dev, PTR_ERR(edmac->clk),
  1414					      "no %s clock found\n", dma_clk_name);
  1415				return ERR_CAST(edmac->clk);
  1416			}
  1417	
  1418			spin_lock_init(&edmac->lock);
  1419			INIT_LIST_HEAD(&edmac->active);
  1420			INIT_LIST_HEAD(&edmac->queue);
  1421			INIT_LIST_HEAD(&edmac->free_list);
  1422			tasklet_setup(&edmac->tasklet, ep93xx_dma_tasklet);
  1423	
  1424			list_add_tail(&edmac->chan.device_node,
  1425				      &dma_dev->channels);
  1426		}
  1427	
  1428		return edma;
  1429	}
  1430	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
