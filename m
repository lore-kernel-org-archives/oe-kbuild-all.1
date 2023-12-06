Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0D8361
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Dec 2023 00:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WrqEck44"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701822008; x=1733358008;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zlR+/9jNx9BPWRcQ3dQBAjBTy88CzvwiMGDqU9uxqdc=;
  b=WrqEck44eDTQK4vqp22wN9F6FsaEeX8y97+GUXBfBziioNWoLvStwc/f
   V/gINvTM4H0lRAZvxACv3d8mb/EWXGMd34dp4Fw9ct6y9pfUNhk06xLkx
   66PFQuUFW1kLJWEhuAeMozChp6vn5BTqonPPtrTcrHQndM5ffq66PqtQc
   NquE6kTQHf2+tu5feem+VxGYRfEKV/s5tYVL2ZISyLQtK74F3hXfjEzZ9
   kXnCyGbAb7B1ISnvkswl3PPZLT+Wh7NBWXEtN6Q4nBy8TqabDzcyWhV83
   AYKYHsXz8NQwUvlWPu5hAuMcrqmoc3rnJ2ffsthbQBGUCWhoFHR17wry5
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="12696510"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="12696510"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 16:20:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="747415845"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="747415845"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 05 Dec 2023 16:20:03 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAfdw-0009vU-2x;
	Wed, 06 Dec 2023 00:20:00 +0000
Date: Wed, 6 Dec 2023 08:19:06 +0800
From: kernel test robot <lkp@intel.com>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [xilinx-xlnx:lkp_test 1/42] sound/pci/hda/cs35l56_hda_spi.c:32:49:
 sparse: sparse: incorrect type in argument 2 (different base types)
Message-ID: <202312060853.SrAcic6A-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx lkp_test
head:   414b0dc753ec961cf8e532b86412522e78a00169
commit: e4a3f0b229639b9aa114e5cbcfeee07c814ee9f9 [1/42] spi: Add multi-cs memories support in SPI core
config: x86_64-randconfig-123-20231202 (https://download.01.org/0day-ci/archive/20231206/202312060853.SrAcic6A-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312060853.SrAcic6A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312060853.SrAcic6A-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/pci/hda/cs35l56_hda_spi.c:32:49: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected int id @@     got unsigned char * @@
   sound/pci/hda/cs35l56_hda_spi.c:32:49: sparse:     expected int id
   sound/pci/hda/cs35l56_hda_spi.c:32:49: sparse:     got unsigned char *
>> sound/pci/hda/cs35l56_hda_spi.c:32:49: sparse: sparse: non size-preserving pointer to integer cast

vim +32 sound/pci/hda/cs35l56_hda_spi.c

73cfbfa9caea8e Simon Trimmer 2023-07-21  13  
73cfbfa9caea8e Simon Trimmer 2023-07-21  14  static int cs35l56_hda_spi_probe(struct spi_device *spi)
73cfbfa9caea8e Simon Trimmer 2023-07-21  15  {
73cfbfa9caea8e Simon Trimmer 2023-07-21  16  	struct cs35l56_hda *cs35l56;
73cfbfa9caea8e Simon Trimmer 2023-07-21  17  	int ret;
73cfbfa9caea8e Simon Trimmer 2023-07-21  18  
73cfbfa9caea8e Simon Trimmer 2023-07-21  19  	cs35l56 = devm_kzalloc(&spi->dev, sizeof(*cs35l56), GFP_KERNEL);
73cfbfa9caea8e Simon Trimmer 2023-07-21  20  	if (!cs35l56)
73cfbfa9caea8e Simon Trimmer 2023-07-21  21  		return -ENOMEM;
73cfbfa9caea8e Simon Trimmer 2023-07-21  22  
73cfbfa9caea8e Simon Trimmer 2023-07-21  23  	cs35l56->base.dev = &spi->dev;
73cfbfa9caea8e Simon Trimmer 2023-07-21  24  	cs35l56->base.regmap = devm_regmap_init_spi(spi, &cs35l56_regmap_spi);
73cfbfa9caea8e Simon Trimmer 2023-07-21  25  	if (IS_ERR(cs35l56->base.regmap)) {
73cfbfa9caea8e Simon Trimmer 2023-07-21  26  		ret = PTR_ERR(cs35l56->base.regmap);
73cfbfa9caea8e Simon Trimmer 2023-07-21  27  		dev_err(cs35l56->base.dev, "Failed to allocate register map: %d\n",
73cfbfa9caea8e Simon Trimmer 2023-07-21  28  			ret);
73cfbfa9caea8e Simon Trimmer 2023-07-21  29  		return ret;
73cfbfa9caea8e Simon Trimmer 2023-07-21  30  	}
73cfbfa9caea8e Simon Trimmer 2023-07-21  31  
73cfbfa9caea8e Simon Trimmer 2023-07-21 @32  	ret = cs35l56_hda_common_probe(cs35l56, spi->chip_select);
73cfbfa9caea8e Simon Trimmer 2023-07-21  33  	if (ret)
73cfbfa9caea8e Simon Trimmer 2023-07-21  34  		return ret;
73cfbfa9caea8e Simon Trimmer 2023-07-21  35  	ret = cs35l56_irq_request(&cs35l56->base, spi->irq);
73cfbfa9caea8e Simon Trimmer 2023-07-21  36  	if (ret < 0)
73cfbfa9caea8e Simon Trimmer 2023-07-21  37  		cs35l56_hda_remove(cs35l56->base.dev);
73cfbfa9caea8e Simon Trimmer 2023-07-21  38  
73cfbfa9caea8e Simon Trimmer 2023-07-21  39  	return ret;
73cfbfa9caea8e Simon Trimmer 2023-07-21  40  }
73cfbfa9caea8e Simon Trimmer 2023-07-21  41  

:::::: The code at line 32 was first introduced by commit
:::::: 73cfbfa9caea8eda54b4c6e49a9555533660aa1e ALSA: hda/cs35l56: Add driver for Cirrus Logic CS35L56 amplifier

:::::: TO: Simon Trimmer <simont@opensource.cirrus.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
