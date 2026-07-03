Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F84F371056
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jul 2026 13:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783085757; cv=none; b=uwFKrYUW7OhWifEPgDsRLgbXsDrK6ecaWdWRHXhJ8bCGiCj36NeWiR5Z+aiBdiCPuJZCV14FrPQPLHr8GbAK7G21/zCnSjvc7Sm2SyHL+nMINdQmqiWAhhGPKdj99Ov3VWPD+Q9x3MC5By2YMcXRsSkprWsj+4kEE+CbxGDiHfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783085757; c=relaxed/simple;
	bh=Ogi61iWenkTWKT8iPRitTq3AcfLkxNEdr6O7KweEmRU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZP1XRYscnsHnrPOJmHRj5dHJz6CjXfXQ7YaV3rNUIoPSCIAxgmjGPJk8eM6L2dPBfsTje1fmr0vnuwVllBVdD1ROShpHyE2giWAkRWkZB2i6FdCWwi/2YhPP4eurBuCjaV9Uas1F1q4Em8pkbmJMvTo5IkMUX3N6aVfGO5OzrgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I2RGvcwE; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I2RGvcwE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783085755; x=1814621755;
  h=date:from:to:cc:subject:message-id;
  bh=Ogi61iWenkTWKT8iPRitTq3AcfLkxNEdr6O7KweEmRU=;
  b=I2RGvcwEVvirQOgZc6oERsSecGFabsIj0DRfcihgC+WUO8dh1KrfWlhZ
   DSShskQ2rozJhhO+G27D/ZTbKOvRQDeqKATrVXM/2BsSsUc3sCptUJORi
   2WsXageGyIcPWPUyZd+QmaOxkB9jhJUXpNSmMLEIHvSaoNUNd2bgM/EWE
   umje4DeLJyPWpKJ4oDCmMjvW2PKbh6myJyDlGWfDfVDHno1wUCX0j6OpM
   PufBTkP/JOomXzKvaolOnHFz+0yqde9ppOGVi6VYsALIbb6AvUe1hiV/V
   MuI+9of2QD+E4oGQ+TnG5WJiUnTWOZpj3j05YUa//u77TUcFnAn7Yi15U
   g==;
X-CSE-ConnectionGUID: 7HrQkUHkQwy8Jb7DdQvNBg==
X-CSE-MsgGUID: V0KADeKOTumWWg7sjFWUuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="83708468"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="83708468"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 06:35:54 -0700
X-CSE-ConnectionGUID: jq9QCRAmTk+bexT+/AjoVA==
X-CSE-MsgGUID: dh7E83zSSJKGl3rerwSsdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="246747808"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 03 Jul 2026 06:35:53 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfe3S-00000000CAR-2Jwa;
	Fri, 03 Jul 2026 13:35:50 +0000
Date: Fri, 03 Jul 2026 21:35:27 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.1-rc 167/167]
 drivers/net/dsa/mxl862xx/mxl862xx.c:4685:3-4: Unneeded semicolon
Message-ID: <202607032107.mphW923g-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.1-rc
head:   866eb49750d39fe938dca71acece6f1540bb1123
commit: f3d4d709103380acbd6a4faaa28fd38c5e97b0b4 [167/167] net: dsa: mxl862xx: add ds-mux (WIP)
config: sparc64-randconfig-r064-20260702 (https://download.01.org/0day-ci/archive/20260703/202607032107.mphW923g-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 9.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607032107.mphW923g-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/dsa/mxl862xx/mxl862xx.c:4685:3-4: Unneeded semicolon

vim +4685 drivers/net/dsa/mxl862xx/mxl862xx.c

  4614	
  4615	static int mxl862xx_probe(struct mdio_device *mdiodev)
  4616	{
  4617		struct device *dev = &mdiodev->dev;
  4618		struct mxl862xx_priv *priv;
  4619		struct device_node *mux_np;
  4620		struct dsa_switch *ds;
  4621		int err, i;
  4622	
  4623		priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
  4624		if (!priv)
  4625			return -ENOMEM;
  4626	
  4627		priv->mdiodev = mdiodev;
  4628	
  4629		ds = devm_kzalloc(dev, sizeof(*ds), GFP_KERNEL);
  4630		if (!ds)
  4631			return -ENOMEM;
  4632	
  4633		priv->ds = ds;
  4634		ds->dev = dev;
  4635		ds->priv = priv;
  4636		ds->ops = &mxl862xx_switch_ops;
  4637		ds->phylink_mac_ops = &mxl862xx_phylink_mac_ops;
  4638		ds->num_ports = MXL862XX_MAX_PORTS;
  4639		ds->fdb_isolation = true;
  4640		ds->max_num_bridges = MXL862XX_MAX_BRIDGES;
  4641		ds->num_lag_ids = MXL862XX_MAX_LAG_IDS;
  4642	
  4643		mxl862xx_host_init(priv);
  4644	
  4645		for (i = 0; i < MXL862XX_MAX_PORTS; i++) {
  4646			priv->ports[i].priv = priv;
  4647			INIT_WORK(&priv->ports[i].host_flood_work,
  4648				  mxl862xx_host_flood_work_fn);
  4649			spin_lock_init(&priv->ports[i].stats_lock);
  4650		}
  4651	
  4652		INIT_DELAYED_WORK(&priv->stats_work, mxl862xx_stats_work_fn);
  4653	
  4654		priv->tag_proto = DSA_TAG_PROTO_MXL862;
  4655	
  4656		dev_set_drvdata(dev, ds);
  4657	
  4658		err = dsa_register_switch(ds);
  4659		if (err) {
  4660			set_bit(MXL862XX_FLAG_WORK_STOPPED, &priv->flags);
  4661			cancel_delayed_work_sync(&priv->stats_work);
  4662			mxl862xx_host_shutdown(priv);
  4663			for (i = 0; i < MXL862XX_MAX_PORTS; i++)
  4664				cancel_work_sync(&priv->ports[i].host_flood_work);
  4665			return err;
  4666		}
  4667	
  4668		mux_np = of_get_child_by_name(priv->ds->dev->of_node, "ds-mux-bus");
  4669		if (mux_np) {
  4670			struct device_node *child;
  4671	
  4672			for_each_available_child_of_node(mux_np, child) {
  4673				if (!of_device_is_compatible(child,
  4674							     "mxl862xx,ds-mux"))
  4675					continue;
  4676	
  4677				if (!of_device_is_available(child))
  4678					continue;
  4679	
  4680				err = ds_add_mux(priv, child);
  4681				if (err)
  4682					dev_err(dev, "failed to add mux\n");
  4683	
  4684				of_node_put(mux_np);
> 4685			};
  4686		}
  4687	
  4688		return 0;
  4689	}
  4690	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
