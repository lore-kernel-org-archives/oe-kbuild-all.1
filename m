Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D3335E926
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Oct 2026 03:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791430217; cv=none; b=IYY+oaLYR/4ZjIdcuuJr2i5iPv/rErg8KxiTM+JIyRRRQNbTSotIl+J8wqHOLFwHLOR3LdGwObhnLXsU6Xs49MTitZB5ZzeJrraQJONNrqP80692nGCDErmXwIDPoCo4lcmxmZhsX81iBba0cD6v+2XBqqxhx7xf63IlpqEfq20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791430217; c=relaxed/simple;
	bh=U7BbcZkB5KMT3HOqbmaqhI2ARlgNTyMV9V68qNpA2Og=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=jtVCqf9juLWKkwiIRtTv0+gl3vPEfAFoGFx35Zj2Z6/z2rC5wb9O0zHCFaVee52SVumZ4NM47z80tUwIuiYewprlqYOhxWvFL4xMT2bMT5lrCF3DADveJVTSepcvWkvzP3jvLRl0qf7St5P/5hq9msuqlOrHxnc0wlcJ7vojmLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aIxX0PnV; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aIxX0PnV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791430215; x=1822966215;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U7BbcZkB5KMT3HOqbmaqhI2ARlgNTyMV9V68qNpA2Og=;
  b=aIxX0PnVDZ2KKG8s9DUtkNt2hFNqcRLUqC8phaGw0IazX91FIJJBWuUh
   qMeNHmp06w0wTXVDg+1gC1Omjl0N4DrTIKhPeOzttjaFLa4tTKsjgwgLP
   KVuHmwn9pe/ayLlpZ1ew2CjL5/7V4SHbuO8GQ5OgdubM2VTdq2kGRIhAl
   pINcmcDAzMNMf8HcbWLiTs6VbwjLI/IGoYPf2cwimMn+HbgSp8C9su+8C
   ypNnnMin44WSxZXtLrWPRqNa0DXP/A8EO2QxL4cA6faG5RVqoAVX9RlFL
   lj5skariSI4/K40T2LjQwM6pstR1mR4SlWEq27E4PNQqt3DqhZqnMrW9L
   g==;
X-CSE-ConnectionGUID: BKwtGcQyQBaGEZT0NetwAQ==
X-CSE-MsgGUID: KO/uevw0SGqoU56dFYEdMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="100518"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="100518"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 20:30:15 -0700
X-CSE-ConnectionGUID: LL7MCw7oTOyz78wljc8D6A==
X-CSE-MsgGUID: X9zN6ZT8QDORPLaTFdMtCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="307084074"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 07 Oct 2026 20:30:11 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEepb-000000003vM-28s0;
	Thu, 08 Oct 2026 03:30:07 +0000
Date: Thu, 08 Oct 2026 11:29:13 +0800
From: kernel test robot <lkp@intel.com>
To: "Stefan =?utf-8?Q?D=C3=B6singer"?= <stefandoesinger@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [stefandoesinger-zx297520:dlink 69/142]
 drivers/rpmsg/zx29_smd.c:239:59: warning: cast from pointer to integer of
 different size
Message-ID: <202610081130.QPTfrJT8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://gitlab.com/stefandoesinger/zx297520-kernel dlink
head:   7998b6e929bb20ed66acafa33720d8e3533e1598
commit: fcc80da512bd8aa06a383a655eaf0bed6df90b43 [69/142] more mbox stuff stuff
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20261008/202610081130.QPTfrJT8-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261008/202610081130.QPTfrJT8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610081130.QPTfrJT8-lkp@intel.com/

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
