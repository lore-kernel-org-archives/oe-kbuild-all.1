Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046411F63C6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Dec 2024 16:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734452454; cv=none; b=QmB148i0wOqk+d8jevn/nDa/EB4KlsN3ebCMCoLLOq+d1D4jej8sGCgZz7iLoNQ+JCy5KBg3IaXoLJtHCzwSRmheLcuXzIvxc2uSYCykzoCcrgm3m/jnFaLKhEPGBNRdHV5ILd7h9KWRUdGRsLJ3Dj1oSIS50vk7qCzib236eGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734452454; c=relaxed/simple;
	bh=B5OcCeaLuD3v0QNPSClbu0PEkSCgGGhyrw7aazZKz+8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Wcq/Ei15FzEuOwfCMt0moPCeDe0rGjXxudBOJ3FWRg5Wd7gPylppYMm0I7lVFc/R95aKfuRgigXjmSKErARPk8L79AsKZNKJgKpZ3LyiL2XlKHkLHZuO7hdOdleO3/VA/wU9tl7XqJm+kpDu0R60LWNPV7igDGiLO3zQVvrQfSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k5AR9RjX; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k5AR9RjX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734452452; x=1765988452;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B5OcCeaLuD3v0QNPSClbu0PEkSCgGGhyrw7aazZKz+8=;
  b=k5AR9RjX5FKqyc1F4gH27qmKdi9HhSO+DoNxKZIhcHLJE0SoK6Zu67Fq
   0cOPKMqdLc9bhZT4Hg9MH4hsCJqVjT0+h7B3f8nKzI0lljrgypzg7Esvy
   2pPonFM2Y7bdXbsGxQYyuz+WBecxzXcudI3w6o/8b8A1zWx5hYGumwrIZ
   zaW4tW2D0DUsbzs2F4KfHOeNM4/QrgYhzKnFX8uR/5u/gNhqtluNIZnDu
   3q1oxwE/g+42fhm75SjKhpxTI/5tSwdGoqy7ygC5zOfncaArNCYgPeSEt
   KDpWSatJrqutXBclCAXW9+iXhbhkIVgLa0K1yW+PpJRLtP+/oyKhdk0cL
   A==;
X-CSE-ConnectionGUID: TXjxQ5zbS3Kwunl8PRYX3g==
X-CSE-MsgGUID: PPXNjgWlQyOc11z3un5tlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="52296524"
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; 
   d="scan'208";a="52296524"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 08:20:52 -0800
X-CSE-ConnectionGUID: ONWC+riPSXq2jN9QNYDQHA==
X-CSE-MsgGUID: TadtHWIfSoSlR2YZ+fj8hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; 
   d="scan'208";a="128391383"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 17 Dec 2024 08:20:50 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNaJU-000F8q-0S;
	Tue, 17 Dec 2024 16:20:48 +0000
Date: Wed, 18 Dec 2024 00:20:32 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Hongchen Zhang <zhanghongchen@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1613/1613]
 drivers/char/ipmi/ipmi_si_ls2k500.c:92:5: sparse: sparse: symbol
 'ipmi_si_sim_setup' was not declared. Should it be static?
Message-ID: <202412180056.213DG4nb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   46064348cc445799cf9e8fd030323a0426fbb5e4
commit: 4fbeaa84ef36adce930088074f8c088e5dd780c0 [1613/1613] ipmi: add ls2k500 bmc ipmi support.
config: loongarch-randconfig-r111-20241210 (https://download.01.org/0day-ci/archive/20241218/202412180056.213DG4nb-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241218/202412180056.213DG4nb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412180056.213DG4nb-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/char/ipmi/ipmi_si_ls2k500.c:92:5: sparse: sparse: symbol 'ipmi_si_sim_setup' was not declared. Should it be static?
>> drivers/char/ipmi/ipmi_si_ls2k500.c:116:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *[addressable] [assigned] addr_source_data @@     got void [noderef] __iomem * @@
   drivers/char/ipmi/ipmi_si_ls2k500.c:116:29: sparse:     expected void *[addressable] [assigned] addr_source_data
   drivers/char/ipmi/ipmi_si_ls2k500.c:116:29: sparse:     got void [noderef] __iomem *
>> drivers/char/ipmi/ipmi_si_ls2k500.c:148:24: sparse: sparse: symbol 'ipmi_ls2k500_platform_driver' was not declared. Should it be static?
   drivers/char/ipmi/ipmi_si_ls2k500.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false

vim +/ipmi_si_sim_setup +92 drivers/char/ipmi/ipmi_si_ls2k500.c

    91	
  > 92	int ipmi_si_sim_setup(struct si_sm_io *io)
    93	{
    94		io->inputb = intf_sim_inb;
    95		io->outputb = intf_sim_outb;
    96		io->io_cleanup = ipmi_ls2k500_cleanup;
    97		return 0;
    98	}
    99	
   100	#define platform_resource_start(dev, bar)   ((dev)->resource[(bar)].start)
   101	#define platform_resource_end(dev, bar)     ((dev)->resource[(bar)].end)
   102	static int of_ipmi_ls2k500_probe(struct platform_device *pdev)
   103	{
   104		int rv;
   105		struct si_sm_io io;
   106		void **kcs_data;
   107	
   108		memset(&io, 0, sizeof(io));
   109		io.addr_source = SI_PLATFORM;
   110		dev_info(&pdev->dev, "probing via ls2k500 platform");
   111		io.si_type = SI_KCS;
   112	
   113		io.addr_space = IPMI_MEM_ADDR_SPACE;
   114		io.io_setup = ipmi_si_sim_setup;
   115		io.addr_data = pdev->resource[0].start;
 > 116		io.addr_source_data = ioremap(pdev->resource[0].start,
   117						pdev->resource[0].end -
   118						pdev->resource[0].start + 1);
   119		kcs_data = dev_get_platdata(&pdev->dev);
   120		event_jiffies = kcs_data[0];
   121		mscycles = kcs_data[1];
   122		io.dev = &pdev->dev;
   123		io.regspacing = 4;
   124		io.regsize = DEFAULT_REGSIZE;
   125		io.regshift = 0;
   126		io.irq = 0;
   127		if (io.irq)
   128			io.irq_setup = ipmi_std_irq_setup;
   129	
   130		dev_info(&pdev->dev, "%pR regsize %d spacing %d irq %d\n",
   131			&pdev->resource[0], io.regsize, io.regspacing, io.irq);
   132	
   133		rv = ipmi_si_add_smi(&io);
   134		if (rv)
   135			ipmi_si_remove_by_dev(&pdev->dev);
   136	
   137		return rv;
   138	}
   139	
   140	static int ipmi_ls2k500_remove(struct platform_device *pdev)
   141	{
   142		ipmi_si_remove_by_dev(&pdev->dev);
   143	
   144		return 0;
   145	}
   146	
   147	#define LS2K500_SI_DEVICE_NAME "ipmi_ls2k500_si"
 > 148	struct platform_driver ipmi_ls2k500_platform_driver = {
   149		.driver = {
   150			.name = LS2K500_SI_DEVICE_NAME,
   151		},
   152		.probe		= of_ipmi_ls2k500_probe,
   153		.remove		= ipmi_ls2k500_remove,
   154	};
   155	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
