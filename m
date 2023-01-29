Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF86117C3
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Jan 2023 03:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674961873; x=1706497873;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N70/vNgawDiuyDFPC98Mj27mYhL8N1yDIs6qv28/hq8=;
  b=dLOhmAqIw5hGVUQhBmpMnR8n+PQv6yens+AuU+4Z/1oQb7k4Py0uKAvT
   AMEMPJXP33BKIcQMrYhPCs5fSz+Y+9fK9x+WKkDjpC7Oeo3rnprjx+z0i
   TjzT8PUgxgL+IeR0H/0GsYqYrBS/devbwFe5FZTsTFZBocUXFYOcnStKp
   gR5uI2RT4SlvxaxcNMfRryHzBkweiwvoQjjZ7dZlJA2b5Lu7gM6AaAAcW
   QUNp6vSjoed+2u+XeZXjmfvVy8TthUlCG4PN7Muzq4xNwcqFrr87F4lLX
   T5X9o/PrnmcE+8oTPLQpFixUaIvl2K3Tb3Y5mqSG1ep3YXAfmEftvIzsT
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="413578578"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="413578578"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2023 19:11:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="992486082"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="992486082"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 28 Jan 2023 19:11:06 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pLy5y-0001OM-0C;
	Sun, 29 Jan 2023 03:11:06 +0000
Date: Sun, 29 Jan 2023 11:10:15 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:randconfig-6.3-next 222/235]
 drivers/input/touchscreen/ads7846.c:1196:29: warning: assignment to 'int'
 from 'struct gpio_desc *' makes integer from pointer without a cast
Message-ID: <202301291138.vnHSg2bm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git randconfig-6.3-next
head:   e1ff6e29c348f48dfcdb7f879d52a823c859a65d
commit: 9e70c5888c1b9acaea422cde6e3c753a9a6e4bb1 [222/235] gpiolib: remove gpio_set_debounce
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20230129/202301291138.vnHSg2bm-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git/commit/?id=9e70c5888c1b9acaea422cde6e3c753a9a6e4bb1
        git remote add arnd-playground https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git
        git fetch --no-tags arnd-playground randconfig-6.3-next
        git checkout 9e70c5888c1b9acaea422cde6e3c753a9a6e4bb1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/input/touchscreen/ads7846.c: In function 'ads7846_probe_dt':
>> drivers/input/touchscreen/ads7846.c:1196:29: warning: assignment to 'int' from 'struct gpio_desc *' makes integer from pointer without a cast [-Wint-conversion]
    1196 |         pdata->gpio_pendown = gpiod_get(dev, "pendown-gpio", GPIOD_IN);
         |                             ^


vim +1196 drivers/input/touchscreen/ads7846.c

  1130	
  1131	static const struct ads7846_platform_data *ads7846_probe_dt(struct device *dev)
  1132	{
  1133		struct ads7846_platform_data *pdata;
  1134		struct device_node *node = dev->of_node;
  1135		const struct of_device_id *match;
  1136		u32 value;
  1137	
  1138		if (!node) {
  1139			dev_err(dev, "Device does not have associated DT data\n");
  1140			return ERR_PTR(-EINVAL);
  1141		}
  1142	
  1143		match = of_match_device(ads7846_dt_ids, dev);
  1144		if (!match) {
  1145			dev_err(dev, "Unknown device model\n");
  1146			return ERR_PTR(-EINVAL);
  1147		}
  1148	
  1149		pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
  1150		if (!pdata)
  1151			return ERR_PTR(-ENOMEM);
  1152	
  1153		pdata->model = (unsigned long)match->data;
  1154	
  1155		of_property_read_u16(node, "ti,vref-delay-usecs",
  1156				     &pdata->vref_delay_usecs);
  1157		of_property_read_u16(node, "ti,vref-mv", &pdata->vref_mv);
  1158		pdata->keep_vref_on = of_property_read_bool(node, "ti,keep-vref-on");
  1159	
  1160		pdata->swap_xy = of_property_read_bool(node, "ti,swap-xy");
  1161	
  1162		of_property_read_u16(node, "ti,settle-delay-usec",
  1163				     &pdata->settle_delay_usecs);
  1164		of_property_read_u16(node, "ti,penirq-recheck-delay-usecs",
  1165				     &pdata->penirq_recheck_delay_usecs);
  1166	
  1167		of_property_read_u16(node, "ti,x-plate-ohms", &pdata->x_plate_ohms);
  1168		of_property_read_u16(node, "ti,y-plate-ohms", &pdata->y_plate_ohms);
  1169	
  1170		of_property_read_u16(node, "ti,x-min", &pdata->x_min);
  1171		of_property_read_u16(node, "ti,y-min", &pdata->y_min);
  1172		of_property_read_u16(node, "ti,x-max", &pdata->x_max);
  1173		of_property_read_u16(node, "ti,y-max", &pdata->y_max);
  1174	
  1175		/*
  1176		 * touchscreen-max-pressure gets parsed during
  1177		 * touchscreen_parse_properties()
  1178		 */
  1179		of_property_read_u16(node, "ti,pressure-min", &pdata->pressure_min);
  1180		if (!of_property_read_u32(node, "touchscreen-min-pressure", &value))
  1181			pdata->pressure_min = (u16) value;
  1182		of_property_read_u16(node, "ti,pressure-max", &pdata->pressure_max);
  1183	
  1184		of_property_read_u16(node, "ti,debounce-max", &pdata->debounce_max);
  1185		if (!of_property_read_u32(node, "touchscreen-average-samples", &value))
  1186			pdata->debounce_max = (u16) value;
  1187		of_property_read_u16(node, "ti,debounce-tol", &pdata->debounce_tol);
  1188		of_property_read_u16(node, "ti,debounce-rep", &pdata->debounce_rep);
  1189	
  1190		of_property_read_u32(node, "ti,pendown-gpio-debounce",
  1191				     &pdata->gpio_pendown_debounce);
  1192	
  1193		pdata->wakeup = of_property_read_bool(node, "wakeup-source") ||
  1194				of_property_read_bool(node, "linux,wakeup");
  1195	
> 1196		pdata->gpio_pendown = gpiod_get(dev, "pendown-gpio", GPIOD_IN);
  1197	
  1198		return pdata;
  1199	}
  1200	#else
  1201	static const struct ads7846_platform_data *ads7846_probe_dt(struct device *dev)
  1202	{
  1203		dev_err(dev, "no platform data defined\n");
  1204		return ERR_PTR(-EINVAL);
  1205	}
  1206	#endif
  1207	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
