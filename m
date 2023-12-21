Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A55AD5E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Dec 2023 06:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AcgoZMS6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703139097; x=1734675097;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TawfZsWhqcUypzIb56aZyn8DxXC8h+QBnAoGdEwx1Dk=;
  b=AcgoZMS6RmbnVtfpojeE7K/UjA5xRrL1l4yDZg0+hcIBqQFNZZyKlolz
   BZ6lxKqHYFoOwpeKbDEs2zeEwo3FVjeiM7jN0sj7eDOx3Gj5PIy9xm8DW
   ANHyWQ8/KxwFTw0V7XV6vLl9wgwxsLjOEJpVeYGDuBpxXQniGW4jbvL4P
   V7tBGLInnWGEvDEih+seoF8zY6BSMZxPBTy/9O+7tTaMbAckniUbw2zAj
   pGCOusfNmdVvAwh5kw0JsO5bd2k7mxTTw52RRRFnDZ0DM/Awtqly1iAEE
   3C536yFglphdcvpXVS1nA4zc1IzHYXCUZa+O9TROT0MSQIcBonyeUKJ2+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="462370231"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; 
   d="scan'208";a="462370231"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 22:11:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="752830117"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; 
   d="scan'208";a="752830117"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 20 Dec 2023 22:11:31 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rGCHJ-0007yl-07;
	Thu, 21 Dec 2023 06:11:29 +0000
Date: Thu, 21 Dec 2023 14:08:40 +0800
From: kernel test robot <lkp@intel.com>
To: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Takashi Iwai <tiwai@suse.de>
Subject: [linux-next:pending-fixes 174/268]
 sound/pci/hda/cs35l41_hda_property.c:238: undefined reference to `spi_setup'
Message-ID: <202312211413.1NkzZWqi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git pending-fixes
head:   c6eb02b33bd24f8f4a60947b539db4871ef914cd
commit: b592ed2e1d78a475f781802e441c499ab446975b [174/268] ALSA: hda: cs35l41: Support additional ASUS ROG 2023 models
config: i386-randconfig-051-20231010 (https://download.01.org/0day-ci/archive/20231221/202312211413.1NkzZWqi-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231221/202312211413.1NkzZWqi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312211413.1NkzZWqi-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: sound/pci/hda/cs35l41_hda_property.o: in function `generic_dsd_config':
>> sound/pci/hda/cs35l41_hda_property.c:238: undefined reference to `spi_setup'


vim +238 sound/pci/hda/cs35l41_hda_property.c

8c4c216db8fb84 Stefan Binding 2023-12-18  159  
8c4c216db8fb84 Stefan Binding 2023-12-18  160  static int generic_dsd_config(struct cs35l41_hda *cs35l41, struct device *physdev, int id,
8c4c216db8fb84 Stefan Binding 2023-12-18  161  			      const char *hid)
8c4c216db8fb84 Stefan Binding 2023-12-18  162  {
8c4c216db8fb84 Stefan Binding 2023-12-18  163  	struct cs35l41_hw_cfg *hw_cfg = &cs35l41->hw_cfg;
8c4c216db8fb84 Stefan Binding 2023-12-18  164  	const struct cs35l41_config *cfg;
8c4c216db8fb84 Stefan Binding 2023-12-18  165  	struct gpio_desc *cs_gpiod;
8c4c216db8fb84 Stefan Binding 2023-12-18  166  	struct spi_device *spi;
8c4c216db8fb84 Stefan Binding 2023-12-18  167  	bool dsd_found;
8c4c216db8fb84 Stefan Binding 2023-12-18  168  	int ret;
8c4c216db8fb84 Stefan Binding 2023-12-18  169  
8c4c216db8fb84 Stefan Binding 2023-12-18  170  	for (cfg = cs35l41_config_table; cfg->ssid; cfg++) {
8c4c216db8fb84 Stefan Binding 2023-12-18  171  		if (!strcasecmp(cfg->ssid, cs35l41->acpi_subsystem_id))
8c4c216db8fb84 Stefan Binding 2023-12-18  172  			break;
8c4c216db8fb84 Stefan Binding 2023-12-18  173  	}
8c4c216db8fb84 Stefan Binding 2023-12-18  174  
8c4c216db8fb84 Stefan Binding 2023-12-18  175  	if (!cfg->ssid)
8c4c216db8fb84 Stefan Binding 2023-12-18  176  		return -ENOENT;
8c4c216db8fb84 Stefan Binding 2023-12-18  177  
8c4c216db8fb84 Stefan Binding 2023-12-18  178  	if (!cs35l41->dacpi || cs35l41->dacpi != ACPI_COMPANION(physdev)) {
8c4c216db8fb84 Stefan Binding 2023-12-18  179  		dev_err(cs35l41->dev, "ACPI Device does not match, cannot override _DSD.\n");
8c4c216db8fb84 Stefan Binding 2023-12-18  180  		return -ENODEV;
8c4c216db8fb84 Stefan Binding 2023-12-18  181  	}
8c4c216db8fb84 Stefan Binding 2023-12-18  182  
8c4c216db8fb84 Stefan Binding 2023-12-18  183  	dev_info(cs35l41->dev, "Adding DSD properties for %s\n", cs35l41->acpi_subsystem_id);
8c4c216db8fb84 Stefan Binding 2023-12-18  184  
8c4c216db8fb84 Stefan Binding 2023-12-18  185  	dsd_found = acpi_dev_has_props(cs35l41->dacpi);
8c4c216db8fb84 Stefan Binding 2023-12-18  186  
8c4c216db8fb84 Stefan Binding 2023-12-18  187  	if (!dsd_found) {
8c4c216db8fb84 Stefan Binding 2023-12-18  188  		ret = cs35l41_add_gpios(cs35l41, physdev, cfg->reset_gpio_index,
8c4c216db8fb84 Stefan Binding 2023-12-18  189  						 cfg->spkid_gpio_index, cfg->cs_gpio_index,
8c4c216db8fb84 Stefan Binding 2023-12-18  190  						 cfg->num_amps);
8c4c216db8fb84 Stefan Binding 2023-12-18  191  		if (ret) {
8c4c216db8fb84 Stefan Binding 2023-12-18  192  			dev_err(cs35l41->dev, "Error adding GPIO mapping: %d\n", ret);
8c4c216db8fb84 Stefan Binding 2023-12-18  193  			return ret;
8c4c216db8fb84 Stefan Binding 2023-12-18  194  		}
8c4c216db8fb84 Stefan Binding 2023-12-18  195  	} else if (cfg->reset_gpio_index >= 0 || cfg->spkid_gpio_index >= 0) {
8c4c216db8fb84 Stefan Binding 2023-12-18  196  		dev_warn(cs35l41->dev, "Cannot add Reset/Speaker ID/SPI CS GPIO Mapping, "
8c4c216db8fb84 Stefan Binding 2023-12-18  197  			 "_DSD already exists.\n");
8c4c216db8fb84 Stefan Binding 2023-12-18  198  	}
8c4c216db8fb84 Stefan Binding 2023-12-18  199  
8c4c216db8fb84 Stefan Binding 2023-12-18  200  	if (cfg->bus == SPI) {
8c4c216db8fb84 Stefan Binding 2023-12-18  201  		cs35l41->index = id;
8c4c216db8fb84 Stefan Binding 2023-12-18  202  		/*
8c4c216db8fb84 Stefan Binding 2023-12-18  203  		 * Manually set the Chip Select for the second amp <cs_gpio_index> in the node.
8c4c216db8fb84 Stefan Binding 2023-12-18  204  		 * This is only supported for systems with 2 amps, since we cannot expand the
8c4c216db8fb84 Stefan Binding 2023-12-18  205  		 * default number of chip selects without using cs-gpios
8c4c216db8fb84 Stefan Binding 2023-12-18  206  		 * The CS GPIO must be set high prior to communicating with the first amp (which
8c4c216db8fb84 Stefan Binding 2023-12-18  207  		 * uses a native chip select), to ensure the second amp does not clash with the
8c4c216db8fb84 Stefan Binding 2023-12-18  208  		 * first.
8c4c216db8fb84 Stefan Binding 2023-12-18  209  		 */
8c4c216db8fb84 Stefan Binding 2023-12-18  210  		if (cfg->cs_gpio_index >= 0) {
8c4c216db8fb84 Stefan Binding 2023-12-18  211  			spi = to_spi_device(cs35l41->dev);
8c4c216db8fb84 Stefan Binding 2023-12-18  212  
8c4c216db8fb84 Stefan Binding 2023-12-18  213  			if (cfg->num_amps != 2) {
8c4c216db8fb84 Stefan Binding 2023-12-18  214  				dev_warn(cs35l41->dev,
8c4c216db8fb84 Stefan Binding 2023-12-18  215  					 "Cannot update SPI CS, Number of Amps (%d) != 2\n",
8c4c216db8fb84 Stefan Binding 2023-12-18  216  					 cfg->num_amps);
8c4c216db8fb84 Stefan Binding 2023-12-18  217  			} else if (dsd_found) {
8c4c216db8fb84 Stefan Binding 2023-12-18  218  				dev_warn(cs35l41->dev,
8c4c216db8fb84 Stefan Binding 2023-12-18  219  					"Cannot update SPI CS, _DSD already exists.\n");
8c4c216db8fb84 Stefan Binding 2023-12-18  220  			} else {
8c4c216db8fb84 Stefan Binding 2023-12-18  221  				/*
8c4c216db8fb84 Stefan Binding 2023-12-18  222  				 * This is obtained using driver_gpios, since only one GPIO for CS
8c4c216db8fb84 Stefan Binding 2023-12-18  223  				 * exists, this can be obtained using index 0.
8c4c216db8fb84 Stefan Binding 2023-12-18  224  				 */
8c4c216db8fb84 Stefan Binding 2023-12-18  225  				cs_gpiod = gpiod_get_index(physdev, "cs", 0, GPIOD_OUT_LOW);
8c4c216db8fb84 Stefan Binding 2023-12-18  226  				if (IS_ERR(cs_gpiod)) {
8c4c216db8fb84 Stefan Binding 2023-12-18  227  					dev_err(cs35l41->dev,
8c4c216db8fb84 Stefan Binding 2023-12-18  228  						"Unable to get Chip Select GPIO descriptor\n");
8c4c216db8fb84 Stefan Binding 2023-12-18  229  					return PTR_ERR(cs_gpiod);
8c4c216db8fb84 Stefan Binding 2023-12-18  230  				}
8c4c216db8fb84 Stefan Binding 2023-12-18  231  				if (id == 1) {
8c4c216db8fb84 Stefan Binding 2023-12-18  232  					spi_set_csgpiod(spi, 0, cs_gpiod);
8c4c216db8fb84 Stefan Binding 2023-12-18  233  					cs35l41->cs_gpio = cs_gpiod;
8c4c216db8fb84 Stefan Binding 2023-12-18  234  				} else {
8c4c216db8fb84 Stefan Binding 2023-12-18  235  					gpiod_set_value_cansleep(cs_gpiod, true);
8c4c216db8fb84 Stefan Binding 2023-12-18  236  					gpiod_put(cs_gpiod);
8c4c216db8fb84 Stefan Binding 2023-12-18  237  				}
8c4c216db8fb84 Stefan Binding 2023-12-18 @238  				spi_setup(spi);
8c4c216db8fb84 Stefan Binding 2023-12-18  239  			}
8c4c216db8fb84 Stefan Binding 2023-12-18  240  		}
8c4c216db8fb84 Stefan Binding 2023-12-18  241  	} else {
8c4c216db8fb84 Stefan Binding 2023-12-18  242  		if (cfg->num_amps > 2)
8c4c216db8fb84 Stefan Binding 2023-12-18  243  			/*
8c4c216db8fb84 Stefan Binding 2023-12-18  244  			 * i2c addresses for 3/4 amps are used in order: 0x40, 0x41, 0x42, 0x43,
8c4c216db8fb84 Stefan Binding 2023-12-18  245  			 * subtracting 0x40 would give zero-based index
8c4c216db8fb84 Stefan Binding 2023-12-18  246  			 */
8c4c216db8fb84 Stefan Binding 2023-12-18  247  			cs35l41->index = id - 0x40;
8c4c216db8fb84 Stefan Binding 2023-12-18  248  		else
8c4c216db8fb84 Stefan Binding 2023-12-18  249  			/* i2c addr 0x40 for first amp (always), 0x41/0x42 for 2nd amp */
8c4c216db8fb84 Stefan Binding 2023-12-18  250  			cs35l41->index = id == 0x40 ? 0 : 1;
8c4c216db8fb84 Stefan Binding 2023-12-18  251  	}
8c4c216db8fb84 Stefan Binding 2023-12-18  252  
8c4c216db8fb84 Stefan Binding 2023-12-18  253  	if (cfg->num_amps == 3)
8c4c216db8fb84 Stefan Binding 2023-12-18  254  		/* 3 amps means a center channel, so no duplicate channels */
8c4c216db8fb84 Stefan Binding 2023-12-18  255  		cs35l41->channel_index = 0;
8c4c216db8fb84 Stefan Binding 2023-12-18  256  	else
8c4c216db8fb84 Stefan Binding 2023-12-18  257  		/*
8c4c216db8fb84 Stefan Binding 2023-12-18  258  		 * if 4 amps, there are duplicate channels, so they need different indexes
8c4c216db8fb84 Stefan Binding 2023-12-18  259  		 * if 2 amps, no duplicate channels, channel_index would be 0
8c4c216db8fb84 Stefan Binding 2023-12-18  260  		 */
8c4c216db8fb84 Stefan Binding 2023-12-18  261  		cs35l41->channel_index = cs35l41->index / 2;
8c4c216db8fb84 Stefan Binding 2023-12-18  262  
8c4c216db8fb84 Stefan Binding 2023-12-18  263  	cs35l41->reset_gpio = fwnode_gpiod_get_index(acpi_fwnode_handle(cs35l41->dacpi), "reset",
8c4c216db8fb84 Stefan Binding 2023-12-18  264  						     cs35l41->index, GPIOD_OUT_LOW,
8c4c216db8fb84 Stefan Binding 2023-12-18  265  						     "cs35l41-reset");
8c4c216db8fb84 Stefan Binding 2023-12-18  266  	cs35l41->speaker_id = cs35l41_get_speaker_id(physdev, cs35l41->index, cfg->num_amps, -1);
8c4c216db8fb84 Stefan Binding 2023-12-18  267  
8c4c216db8fb84 Stefan Binding 2023-12-18  268  	hw_cfg->spk_pos = cfg->channel[cs35l41->index];
8c4c216db8fb84 Stefan Binding 2023-12-18  269  
8c4c216db8fb84 Stefan Binding 2023-12-18  270  	if (cfg->boost_type == INTERNAL) {
8c4c216db8fb84 Stefan Binding 2023-12-18  271  		hw_cfg->bst_type = CS35L41_INT_BOOST;
8c4c216db8fb84 Stefan Binding 2023-12-18  272  		hw_cfg->bst_ind = cfg->boost_ind_nanohenry;
8c4c216db8fb84 Stefan Binding 2023-12-18  273  		hw_cfg->bst_ipk = cfg->boost_peak_milliamp;
8c4c216db8fb84 Stefan Binding 2023-12-18  274  		hw_cfg->bst_cap = cfg->boost_cap_microfarad;
8c4c216db8fb84 Stefan Binding 2023-12-18  275  		hw_cfg->gpio1.func = CS35L41_NOT_USED;
8c4c216db8fb84 Stefan Binding 2023-12-18  276  		hw_cfg->gpio1.valid = true;
8c4c216db8fb84 Stefan Binding 2023-12-18  277  	} else {
8c4c216db8fb84 Stefan Binding 2023-12-18  278  		hw_cfg->bst_type = CS35L41_EXT_BOOST;
8c4c216db8fb84 Stefan Binding 2023-12-18  279  		hw_cfg->bst_ind = -1;
8c4c216db8fb84 Stefan Binding 2023-12-18  280  		hw_cfg->bst_ipk = -1;
8c4c216db8fb84 Stefan Binding 2023-12-18  281  		hw_cfg->bst_cap = -1;
8c4c216db8fb84 Stefan Binding 2023-12-18  282  		hw_cfg->gpio1.func = CS35l41_VSPK_SWITCH;
8c4c216db8fb84 Stefan Binding 2023-12-18  283  		hw_cfg->gpio1.valid = true;
8c4c216db8fb84 Stefan Binding 2023-12-18  284  	}
8c4c216db8fb84 Stefan Binding 2023-12-18  285  
8c4c216db8fb84 Stefan Binding 2023-12-18  286  	hw_cfg->gpio2.func = CS35L41_INTERRUPT;
8c4c216db8fb84 Stefan Binding 2023-12-18  287  	hw_cfg->gpio2.valid = true;
8c4c216db8fb84 Stefan Binding 2023-12-18  288  	hw_cfg->valid = true;
8c4c216db8fb84 Stefan Binding 2023-12-18  289  
8c4c216db8fb84 Stefan Binding 2023-12-18  290  	return 0;
8c4c216db8fb84 Stefan Binding 2023-12-18  291  }
ef4ba63f12b035 Stefan Binding 2023-08-15  292  

:::::: The code at line 238 was first introduced by commit
:::::: 8c4c216db8fb84be9c4ca60d72b88882066cf28f ALSA: hda: cs35l41: Add config table to support many laptops without _DSD

:::::: TO: Stefan Binding <sbinding@opensource.cirrus.com>
:::::: CC: Takashi Iwai <tiwai@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
