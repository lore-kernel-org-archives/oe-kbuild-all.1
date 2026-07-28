Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C65384CD1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Jul 2026 07:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785224042; cv=none; b=URDKPWJAXxquo61Wn3zL4tTycHaFLjJh8H9x9I/chGIvfhCY4BdR6alKMGPYmh0TvNPkfNHS+3c/Cl+DP+Gtn/pZ/P6Q86qKBzhG8dvCmg5ediIqZs6hFp7BJ0v1WSvd829TjwvbOR+fo2/1Cf0i39/UrqzKAEfZ4P81iCbBgA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785224042; c=relaxed/simple;
	bh=68FoAbddCINhNpNxQ6Fhuqcck7SxU1UG506Vl3NenCk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=etd2zmeBqd8pwsOXU7PdWR75koU+OBKY7kV09GBkRvAihHnT6wiO5nZfuIzwfRfNZoedbH6pmwDylEXW9psFk7ZX8Q8L9JbovqkM2cR3MRnKqC4MZ4ikYOSED6WPPiJu1UQ+FGKGU+CUK6dbFRaKmzGmtXiPcbKgoTwTn8gITq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PtTY9K6B; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PtTY9K6B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785224040; x=1816760040;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=68FoAbddCINhNpNxQ6Fhuqcck7SxU1UG506Vl3NenCk=;
  b=PtTY9K6BhWWggRgoThjxP4hBGDfeTnuQQG9NiytWCCItsot1K3CBWe1G
   6h9+I4LU4jOYCuczhl6l5EaZEI/qZ7R7diTxk09Ii4SynR3vXOOYh6o1l
   cC/ZGX+hVDxSyso/h897LxEFYfXMn+oDixoyOCYK0DN0vfKuDODz53v25
   4j6vDkDFjdWxkR8+HLyLb6GNrwt1k4R54z8ZgfZRnzceapDdTCp+7d2xg
   k9p9TUwTmWjrg/Ineh50Q3HH9R6ogbqEh9QGrUJiMeVojIxEh+gedUA/z
   MizQvx9J7L5AFnendQZvXpw5IujeQrroE7fs1hkQ84MwJ131Y9yukaIKR
   g==;
X-CSE-ConnectionGUID: stE0MOTRSsq0Nlul/5p6dg==
X-CSE-MsgGUID: 2MjqH8DyQH+x2iqeqeMN9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="85566808"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="85566808"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 00:34:00 -0700
X-CSE-ConnectionGUID: 5WX2/IoJSB2gEjFXDQJofg==
X-CSE-MsgGUID: ElJJo9dIQ6GD21NY7dgUCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="263946141"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 28 Jul 2026 00:33:58 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wocJw-00000000e6f-109E;
	Tue, 28 Jul 2026 07:33:49 +0000
Date: Tue, 28 Jul 2026 15:32:34 +0800
From: kernel test robot <lkp@intel.com>
To: "Stefan =?utf-8?Q?D=C3=B6singer"?= <stefandoesinger@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [stefandoesinger-zx297520:dlink 61/130]
 drivers/rpmsg/zx29_smd.c:239:59: warning: cast from pointer to integer of
 different size
Message-ID: <202607281529.dAC1X7KZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://gitlab.com/stefandoesinger/zx297520-kernel dlink
head:   3d8eb1c72ad9937912307a2d4f3de812b572b9b3
commit: 6904c8e1cb964bc77f9786b792cd229478848e40 [61/130] more mbox stuff stuff
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260728/202607281529.dAC1X7KZ-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260728/202607281529.dAC1X7KZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607281529.dAC1X7KZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/platform_device.h:13,
                    from drivers/rpmsg/zx29_smd.c:8:
   drivers/rpmsg/zx29_smd.c: In function 'zx29_smd_probe':
>> drivers/rpmsg/zx29_smd.c:239:59: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     239 |         dev_info(&pdev->dev, "zx29_smd->data_r 0x%08x\n", (unsigned int)zx29_smd->data_r);
         |                                                           ^
   include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/rpmsg/zx29_smd.c:239:9: note: in expansion of macro 'dev_info'
     239 |         dev_info(&pdev->dev, "zx29_smd->data_r 0x%08x\n", (unsigned int)zx29_smd->data_r);
         |         ^~~~~~~~
   drivers/rpmsg/zx29_smd.c:262:59: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     262 |         dev_info(&pdev->dev, "zx29_smd->data_s 0x%08x\n", (unsigned int)zx29_smd->data_s);
         |                                                           ^
   include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/rpmsg/zx29_smd.c:262:9: note: in expansion of macro 'dev_info'
     262 |         dev_info(&pdev->dev, "zx29_smd->data_s 0x%08x\n", (unsigned int)zx29_smd->data_s);
         |         ^~~~~~~~
   drivers/rpmsg/zx29_smd.c: At top level:
   drivers/rpmsg/zx29_smd.c:146:13: warning: 'zx29_smd_release_device' defined but not used [-Wunused-function]
     146 | static void zx29_smd_release_device(struct device *dev)
         |             ^~~~~~~~~~~~~~~~~~~~~~~


vim +239 drivers/rpmsg/zx29_smd.c

   203	
   204	static int zx29_smd_probe(struct platform_device *pdev)
   205	{
   206		struct device *dev = &pdev->dev;
   207		struct zx29_smd *zx29_smd;
   208		struct device_node *sram;
   209		struct resource res;
   210		u32 channel;
   211		int ret;
   212	
   213		ret = of_property_read_u32(pdev->dev.of_node, "zte,rpmsg-channel", &channel);
   214		if (ret) {
   215			dev_err(&pdev->dev, "Invalid rpmsg channel entry\n");
   216			return ret;
   217		}
   218	
   219		zx29_smd = devm_kzalloc(dev, sizeof(*zx29_smd), GFP_KERNEL);
   220		if (!zx29_smd)
   221			return -ENOMEM;
   222		zx29_smd->pdev = pdev;
   223		dev_info(&pdev->dev, "Hello rpmsg\n");
   224	
   225		sram = of_parse_phandle(pdev->dev.of_node, "sram", 0);
   226		if (!sram) {
   227			dev_info(dev, "no sram\n");
   228			return -EINVAL;
   229		}
   230		of_address_to_resource(sram, 0, &res);
   231		zx29_smd->recv = devm_memremap(dev, res.start + channel * sizeof(struct zx29_channel_hdr),
   232					       sizeof(struct zx29_channel_hdr), MEMREMAP_WB);
   233	
   234		if (!(zx29_smd->recv->flags & 1)) {
   235			dev_info(&pdev->dev, "Receive channel not created by remote end\n");
   236			return -ENODEV;
   237		}
   238		zx29_smd->data_r = devm_memremap(dev, zx29_smd->recv->base, zx29_smd->recv->size, MEMREMAP_WB);
 > 239		dev_info(&pdev->dev, "zx29_smd->data_r 0x%08x\n", (unsigned int)zx29_smd->data_r);
   240	
   241		zx29_smd->rpdev.ops = &zx29_smd_device_ops;
   242		zx29_smd->rpdev.src = channel;
   243		zx29_smd->rpdev.dst = channel;
   244		zx29_smd->rpdev.announce = true;
   245		strscpy(zx29_smd->rpdev.id.name, "rpmsg-tty", RPMSG_NAME_SIZE);
   246		zx29_smd->rpdev.dev.parent = &pdev->dev;
   247	
   248		sram = of_parse_phandle(pdev->dev.of_node, "sram", 1);
   249		if (!sram)
   250			return -EINVAL;
   251		of_address_to_resource(sram, 0, &res);
   252		zx29_smd->send = devm_memremap(dev, res.start + channel * sizeof(struct zx29_channel_hdr),
   253					       sizeof(struct zx29_channel_hdr), MEMREMAP_WB);
   254	
   255		/* FIXME: Create channel infrastructure. */
   256		zx29_smd->send->base = 0x82000000;
   257		zx29_smd->send->recv_pos = zx29_smd->send->send_pos = 0;
   258		zx29_smd->send->size = 0x20;
   259		zx29_smd->send->flags = 1;
   260		zx29_smd->send->end = 0;
   261		zx29_smd->data_s = devm_memremap(dev, zx29_smd->send->base, zx29_smd->send->size, MEMREMAP_WB);
   262		dev_info(&pdev->dev, "zx29_smd->data_s 0x%08x\n", (unsigned int)zx29_smd->data_s);
   263	
   264		zx29_smd->mbox_client.dev = &pdev->dev;
   265		zx29_smd->mbox_client.rx_callback = zx29_smd_rx_callback;
   266		zx29_smd->mbox_client.tx_block = true;
   267		zx29_smd->mbox_client.tx_tout = 500;
   268		zx29_smd->mbox_client.tx_done = txdone;
   269		zx29_smd->mbox_client.knows_txdone = false;
   270	
   271		return rpmsg_register_device(&zx29_smd->rpdev);
   272	}
   273	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
