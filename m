Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7AF31A83
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Nov 2023 15:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MBBixyXp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701098611; x=1732634611;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AUDrWmN0EVJ+YcyB1CZC1uhtVQT+Yubz7Baf80vD2fU=;
  b=MBBixyXpwtRR46eVGPSi4rMF0ShhEdLKknH/D4uAT4qjk9SaONIO8F91
   mih5ZBqjrfb/Gd4oHf8DGr3RypWVgd0u+eiF23nLw8eXjPOrmokCIojpZ
   AOiZnpYUZkDBC8XdbCQR+EhLjRJIxYuE8NGvYQ42yG7E03B3Pvk4qGeRC
   M3cdGSVPWg2CxKkLCPv+V437qP5lGdP7oeSl9bTDFDx650Pgc8pby9XWo
   tVFlfv1P2wyACTWPhcWZv0tGpUpdiVY06G0MESAAcXOv855Gh92gmfBk6
   hgCzd44aQ0MD9WarjeJPlfiTOJ+r6rvucJaFlxz6Dd+hD/fbHZKcBYn6p
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="383111029"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="383111029"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 07:23:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="797269357"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="797269357"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 27 Nov 2023 07:23:30 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7dSJ-0006Mb-0e;
	Mon, 27 Nov 2023 15:23:27 +0000
Date: Mon, 27 Nov 2023 23:22:24 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/110-smc 3/23]
 drivers/platform/apple/smc_core.c:210:26: sparse: sparse: cast to restricted
 __be32
Message-ID: <202311272043.7dBL3MgD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/110-smc
head:   e142826e85344b7a477ec56c5207d4cd18636f12
commit: 609fb00a59a7a57ce0dc97998f95ed5c57cdaebe [3/23] platform/apple: Add new Apple Mac SMC driver
config: sparc-randconfig-r113-20231127 (https://download.01.org/0day-ci/archive/20231127/202311272043.7dBL3MgD-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231127/202311272043.7dBL3MgD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311272043.7dBL3MgD-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/platform/apple/smc_core.c:210:26: sparse: sparse: cast to restricted __be32

vim +210 drivers/platform/apple/smc_core.c

   190	
   191	struct apple_smc *apple_smc_probe(struct device *dev, const struct apple_smc_backend_ops *ops, void *cookie)
   192	{
   193		struct apple_smc *smc;
   194		u32 count;
   195		int ret;
   196	
   197		smc = devm_kzalloc(dev, sizeof(*smc), GFP_KERNEL);
   198		if (!smc)
   199			return ERR_PTR(-ENOMEM);
   200	
   201		smc->dev = dev;
   202		smc->be_cookie = cookie;
   203		smc->be = ops;
   204		mutex_init(&smc->mutex);
   205		BLOCKING_INIT_NOTIFIER_HEAD(&smc->event_handlers);
   206	
   207		ret = apple_smc_read_u32(smc, SMC_KEY(#KEY), &count);
   208		if (ret)
   209			return ERR_PTR(dev_err_probe(dev, ret, "Failed to get key count"));
 > 210		smc->key_count = be32_to_cpu(count);
   211	
   212		ret = apple_smc_get_key_by_index(smc, 0, &smc->first_key);
   213		if (ret)
   214			return ERR_PTR(dev_err_probe(dev, ret, "Failed to get first key"));
   215	
   216		ret = apple_smc_get_key_by_index(smc, smc->key_count - 1, &smc->last_key);
   217		if (ret)
   218			return ERR_PTR(dev_err_probe(dev, ret, "Failed to get last key"));
   219	
   220		/* Enable notifications */
   221		apple_smc_write_flag(smc, SMC_KEY(NTAP), 1);
   222	
   223		dev_info(dev, "Initialized (%d keys %p4ch..%p4ch)\n",
   224			 smc->key_count, &smc->first_key, &smc->last_key);
   225	
   226		dev_set_drvdata(dev, smc);
   227	
   228		ret = mfd_add_devices(dev, -1, apple_smc_devs, ARRAY_SIZE(apple_smc_devs), NULL, 0, NULL);
   229		if (ret)
   230			return ERR_PTR(dev_err_probe(dev, ret, "Subdevice initialization failed"));
   231	
   232		return smc;
   233	}
   234	EXPORT_SYMBOL(apple_smc_probe);
   235	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
