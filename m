Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B69612B17C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jan 2025 03:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737170358; cv=none; b=gaqk5Z9881pFMDPRfX7QFueKCSCN3kFo7dVmr6L9l1Bsmn4V8O27hUAFlGP2ws/ehs7ZoG0MHlUf3WngPGbajYnkjOn884cJAjKHMVthBuw/vt4zMll6w4kUEi0XFFt3+OzqfZV5A+tw2xalvGn/cJ+iDBBKH8X7uOdKRL1gYoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737170358; c=relaxed/simple;
	bh=vkeDHMS92plX2ZpwUHbSPDSwtdbW0oDVGVs1kpe+oGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i9jho/B6KE4KKY6+v/tIZShcxSnf/MEqyxCgSMdYF1PlVRPaDRHLrQI5FCiI/kmP9JLfQZjRipCXytoZhr87ro78+c8lgE7vF9MG09+0vG8vHB07UJk6XDahqSGlre3EYNb8ZmW0zKtz2Ap4LDNNa9P59kdAYAtKAkxvwL9Snis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZUDCawp6; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZUDCawp6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737170356; x=1768706356;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vkeDHMS92plX2ZpwUHbSPDSwtdbW0oDVGVs1kpe+oGI=;
  b=ZUDCawp6Otcn+4jEONp9LYIFmMPxCui4TkIfy3oMCTgzdeCdpscMuIap
   TxeZKF4yFnbU0VMpM56COJKPArKKwVcTmeqhuM/Og9U0QgG4I0TztNvY/
   EyO8BCcVHM56Afv8PRTkwVgbEm6wo3XWb5FNzREMEQt1MM2WX4zJXU35w
   PKBHEZj/1PMEqayMsxutpVr2N+x4icu23xrU0Laj4fBPujsaddkyKrq8t
   W46oqCCWYDRaZXwo/D839UnzZNWfPVfEyUWAlk+Mr62U1imAbB6TJgxfV
   GoAgM2iug6vAEYVxp5mv23hJf+0tSsNMI9Ko00SKdtwpd1rXqBwHXxGIZ
   g==;
X-CSE-ConnectionGUID: qSBEtO9MSmGPV3NQv2y5eg==
X-CSE-MsgGUID: nUL18tduQXOkLVPMi8FRsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="55171087"
X-IronPort-AV: E=Sophos;i="6.13,214,1732608000"; 
   d="scan'208";a="55171087"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 19:19:15 -0800
X-CSE-ConnectionGUID: iv3zXespTfiYBBnMDCPDXg==
X-CSE-MsgGUID: vVTU3cvSRLazBfb0Rroubw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="143257974"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 17 Jan 2025 19:19:13 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYzMd-000U2h-0q;
	Sat, 18 Jan 2025 03:19:11 +0000
Date: Sat, 18 Jan 2025 11:18:57 +0800
From: kernel test robot <lkp@intel.com>
To: Jonas Andreasson <jonas.andreasson@axis.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel@axis.com, Jonas Andreasson <jonas.andreasson@axis.com>
Subject: Re: [PATCH] regulator: TPS6287X: Use min/max uV to get VRANGE
Message-ID: <202501181152.D4FjGoUD-lkp@intel.com>
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
config: arc-randconfig-001-20250116 (https://download.01.org/0day-ci/archive/20250118/202501181152.D4FjGoUD-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250118/202501181152.D4FjGoUD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501181152.D4FjGoUD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/regulator/tps6287x-regulator.c: In function 'tps6287x_i2c_probe':
>> drivers/regulator/tps6287x-regulator.c:203:56: warning: passing argument 2 of 'tps6287x_best_range' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     203 |         reg_data->range = tps6287x_best_range(&config, &tps6287x_reg);
         |                                                        ^~~~~~~~~~~~~
   drivers/regulator/tps6287x-regulator.c:59:88: note: expected 'struct regulator_desc *' but argument is of type 'const struct regulator_desc *'
      59 | static int tps6287x_best_range(struct regulator_config *config, struct regulator_desc *desc)
         |                                                                 ~~~~~~~~~~~~~~~~~~~~~~~^~~~


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
