Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216F020E0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Jan 2024 04:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705725030; cv=none; b=GOMF9rtisg+wWSY/LL2wO2mtkgzXvJ9dUiXQ4sAzWa/9dRcIYO4a7XFJoZrnbavFjk5IGJIEUYDyqbxKb7rwJ8wmfOz3seH0Y7bIbQFJLc+cPuFqhg2l1tAYfSgJEW3L4dPhKMYt4qabVqedeSPBqgS5HRazIa3e/L5m9PcaX7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705725030; c=relaxed/simple;
	bh=9HjzdrGSjJ07Eem2cQ9of9e9+7KQtM3FGLalB4/ssck=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e3W4tiscmmODpA+GEY1X8R/fnr7PGTI27KiN6Yr6wdBGwhNjfv5TFR+/FcW45RDvo3zUDyzk96Q2EduyoXR1Pc8mTsNiS9DQo9uqmXKFkrUwEY/7k5tJLi9KvF4Ub7iLJYnRstgM2M01FBSXrt03pSGnjcl80buOFWU1Hg/izsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D4Sj62Dd; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D4Sj62Dd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705725028; x=1737261028;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9HjzdrGSjJ07Eem2cQ9of9e9+7KQtM3FGLalB4/ssck=;
  b=D4Sj62DdvLVGstwwGzT+J79fJe8d03bgNE5ZDHhSjCDOlA/LDcAlqJC9
   SsJbAiFN1IZFm35TitgCAYw5/aiCIkExafbKKG0f1axmShxifBe8c3FbF
   R82KrG0qVGd+vVC5BN7nAox0p7xRDkeksYnhRXDnKfmxxWzvMJFnY0J5F
   19O/7fcF62ySSSWT23j69QuLFb83GgeDFZjNSFFR4vEM1tU2HOyZSCMid
   Hz6kLyyIbegtRQGYIVBeTByfA/ouZE7KnPFpJxtFlfmgAu6xFzL4OPj+E
   AD9JYh4iWCVY7pkiONZ63jqjSx/OadA5A8Gl7v09rrLP7ZTYUgbRFE5Pq
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="786387"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; 
   d="scan'208";a="786387"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2024 20:30:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="1116407470"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; 
   d="scan'208";a="1116407470"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 19 Jan 2024 20:30:26 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rR2zw-0004jw-0V;
	Sat, 20 Jan 2024 04:30:24 +0000
Date: Sat, 20 Jan 2024 12:30:23 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 21291/21561]
 drivers/spi/spi-phytium.c:459:62: warning: 'snprintf' output may be
 truncated before the last format character
Message-ID: <202401201255.BUcR8qry-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   0d29fbb6f9321a629cbf0ca30f15ce6f333ed7b9
commit: e8483fcd43fc1dbb8d21bb7eacce804cbab6a7c6 [21291/21561] spi: add phytium spi support
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240120/202401201255.BUcR8qry-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240120/202401201255.BUcR8qry-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401201255.BUcR8qry-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/spi/spi-phytium.c: In function 'phytium_spi_add_host':
>> drivers/spi/spi-phytium.c:459:62: warning: 'snprintf' output may be truncated before the last format character [-Wformat-truncation=]
     459 |         snprintf(fts->name, sizeof(fts->name), "phytium_spi%d", fts->bus_num);
         |                                                              ^
   drivers/spi/spi-phytium.c:459:9: note: 'snprintf' output between 13 and 17 bytes into a destination of size 16
     459 |         snprintf(fts->name, sizeof(fts->name), "phytium_spi%d", fts->bus_num);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/snprintf +459 drivers/spi/spi-phytium.c

   446	
   447	int phytium_spi_add_host(struct device *dev, struct phytium_spi *fts)
   448	{
   449		struct spi_master *master;
   450		int ret;
   451	
   452		WARN_ON(fts == NULL);
   453	
   454		master = spi_alloc_master(dev, 0);
   455		if (!master)
   456			return -ENOMEM;
   457	
   458		fts->master = master;
 > 459		snprintf(fts->name, sizeof(fts->name), "phytium_spi%d", fts->bus_num);
   460	
   461		ret = request_irq(fts->irq, phytium_spi_irq,
   462					IRQF_SHARED, fts->name, master);
   463		if (ret < 0) {
   464			dev_err(dev, "can not get IRQ\n");
   465			goto err_free_master;
   466		}
   467	
   468		master->mode_bits = SPI_CPOL | SPI_CPHA | SPI_LOOP;
   469		master->bits_per_word_mask = SPI_BPW_MASK(8) | SPI_BPW_MASK(16);
   470		master->bus_num = fts->bus_num;
   471		master->num_chipselect = fts->num_cs;
   472		master->setup = phytium_spi_setup;
   473		master->cleanup = phytium_spi_cleanup;
   474		master->set_cs = phytium_spi_set_cs;
   475		master->transfer_one = phytium_spi_transfer_one;
   476		master->handle_err = phytium_spi_handle_err;
   477		master->max_speed_hz = fts->max_freq;
   478		master->dev.of_node = dev->of_node;
   479		master->dev.fwnode = dev->fwnode;
   480		master->flags = SPI_MASTER_GPIO_SS;
   481		master->cs_gpios = fts->cs;
   482	
   483		spi_hw_init(dev, fts);
   484	
   485		spi_master_set_devdata(master, fts);
   486		ret = devm_spi_register_master(dev, master);
   487		if (ret) {
   488			dev_err(&master->dev, "problem registering spi master\n");
   489			goto err_exit;
   490		}
   491	
   492		return 0;
   493	
   494	err_exit:
   495		spi_enable_chip(fts, 0);
   496		free_irq(fts->irq, master);
   497	err_free_master:
   498		spi_master_put(master);
   499		return ret;
   500	}
   501	EXPORT_SYMBOL_GPL(phytium_spi_add_host);
   502	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
