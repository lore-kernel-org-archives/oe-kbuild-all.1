Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13AF24EF6E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Feb 2025 20:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740429266; cv=none; b=VYva1imX6kROTn0f5nh+GhJzJuSOOdIsL8XDqPreeGwo3t8EtVgdAXmB9c9nx2SMwTNse3M7J+5lYa4ttukirJ0EPnchce30D63rimDU1hjB129NhCliH9DK2GtBVJT/BthjRL7m+rle5bdcHBVegsZhlbtURasB/lVsGyC5qUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740429266; c=relaxed/simple;
	bh=/EJGPYPsY4Nyk+jmsN8qS4x8/U8GxQxZ7Puza3XE3zY=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uX+aWycO7eKXghZv9eUCCjRpP6rcab7VTjeM3+syhwRJXm+dSPFBM00FbSHTp3L4BkDZ4uOVfTnmFNVGuAgB35xNfgfrR/Xjg3BnyVnRTt1M6mZ+s9TpRmg7DWQTwlJfTtabj9jkfK43l5vrDBc52agIgx6kdzuqwl3hE0E1YZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RTu+9ssZ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RTu+9ssZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740429264; x=1771965264;
  h=date:from:cc:subject:message-id:mime-version;
  bh=/EJGPYPsY4Nyk+jmsN8qS4x8/U8GxQxZ7Puza3XE3zY=;
  b=RTu+9ssZsPEO+cbm5tqIu3Em+pPBz1eeIoWcNTdAtj4QSJtWJgX+BsTT
   SUaOXF+eA1nxcbIPpCiwFmDIlolVhpM7211kS/VHSY/D3Za9XKt7QvLiz
   7/xJXEDjCVUWRgf5FUIAO7XBnqZIEEeX1ZReB+tVUcGfY2T8ski2nmUX1
   k84Sm+T9UZMA5w+YwAiZeAH7wSDgLz5Fmvfr3KX6/m7d05sMDZpe0YOHe
   SOmIxfyaU5zPHQt5CuOqZsa9dzJgtzCrtlgbZZiAnu4H2L82J+bhMVQF+
   PwdaP0ZTet2Yb+w2AX2RFraHRwDQ7u2tHt+1wFK2ssZLTQUT8gPl4pzI/
   A==;
X-CSE-ConnectionGUID: 8YOqBqrgT6uCod/pFzjIfA==
X-CSE-MsgGUID: I+7J+LZSSLWsscScp78yew==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="58751556"
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; 
   d="scan'208";a="58751556"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 12:34:23 -0800
X-CSE-ConnectionGUID: oz2iA9ZuSQeF7Lq/e4kPIA==
X-CSE-MsgGUID: /4SjV8nMR/y4Pl8IOgB68w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; 
   d="scan'208";a="121135673"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 24 Feb 2025 12:34:22 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tmf9f-0009JP-20
	for oe-kbuild-all@lists.linux.dev;
	Mon, 24 Feb 2025 20:34:19 +0000
Date: Tue, 25 Feb 2025 04:33:41 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/69 1/1] drivers/pinctrl/pinctrl-mcp23s08.c:782:24:
 warning: unused variable 'one_regmap_config'
Message-ID: <202502250444.kC5LoHEu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jan,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git pr/69
head:   f36ea6678b4077d9bbb4644e73977fb91d187ab7
commit: 39958037723af522b275f5d3a72f5778d893f5aa [1/1] pinctrl: mcp23s08: spi: Fix regmap debugfs entries
config: arm-randconfig-004-20250224 (https://download.01.org/0day-ci/archive/20250225/202502250444.kC5LoHEu-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250225/202502250444.kC5LoHEu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502250444.kC5LoHEu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/pinctrl/pinctrl-mcp23s08.c: In function 'mcp_pinconf_set':
   drivers/pinctrl/pinctrl-mcp23s08.c:282:6: warning: variable 'val' set but not used [-Wunused-but-set-variable]
     u16 val;
         ^~~
   drivers/pinctrl/pinctrl-mcp23s08.c:281:11: warning: variable 'mask' set but not used [-Wunused-but-set-variable]
     u32 arg, mask;
              ^~~~
   drivers/pinctrl/pinctrl-mcp23s08.c: In function 'mcp23s08_probe_one':
>> drivers/pinctrl/pinctrl-mcp23s08.c:782:24: warning: unused variable 'one_regmap_config' [-Wunused-variable]
     struct regmap_config *one_regmap_config = NULL;
                           ^~~~~~~~~~~~~~~~~


vim +/one_regmap_config +782 drivers/pinctrl/pinctrl-mcp23s08.c

   775	
   776	static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
   777				      void *data, unsigned addr, unsigned type,
   778				      unsigned int base, int cs)
   779	{
   780		int status, ret;
   781		bool mirror = false;
 > 782		struct regmap_config *one_regmap_config = NULL;
   783	
   784		mutex_init(&mcp->lock);
   785	
   786		mcp->dev = dev;
   787		mcp->addr = addr;
   788		mcp->irq_active_high = false;
   789	
   790		mcp->chip.direction_input = mcp23s08_direction_input;
   791		mcp->chip.get = mcp23s08_get;
   792		mcp->chip.direction_output = mcp23s08_direction_output;
   793		mcp->chip.set = mcp23s08_set;
   794		mcp->chip.dbg_show = mcp23s08_dbg_show;
   795	#ifdef CONFIG_OF_GPIO
   796		mcp->chip.of_gpio_n_cells = 2;
   797		mcp->chip.of_node = dev->of_node;
   798	#endif
   799	
   800		switch (type) {
   801	#ifdef CONFIG_SPI_MASTER
   802		case MCP_TYPE_S08:
   803		case MCP_TYPE_S17:
   804			switch (type) {
   805			case MCP_TYPE_S08:
   806				one_regmap_config =
   807					devm_kmemdup(dev, &mcp23x08_regmap,
   808						sizeof(struct regmap_config), GFP_KERNEL);
   809				mcp->reg_shift = 0;
   810				mcp->chip.ngpio = 8;
   811				mcp->chip.label = "mcp23s08";
   812				break;
   813			case MCP_TYPE_S17:
   814				one_regmap_config =
   815					devm_kmemdup(dev, &mcp23x17_regmap,
   816						sizeof(struct regmap_config), GFP_KERNEL);
   817				mcp->reg_shift = 1;
   818				mcp->chip.ngpio = 16;
   819				mcp->chip.label = "mcp23s17";
   820				break;
   821			}
   822			if (!one_regmap_config)
   823				return -ENOMEM;
   824	
   825			one_regmap_config->name = devm_kasprintf(dev, GFP_KERNEL, "%d", (addr & ~0x40) >> 1);
   826			mcp->regmap = devm_regmap_init(dev, &mcp23sxx_spi_regmap, mcp,
   827						       one_regmap_config);
   828			break;
   829	
   830		case MCP_TYPE_S18:
   831			if (!one_regmap_config)
   832				return -ENOMEM;
   833			mcp->regmap = devm_regmap_init(dev, &mcp23sxx_spi_regmap, mcp,
   834						       &mcp23x17_regmap);
   835			mcp->reg_shift = 1;
   836			mcp->chip.ngpio = 16;
   837			mcp->chip.label = "mcp23s18";
   838			break;
   839	#endif /* CONFIG_SPI_MASTER */
   840	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
