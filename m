Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE747EA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Apr 2023 01:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681522505; x=1713058505;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kLhrfBX10Uh2rryhJS8i8N+biChYR5nZeRdao32iirA=;
  b=ZxpBCLbm0rRzQxH0gX8aLGau7TIcf9GVqiG5YKolUO7crhzQPnzPDN2e
   5AyN8YYZnI314sTlvq/HN3J8ut4UOWQ9FBnSkNLd1FzSsw74DC6sxCrf/
   2esaaOZIg3WC/03R6loFNNn6/LiPk9sazLZ2T63JjawhWu9S2mdkRD1vy
   QJXuF6Bd0p20XIWrvN+18ka8aSWMm3maauptBOjSW4a0O8+wmBrYvuNPB
   KzMPDcgY0wrAekZvNUM7Q4HY/3aZ0o5WPlYvs/MeTxr+PDR3KygQa1/7J
   0GbrdMN6hCGaXjw+d0sqIubOyUmFfMoe54vgNOo7j3gDT8/BNz2OW6hub
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="407490211"
X-IronPort-AV: E=Sophos;i="5.99,198,1677571200"; 
   d="scan'208";a="407490211"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2023 18:35:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="720477566"
X-IronPort-AV: E=Sophos;i="5.99,198,1677571200"; 
   d="scan'208";a="720477566"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 14 Apr 2023 18:35:03 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnUog-000aFf-1l;
	Sat, 15 Apr 2023 01:35:02 +0000
Date: Sat, 15 Apr 2023 09:35:01 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/629 191/9838]
 drivers/video/backlight/pwm_bl.c:260:17: warning: 'strncpy' specified bound
 16 equals destination size
Message-ID: <202304150950.jn3NM4Wi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/629
head:   d1033c2e51746dfdb7179c82e38b03ba7de39c63
commit: 9a95763faad0658cdca312ad1a2d3c47b70118e8 [191/9838] LF-3541: video/backligh: fix Coverity Issue: 9551473 Copy into fixed size buffer
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230415/202304150950.jn3NM4Wi-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/9a95763faad0658cdca312ad1a2d3c47b70118e8
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/629
        git checkout 9a95763faad0658cdca312ad1a2d3c47b70118e8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/firmware/imx/ drivers/gpu/drm/bridge/ drivers/mailbox/ drivers/media/platform/ drivers/net/ drivers/pwm/ drivers/regulator/ drivers/soc/imx/ drivers/staging/ drivers/video/backlight/ drivers/video/fbdev/ sound/soc/fsl/ sound/soc/sof/amd/ sound/soc/sof/imx/ sound/soc/sof/intel/ sound/soc/sof/mediatek/mt8186/ sound/soc/sof/mediatek/mt8195/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304150950.jn3NM4Wi-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/video/backlight/pwm_bl.c: In function 'pwm_backlight_parse_dt':
>> drivers/video/backlight/pwm_bl.c:260:17: warning: 'strncpy' specified bound 16 equals destination size [-Wstringop-truncation]
     260 |                 strncpy(data->fb_id, names, sizeof(data->fb_id));
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/strncpy +260 drivers/video/backlight/pwm_bl.c

   240	
   241	static int pwm_backlight_parse_dt(struct device *dev,
   242					  struct platform_pwm_backlight_data *data)
   243	{
   244		struct device_node *node = dev->of_node;
   245		unsigned int num_levels;
   246		unsigned int num_steps = 0;
   247		struct property *prop;
   248		unsigned int *table;
   249		int length;
   250		u32 value;
   251		int ret;
   252		const char *names;
   253	
   254		if (!node)
   255			return -ENODEV;
   256	
   257		memset(data, 0, sizeof(*data));
   258	
   259		if (!of_property_read_string(node, "fb-names", &names)) {
 > 260			strncpy(data->fb_id, names, sizeof(data->fb_id));
   261			data->check_fb = &pwm_backlight_check_fb_name;
   262		}
   263	
   264		/*
   265		 * These values are optional and set as 0 by default, the out values
   266		 * are modified only if a valid u32 value can be decoded.
   267		 */
   268		of_property_read_u32(node, "post-pwm-on-delay-ms",
   269				     &data->post_pwm_on_delay);
   270		of_property_read_u32(node, "pwm-off-delay-ms", &data->pwm_off_delay);
   271	
   272		/*
   273		 * Determine the number of brightness levels, if this property is not
   274		 * set a default table of brightness levels will be used.
   275		 */
   276		prop = of_find_property(node, "brightness-levels", &length);
   277		if (!prop)
   278			return 0;
   279	
   280		num_levels = length / sizeof(u32);
   281	
   282		/* read brightness levels from DT property */
   283		if (num_levels > 0) {
   284			data->levels = devm_kcalloc(dev, num_levels,
   285						    sizeof(*data->levels), GFP_KERNEL);
   286			if (!data->levels)
   287				return -ENOMEM;
   288	
   289			ret = of_property_read_u32_array(node, "brightness-levels",
   290							 data->levels,
   291							 num_levels);
   292			if (ret < 0)
   293				return ret;
   294	
   295			ret = of_property_read_u32(node, "default-brightness-level",
   296						   &value);
   297			if (ret < 0)
   298				return ret;
   299	
   300			data->dft_brightness = value;
   301	
   302			/*
   303			 * This property is optional, if is set enables linear
   304			 * interpolation between each of the values of brightness levels
   305			 * and creates a new pre-computed table.
   306			 */
   307			of_property_read_u32(node, "num-interpolated-steps",
   308					     &num_steps);
   309	
   310			/*
   311			 * Make sure that there is at least two entries in the
   312			 * brightness-levels table, otherwise we can't interpolate
   313			 * between two points.
   314			 */
   315			if (num_steps) {
   316				unsigned int num_input_levels = num_levels;
   317				unsigned int i;
   318				u32 x1, x2, x, dx;
   319				u32 y1, y2;
   320				s64 dy;
   321	
   322				if (num_input_levels < 2) {
   323					dev_err(dev, "can't interpolate\n");
   324					return -EINVAL;
   325				}
   326	
   327				/*
   328				 * Recalculate the number of brightness levels, now
   329				 * taking in consideration the number of interpolated
   330				 * steps between two levels.
   331				 */
   332				num_levels = (num_input_levels - 1) * num_steps + 1;
   333				dev_dbg(dev, "new number of brightness levels: %d\n",
   334					num_levels);
   335	
   336				/*
   337				 * Create a new table of brightness levels with all the
   338				 * interpolated steps.
   339				 */
   340				table = devm_kcalloc(dev, num_levels, sizeof(*table),
   341						     GFP_KERNEL);
   342				if (!table)
   343					return -ENOMEM;
   344				/*
   345				 * Fill the interpolated table[x] = y
   346				 * by draw lines between each (x1, y1) to (x2, y2).
   347				 */
   348				dx = num_steps;
   349				for (i = 0; i < num_input_levels - 1; i++) {
   350					x1 = i * dx;
   351					x2 = x1 + dx;
   352					y1 = data->levels[i];
   353					y2 = data->levels[i + 1];
   354					dy = (s64)y2 - y1;
   355	
   356					for (x = x1; x < x2; x++) {
   357						table[x] = y1 +
   358							div_s64(dy * (x - x1), dx);
   359					}
   360				}
   361				/* Fill in the last point, since no line starts here. */
   362				table[x2] = y2;
   363	
   364				/*
   365				 * As we use interpolation lets remove current
   366				 * brightness levels table and replace for the
   367				 * new interpolated table.
   368				 */
   369				devm_kfree(dev, data->levels);
   370				data->levels = table;
   371			}
   372	
   373			data->max_brightness = num_levels - 1;
   374		}
   375		return 0;
   376	}
   377	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
