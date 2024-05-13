Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6585E84D07
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 May 2024 23:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715641744; cv=none; b=Mek1HRV6xKDM+o5qaYhWuK2s/ICUoLssJntAFnOJKqNNHa44mM0FAmPdwrioedVmfF/XTQZUiEaBq2ykCVsyALUpUabrRfyKLWXFMtptWlHbocokvJvPEmae41bVt2EKSY3BItYGe93XFcQmdxyzm0HtCacmZ5AvH54PsIc8R6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715641744; c=relaxed/simple;
	bh=+ER/66bDWWUg7MyHoY1bI6LD89I8W3C+ESbC8iddrkU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MVW7sbYAvkZH2Xa/dD7y2FiDHUDIYrZQB7fZO6rzVgJRcbCp4zmCJqm15ZjB9GqueYxCaEOCu4gNxgYg+ej9GrpEYAVHb/f5gALmM7YAeR7tcOhP9/8Qkh8mtp/FmSiGzUGm40Io6Tw38YuE45g7Vk2HiUSFDZ+ZT2XpNNdUFgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n3fB4Jlg; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n3fB4Jlg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715641742; x=1747177742;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+ER/66bDWWUg7MyHoY1bI6LD89I8W3C+ESbC8iddrkU=;
  b=n3fB4Jlg+TthKAJO0A/RvykVosQaVDqfB3jVQ94rs2+WH4w+dbxnqexf
   vyMnMpDSr5Q03adkaCWYwqw7LFUl6OF6RugUwZf9IHAA1t2prOnbmFJnR
   7myVyWV01KZlX70IhND4CNoQACWY6oOAvaetD9XJ581RhoazWn5eeVUpF
   IQpwsAKA3d3c/+L4XtqbJqRZbsrTNqqWKHOqxBn6pwQb7RzuBUxNfryOD
   yDO3UMMseoemCH8X3Ozdl3zQDrqOXVaZIIvul2/NsM9sRKrvE46YufLke
   1AyaUvXeJUJDQcehOkNoK3YIDZyT3CaDY+60Ox/8tb2gMzh+H9+GHy1d2
   Q==;
X-CSE-ConnectionGUID: DudEfAeQQoK0AIoxgl+RRw==
X-CSE-MsgGUID: Xjlh0aB8SgGMG0GN1vtfPw==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="14546218"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="14546218"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 16:09:01 -0700
X-CSE-ConnectionGUID: lcZhuOCCRdeHMgZ0wWRVXQ==
X-CSE-MsgGUID: glM/PEYETqWY/07Ib55jjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="30430176"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 13 May 2024 16:08:59 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s6emv-000Amh-1J;
	Mon, 13 May 2024 23:08:57 +0000
Date: Tue, 14 May 2024 07:08:37 +0800
From: kernel test robot <lkp@intel.com>
To: Maciej Strozek <mstrozek@opensource.cirrus.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Mark Brown <broonie@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [linux-next:master 8530/12793]
 sound/soc/codecs/cs35l56-spi.c:28:undefined reference to
 `__devm_regmap_init_spi'
Message-ID: <202405140758.o2HY4nYD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6ba6c795dc73c22ce2c86006f17c4aa802db2a60
commit: b831b4dca48dbe0f1f7705b44460dd9ca7f2f940 [8530/12793] ASoC: intel: sof_sdw: Add support for cs42l43-cs35l56 sidecar amps
config: x86_64-randconfig-002-20231219 (https://download.01.org/0day-ci/archive/20240514/202405140758.o2HY4nYD-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240514/202405140758.o2HY4nYD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405140758.o2HY4nYD-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `cs35l56_spi_probe':
>> sound/soc/codecs/cs35l56-spi.c:28:(.text+0x61ce83b): undefined reference to `__devm_regmap_init_spi'
   ld: vmlinux.o: in function `cs35l56_spi_driver_init':
>> sound/soc/codecs/cs35l56-spi.c:82:(.init.text+0x118893): undefined reference to `__spi_register_driver'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_SOC_CS35L56_SPI
   Depends on [n]: SOUND [=y] && SND [=y] && SND_SOC [=y] && SPI_MASTER [=n] && (SOUNDWIRE [=y] || !SOUNDWIRE [=y])
   Selected by [y]:
   - SND_SOC_INTEL_SOUNDWIRE_SOF_MACH [=y] && SOUND [=y] && SND [=y] && SND_SOC [=y] && SND_SOC_INTEL_MACH [=y] && SND_SOC_SOF_INTEL_SOUNDWIRE [=y] && I2C [=y] && ACPI [=y] && (MFD_INTEL_LPSS [=y] || COMPILE_TEST [=n]) && (SND_SOC_INTEL_USER_FRIENDLY_LONG_NAMES [=y] || COMPILE_TEST [=n]) && SOUNDWIRE [=y]


vim +28 sound/soc/codecs/cs35l56-spi.c

e496112529006c Richard Fitzgerald 2023-03-20  16  
e496112529006c Richard Fitzgerald 2023-03-20  17  static int cs35l56_spi_probe(struct spi_device *spi)
e496112529006c Richard Fitzgerald 2023-03-20  18  {
e496112529006c Richard Fitzgerald 2023-03-20  19  	const struct regmap_config *regmap_config = &cs35l56_regmap_spi;
e496112529006c Richard Fitzgerald 2023-03-20  20  	struct cs35l56_private *cs35l56;
e496112529006c Richard Fitzgerald 2023-03-20  21  	int ret;
e496112529006c Richard Fitzgerald 2023-03-20  22  
e496112529006c Richard Fitzgerald 2023-03-20  23  	cs35l56 = devm_kzalloc(&spi->dev, sizeof(struct cs35l56_private), GFP_KERNEL);
e496112529006c Richard Fitzgerald 2023-03-20  24  	if (!cs35l56)
e496112529006c Richard Fitzgerald 2023-03-20  25  		return -ENOMEM;
e496112529006c Richard Fitzgerald 2023-03-20  26  
e496112529006c Richard Fitzgerald 2023-03-20  27  	spi_set_drvdata(spi, cs35l56);
898673b905b931 Simon Trimmer      2023-07-21 @28  	cs35l56->base.regmap = devm_regmap_init_spi(spi, regmap_config);
898673b905b931 Simon Trimmer      2023-07-21  29  	if (IS_ERR(cs35l56->base.regmap)) {
898673b905b931 Simon Trimmer      2023-07-21  30  		ret = PTR_ERR(cs35l56->base.regmap);
e496112529006c Richard Fitzgerald 2023-03-20  31  		return dev_err_probe(&spi->dev, ret, "Failed to allocate register map\n");
e496112529006c Richard Fitzgerald 2023-03-20  32  	}
e496112529006c Richard Fitzgerald 2023-03-20  33  
898673b905b931 Simon Trimmer      2023-07-21  34  	cs35l56->base.dev = &spi->dev;
634ed138d80b1c Richard Fitzgerald 2023-10-06  35  	cs35l56->base.can_hibernate = true;
e496112529006c Richard Fitzgerald 2023-03-20  36  
e496112529006c Richard Fitzgerald 2023-03-20  37  	ret = cs35l56_common_probe(cs35l56);
e496112529006c Richard Fitzgerald 2023-03-20  38  	if (ret != 0)
e496112529006c Richard Fitzgerald 2023-03-20  39  		return ret;
e496112529006c Richard Fitzgerald 2023-03-20  40  
e496112529006c Richard Fitzgerald 2023-03-20  41  	ret = cs35l56_init(cs35l56);
e496112529006c Richard Fitzgerald 2023-03-20  42  	if (ret == 0)
898673b905b931 Simon Trimmer      2023-07-21  43  		ret = cs35l56_irq_request(&cs35l56->base, spi->irq);
e496112529006c Richard Fitzgerald 2023-03-20  44  	if (ret < 0)
e496112529006c Richard Fitzgerald 2023-03-20  45  		cs35l56_remove(cs35l56);
e496112529006c Richard Fitzgerald 2023-03-20  46  
e496112529006c Richard Fitzgerald 2023-03-20  47  	return ret;
e496112529006c Richard Fitzgerald 2023-03-20  48  }
e496112529006c Richard Fitzgerald 2023-03-20  49  
e496112529006c Richard Fitzgerald 2023-03-20  50  static void cs35l56_spi_remove(struct spi_device *spi)
e496112529006c Richard Fitzgerald 2023-03-20  51  {
e496112529006c Richard Fitzgerald 2023-03-20  52  	struct cs35l56_private *cs35l56 = spi_get_drvdata(spi);
e496112529006c Richard Fitzgerald 2023-03-20  53  
e496112529006c Richard Fitzgerald 2023-03-20  54  	cs35l56_remove(cs35l56);
e496112529006c Richard Fitzgerald 2023-03-20  55  }
e496112529006c Richard Fitzgerald 2023-03-20  56  
e496112529006c Richard Fitzgerald 2023-03-20  57  static const struct spi_device_id cs35l56_id_spi[] = {
e496112529006c Richard Fitzgerald 2023-03-20  58  	{ "cs35l56", 0 },
e496112529006c Richard Fitzgerald 2023-03-20  59  	{}
e496112529006c Richard Fitzgerald 2023-03-20  60  };
e496112529006c Richard Fitzgerald 2023-03-20  61  MODULE_DEVICE_TABLE(spi, cs35l56_id_spi);
e496112529006c Richard Fitzgerald 2023-03-20  62  
e8500a70270334 Simon Trimmer      2023-08-17  63  #ifdef CONFIG_ACPI
e8500a70270334 Simon Trimmer      2023-08-17  64  static const struct acpi_device_id cs35l56_asoc_acpi_match[] = {
e8500a70270334 Simon Trimmer      2023-08-17  65  	{ "CSC355C", 0 },
e8500a70270334 Simon Trimmer      2023-08-17  66  	{},
e8500a70270334 Simon Trimmer      2023-08-17  67  };
e8500a70270334 Simon Trimmer      2023-08-17  68  MODULE_DEVICE_TABLE(acpi, cs35l56_asoc_acpi_match);
e8500a70270334 Simon Trimmer      2023-08-17  69  #endif
e8500a70270334 Simon Trimmer      2023-08-17  70  
e496112529006c Richard Fitzgerald 2023-03-20  71  static struct spi_driver cs35l56_spi_driver = {
e496112529006c Richard Fitzgerald 2023-03-20  72  	.driver = {
e496112529006c Richard Fitzgerald 2023-03-20  73  		.name		= "cs35l56",
3d3a8667954104 Richard Fitzgerald 2023-09-14  74  		.pm = pm_ptr(&cs35l56_pm_ops_i2c_spi),
e8500a70270334 Simon Trimmer      2023-08-17  75  		.acpi_match_table = ACPI_PTR(cs35l56_asoc_acpi_match),
e496112529006c Richard Fitzgerald 2023-03-20  76  	},
e496112529006c Richard Fitzgerald 2023-03-20  77  	.id_table	= cs35l56_id_spi,
e496112529006c Richard Fitzgerald 2023-03-20  78  	.probe		= cs35l56_spi_probe,
e496112529006c Richard Fitzgerald 2023-03-20  79  	.remove		= cs35l56_spi_remove,
e496112529006c Richard Fitzgerald 2023-03-20  80  };
e496112529006c Richard Fitzgerald 2023-03-20  81  
e496112529006c Richard Fitzgerald 2023-03-20 @82  module_spi_driver(cs35l56_spi_driver);
e496112529006c Richard Fitzgerald 2023-03-20  83  

:::::: The code at line 28 was first introduced by commit
:::::: 898673b905b9318489430663083f629bc38c7461 ASoC: cs35l56: Move shared data into a common data structure

:::::: TO: Simon Trimmer <simont@opensource.cirrus.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
