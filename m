Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E772204873
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Feb 2025 14:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739283141; cv=none; b=YgM2jtSsM9fZgdruD+mVvgaJF7GzUO933WMmVoixUn3VSqJj30MoANRMpd/4S4D6RAaHZXgMuYyovOWxifq2Q6PBr7rcSrG38OLwLmfQnVT67mJKA7V2e2W9bhsmmJUobrPEcNlwjTgkD+jvrivsBzQ8gdhH9TBmYeg7BtpijdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739283141; c=relaxed/simple;
	bh=OpfTxmZ8HiKtFRIXIujozo30LH+JjSCU/MBfePF+mng=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QBcDWjVtQGMQfzaAP2NsB+0QdihhgO3wb03oY9zWNSfNmP4UJqd/PXTGhbLCW3GWMhXGPSnA6sltOKDS5ELh1A1I+hFXsj7H7V+msbEhaejrZ9D71jUtZzu1YQuSM/shjBKg1VnENobVaWiCC9IWF6OrEzZJOscn1vsqmF7Xvi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tzfar9gJ; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tzfar9gJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739283139; x=1770819139;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OpfTxmZ8HiKtFRIXIujozo30LH+JjSCU/MBfePF+mng=;
  b=Tzfar9gJ5t05wRAbBLMor8Zro+ViVVvycGMY1byaYX0ItLte8Qrd/ViP
   l11/AzgFQSuHXIr5DLq04dD5lvoBi2ob89PCPKmdwuSpKplaQtu6cGox9
   Q4q2qa0JJuwAF0qtLvMoqXlQfL/cwQ1jSJsknG8mhihEFnFI+KbdJ6JnM
   Dn+MLr6LAU8OkQEkruKf5k33SGBdJcK7D5t1Do9nMWbtzf/oD8Fn19IoR
   IAmeJxEG22pcBqdKy6Xk4hYmO5gSrzEe7D7L2MqmaHIRgnJ1FZGTaZAbL
   pqYT6lLd7ec7fMWTYub62es2CBsZddpulT1lVY502wto6+LxADZh0UbYm
   g==;
X-CSE-ConnectionGUID: hg0nDpu5RDimBZBYBQvRWQ==
X-CSE-MsgGUID: bbH43tdYQxm3I3EL0ocw+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="39922725"
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; 
   d="scan'208";a="39922725"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 06:12:18 -0800
X-CSE-ConnectionGUID: JAwTJ2AzRB6JRCC7idd9bg==
X-CSE-MsgGUID: uKq4rowQR3Cv471iLPSKaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; 
   d="scan'208";a="117605124"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 11 Feb 2025 06:12:18 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thqzn-0014Go-1f;
	Tue, 11 Feb 2025 14:12:15 +0000
Date: Tue, 11 Feb 2025 22:11:46 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/110-smc 3/33]
 drivers/platform/apple/smc_core.c:210:26: sparse: sparse: cast to restricted
 __be32
Message-ID: <202502112223.xS2YxBR1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/110-smc
head:   4a6d744baf26d9d234c65a17c1e65789f93895c6
commit: 2ffac11f87954373aa7e52c34498d6c08af2c479 [3/33] platform/apple: Add new Apple Mac SMC driver
config: arm64-randconfig-r121-20250211 (https://download.01.org/0day-ci/archive/20250211/202502112223.xS2YxBR1-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250211/202502112223.xS2YxBR1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502112223.xS2YxBR1-lkp@intel.com/

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
