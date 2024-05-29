Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD7FA48
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 May 2024 05:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716958836; cv=none; b=ppw6iYFyV4wATMVxKEEMisIFQ2iw8nGD30eVEzlUkBc6rJhJxk30WRI645qziZrz/eLdOIftTWY4T1d31IB/7q4NTgNMvFYOgE8+nrClDJnPDlljDjowhmxxlMaQuzk4D7E/9XfNE1SFjulI3IBK6MBrY9S9woC9PxcDjG6ZUBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716958836; c=relaxed/simple;
	bh=pr5UY11mqCCaLOvdOYZATrz+rRoWEgueTskDCUbhOt4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OrUDuhxiI5QT6LCVAiIc9BVJ/j90CVRE30W5cgDrFyWpA0Fj0aNtmil6X6q686be1VUn58SraQudhpI1pw074QLjA2CL1m/LEmWzPQKCNDhlCnYYkw7BUaMCqxmpQ6iAaeJVRu94WzhfPpH96I6eOKla3vCLG0uhi4hAehHjvv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jjO6MM9e; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jjO6MM9e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716958834; x=1748494834;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pr5UY11mqCCaLOvdOYZATrz+rRoWEgueTskDCUbhOt4=;
  b=jjO6MM9eCed2Q4355PhPtQT2SrgNDXP/7ga+RiJBzlS4BGfGkzovL08r
   D5L+QXzCf81irh1iCuWpHtBg26ATgFqfp0y4RFuHfZszbYj2pX/UxEs+E
   5JRihLk0KVcD50fMsrIq+jFZE1GzTCKB638sRXr5BlVz3XM435PhaphxH
   hpjCCTFiGiovnB2A89uOu/DOhgMJClIjTVUxOVllntG8zHFy1ujAwuKiO
   WQ0DmO+mrhZtB4EpQ/+PkZfPAG/QAg85xzxb+GDjSbTkxlgmpc7tsIaNu
   n7d/S8eFhJ8ghcmemt+3fxAP9C10KZboIESRLrm2CKK6HfBGlSb2fu8TT
   A==;
X-CSE-ConnectionGUID: Kro8S5x0SMK8crEKqQ0W/w==
X-CSE-MsgGUID: dN6L1T4zTGivZVtVUeyDHg==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13162448"
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; 
   d="scan'208";a="13162448"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 22:00:33 -0700
X-CSE-ConnectionGUID: +WxiQZonSLCY0fwX3WW6NA==
X-CSE-MsgGUID: IiMqKHzWRISSX6rF6t/18g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; 
   d="scan'208";a="66160814"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 28 May 2024 22:00:32 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCBQF-000D8R-0p;
	Wed, 29 May 2024 05:00:28 +0000
Date: Wed, 29 May 2024 12:59:47 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:struct-device 20/20] drivers/zorro/zorro.c:184:23:
 error: 'struct device' has no member named 'id'
Message-ID: <202405291235.fuJ32z1Q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bvanassche/linux struct-device
head:   f37061809bb98e131179785e0d1ff3fe5bfbd819
commit: f37061809bb98e131179785e0d1ff3fe5bfbd819 [20/20] driver core: Remove struct device::id
config: m68k-defconfig (https://download.01.org/0day-ci/archive/20240529/202405291235.fuJ32z1Q-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240529/202405291235.fuJ32z1Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405291235.fuJ32z1Q-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/zorro/zorro.c: In function 'amiga_zorro_probe':
>> drivers/zorro/zorro.c:184:23: error: 'struct device' has no member named 'id'
     184 |                 z->dev.id = i;
         |                       ^


vim +184 drivers/zorro/zorro.c

^1da177e4c3f41 Linus Torvalds     2005-04-16  126  
0d305464aefff3 Geert Uytterhoeven 2009-04-05  127  static int __init amiga_zorro_probe(struct platform_device *pdev)
^1da177e4c3f41 Linus Torvalds     2005-04-16  128  {
0d305464aefff3 Geert Uytterhoeven 2009-04-05  129  	struct zorro_bus *bus;
c293738e6d8dfb Geert Uytterhoeven 2013-06-29  130  	struct zorro_dev_init *zi;
^1da177e4c3f41 Linus Torvalds     2005-04-16  131  	struct zorro_dev *z;
0d305464aefff3 Geert Uytterhoeven 2009-04-05  132  	struct resource *r;
^1da177e4c3f41 Linus Torvalds     2005-04-16  133  	unsigned int i;
11a8b2c5cde137 Geert Uytterhoeven 2008-12-30  134  	int error;
^1da177e4c3f41 Linus Torvalds     2005-04-16  135  
^1da177e4c3f41 Linus Torvalds     2005-04-16  136  	/* Initialize the Zorro bus */
acafe7e3021616 Kees Cook          2018-05-08  137  	bus = kzalloc(struct_size(bus, devices, zorro_num_autocon),
c293738e6d8dfb Geert Uytterhoeven 2013-06-29  138  		      GFP_KERNEL);
0d305464aefff3 Geert Uytterhoeven 2009-04-05  139  	if (!bus)
0d305464aefff3 Geert Uytterhoeven 2009-04-05  140  		return -ENOMEM;
0d305464aefff3 Geert Uytterhoeven 2009-04-05  141  
c293738e6d8dfb Geert Uytterhoeven 2013-06-29  142  	zorro_autocon = bus->devices;
0d305464aefff3 Geert Uytterhoeven 2009-04-05  143  	bus->dev.parent = &pdev->dev;
83b7bce3d390f1 Geert Uytterhoeven 2013-10-16  144  	dev_set_name(&bus->dev, zorro_bus_type.name);
0d305464aefff3 Geert Uytterhoeven 2009-04-05  145  	error = device_register(&bus->dev);
11a8b2c5cde137 Geert Uytterhoeven 2008-12-30  146  	if (error) {
11a8b2c5cde137 Geert Uytterhoeven 2008-12-30  147  		pr_err("Zorro: Error registering zorro_bus\n");
10b68799b32d60 Vasiliy Kulikov    2010-09-19  148  		put_device(&bus->dev);
0d305464aefff3 Geert Uytterhoeven 2009-04-05  149  		kfree(bus);
11a8b2c5cde137 Geert Uytterhoeven 2008-12-30  150  		return error;
11a8b2c5cde137 Geert Uytterhoeven 2008-12-30  151  	}
0d305464aefff3 Geert Uytterhoeven 2009-04-05  152  	platform_set_drvdata(pdev, bus);
^1da177e4c3f41 Linus Torvalds     2005-04-16  153  
0d305464aefff3 Geert Uytterhoeven 2009-04-05  154  	pr_info("Zorro: Probing AutoConfig expansion devices: %u device%s\n",
0d305464aefff3 Geert Uytterhoeven 2009-04-05  155  		 zorro_num_autocon, zorro_num_autocon == 1 ? "" : "s");
0d305464aefff3 Geert Uytterhoeven 2009-04-05  156  
a7f4d00a82feb5 Geert Uytterhoeven 2011-09-22  157  	/* First identify all devices ... */
^1da177e4c3f41 Linus Torvalds     2005-04-16  158  	for (i = 0; i < zorro_num_autocon; i++) {
c293738e6d8dfb Geert Uytterhoeven 2013-06-29  159  		zi = &zorro_autocon_init[i];
^1da177e4c3f41 Linus Torvalds     2005-04-16  160  		z = &zorro_autocon[i];
c293738e6d8dfb Geert Uytterhoeven 2013-06-29  161  
c293738e6d8dfb Geert Uytterhoeven 2013-06-29  162  		z->rom = zi->rom;
bd9ba8f40ee30e Geert Uytterhoeven 2013-10-04  163  		z->id = (be16_to_cpu(z->rom.er_Manufacturer) << 16) |
bd9ba8f40ee30e Geert Uytterhoeven 2013-10-04  164  			(z->rom.er_Product << 8);
^1da177e4c3f41 Linus Torvalds     2005-04-16  165  		if (z->id == ZORRO_PROD_GVP_EPC_BASE) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  166  			/* GVP quirk */
c293738e6d8dfb Geert Uytterhoeven 2013-06-29  167  			unsigned long magic = zi->boardaddr + 0x8000;
d49cbe73beb7ff Jacob              2018-05-12  168  
^1da177e4c3f41 Linus Torvalds     2005-04-16  169  			z->id |= *(u16 *)ZTWO_VADDR(magic) & GVP_PRODMASK;
^1da177e4c3f41 Linus Torvalds     2005-04-16  170  		}
c293738e6d8dfb Geert Uytterhoeven 2013-06-29  171  		z->slotaddr = zi->slotaddr;
c293738e6d8dfb Geert Uytterhoeven 2013-06-29  172  		z->slotsize = zi->slotsize;
^1da177e4c3f41 Linus Torvalds     2005-04-16  173  		sprintf(z->name, "Zorro device %08x", z->id);
^1da177e4c3f41 Linus Torvalds     2005-04-16  174  		zorro_name_device(z);
d39d1677c304d7 Andy Shevchenko    2023-08-31  175  		z->resource = DEFINE_RES_MEM_NAMED(zi->boardaddr, zi->boardsize, z->name);
0d305464aefff3 Geert Uytterhoeven 2009-04-05  176  		r = zorro_find_parent_resource(pdev, z);
0d305464aefff3 Geert Uytterhoeven 2009-04-05  177  		error = request_resource(r, &z->resource);
ea2abe2fd59a73 Geert Uytterhoeven 2020-07-13  178  		if (error && !(z->rom.er_Type & ERTF_MEMLIST))
0d305464aefff3 Geert Uytterhoeven 2009-04-05  179  			dev_err(&bus->dev,
0d305464aefff3 Geert Uytterhoeven 2009-04-05  180  				"Address space collision on device %s %pR\n",
b01e3b07ec29e9 Geert Uytterhoeven 2008-12-30  181  				z->name, &z->resource);
0d305464aefff3 Geert Uytterhoeven 2009-04-05  182  		z->dev.parent = &bus->dev;
^1da177e4c3f41 Linus Torvalds     2005-04-16  183  		z->dev.bus = &zorro_bus_type;
83b7bce3d390f1 Geert Uytterhoeven 2013-10-16 @184  		z->dev.id = i;
55496d3fe2acd1 Michael Schmitz    2018-03-03  185  		switch (z->rom.er_Type & ERT_TYPEMASK) {
55496d3fe2acd1 Michael Schmitz    2018-03-03  186  		case ERT_ZORROIII:
55496d3fe2acd1 Michael Schmitz    2018-03-03  187  			z->dev.coherent_dma_mask = DMA_BIT_MASK(32);
55496d3fe2acd1 Michael Schmitz    2018-03-03  188  			break;
55496d3fe2acd1 Michael Schmitz    2018-03-03  189  
55496d3fe2acd1 Michael Schmitz    2018-03-03  190  		case ERT_ZORROII:
55496d3fe2acd1 Michael Schmitz    2018-03-03  191  		default:
55496d3fe2acd1 Michael Schmitz    2018-03-03  192  			z->dev.coherent_dma_mask = DMA_BIT_MASK(24);
55496d3fe2acd1 Michael Schmitz    2018-03-03  193  			break;
55496d3fe2acd1 Michael Schmitz    2018-03-03  194  		}
55496d3fe2acd1 Michael Schmitz    2018-03-03  195  		z->dev.dma_mask = &z->dev.coherent_dma_mask;
a7f4d00a82feb5 Geert Uytterhoeven 2011-09-22  196  	}
a7f4d00a82feb5 Geert Uytterhoeven 2011-09-22  197  
a7f4d00a82feb5 Geert Uytterhoeven 2011-09-22  198  	/* ... then register them */
a7f4d00a82feb5 Geert Uytterhoeven 2011-09-22  199  	for (i = 0; i < zorro_num_autocon; i++) {
a7f4d00a82feb5 Geert Uytterhoeven 2011-09-22  200  		z = &zorro_autocon[i];
11a8b2c5cde137 Geert Uytterhoeven 2008-12-30  201  		error = device_register(&z->dev);
11a8b2c5cde137 Geert Uytterhoeven 2008-12-30  202  		if (error) {
0d305464aefff3 Geert Uytterhoeven 2009-04-05  203  			dev_err(&bus->dev, "Error registering device %s\n",
0d305464aefff3 Geert Uytterhoeven 2009-04-05  204  				z->name);
10b68799b32d60 Vasiliy Kulikov    2010-09-19  205  			put_device(&z->dev);
11a8b2c5cde137 Geert Uytterhoeven 2008-12-30  206  			continue;
11a8b2c5cde137 Geert Uytterhoeven 2008-12-30  207  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  208  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  209  
^1da177e4c3f41 Linus Torvalds     2005-04-16  210  	/* Mark all available Zorro II memory */
^1da177e4c3f41 Linus Torvalds     2005-04-16  211  	zorro_for_each_dev(z) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  212  		if (z->rom.er_Type & ERTF_MEMLIST)
0d305464aefff3 Geert Uytterhoeven 2009-04-05  213  			mark_region(zorro_resource_start(z),
0d305464aefff3 Geert Uytterhoeven 2009-04-05  214  				    zorro_resource_end(z)+1, 1);
^1da177e4c3f41 Linus Torvalds     2005-04-16  215  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  216  
^1da177e4c3f41 Linus Torvalds     2005-04-16  217  	/* Unmark all used Zorro II memory */
^1da177e4c3f41 Linus Torvalds     2005-04-16  218  	for (i = 0; i < m68k_num_memory; i++)
^1da177e4c3f41 Linus Torvalds     2005-04-16  219  		if (m68k_memory[i].addr < 16*1024*1024)
^1da177e4c3f41 Linus Torvalds     2005-04-16  220  			mark_region(m68k_memory[i].addr,
0d305464aefff3 Geert Uytterhoeven 2009-04-05  221  				    m68k_memory[i].addr+m68k_memory[i].size,
0d305464aefff3 Geert Uytterhoeven 2009-04-05  222  				    0);
^1da177e4c3f41 Linus Torvalds     2005-04-16  223  
^1da177e4c3f41 Linus Torvalds     2005-04-16  224  	return 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  225  }
^1da177e4c3f41 Linus Torvalds     2005-04-16  226  

:::::: The code at line 184 was first introduced by commit
:::::: 83b7bce3d390f15047e05a186bb4051536ee9dbc zorro: Let the driver core handle device enumeration

:::::: TO: Geert Uytterhoeven <geert@linux-m68k.org>
:::::: CC: Geert Uytterhoeven <geert@linux-m68k.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
