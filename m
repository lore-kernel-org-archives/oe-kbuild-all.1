Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5CF728691
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Nov 2024 14:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732890492; cv=none; b=lopmdOw9EqoPjyyDb/uBBho373Nac+4pLMoUOdmPbCK8SawmTiBnMBWr7X9SxfmeWji+4RVaJY63TB6zzpow2S7MV+3BBRvfdMt5Tb/kt8pMLYttY/61wWoMS895DH7t2SbGIZSD6h10Hab3v5naShQ872FkIo+JSSvwqUeEJRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732890492; c=relaxed/simple;
	bh=4tEUdPHjXn8eeu5J9e1mqu+fRSW6NMF1NWjEPLWPkms=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qx0DEU3rC/5OOjG6bO2zVBUWvbYxqjo9FrW3ybPzriCZmH5xNU34NoTDfnicSxZ7E3gJeiItcaoZ2wn1QpFVWXrkFgVTmDS2ZTEvYtE5oZ3MLcGv1ygmZKDpZTBx9sxh51QFBgGKtk5iHlsjC2eT3nSDrIe+VAaNmPnGh8snxGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iZmmVPW4; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iZmmVPW4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732890489; x=1764426489;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4tEUdPHjXn8eeu5J9e1mqu+fRSW6NMF1NWjEPLWPkms=;
  b=iZmmVPW4HUy1iUB5YVMQXu7cTaUGW7k6Dy+2CRv9hT3MhLPSVIUs69Ev
   gR/cdHSQPkWlKZu3g+q0W/FYNYnSl7pYhgbNs5fV+CTRx4+VlTaDxtqfd
   NDpSjIeKBGBrzFvgbP+qBotQwKX6yqYkkuksXBtj8IYSEmbR9wNZ/3jRL
   RKzeZquxu20slp2HMeJRZsHwwjlnCtRqW8EKOBRVt2oN05JxmeTp7R1Db
   RdbNkUM7EAV2ga4dD/XkaSlxxCxc3L4AvPzX+icwBQaYQNTTsSvYTLu2d
   /XW6FN5/uNatyOC39skjOfrNv5LieRdiIzvlvMtAdfuPZETCi6k56uiPl
   A==;
X-CSE-ConnectionGUID: wcT9nfbtTYawKI+YQvZJtQ==
X-CSE-MsgGUID: SSAd+nfZSG6a2fuP3RAIMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="32872694"
X-IronPort-AV: E=Sophos;i="6.12,195,1728975600"; 
   d="scan'208";a="32872694"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 06:28:09 -0800
X-CSE-ConnectionGUID: +Wx+BytySBeblqkIQBdeZA==
X-CSE-MsgGUID: Q9T5OGSnTLOTXBA04AB7Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,195,1728975600"; 
   d="scan'208";a="92889968"
Received: from lkp-server01.sh.intel.com (HELO 5e2646291792) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 29 Nov 2024 06:28:08 -0800
Received: from kbuild by 5e2646291792 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tH1yX-0000Ol-2Q;
	Fri, 29 Nov 2024 14:28:05 +0000
Date: Fri, 29 Nov 2024 22:27:33 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/110-smc 2/33]
 drivers/platform/apple/smc_core.c:210:26: sparse: sparse: cast to restricted
 __be32
Message-ID: <202411292256.AA0JdB4O-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/110-smc
head:   7206767c881874e25142cc6e862aa43778c051a2
commit: 0eff6efa8e45c0c214f38c401ebb1b4e5c675ae8 [2/33] platform/apple: Add new Apple Mac SMC driver
config: alpha-randconfig-r131-20241118 (https://download.01.org/0day-ci/archive/20241129/202411292256.AA0JdB4O-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241129/202411292256.AA0JdB4O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411292256.AA0JdB4O-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/platform/apple/smc_core.c:210:26: sparse: sparse: cast to restricted __be32
>> drivers/platform/apple/smc_core.c:210:26: sparse: sparse: cast to restricted __be32
>> drivers/platform/apple/smc_core.c:210:26: sparse: sparse: cast to restricted __be32
>> drivers/platform/apple/smc_core.c:210:26: sparse: sparse: cast to restricted __be32
>> drivers/platform/apple/smc_core.c:210:26: sparse: sparse: cast to restricted __be32
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
