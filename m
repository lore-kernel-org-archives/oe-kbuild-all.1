Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0642ECD34
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Nov 2025 08:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762934973; cv=none; b=Ls17TvvkkM7hDPnP+GuIHmWFEL9NHhD03Ff9sTXZ3UYgdidZYB24z6VHhXhZP3N4jvNdnq6QK98QZeNWsrw7+UZFF72Gnfog9lX8ji5y1XNMdg3BN5SornWuwiQ/L1LcwDDMbIhQ951TaX+kZxCjhiFtsZRxijVmgdQSL6yUyOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762934973; c=relaxed/simple;
	bh=jx6i1yXXVV1Mnxz2ZVhFZFebjuCYianpne0zTR+Xu0A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sZe7ukWNbhoz+mcu9etxxnX9nz/GU2Zm+scypYEmeccHyvu/L3OGEvARgd5a7Lkt/potF0bqWnn9VHXcPmyXS89ennE68nRsALUuPyd6/RzjtmllIZEUKU6E/s/kbYOHcx5PpjNgnykvaEZKmV/JD036tYrTluINN+Qmfc2Jvvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c2K2QBDN; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c2K2QBDN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762934972; x=1794470972;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jx6i1yXXVV1Mnxz2ZVhFZFebjuCYianpne0zTR+Xu0A=;
  b=c2K2QBDNaURCG7aVK1KkeUHJnkOUT7q0sJMZGevHVqhHClPLgyi+yivl
   6vfogZsu3f7EANKOiJN8evAOfpr3U0tdqlsGgM4rFAQo8AJfOahVfgNFl
   YweVZQfTKPGPFbnTjajwWm/vhn9hDFidHKn81nMX7TwWzyaPjiuZE6MTT
   GKO3gGfZBxVeY3WpOvwBjuQAF7+DTOZyVgoe4ZVyTzO3JOgwNUUMxWzMy
   KSjNZaf+Hz6N2Y07Oy8S3TjnzFgfx48AjwmywkrPMcwsj7KDOsG04iWBM
   Hwui6wmfsu/0o89L2f1/wFP9WeLIdUClce7JWKpUSziMafhwwxbsTfOp/
   w==;
X-CSE-ConnectionGUID: 76VpNeLfShi0CKCIPZ23hA==
X-CSE-MsgGUID: wpfxwfIcTG2dQOw16MAxCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="52552508"
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; 
   d="scan'208";a="52552508"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 00:09:30 -0800
X-CSE-ConnectionGUID: DYRRPZARQsiEEL9ptuDQtg==
X-CSE-MsgGUID: pqnT4wNNRIeyId3Xr9LamQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; 
   d="scan'208";a="193542799"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 12 Nov 2025 00:09:23 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJ5ur-000407-1N;
	Wed, 12 Nov 2025 08:09:21 +0000
Date: Wed, 12 Nov 2025 16:08:39 +0800
From: kernel test robot <lkp@intel.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ambarus:b4/gs101-otp 3/6] drivers/nvmem/exynos-otp.c:75:22: error:
 implicit declaration of function 'FIELD_GET'
Message-ID: <202511121657.HNfySIOh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ambarus/linux-0day b4/gs101-otp
head:   0862419643dee379acb65ec070139ee9833f28c4
commit: f137b011b07dfa01eee237ebea7fb58a457a67a9 [3/6] nvmem: add Samsung Exynos OTP support
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20251112/202511121657.HNfySIOh-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251112/202511121657.HNfySIOh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511121657.HNfySIOh-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/nvmem/exynos-otp.c: In function 'exynos_otp_soc_device_register':
>> drivers/nvmem/exynos-otp.c:75:22: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]
      75 |         product_id = FIELD_GET(EXYNOS_OTP_PRODUCT_ID_MASK, val);
         |                      ^~~~~~~~~


vim +/FIELD_GET +75 drivers/nvmem/exynos-otp.c

    56	
    57	static int exynos_otp_soc_device_register(struct exynos_otp *eotp)
    58	{
    59		struct soc_device_attribute *soc_dev_attr;
    60		struct regmap *regmap = eotp->regmap;
    61		struct device *dev = eotp->dev;
    62		struct soc_device *soc_dev;
    63		u32 val, main_rev, sub_rev;
    64		u32 product_id, revision;
    65		int ret;
    66	
    67		soc_dev_attr = devm_kzalloc(dev, sizeof(*soc_dev_attr), GFP_KERNEL);
    68		if (!soc_dev_attr)
    69			return -ENOMEM;
    70	
    71		ret = regmap_read(regmap, EXYNOS_OTP_PRODUCT_ID, &val);
    72		if (ret)
    73			return dev_err_probe(dev, ret, "failed to read product id");
    74	
  > 75		product_id = FIELD_GET(EXYNOS_OTP_PRODUCT_ID_MASK, val);
    76		main_rev = FIELD_GET(EXYNOS_OTP_PRODUCT_ID_MAIN_REV, val);
    77	
    78		ret = regmap_read(regmap, EXYNOS_OTP_CHIPID(3), &val);
    79		if (ret)
    80			return dev_err_probe(dev, ret, "failed to read chip id");
    81	
    82		sub_rev = FIELD_GET(EXYNOS_OTP_CHIPID3_SUB_REV, val);
    83		revision = main_rev << EXYNOS_OTP_PRODUCT_ID_MAIN_REV_SHIFT | sub_rev;
    84	
    85		soc_dev_attr->family = "Samsung Exynos";
    86		soc_dev_attr->soc_id = exynos_otp_xlate_soc_name(product_id);
    87		if (!soc_dev_attr->soc_id)
    88			return dev_err_probe(dev, -ENODEV,
    89					     "failed to translate chip id to name");
    90	
    91		soc_dev_attr->revision = devm_kasprintf(dev, GFP_KERNEL, "%x",
    92							revision);
    93		if (!soc_dev_attr->revision)
    94			return -ENOMEM;
    95	
    96		soc_dev = soc_device_register(soc_dev_attr);
    97		if (IS_ERR(soc_dev))
    98			return dev_err_probe(dev, PTR_ERR(soc_dev),
    99					     "failed to register to the SoC interface");
   100	
   101		ret = devm_add_action_or_reset(dev, exynos_otp_unregister_soc, soc_dev);
   102		if (ret)
   103			return dev_err_probe(dev, ret, "failed to add devm action");
   104	
   105		return 0;
   106	}
   107	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
