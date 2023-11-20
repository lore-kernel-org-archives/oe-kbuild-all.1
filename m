Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92AC321B6
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Nov 2023 21:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CLccN523"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700514175; x=1732050175;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YY8odOppVf2ZaRwPs0RRXbS8eV9GlT8AEvR+WCYhKE0=;
  b=CLccN523/Q80gTpjqqKvO2wKh0LoqC4LbSmebGJdaejCGRX8h4YSkjFJ
   UJCsQWn1Chep8UvqO26Lth0g3qBLZEHujDkMpM+d1HUvE4R3+Mjn/kClH
   jutX01y+rqmO46UFpKNHlOyEnWVJ92i9X4aCynqCw3IFvcGqebmMeGuKL
   dJ3Ju3rano1E79ucx37iYBdj0j7Ru8qMr1fi1yJvBRxgggbaUedCLRxpD
   ERoMQ0bMLpxNcWL0HU7iMMssJgQ/iUW9Jc6v4t/Yc0JI6pu+NNBDwzWs7
   THhklMeVLV+08T2AMkrQYWzGiZkxyVorbmxILCdz3uVrHgxI6ELySPq0J
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="388855668"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="388855668"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 13:02:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="759889929"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="759889929"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 20 Nov 2023 13:02:53 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5BPt-0006vP-17;
	Mon, 20 Nov 2023 21:02:50 +0000
Date: Tue, 21 Nov 2023 05:02:23 +0800
From: kernel test robot <lkp@intel.com>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:v10_20231118_amit_kumar_mahapatra_spi_add_support_for_stacked_parallel_memories
 1/2] sound/pci/hda/cs35l56_hda_spi.c:32:52: warning: passing argument 2 of
 'cs35l56_hda_common_probe' makes integer from pointer without a cast
Message-ID: <202311210457.zXFl9dy4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git v10_20231118_amit_kumar_mahapatra_spi_add_support_for_stacked_parallel_memories
head:   28c84457d889d997b2cfefd7f6967dc919bdf628
commit: eb12970007184e2e5c6eae6ef1b32eee13480811 [1/2] spi: Add multi-cs memories support in SPI core
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231121/202311210457.zXFl9dy4-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231121/202311210457.zXFl9dy4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311210457.zXFl9dy4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/pci/hda/cs35l56_hda_spi.c: In function 'cs35l56_hda_spi_probe':
>> sound/pci/hda/cs35l56_hda_spi.c:32:52: warning: passing argument 2 of 'cs35l56_hda_common_probe' makes integer from pointer without a cast [-Wint-conversion]
      32 |         ret = cs35l56_hda_common_probe(cs35l56, spi->chip_select);
         |                                                 ~~~^~~~~~~~~~~~~
         |                                                    |
         |                                                    u8 * {aka unsigned char *}
   In file included from sound/pci/hda/cs35l56_hda_spi.c:12:
   sound/pci/hda/cs35l56_hda.h:45:63: note: expected 'int' but argument is of type 'u8 *' {aka 'unsigned char *'}
      45 | int cs35l56_hda_common_probe(struct cs35l56_hda *cs35l56, int id);
         |                                                           ~~~~^~


vim +/cs35l56_hda_common_probe +32 sound/pci/hda/cs35l56_hda_spi.c

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
