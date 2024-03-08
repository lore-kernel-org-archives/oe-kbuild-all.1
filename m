Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB9A2CCDF
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Mar 2024 13:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709904957; cv=none; b=Mobk9ZBE7a9uvuPm1QPqRwIpr2mBhUrrzQSioPotHFnwWF/PI4fIu4gYhAXxWcsfMPA/SKlwseA65QMSyvWdhS0+RvsX5MlDUBiP8KsTQWMqknbscU06lSG5Iil4wXT+ZOVuILpT2ze2n1ajI1DHdvUDW65ulDYotXsgrPeh+yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709904957; c=relaxed/simple;
	bh=0Y32oNjQ07aTiGYIkJNwrCBZz3wXHNjY32FjJO9SLR8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K3Q/UrUrbR6vatP9EVESiIX7+I7Qoqx8zI7KU10LvNjXufwjTX35b0g+CGXNovhTUriCKSiNiS1Kn9Qr80jrRXYWLNi4h5/q/JD+lzh0WJq8pWeqcZ90o+suR3HIcIj+rN/PcM600jWoZ+KCK+r0B3aJRWA5wWK+gk8bHT55V08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fKOtlbYo; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fKOtlbYo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709904953; x=1741440953;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0Y32oNjQ07aTiGYIkJNwrCBZz3wXHNjY32FjJO9SLR8=;
  b=fKOtlbYouzsiALIE91jmprIee+kdhskGFJOgrhiJza6fx6jPYti55wrS
   DDjuD6YA9DcNai4dHHrZZ97QxfLrWtpK6qIk3LPocSqCPhjc2YHbISbVm
   VUAB+dD9h/0t8tvfhLZQA8uyAHLl49K5HZTL0eF7T5VYJkCG8dz2E9t2/
   rnvz3i8Xah1oP3A+zmxe/ibSSpLqCNT23spCQlXR4buscNWtedFoQQwb6
   0ecMhst/plo0Vs7DwwWRyhzBoBNbZuxX6MbWf1rI+ShIzIl+dYeExZSMN
   JRbqkwba12B14WlrDcWudyAbIw3Bx8/C8q4vDax38GC5ztR6zsyf+jJDF
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="15270325"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="15270325"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 05:35:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="10863983"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 08 Mar 2024 05:35:51 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1riaO4-0006P1-20;
	Fri, 08 Mar 2024 13:35:48 +0000
Date: Fri, 8 Mar 2024 21:35:04 +0800
From: kernel test robot <lkp@intel.com>
To: Chris Leech <cleech@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [char-misc:char-misc-next 68/70] drivers/uio/uio_pruss.c:194:34:
 warning: cast from pointer to integer of different size
Message-ID: <202403082105.jTF1eebn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git char-misc-next
head:   367b3560e10bbae3660d8ba4d0a7cc92170d8398
commit: 7722151e4651c973c18df0c18c015edcc7b43b25 [68/70] uio_pruss: UIO_MEM_DMA_COHERENT conversion
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20240308/202403082105.jTF1eebn-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240308/202403082105.jTF1eebn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403082105.jTF1eebn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/uio/uio_pruss.c: In function 'pruss_probe':
>> drivers/uio/uio_pruss.c:194:34: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     194 |                 p->mem[2].addr = (phys_addr_t) gdev->ddr_vaddr;
         |                                  ^


vim +194 drivers/uio/uio_pruss.c

   106	
   107	static int pruss_probe(struct platform_device *pdev)
   108	{
   109		struct uio_info *p;
   110		struct uio_pruss_dev *gdev;
   111		struct resource *regs_prussio;
   112		struct device *dev = &pdev->dev;
   113		int ret, cnt, i, len;
   114		struct uio_pruss_pdata *pdata = dev_get_platdata(dev);
   115	
   116		gdev = devm_kzalloc(dev, sizeof(struct uio_pruss_dev), GFP_KERNEL);
   117		if (!gdev)
   118			return -ENOMEM;
   119	
   120		gdev->info = devm_kcalloc(dev, MAX_PRUSS_EVT, sizeof(*p), GFP_KERNEL);
   121		if (!gdev->info)
   122			return -ENOMEM;
   123	
   124		/* Power on PRU in case its not done as part of boot-loader */
   125		gdev->pruss_clk = devm_clk_get(dev, "pruss");
   126		if (IS_ERR(gdev->pruss_clk)) {
   127			dev_err(dev, "Failed to get clock\n");
   128			return PTR_ERR(gdev->pruss_clk);
   129		}
   130	
   131		ret = clk_enable(gdev->pruss_clk);
   132		if (ret) {
   133			dev_err(dev, "Failed to enable clock\n");
   134			return ret;
   135		}
   136	
   137		regs_prussio = platform_get_resource(pdev, IORESOURCE_MEM, 0);
   138		if (!regs_prussio) {
   139			dev_err(dev, "No PRUSS I/O resource specified\n");
   140			ret = -EIO;
   141			goto err_clk_disable;
   142		}
   143	
   144		if (!regs_prussio->start) {
   145			dev_err(dev, "Invalid memory resource\n");
   146			ret = -EIO;
   147			goto err_clk_disable;
   148		}
   149	
   150		if (pdata->sram_pool) {
   151			gdev->sram_pool = pdata->sram_pool;
   152			gdev->sram_vaddr =
   153				(unsigned long)gen_pool_dma_alloc(gdev->sram_pool,
   154						sram_pool_sz, &gdev->sram_paddr);
   155			if (!gdev->sram_vaddr) {
   156				dev_err(dev, "Could not allocate SRAM pool\n");
   157				ret = -ENOMEM;
   158				goto err_clk_disable;
   159			}
   160		}
   161	
   162		gdev->ddr_vaddr = dma_alloc_coherent(dev, extram_pool_sz,
   163					&(gdev->ddr_paddr), GFP_KERNEL | GFP_DMA);
   164		if (!gdev->ddr_vaddr) {
   165			dev_err(dev, "Could not allocate external memory\n");
   166			ret = -ENOMEM;
   167			goto err_free_sram;
   168		}
   169	
   170		len = resource_size(regs_prussio);
   171		gdev->prussio_vaddr = ioremap(regs_prussio->start, len);
   172		if (!gdev->prussio_vaddr) {
   173			dev_err(dev, "Can't remap PRUSS I/O  address range\n");
   174			ret = -ENOMEM;
   175			goto err_free_ddr_vaddr;
   176		}
   177	
   178		ret = platform_get_irq(pdev, 0);
   179		if (ret < 0)
   180			goto err_unmap;
   181	
   182		gdev->hostirq_start = ret;
   183		gdev->pintc_base = pdata->pintc_base;
   184	
   185		for (cnt = 0, p = gdev->info; cnt < MAX_PRUSS_EVT; cnt++, p++) {
   186			p->mem[0].addr = regs_prussio->start;
   187			p->mem[0].size = resource_size(regs_prussio);
   188			p->mem[0].memtype = UIO_MEM_PHYS;
   189	
   190			p->mem[1].addr = gdev->sram_paddr;
   191			p->mem[1].size = sram_pool_sz;
   192			p->mem[1].memtype = UIO_MEM_PHYS;
   193	
 > 194			p->mem[2].addr = (phys_addr_t) gdev->ddr_vaddr;
   195			p->mem[2].dma_addr = gdev->ddr_paddr;
   196			p->mem[2].size = extram_pool_sz;
   197			p->mem[2].memtype = UIO_MEM_DMA_COHERENT;
   198			p->mem[2].dma_device = dev;
   199	
   200			p->name = devm_kasprintf(dev, GFP_KERNEL, "pruss_evt%d", cnt);
   201			p->version = DRV_VERSION;
   202	
   203			/* Register PRUSS IRQ lines */
   204			p->irq = gdev->hostirq_start + cnt;
   205			p->handler = pruss_handler;
   206			p->priv = gdev;
   207	
   208			ret = uio_register_device(dev, p);
   209			if (ret < 0)
   210				goto err_unloop;
   211		}
   212	
   213		platform_set_drvdata(pdev, gdev);
   214		return 0;
   215	
   216	err_unloop:
   217		for (i = 0, p = gdev->info; i < cnt; i++, p++) {
   218			uio_unregister_device(p);
   219		}
   220	err_unmap:
   221		iounmap(gdev->prussio_vaddr);
   222	err_free_ddr_vaddr:
   223		dma_free_coherent(dev, extram_pool_sz, gdev->ddr_vaddr,
   224				  gdev->ddr_paddr);
   225	err_free_sram:
   226		if (pdata->sram_pool)
   227			gen_pool_free(gdev->sram_pool, gdev->sram_vaddr, sram_pool_sz);
   228	err_clk_disable:
   229		clk_disable(gdev->pruss_clk);
   230	
   231		return ret;
   232	}
   233	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
