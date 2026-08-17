Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25032517A5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Aug 2026 05:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786943787; cv=none; b=AIzLuSYv+GwZoTVSx9MTKpNuDDvF19fmMQ7d5qREZynjdySNnach4mCTJobg3aB4JXzzmI8b43QEYuA/jhFkQuQ0T5mxxim7ImicnF2YFJTljtVpvtpvKdgqSoQpms9fm1yEkf07z7kQdQDPUTHunbkwCwfAKBewgX5gWrnfST4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786943787; c=relaxed/simple;
	bh=0gRjb7GbT7paYjKUZ9ewHtfHxURlAGynqCWuCCnJDx8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uxjVCNL3ldy5VyeeZkbEEGfhtzmpOU24HZ9tMvh1ciq6wIDRm5RhtBhEn2y0uI6BBVVSRalyq9Ln+Z54XM8OZ3rLIlc11CuUrClisHaYNDs7xDi/UhBXuJJYM49szQoymFSCpKHVKgVGOqmLmsS4qdKx2JZiIWwXzVLmmHqs1a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dx+Ur1wd; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dx+Ur1wd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786943785; x=1818479785;
  h=date:from:to:cc:subject:message-id;
  bh=0gRjb7GbT7paYjKUZ9ewHtfHxURlAGynqCWuCCnJDx8=;
  b=Dx+Ur1wdKzQ1jPt+lyz0D35rrCJd7gP4iU593ir0mjj9Sq45FfJe8JS8
   VTJ0idYYgmsk2HtwGnFqeUSCGNsr9t2oKUJa3vAfE1m1e3PhuU7fQ+OGf
   pIwxgDD8tcK2iGa5Qzn0XKlOgc/p9jvt5RO9PbZdztOXFs5YJCi1qmQLW
   sHgW8Ay75vTc+Fiv9rDl1V/+M0yFHyM8GnblzLx8Tzdp5AT08eLURM3KL
   ZJw3AOE9HlsDmoCyg2/gvPZgPxjyZaefg1Y9mHpJ0QqZhSZBrrtjC9tMk
   5pWLMLRF8EqWqj26gDbIyxkBqZ24NI7EbHCF3bzVYdfcU80gb9D7Y1zUB
   A==;
X-CSE-ConnectionGUID: JTOgFetsSCassM4BU8f5cA==
X-CSE-MsgGUID: w0wRn9a4QoyEfCTmGAwSow==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="87480294"
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="87480294"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2026 22:16:25 -0700
X-CSE-ConnectionGUID: gaX2yrFdRQ+u8MR4i4y78w==
X-CSE-MsgGUID: KMUivrqmQK+YuSh8naMc4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="261531174"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 16 Aug 2026 22:16:23 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvphs-00000000dJ0-3eSL;
	Mon, 17 Aug 2026 05:16:20 +0000
Date: Mon, 17 Aug 2026 13:16:00 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 arm@kernel.org
Subject: [soc:board-remove 132/217]
 drivers/i2c/busses/i2c-pxa-pci.c:41:29: warning: unused variable 'prop'
Message-ID: <202608171507.CDOR43wB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git board-remove
head:   057394422bc04420585b2790b230d8a1f350ace8
commit: 965e36538dc05c1751e466c2afa3124be407bc2d [132/217] i2c: pxa: remove platform data based probing
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260817/202608171507.CDOR43wB-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260817/202608171507.CDOR43wB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608171507.CDOR43wB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/i2c/busses/i2c-pxa-pci.c: In function 'add_i2c_device':
>> drivers/i2c/busses/i2c-pxa-pci.c:41:29: warning: unused variable 'prop' [-Wunused-variable]
      41 |                 const void *prop;
         |                             ^~~~


vim +/prop +41 drivers/i2c/busses/i2c-pxa-pci.c

7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  21  
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  22  static struct platform_device *add_i2c_device(struct pci_dev *dev, int bar)
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  23  {
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  24  	struct platform_device *pdev;
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  25  	struct resource res[2];
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  26  	struct device_node *child;
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  27  	static int devnum;
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  28  	int ret;
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  29  
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  30  	memset(&res, 0, sizeof(res));
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  31  
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  32  	res[0].flags = IORESOURCE_MEM;
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  33  	res[0].start = pci_resource_start(dev, bar);
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  34  	res[0].end = pci_resource_end(dev, bar);
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  35  
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  36  	res[1].flags = IORESOURCE_IRQ;
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  37  	res[1].start = dev->irq;
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  38  	res[1].end = dev->irq;
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  39  
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  40  	for_each_child_of_node(dev->dev.of_node, child) {
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02 @41  		const void *prop;
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  42  		struct resource r;
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  43  		int ret;
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  44  
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  45  		ret = of_address_to_resource(child, 0, &r);
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  46  		if (ret < 0)
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  47  			continue;
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  48  		if (r.start != res[0].start)
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  49  			continue;
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  50  		if (r.end != res[0].end)
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  51  			continue;
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  52  		if (r.flags != res[0].flags)
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  53  			continue;
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  54  
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  55  		break;
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  56  	}
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  57  
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  58  	if (!child) {
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  59  		dev_err(&dev->dev, "failed to match a DT node for bar %d.\n",
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  60  				bar);
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  61  		ret = -EINVAL;
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  62  		goto out;
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  63  	}
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  64  
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  65  	pdev = platform_device_alloc("ce4100-i2c", devnum);
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  66  	if (!pdev) {
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  67  		of_node_put(child);
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  68  		ret = -ENOMEM;
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  69  		goto out;
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  70  	}
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  71  	pdev->dev.parent = &dev->dev;
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  72  	pdev->dev.of_node = child;
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  73  
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  74  	ret = platform_device_add_resources(pdev, res, ARRAY_SIZE(res));
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  75  	if (ret)
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  76  		goto err;
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  77  
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  78  	ret = platform_device_add(pdev);
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  79  	if (ret)
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  80  		goto err;
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  81  	devnum++;
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  82  	return pdev;
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  83  err:
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  84  	platform_device_put(pdev);
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  85  out:
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  86  	return ERR_PTR(ret);
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  87  }
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  88  

:::::: The code at line 41 was first introduced by commit
:::::: 7e94dd154e934aa2137c427c3b1c8e9a6e465fcd i2c-pxa2xx: Add PCI support for PXA I2C controller

:::::: TO: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
:::::: CC: Ben Dooks <ben-linux@fluff.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
