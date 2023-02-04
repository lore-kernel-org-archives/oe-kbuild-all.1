Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3340123DC
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Feb 2023 21:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675547760; x=1707083760;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lTR7pM2QQZJ0jT5kwqvVBsNg74ceEl4p7DaNXpar/vA=;
  b=b2FjxUzUQv+9ps/H9p2pp7I0sjirVUWPYtTsxG/bdKXaBuR8OkupLl5x
   Gsl/RnrPaYwpNtVcPPa/EyWfnf3zKONwPuL7fjsBFw3FfaIJbRl2iyMy2
   9iEumeWVLOcff1R0EoyBwT91TdHKTtCupekXEGVfEhJrDFgor9vXwVUgn
   Rx44yHui8Q4OAunSfZ4Kbyg8rVvO7u5bpN52B7GTMPhV3bgjLB88kTGYQ
   htdb5Bwmc5YK/NXlAchRYboV2lX7xmfsjznwGzYT/nZGuexvUs1ySKVnQ
   2NMdA3p8ABsDp3WTh6LlroC226q2FAwT+Li5MA4KK4SlPPYw0o55iuP/x
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="415208130"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="415208130"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 13:55:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="734732602"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="734732602"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 04 Feb 2023 13:55:57 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOQVp-0001Y0-0v;
	Sat, 04 Feb 2023 21:55:57 +0000
Date: Sun, 5 Feb 2023 05:55:13 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 281/20209]
 drivers/video/backlight/pwm_bl.c:260:17: warning: 'strncpy' specified bound
 16 equals destination size
Message-ID: <202302050526.sesdJkq6-lkp@intel.com>
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

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   3248ffcb12d15a0e40b9a020ba362591b8137923
commit: ac14f2eb41ff07a60b8ce1a297b6ca3e9f0e33f9 [281/20209] LF-3541: video/backligh: fix Coverity Issue: 9551473 Copy into fixed size buffer
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230205/202302050526.sesdJkq6-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/ac14f2eb41ff07a60b8ce1a297b6ca3e9f0e33f9
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc 5.15-2.2.x-imx
        git checkout ac14f2eb41ff07a60b8ce1a297b6ca3e9f0e33f9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/accessibility/speakup/ drivers/base/power/ drivers/dma/ drivers/firmware/imx/ drivers/gpu/drm/bridge/ drivers/gpu/drm/imx/ drivers/i2c/busses/ drivers/input/touchscreen/ drivers/mailbox/ drivers/media/platform/ drivers/mtd/nand/raw/gpmi-nand/ drivers/net/ethernet/freescale/ drivers/net/phy/ drivers/pci/controller/dwc/ drivers/pci/controller/mobiveil/ drivers/power/supply/ drivers/pwm/ drivers/regulator/ drivers/rpmsg/ drivers/soc/imx/ drivers/staging/ drivers/thermal/ drivers/video/backlight/ drivers/video/fbdev/ net/ sound/soc/fsl/ sound/soc/sof/imx/ sound/soc/sof/intel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

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
   284			size_t size = sizeof(*data->levels) * num_levels;
   285	
   286			data->levels = devm_kzalloc(dev, size, GFP_KERNEL);
   287			if (!data->levels)
   288				return -ENOMEM;
   289	
   290			ret = of_property_read_u32_array(node, "brightness-levels",
   291							 data->levels,
   292							 num_levels);
   293			if (ret < 0)
   294				return ret;
   295	
   296			ret = of_property_read_u32(node, "default-brightness-level",
   297						   &value);
   298			if (ret < 0)
   299				return ret;
   300	
   301			data->dft_brightness = value;
   302	
   303			/*
   304			 * This property is optional, if is set enables linear
   305			 * interpolation between each of the values of brightness levels
   306			 * and creates a new pre-computed table.
   307			 */
   308			of_property_read_u32(node, "num-interpolated-steps",
   309					     &num_steps);
   310	
   311			/*
   312			 * Make sure that there is at least two entries in the
   313			 * brightness-levels table, otherwise we can't interpolate
   314			 * between two points.
   315			 */
   316			if (num_steps) {
   317				unsigned int num_input_levels = num_levels;
   318				unsigned int i;
   319				u32 x1, x2, x, dx;
   320				u32 y1, y2;
   321				s64 dy;
   322	
   323				if (num_input_levels < 2) {
   324					dev_err(dev, "can't interpolate\n");
   325					return -EINVAL;
   326				}
   327	
   328				/*
   329				 * Recalculate the number of brightness levels, now
   330				 * taking in consideration the number of interpolated
   331				 * steps between two levels.
   332				 */
   333				num_levels = (num_input_levels - 1) * num_steps + 1;
   334				dev_dbg(dev, "new number of brightness levels: %d\n",
   335					num_levels);
   336	
   337				/*
   338				 * Create a new table of brightness levels with all the
   339				 * interpolated steps.
   340				 */
   341				size = sizeof(*table) * num_levels;
   342				table = devm_kzalloc(dev, size, GFP_KERNEL);
   343				if (!table)
   344					return -ENOMEM;
   345				/*
   346				 * Fill the interpolated table[x] = y
   347				 * by draw lines between each (x1, y1) to (x2, y2).
   348				 */
   349				dx = num_steps;
   350				for (i = 0; i < num_input_levels - 1; i++) {
   351					x1 = i * dx;
   352					x2 = x1 + dx;
   353					y1 = data->levels[i];
   354					y2 = data->levels[i + 1];
   355					dy = (s64)y2 - y1;
   356	
   357					for (x = x1; x < x2; x++) {
   358						table[x] = y1 +
   359							div_s64(dy * (x - x1), dx);
   360					}
   361				}
   362				/* Fill in the last point, since no line starts here. */
   363				table[x2] = y2;
   364	
   365				/*
   366				 * As we use interpolation lets remove current
   367				 * brightness levels table and replace for the
   368				 * new interpolated table.
   369				 */
   370				devm_kfree(dev, data->levels);
   371				data->levels = table;
   372			}
   373	
   374			data->max_brightness = num_levels - 1;
   375		}
   376		return 0;
   377	}
   378	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
