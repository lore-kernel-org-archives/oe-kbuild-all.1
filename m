Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03622AF15
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 09:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727515030; cv=none; b=cep/OIi39HeYX4ooYhlj2wwnh+vlf9eFFgX4RFm/Pg8ufrhFS+S1KFZhv4xrtdwujUJWKaq6mo2xdiwowbWy5qEOkC56TRqDCN9QP3wJIZzrRiACpB5OnsmWE1U5MtXzhFNBSBx3UtFpPgwdzWbGfQdQQzcUcfgFPc0BQme4wz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727515030; c=relaxed/simple;
	bh=OV5CgRwQRL6ogCKVRkE+YKCLYyAztcg92RDyNZdxdNs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tJ6YqhhMUFwjAImW/7gSnhIRN35ecMrNKbc5Js5hTLgIZOGR/s+CxGvraraqNLDP4TR8NEpfwQRpWVHlTRI8wVDq5xNdgiSxW7ftsqS/zNwhwt2SxAheuMS6q0Lu+1oQyvLqFlZTV++HCL6I51sz+aj1zPBIToRrdxGFs9ghDeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XcitK3h4; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XcitK3h4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727515029; x=1759051029;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OV5CgRwQRL6ogCKVRkE+YKCLYyAztcg92RDyNZdxdNs=;
  b=XcitK3h4bWVACoMgupyc1P4Otizc3bYrF6rvu+r7WOIPZ3kyhVoS4WCx
   CkhBLQ8N4rU+Pp6d3q5WHGOvsqJVIUQAUN4yulGlGtXjik+60Ryzv2h9P
   Xbp1rpEK29S12X5l9e65ikqTkwxYpDcvSRZ/63CTU5s+KwB//eSXcXIFY
   8Uxgj5NQxVe1Ar64R76tBeuNNDZRqyyLfYi/D60xO71z7UYv68daJkmDO
   zT8XSIWIf5LG+59xhgpOJQH9gy32MaqEqudVoNEeII628b+tbyuI2Kd6U
   KXVmDFvjJ1bAeG5lJ8tlEfJQ+O53+YNkzuDZYUNUnCGBmO6+1z6HlsJf2
   A==;
X-CSE-ConnectionGUID: 5PrAcK+uT7S2m+fIbLldZg==
X-CSE-MsgGUID: pKo8SYeCTq6r4WeInlFJsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="37222881"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="37222881"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 02:17:08 -0700
X-CSE-ConnectionGUID: 0kzjeKRWSF2tSDjBRqDODA==
X-CSE-MsgGUID: v7m/aSn9TvKxCwu/AUlytQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="72650754"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 28 Sep 2024 02:17:07 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suTZY-000N5j-2Z;
	Sat, 28 Sep 2024 09:17:04 +0000
Date: Sat, 28 Sep 2024 17:16:48 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 218/16788]
 drivers/video/backlight/pwm_bl.c:260:17: warning: 'strncpy' specified bound
 16 equals destination size
Message-ID: <202409281728.C1pzFPUp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: 68c0368e676bb1f6729f0d1cef8883fd626569bd [218/16788] LF-3541: video/backligh: fix Coverity Issue: 9551473 Copy into fixed size buffer
config: csky-randconfig-002-20240928 (https://download.01.org/0day-ci/archive/20240928/202409281728.C1pzFPUp-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409281728.C1pzFPUp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409281728.C1pzFPUp-lkp@intel.com/

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
