Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839C611720
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 10:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="byyup2FK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697194575; x=1728730575;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kZrXIwC/bCwARwhOKkq65p+MiZUi8lZmlJGrM49SROA=;
  b=byyup2FKsHMBdEA4slfgOYOF51zUoIVRTGd6REivr/Ke27UErRMMQMFP
   thGfwBfTLIvGyDf/eb4u7rmY4zSaes2fcH8JR9UfniCgCHxGQr09Ilf/t
   Kb+CZLwIYDYADEpNMR8Dn2oXQtq9mS9SOOkKHssRV4mynJoIVFwrAeHLB
   urR8wU2p5ElVGLZBOYLhe7KUzHjuBvOkuOYrZq9PfgFYUkWtOt74UbUma
   EbJM3FQ12uYjqXiVIOOM+ydqvU1VJadwGFrXCFDWn3afuFvsa+VA0ILgM
   90WnawavEgYhLnGS8wLkJh20LUelMItESZALalgf7IhTRKbxdfRn/mJFK
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="6713712"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="6713712"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 03:56:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="1086099883"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="1086099883"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 13 Oct 2023 03:56:12 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrFpy-0004f1-0D;
	Fri, 13 Oct 2023 10:56:10 +0000
Date: Fri, 13 Oct 2023 18:55:10 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 191/15768]
 drivers/video/backlight/pwm_bl.c:260:17: warning: 'strncpy' specified bound
 16 equals destination size
Message-ID: <202310131810.GJxaJMMc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sandor,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 6.1-2.1.x-imx
head:   3f41fbe42851375d3d5996e4bf9e9809e6c79517
commit: 9a95763faad0658cdca312ad1a2d3c47b70118e8 [191/15768] LF-3541: video/backligh: fix Coverity Issue: 9551473 Copy into fixed size buffer
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20231013/202310131810.GJxaJMMc-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231013/202310131810.GJxaJMMc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310131810.GJxaJMMc-lkp@intel.com/

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
https://github.com/intel/lkp-tests/wiki
