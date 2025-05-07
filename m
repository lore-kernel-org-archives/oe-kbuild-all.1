Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACAE1258CC1
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 May 2025 13:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746624895; cv=none; b=qWsqySBd1MCyEvBrTbT8EUUHOFgq36pmyfkARlOL+2WbW6zFSN/OT53EewFu1Y0405XSK5lp2tzIXNPuNOQ6ArnGh/c8rKZKDD3kw0NZMtdfBTuidc6/7HQBD4lhDHkZQMaMmcWRDDziLrvif2SwCkrgjf6Uf9Ml+q2BXozI4Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746624895; c=relaxed/simple;
	bh=vlTS+nkMIj1vhy65TLDrilxkQV1mPK5ETkpecS9PW+g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TlFXsHdzopS+8Yq3G3JxYUzao7fLbHICsAbcitz+l6X2WJu89lg9kbbO5zHJbzGhTWvKX7S4qHP+2tsr/s67CqUsxUViy/6kOpSK6ivveq5jebAnzawQd6bO5cAo5BNX9LRYK5n0PQ6FvzDLnBPszJgoh3xusOkHZQAZKsdYjEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NkGCT7pv; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NkGCT7pv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746624894; x=1778160894;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vlTS+nkMIj1vhy65TLDrilxkQV1mPK5ETkpecS9PW+g=;
  b=NkGCT7pvggZxvNQYSLBAZwilNBonCu+eVUW3p40F5VTwrDEBh1QHVdNw
   MSiT3EnOAxCRn6uZ+A3dpajAtWTWugPi+d8nOF5otU6aiGt5EdFxPi/oT
   B6tsD7UjLenme+dFNqyzy+h0+a/h4/JmNbrKZ4Co/GOyuVyoHwVwFvncf
   gKiufVPmr8U4cJbdKERa9STYXDuRrrQIUs578uIOEaoG/Axt5nhOtqweF
   QC3myfur987E24ZrMFl7faluniljk3qlC26wP4RuZORa2fWDOeMRuz5hS
   s8ESgf5OnhkSsj9/87gHY2XbdMNFSwMgO+j6oZK3QIJmGqQYopp6jnWmQ
   A==;
X-CSE-ConnectionGUID: LZgmBkTcSPaGdZ93lWouiQ==
X-CSE-MsgGUID: xQTl6qqjS06WiQa5gD6tSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="47606959"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="47606959"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 06:34:53 -0700
X-CSE-ConnectionGUID: BihSP+aVQVq2osLjHrN+lg==
X-CSE-MsgGUID: kPS0DQRNRHu4Mym4fkt5+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="140006947"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 07 May 2025 06:34:52 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCevB-0007sc-31;
	Wed, 07 May 2025 13:34:49 +0000
Date: Wed, 7 May 2025 21:34:49 +0800
From: kernel test robot <lkp@intel.com>
To: ChiYuan Huang <cy_huang@richtek.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 2804/9308] sound/soc/codecs/rt9123.c:406:17:
 sparse: sparse: cast to restricted __be16
Message-ID: <202505072140.iHyLlDN6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   08710e696081d58163c8078e0e096be6d35c5fad
commit: 8bffd24e45618b6c3d6ce11947193c6d8ba846a7 [2804/9308] ASoC: codecs: Add support for Richtek rt9123
config: csky-randconfig-r133-20250417 (https://download.01.org/0day-ci/archive/20250507/202505072140.iHyLlDN6-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250507/202505072140.iHyLlDN6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505072140.iHyLlDN6-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/soc/codecs/rt9123.c:406:17: sparse: sparse: cast to restricted __be16
>> sound/soc/codecs/rt9123.c:412:66: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned short [usertype] value @@     got restricted __be16 [assigned] [usertype] value @@
   sound/soc/codecs/rt9123.c:412:66: sparse:     expected unsigned short [usertype] value
   sound/soc/codecs/rt9123.c:412:66: sparse:     got restricted __be16 [assigned] [usertype] value

vim +406 sound/soc/codecs/rt9123.c

   379	
   380	static int rt9123_i2c_probe(struct i2c_client *i2c)
   381	{
   382		struct device *dev = &i2c->dev;
   383		struct rt9123_priv *rt9123;
   384		struct regmap *regmap;
   385		__be16 value;
   386		u16 venid;
   387		int ret;
   388	
   389		rt9123 = devm_kzalloc(dev, sizeof(*rt9123), GFP_KERNEL);
   390		if (!rt9123)
   391			return -ENOMEM;
   392	
   393		rt9123->enable = devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_HIGH);
   394		if (IS_ERR(rt9123->enable))
   395			return PTR_ERR(rt9123->enable);
   396		else if (rt9123->enable)
   397			usleep_range(250, 350);
   398		else
   399			dev_dbg(dev, "No 'enable' GPIO specified, treat it as default on\n");
   400	
   401		/* Check vendor id information */
   402		ret = i2c_smbus_read_word_data(i2c, RT9123_REG_COMBOID);
   403		if (ret < 0)
   404			return dev_err_probe(dev, ret, "Failed to read vendor-id\n");
   405	
 > 406		venid = be16_to_cpu(ret);
   407		if ((venid & RT9123_MASK_VENID) != RT9123_FIXED_VENID)
   408			return dev_err_probe(dev, -ENODEV, "Incorrect vendor-id 0x%04x\n", venid);
   409	
   410		/* Trigger RG reset before regmap init cache */
   411		value = cpu_to_be16(RT9123_MASK_SWRST);
 > 412		ret = i2c_smbus_write_word_data(i2c, RT9123_REG_AMPCTRL, value);
   413		if (ret)
   414			return dev_err_probe(dev, ret, "Failed to trigger RG reset\n");
   415	
   416		/* Need to wait 10ms for the reset to complete */
   417		usleep_range(10000, 11000);
   418	
   419		regmap = devm_regmap_init_i2c(i2c, &rt9123_regmap_config);
   420		if (IS_ERR(regmap))
   421			return dev_err_probe(dev, PTR_ERR(regmap), "Failed to init regmap\n");
   422	
   423		i2c_set_clientdata(i2c, rt9123);
   424	
   425		pm_runtime_set_autosuspend_delay(dev, 500);
   426		pm_runtime_use_autosuspend(dev);
   427		pm_runtime_set_active(dev);
   428		ret = devm_pm_runtime_enable(dev);
   429		if (ret)
   430			return dev_err_probe(dev, ret, "Failed to enable pm runtime\n");
   431	
   432		return devm_snd_soc_register_component(dev, &rt9123_comp_driver, &rt9123_dai_driver, 1);
   433	}
   434	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
