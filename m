Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC3A1FC7FF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jan 2025 10:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737110549; cv=none; b=iO5fZTtPnGRvVBIOTA/gDFr9K1zyRMr6mCrja3lJ2HFXBZkkJrk9FEABh8RE+8tQ7XLBOYglncrboUmlp/tOtk4R611fehYjtaPmN2vYDo1kGXLvDXCDERdzgF4FPYjIPfKzAhcI/am9Tohaz4jF606FD0R3PWGZ8PFHtUTWwko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737110549; c=relaxed/simple;
	bh=REY7nCSiaX+falD92vRUezvg4FH/+RZv5pUUDqsh0t8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mYs60nEx6pXwU/VdRNSA4WKPDikTFXbsKCtfxDlgsNRaGG5QS9cLZu2LUtHMRZWFbux32F4eYk42uDTuicZa55laHK8hL8aU5vPJJIpgP860Q24wSTc9jR1R7//RDwupepLR5uIiZRwODGdV3nXRnDY7Sg0ccBOxVi4gUiAocWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AVrO/ezS; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AVrO/ezS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737110548; x=1768646548;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=REY7nCSiaX+falD92vRUezvg4FH/+RZv5pUUDqsh0t8=;
  b=AVrO/ezSYBgy7i+WEzFxb43gYwnpt0sx56OuH6W2t0h7q7lsWMuH4p5S
   dMctzgUCAhJdDdzqR7C3kuG0v7O1x+tSLzj/3LzBjJSu1VQ7Ktiol88pr
   wm+sWi8dcOiwlTi5CtEU44lJ0pBrnb5LVk0PX2tcSypwKRU274wE2E2Lp
   bGWOvT873wp3OJiDNxXskCirKBtxloR53sriU9+N2calIg0WPLWH5CR3Z
   xzPauLzxPyOjpRRcEJpidOsz82Kni22fWHhRf2sBFJs45ngTPrPbCaY0/
   dxM49teQPec00PvdEgf0GLYafx5GsC8+XxHtxmQGIN362lB2YPEGWhNJq
   g==;
X-CSE-ConnectionGUID: DfkDs3WjSwKzITrgFy22Tg==
X-CSE-MsgGUID: rPmSAmbsQOikGxXPEnC19g==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="48956216"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="48956216"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 02:42:26 -0800
X-CSE-ConnectionGUID: ZnDcquxRT1CFnbu/kj6r9w==
X-CSE-MsgGUID: a0pU3cS3SF+XcxyERBKA4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; 
   d="scan'208";a="105734338"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 17 Jan 2025 02:42:24 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYjny-000T4t-1H;
	Fri, 17 Jan 2025 10:42:22 +0000
Date: Fri, 17 Jan 2025 18:42:08 +0800
From: kernel test robot <lkp@intel.com>
To: Jonas Andreasson <jonas.andreasson@axis.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel@axis.com, Jonas Andreasson <jonas.andreasson@axis.com>
Subject: Re: [PATCH] regulator: TPS6287X: Use min/max uV to get VRANGE
Message-ID: <202501171805.BfxHTcAh-lkp@intel.com>
References: <20250115-tps-fix-v1-1-2bd7b316409d@axis.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250115-tps-fix-v1-1-2bd7b316409d@axis.com>

Hi Jonas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on adc218676eef25575469234709c2d87185ca223a]

url:    https://github.com/intel-lab-lkp/linux/commits/Jonas-Andreasson/regulator-TPS6287X-Use-min-max-uV-to-get-VRANGE/20250115-175832
base:   adc218676eef25575469234709c2d87185ca223a
patch link:    https://lore.kernel.org/r/20250115-tps-fix-v1-1-2bd7b316409d%40axis.com
patch subject: [PATCH] regulator: TPS6287X: Use min/max uV to get VRANGE
config: x86_64-randconfig-121-20250116 (https://download.01.org/0day-ci/archive/20250117/202501171805.BfxHTcAh-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250117/202501171805.BfxHTcAh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501171805.BfxHTcAh-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/regulator/tps6287x-regulator.c:203:57: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected struct regulator_desc *desc @@     got struct regulator_desc const * @@
   drivers/regulator/tps6287x-regulator.c:203:57: sparse:     expected struct regulator_desc *desc
   drivers/regulator/tps6287x-regulator.c:203:57: sparse:     got struct regulator_desc const *
   drivers/regulator/tps6287x-regulator.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/page-flags.h:237:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:237:46: sparse: sparse: self-comparison always evaluates to false

vim +203 drivers/regulator/tps6287x-regulator.c

   179	
   180	static int tps6287x_i2c_probe(struct i2c_client *i2c)
   181	{
   182		struct device *dev = &i2c->dev;
   183		struct regulator_config config = {};
   184		struct tps6287x_reg_data *reg_data;
   185		struct regulator_dev *rdev;
   186	
   187		reg_data = devm_kzalloc(dev, sizeof(struct tps6287x_reg_data), GFP_KERNEL);
   188	
   189		if (!reg_data)
   190			return -ENOMEM;
   191	
   192		config.regmap = devm_regmap_init_i2c(i2c, &tps6287x_regmap_config);
   193		if (IS_ERR(config.regmap)) {
   194			dev_err(dev, "Failed to init i2c\n");
   195			return PTR_ERR(config.regmap);
   196		}
   197	
   198		config.dev = dev;
   199		config.of_node = dev->of_node;
   200		config.init_data = of_get_regulator_init_data(dev, dev->of_node,
   201							      &tps6287x_reg);
   202	
 > 203		reg_data->range = tps6287x_best_range(&config, &tps6287x_reg);
   204	
   205		rdev = devm_regulator_register(dev, &tps6287x_reg, &config);
   206		if (IS_ERR(rdev)) {
   207			dev_err(dev, "Failed to register regulator\n");
   208			return PTR_ERR(rdev);
   209		}
   210	
   211		rdev->reg_data = (void *)reg_data;
   212		dev_dbg(dev, "Probed regulator\n");
   213	
   214		return 0;
   215	}
   216	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
