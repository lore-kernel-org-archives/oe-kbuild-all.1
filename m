Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756F71865
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Jun 2023 18:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687113269; x=1718649269;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Lx80KF67rW2jc9kg7t507RrhJJErkcoW/vtqPp5Ad6I=;
  b=fRHJO4qCR1By/W3hNmlKhaq9kjHYFBhX8GXU007z4v0alajtUA5o39Wi
   zJhDwfowZQMORczsxcQOZC0mfy3m0O0k56ina8eH65RljDH0K4rKJIFyp
   h7bnUNzwHL44NxQFYpVEPBKWQ3huoVituaOICWC072i+K2Rmo/56bVxoJ
   HO70rl5aP8f73WwBRfUGq+ycdl2kSdpfTU08i2QULi5JNW9wF+QCgrUbd
   3PPAY8qOOAVHTLITNQwZeY2FglKB2dJlyTvqH5IqliT6OSmeLyEzyx8KP
   /OTp4s7rc86pQ0Xe+ldFeBNeURyK4BEWRDFM7A9GMxl2N2ZG7oD9uSvNG
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="356988810"
X-IronPort-AV: E=Sophos;i="6.00,253,1681196400"; 
   d="scan'208";a="356988810"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2023 11:34:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="960215808"
X-IronPort-AV: E=Sophos;i="6.00,253,1681196400"; 
   d="scan'208";a="960215808"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 18 Jun 2023 11:34:27 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qAxEJ-0003xY-0n;
	Sun, 18 Jun 2023 18:34:27 +0000
Date: Mon, 19 Jun 2023 02:34:18 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/110-smc 3/23]
 drivers/platform/apple/smc_core.c:210:26: sparse: sparse: cast to restricted
 __be32
Message-ID: <202306190250.5eZsAVHE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/110-smc
head:   107ed86e21d1522d5d5d9d629f1d9c371e37df7f
commit: d55f4cc3a82c44e82a3fe6fc02403752ea0e2053 [3/23] platform/apple: Add new Apple Mac SMC driver
config: arm64-randconfig-s052-20230618 (https://download.01.org/0day-ci/archive/20230619/202306190250.5eZsAVHE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230619/202306190250.5eZsAVHE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306190250.5eZsAVHE-lkp@intel.com/

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
