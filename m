Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330832F28
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 May 2024 01:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715218736; cv=none; b=BTJABO5dKQvIHOg1RvoQ6DcvE/VB0P29bUyqnCqxP9zyGIc4/x1rNI6yFvGa1YqDBrIGMpW7vKDLcgbB3HhPgen2e7qczD1uBjuKjILjod8c7Zjvv3FJd/TouTGKL1J2r2MqcUUVdLohTaWZyI1uDE9FYvfRO/XgljwPaWn5+Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715218736; c=relaxed/simple;
	bh=4lRwh/wpMfHNsZJgRYQKNGFfth8JUxIWADtwvGoKCaU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l+FEfuQPb0brwVxk86KIWn7/Alh4NC7O4HqSEDD2xU0ItL87eTTidtaLEVoIetVAakysJ4zopHnbmZ+xbpq/sRBWnro9/3woJ4/oAMiTl2VaHdan/rg+pfarjo2pTfzxjh53yMTcSLUobUTI8mBmH5vmd3SJXk3iXWNVPXdkN6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l+VO39Gt; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l+VO39Gt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715218734; x=1746754734;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4lRwh/wpMfHNsZJgRYQKNGFfth8JUxIWADtwvGoKCaU=;
  b=l+VO39GtvgeRWZa4Ct7q1pZSRyTeMAvkQ0IJEEryuMi/aaZMnWAo3vGp
   3pSFi0e6paxkuZ6FmopTehA94CNok7+5yP3ruJT57HBoiFnyE4ITai18Z
   cOoxpJDYB7+w5pOxN4YcbSSOMqxzPCxPSBRQ46I2ZP6iOlXxwugv9mdUd
   83QNSx1z2Fci1apdkPVttH2pbTQfdDjn4pvmGJmXWcoKrrYne0ZNrN8FZ
   6dufky7cDE02rVGOLeEGtRDxJPoQAgxvW9k0N2ZVkJBi9uWKjZzLkl8xV
   K9u4GUpvhzh54if6Ds1J5k+VLHpHwHQ8XZ/ZpE15T6muzlH7mqV0vUwtc
   Q==;
X-CSE-ConnectionGUID: EBARkZoLTVWZ4EGbUzSzZg==
X-CSE-MsgGUID: 7LVLK4XIR2+eUQaavz+IcA==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="11239313"
X-IronPort-AV: E=Sophos;i="6.08,146,1712646000"; 
   d="scan'208";a="11239313"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 18:38:54 -0700
X-CSE-ConnectionGUID: qSvDF2QrS5SRXK3wz2evgQ==
X-CSE-MsgGUID: QmdVfWK5QeuKm+FdaXkX1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,146,1712646000"; 
   d="scan'208";a="33612395"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 08 May 2024 18:38:51 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s4skD-0004Ka-1u;
	Thu, 09 May 2024 01:38:49 +0000
Date: Thu, 9 May 2024 09:38:23 +0800
From: kernel test robot <lkp@intel.com>
To: Samuel Holland <samuel@sholland.org>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>
Subject: [broonie-ci:v5_20240507_wens_regulator_sun20i_add_allwinner_d1_ldos_driver
 11/11] drivers/regulator/sun20i-regulator.c:111:16: error: implicit
 declaration of function 'of_device_get_match_data'
Message-ID: <202405090914.lJYHXeaT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git v5_20240507_wens_regulator_sun20i_add_allwinner_d1_ldos_driver
head:   d76a5d182fa92d5270e5689baa26841f7ac45228
commit: d76a5d182fa92d5270e5689baa26841f7ac45228 [11/11] regulator: sun20i: Add Allwinner D1 LDOs driver
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240509/202405090914.lJYHXeaT-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240509/202405090914.lJYHXeaT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405090914.lJYHXeaT-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/regulator/sun20i-regulator.c: In function 'sun20i_regulator_probe':
>> drivers/regulator/sun20i-regulator.c:111:16: error: implicit declaration of function 'of_device_get_match_data' [-Werror=implicit-function-declaration]
     111 |         data = of_device_get_match_data(dev);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/regulator/sun20i-regulator.c:111:14: warning: assignment to 'const struct sun20i_regulator_data *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     111 |         data = of_device_get_match_data(dev);
         |              ^
   drivers/regulator/sun20i-regulator.c: At top level:
>> drivers/regulator/sun20i-regulator.c:136:34: error: array type has incomplete element type 'struct of_device_id'
     136 | static const struct of_device_id sun20i_regulator_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/regulator/sun20i-regulator.c:136:34: warning: 'sun20i_regulator_of_match' defined but not used [-Wunused-variable]
   cc1: some warnings being treated as errors


vim +/of_device_get_match_data +111 drivers/regulator/sun20i-regulator.c

   103	
   104	static int sun20i_regulator_probe(struct platform_device *pdev)
   105	{
   106		const struct sun20i_regulator_data *data;
   107		struct device *dev = &pdev->dev;
   108		struct regulator_config config;
   109		struct regmap *regmap;
   110	
 > 111		data = of_device_get_match_data(dev);
   112		if (!data)
   113			return -EINVAL;
   114	
   115		regmap = sun20i_regulator_get_regmap(dev);
   116		if (IS_ERR(regmap))
   117			return dev_err_probe(dev, PTR_ERR(regmap), "Failed to get regmap\n");
   118	
   119		config = (struct regulator_config) {
   120			.dev	= dev,
   121			.regmap	= regmap,
   122		};
   123	
   124		for (unsigned int i = 0; i < data->ndescs; ++i) {
   125			const struct regulator_desc *desc = &data->descs[i];
   126			struct regulator_dev *rdev;
   127	
   128			rdev = devm_regulator_register(dev, desc, &config);
   129			if (IS_ERR(rdev))
   130				return PTR_ERR(rdev);
   131		}
   132	
   133		return 0;
   134	}
   135	
 > 136	static const struct of_device_id sun20i_regulator_of_match[] = {
   137		{
   138			.compatible = "allwinner,sun20i-d1-system-ldos",
   139			.data = &sun20i_d1_system_ldos,
   140		},
   141		{ },
   142	};
   143	MODULE_DEVICE_TABLE(of, sun20i_regulator_of_match);
   144	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
