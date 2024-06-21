Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0662176225
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Jun 2024 11:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718970666; cv=none; b=gQA4IODk14TYfX6WzNNv8DAd8xpxw2K5gB+0zHk1inJvh61miP+KBIi+/O02v9o+0TIxKCzC4Uoqv0qqKtTaw04g89jqLpOJgaGn/1w59xD9VQ3eKP1EYDBohkLfUfOWY6ttsRLkEyrM9tnXbNcvuEnO2oSJzAO2R8/x5y+29Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718970666; c=relaxed/simple;
	bh=LYmTseJmTvHABtdX7+JZCSX7M6vQH1wNvw6pfzBDRyc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X1GI6Voj+LTEYyH10L+TiiJLfJbPtqXCGdENY+rD6LsbsRCinPML4BriNu5Y+vipOE4qNBdJXkTgxeYSUseun+j1vGIwFbdPko+mOvtslQqYu5exY/Gerpru/8+KO86/q6SB3IkT5YHLpDi6XCRVgoBA7BBird3l1gF0ajXGzKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ua3uWDIV; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ua3uWDIV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718970663; x=1750506663;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LYmTseJmTvHABtdX7+JZCSX7M6vQH1wNvw6pfzBDRyc=;
  b=Ua3uWDIVfMmRLH5N89YvfsxOLYal0JQBuv3mDkp4dXPJVdkPlXOv2AjY
   QkuLTCVQdA0tSn2ecmbojPObUk6+/2SNQoaGv2w23Pyn9w9DSDd7j5M9d
   a9URND7VrsxUdDzIel/qARPeZNsht1BZQDZCiDVOx+oRcLtHaXglqmKWt
   R1Gi0Ud4GzNGuxeLQqVYxBEfkzoary7FGs+ewK2owrT+r7/+tnmYQ4IZy
   QfxLXSXXUJr8UFLu8jSSF8FgbTknRhynnjAo8UJVig1rsMkY6id8SYAFk
   Nr0765AU9P4eyDbcXC1AfB+1q3cb3y1GobYEcp2T7P/Mftzbz/+bt6wdZ
   w==;
X-CSE-ConnectionGUID: nu/OEYQtTrGH/YG3vIbGZw==
X-CSE-MsgGUID: U1b80DbrT0qWeSt51tPwUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="19881227"
X-IronPort-AV: E=Sophos;i="6.08,254,1712646000"; 
   d="scan'208";a="19881227"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2024 04:51:03 -0700
X-CSE-ConnectionGUID: Qb4XSZ/BSyqXtkRHqyylqw==
X-CSE-MsgGUID: dXhXLHHsReaF5v1pdnXusQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,254,1712646000"; 
   d="scan'208";a="80076083"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 21 Jun 2024 04:51:02 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKcnD-0008XG-1P;
	Fri, 21 Jun 2024 11:50:59 +0000
Date: Fri, 21 Jun 2024 19:50:33 +0800
From: kernel test robot <lkp@intel.com>
To: Simon Trimmer <simont@opensource.cirrus.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] ALSA: hda: cs35l56: Select SERIAL_MULTI_INSTANTIATE
Message-ID: <202406211958.NIWjyRaQ-lkp@intel.com>
References: <20240619161602.117452-1-simont@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240619161602.117452-1-simont@opensource.cirrus.com>

Hi Simon,

kernel test robot noticed the following build errors:

[auto build test ERROR on tiwai-sound/for-next]
[also build test ERROR on v6.10-rc4]
[cannot apply to tiwai-sound/for-linus linus/master next-20240620]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Simon-Trimmer/ALSA-hda-cs35l56-Select-SERIAL_MULTI_INSTANTIATE/20240620-001810
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/20240619161602.117452-1-simont%40opensource.cirrus.com
patch subject: [PATCH] ALSA: hda: cs35l56: Select SERIAL_MULTI_INSTANTIATE
config: x86_64-randconfig-013-20240620 (https://download.01.org/0day-ci/archive/20240621/202406211958.NIWjyRaQ-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240621/202406211958.NIWjyRaQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406211958.NIWjyRaQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `smi_devs_unregister':
>> drivers/platform/x86/serial-multi-instantiate.c:90:(.text+0x5d49e59): undefined reference to `spi_unregister_device'
   ld: vmlinux.o: in function `smi_spi_probe':
>> drivers/platform/x86/serial-multi-instantiate.c:111:(.text+0x5d4a7d6): undefined reference to `acpi_spi_count_resources'
>> ld: drivers/platform/x86/serial-multi-instantiate.c:147:(.text+0x5d4a8cf): undefined reference to `spi_add_device'
>> ld: drivers/platform/x86/serial-multi-instantiate.c:125:(.text+0x5d4a978): undefined reference to `acpi_spi_device_alloc'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SERIAL_MULTI_INSTANTIATE
   Depends on [n]: X86_PLATFORM_DEVICES [=y] && I2C [=y] && SPI [=n] && ACPI [=y]
   Selected by [y]:
   - SND_HDA_SCODEC_CS35L56_I2C [=y] && SOUND [=y] && SND [=y] && SND_HDA [=y] && I2C [=y] && (ACPI [=y] || COMPILE_TEST [=n]) && SND_SOC [=y]


vim +90 drivers/platform/x86/serial-multi-instantiate.c

35a36cbb7b1ce7 Lucas Tanure                        2022-01-21   83  
35a36cbb7b1ce7 Lucas Tanure                        2022-01-21   84  static void smi_devs_unregister(struct smi *smi)
35a36cbb7b1ce7 Lucas Tanure                        2022-01-21   85  {
ed7adc2b69c649 Andy Shevchenko                     2022-07-10   86  	while (smi->i2c_num--)
ed7adc2b69c649 Andy Shevchenko                     2022-07-10   87  		i2c_unregister_device(smi->i2c_devs[smi->i2c_num]);
68f201f9061c00 Stefan Binding                      2022-01-21   88  
ed7adc2b69c649 Andy Shevchenko                     2022-07-10   89  	while (smi->spi_num--)
ed7adc2b69c649 Andy Shevchenko                     2022-07-10  @90  		spi_unregister_device(smi->spi_devs[smi->spi_num]);
68f201f9061c00 Stefan Binding                      2022-01-21   91  }
68f201f9061c00 Stefan Binding                      2022-01-21   92  
68f201f9061c00 Stefan Binding                      2022-01-21   93  /**
68f201f9061c00 Stefan Binding                      2022-01-21   94   * smi_spi_probe - Instantiate multiple SPI devices from inst array
68f201f9061c00 Stefan Binding                      2022-01-21   95   * @pdev:	Platform device
68f201f9061c00 Stefan Binding                      2022-01-21   96   * @smi:	Internal struct for Serial multi instantiate driver
68f201f9061c00 Stefan Binding                      2022-01-21   97   * @inst_array:	Array of instances to probe
68f201f9061c00 Stefan Binding                      2022-01-21   98   *
68f201f9061c00 Stefan Binding                      2022-01-21   99   * Returns the number of SPI devices instantiate, Zero if none is found or a negative error code.
68f201f9061c00 Stefan Binding                      2022-01-21  100   */
8b50c48d59a9cd Andy Shevchenko                     2022-07-10  101  static int smi_spi_probe(struct platform_device *pdev, struct smi *smi,
68f201f9061c00 Stefan Binding                      2022-01-21  102  			 const struct smi_instance *inst_array)
68f201f9061c00 Stefan Binding                      2022-01-21  103  {
68f201f9061c00 Stefan Binding                      2022-01-21  104  	struct device *dev = &pdev->dev;
8b50c48d59a9cd Andy Shevchenko                     2022-07-10  105  	struct acpi_device *adev = ACPI_COMPANION(dev);
68f201f9061c00 Stefan Binding                      2022-01-21  106  	struct spi_controller *ctlr;
68f201f9061c00 Stefan Binding                      2022-01-21  107  	struct spi_device *spi_dev;
68f201f9061c00 Stefan Binding                      2022-01-21  108  	char name[50];
68f201f9061c00 Stefan Binding                      2022-01-21  109  	int i, ret, count;
68f201f9061c00 Stefan Binding                      2022-01-21  110  
68f201f9061c00 Stefan Binding                      2022-01-21 @111  	ret = acpi_spi_count_resources(adev);
68f201f9061c00 Stefan Binding                      2022-01-21  112  	if (ret < 0)
68f201f9061c00 Stefan Binding                      2022-01-21  113  		return ret;
f3e13bbc6f5a84 Andy Shevchenko                     2022-07-10  114  	if (!ret)
2b5b27826a48ee Andy Shevchenko                     2022-07-10  115  		return -ENOENT;
68f201f9061c00 Stefan Binding                      2022-01-21  116  
68f201f9061c00 Stefan Binding                      2022-01-21  117  	count = ret;
68f201f9061c00 Stefan Binding                      2022-01-21  118  
68f201f9061c00 Stefan Binding                      2022-01-21  119  	smi->spi_devs = devm_kcalloc(dev, count, sizeof(*smi->spi_devs), GFP_KERNEL);
68f201f9061c00 Stefan Binding                      2022-01-21  120  	if (!smi->spi_devs)
68f201f9061c00 Stefan Binding                      2022-01-21  121  		return -ENOMEM;
68f201f9061c00 Stefan Binding                      2022-01-21  122  
68f201f9061c00 Stefan Binding                      2022-01-21  123  	for (i = 0; i < count && inst_array[i].type; i++) {
68f201f9061c00 Stefan Binding                      2022-01-21  124  
68f201f9061c00 Stefan Binding                      2022-01-21 @125  		spi_dev = acpi_spi_device_alloc(NULL, adev, i);
68f201f9061c00 Stefan Binding                      2022-01-21  126  		if (IS_ERR(spi_dev)) {
14a9aa99aca6c2 Andy Shevchenko                     2022-07-10  127  			ret = dev_err_probe(dev, PTR_ERR(spi_dev), "failed to allocate SPI device %s from ACPI\n",
14a9aa99aca6c2 Andy Shevchenko                     2022-07-10  128  					    dev_name(&adev->dev));
68f201f9061c00 Stefan Binding                      2022-01-21  129  			goto error;
68f201f9061c00 Stefan Binding                      2022-01-21  130  		}
68f201f9061c00 Stefan Binding                      2022-01-21  131  
68f201f9061c00 Stefan Binding                      2022-01-21  132  		ctlr = spi_dev->controller;
68f201f9061c00 Stefan Binding                      2022-01-21  133  
68f201f9061c00 Stefan Binding                      2022-01-21  134  		strscpy(spi_dev->modalias, inst_array[i].type, sizeof(spi_dev->modalias));
68f201f9061c00 Stefan Binding                      2022-01-21  135  
68f201f9061c00 Stefan Binding                      2022-01-21  136  		ret = smi_get_irq(pdev, adev, &inst_array[i]);
68f201f9061c00 Stefan Binding                      2022-01-21  137  		if (ret < 0) {
68f201f9061c00 Stefan Binding                      2022-01-21  138  			spi_dev_put(spi_dev);
68f201f9061c00 Stefan Binding                      2022-01-21  139  			goto error;
68f201f9061c00 Stefan Binding                      2022-01-21  140  		}
68f201f9061c00 Stefan Binding                      2022-01-21  141  		spi_dev->irq = ret;
68f201f9061c00 Stefan Binding                      2022-01-21  142  
68f201f9061c00 Stefan Binding                      2022-01-21  143  		snprintf(name, sizeof(name), "%s-%s-%s.%d", dev_name(&ctlr->dev), dev_name(dev),
68f201f9061c00 Stefan Binding                      2022-01-21  144  			 inst_array[i].type, i);
68f201f9061c00 Stefan Binding                      2022-01-21  145  		spi_dev->dev.init_name = name;
68f201f9061c00 Stefan Binding                      2022-01-21  146  
68f201f9061c00 Stefan Binding                      2022-01-21 @147  		ret = spi_add_device(spi_dev);
68f201f9061c00 Stefan Binding                      2022-01-21  148  		if (ret) {
14a9aa99aca6c2 Andy Shevchenko                     2022-07-10  149  			dev_err_probe(&ctlr->dev, ret, "failed to add SPI device %s from ACPI\n",
14a9aa99aca6c2 Andy Shevchenko                     2022-07-10  150  				      dev_name(&adev->dev));
68f201f9061c00 Stefan Binding                      2022-01-21  151  			spi_dev_put(spi_dev);
68f201f9061c00 Stefan Binding                      2022-01-21  152  			goto error;
68f201f9061c00 Stefan Binding                      2022-01-21  153  		}
68f201f9061c00 Stefan Binding                      2022-01-21  154  
e20451f44ca33e Amit Kumar Mahapatra via Alsa-devel 2023-03-10  155  		dev_dbg(dev, "SPI device %s using chip select %u", name,
e20451f44ca33e Amit Kumar Mahapatra via Alsa-devel 2023-03-10  156  			spi_get_chipselect(spi_dev, 0));
68f201f9061c00 Stefan Binding                      2022-01-21  157  
68f201f9061c00 Stefan Binding                      2022-01-21  158  		smi->spi_devs[i] = spi_dev;
68f201f9061c00 Stefan Binding                      2022-01-21  159  		smi->spi_num++;
68f201f9061c00 Stefan Binding                      2022-01-21  160  	}
68f201f9061c00 Stefan Binding                      2022-01-21  161  
68f201f9061c00 Stefan Binding                      2022-01-21  162  	if (smi->spi_num < count) {
68f201f9061c00 Stefan Binding                      2022-01-21  163  		dev_dbg(dev, "Error finding driver, idx %d\n", i);
68f201f9061c00 Stefan Binding                      2022-01-21  164  		ret = -ENODEV;
68f201f9061c00 Stefan Binding                      2022-01-21  165  		goto error;
68f201f9061c00 Stefan Binding                      2022-01-21  166  	}
68f201f9061c00 Stefan Binding                      2022-01-21  167  
68f201f9061c00 Stefan Binding                      2022-01-21  168  	dev_info(dev, "Instantiated %d SPI devices.\n", smi->spi_num);
68f201f9061c00 Stefan Binding                      2022-01-21  169  
68f201f9061c00 Stefan Binding                      2022-01-21  170  	return 0;
68f201f9061c00 Stefan Binding                      2022-01-21  171  error:
68f201f9061c00 Stefan Binding                      2022-01-21  172  	smi_devs_unregister(smi);
68f201f9061c00 Stefan Binding                      2022-01-21  173  
68f201f9061c00 Stefan Binding                      2022-01-21  174  	return ret;
35a36cbb7b1ce7 Lucas Tanure                        2022-01-21  175  }
35a36cbb7b1ce7 Lucas Tanure                        2022-01-21  176  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
