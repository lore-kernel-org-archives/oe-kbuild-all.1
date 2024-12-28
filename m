Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D321422087
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Dec 2024 02:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735352664; cv=none; b=kspRLfJZ7ZiaGCldQmb4IzOT+/7lxlNf6G4oH8y/DxVBwZBviIta3Vr+4hPDhHIFZwYIO9NOkDSstU21CONOt8k3aeFkMOuAYvHfp+bZ5o9TSlF34h6Od7v2l87VXH2K2sqou930YOAsNGmSyNOowZHhfznz6Gonc6dsRRva6UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735352664; c=relaxed/simple;
	bh=EO14YZbOIQYdNf5JS5DysauJ7cJWcO7lSeoNxffKoUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PR5e+vSbgH+gDTDoKCOab1IgjA2jKcR6uyZPvfHckpBbuMJ9P7vfj39JP660EebEbqA8J/yimUBLqOVwwt/UrO8O2isC36XobA6irRHnA4f8pqWhZtWpVCygoLdsPkYknDjFP0JjNYRkb6kxexNrvbdJ2jdy3wZ62kgZuQfBxRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aDo+/4Jq; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aDo+/4Jq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735352662; x=1766888662;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EO14YZbOIQYdNf5JS5DysauJ7cJWcO7lSeoNxffKoUQ=;
  b=aDo+/4Jq/J1EvI2fnzP9VkzdupaXBFZRlanAFkfhIydPOaYwj5XofwLY
   uq6pF/OXS1GipEdYp8Afj8FhVFrScUNtBuoH2QpgmVLV9lHF6ThY3mw9b
   na44WV9qJKczc9Cwm2mrwY36D377JpW2SZSYkaNQWANHw5vetssIP1bM4
   acbIGr3LrkUktMTHUv3uuRyGhVeU19X4IJ04j3BXGNFFNSDH6zV5kjtXE
   2Fn8mzAf8QMwkbLxelz2vUjppwmpZzXbYO085pvGxXBP5jIvcX27olh5A
   7juAcHJrokwyxUmPIesKpqqgVEor9Qrz8zF9Uh5EoDDwa1lo0Eixo0XhE
   Q==;
X-CSE-ConnectionGUID: rEH44BNLS06d0OKzT+qgaQ==
X-CSE-MsgGUID: sdAb1dI5RWmiYhqWUHfK+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="38580188"
X-IronPort-AV: E=Sophos;i="6.12,271,1728975600"; 
   d="scan'208";a="38580188"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 18:24:20 -0800
X-CSE-ConnectionGUID: lCB60cAXT7+rPQESXyoZLQ==
X-CSE-MsgGUID: S1RIO+VEQuSm2lNhDx1RDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="105362053"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 27 Dec 2024 18:24:18 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRMUy-0003oo-1n;
	Sat, 28 Dec 2024 02:24:16 +0000
Date: Sat, 28 Dec 2024 10:23:25 +0800
From: kernel test robot <lkp@intel.com>
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: drivers/platform/mellanox/mlxreg-hotplug.c:87:61: warning: '%d'
 directive output may be truncated writing 1 byte into a region of size
 between 0 and 31
Message-ID: <202412281022.emy8ZDNh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Vadim,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fd0584d220fe285dc45be43eede55df89ad6a3d9
commit: 92d020f97966b1724cfcac93e89176d0eb3aca61 platform/mellanox: mlxreg-hotplug: Add environmental data to uevent
date:   4 years, 5 months ago
config: sparc-randconfig-001-20241212 (https://download.01.org/0day-ci/archive/20241228/202412281022.emy8ZDNh-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241228/202412281022.emy8ZDNh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412281022.emy8ZDNh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/bits.h:23,
                    from include/linux/bitops.h:5,
                    from drivers/platform/mellanox/mlxreg-hotplug.c:8:
   drivers/platform/mellanox/mlxreg-hotplug.c: In function 'mlxreg_hotplug_attr_init':
   include/linux/bits.h:26:42: warning: comparison of unsigned expression in '< 0' is always false [-Wtype-limits]
      26 |                 __builtin_constant_p((l) > (h)), (l) > (h), 0)))
         |                                          ^
   include/linux/build_bug.h:16:62: note: in definition of macro 'BUILD_BUG_ON_ZERO'
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                              ^
   include/linux/bits.h:39:10: note: in expansion of macro 'GENMASK_INPUT_CHECK'
      39 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |          ^~~~~~~~~~~~~~~~~~~
   drivers/platform/mellanox/mlxreg-hotplug.c:214:38: note: in expansion of macro 'GENMASK'
     214 |                         item->mask = GENMASK((regval & item->mask) - 1, 0);
         |                                      ^~~~~~~
   include/linux/bits.h:26:54: warning: comparison of unsigned expression in '< 0' is always false [-Wtype-limits]
      26 |                 __builtin_constant_p((l) > (h)), (l) > (h), 0)))
         |                                                      ^
   include/linux/build_bug.h:16:62: note: in definition of macro 'BUILD_BUG_ON_ZERO'
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                              ^
   include/linux/bits.h:39:10: note: in expansion of macro 'GENMASK_INPUT_CHECK'
      39 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |          ^~~~~~~~~~~~~~~~~~~
   drivers/platform/mellanox/mlxreg-hotplug.c:214:38: note: in expansion of macro 'GENMASK'
     214 |                         item->mask = GENMASK((regval & item->mask) - 1, 0);
         |                                      ^~~~~~~
   drivers/platform/mellanox/mlxreg-hotplug.c: In function 'mlxreg_hotplug_udev_event_send.isra':
>> drivers/platform/mellanox/mlxreg-hotplug.c:87:61: warning: '%d' directive output may be truncated writing 1 byte into a region of size between 0 and 31 [-Wformat-truncation=]
      87 |         snprintf(event_str, MLXREG_CORE_LABEL_MAX_SIZE, "%s=%d", label, !!action);
         |                                                             ^~
   drivers/platform/mellanox/mlxreg-hotplug.c:87:57: note: directive argument in the range [0, 1]
      87 |         snprintf(event_str, MLXREG_CORE_LABEL_MAX_SIZE, "%s=%d", label, !!action);
         |                                                         ^~~~~~~
   drivers/platform/mellanox/mlxreg-hotplug.c:87:9: note: 'snprintf' output between 3 and 34 bytes into a destination of size 32
      87 |         snprintf(event_str, MLXREG_CORE_LABEL_MAX_SIZE, "%s=%d", label, !!action);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +87 drivers/platform/mellanox/mlxreg-hotplug.c

    77	
    78	static int
    79	mlxreg_hotplug_udev_event_send(struct kobject *kobj,
    80				       struct mlxreg_core_data *data, bool action)
    81	{
    82		char event_str[MLXREG_CORE_LABEL_MAX_SIZE + 2];
    83		char label[MLXREG_CORE_LABEL_MAX_SIZE] = { 0 };
    84	
    85		mlxreg_hotplug_udev_envp[0] = event_str;
    86		string_upper(label, data->label);
  > 87		snprintf(event_str, MLXREG_CORE_LABEL_MAX_SIZE, "%s=%d", label, !!action);
    88	
    89		return kobject_uevent_env(kobj, KOBJ_CHANGE, mlxreg_hotplug_udev_envp);
    90	}
    91	
    92	static int mlxreg_hotplug_device_create(struct mlxreg_hotplug_priv_data *priv,
    93						struct mlxreg_core_data *data)
    94	{
    95		struct mlxreg_core_hotplug_platform_data *pdata;
    96		struct i2c_client *client;
    97	
    98		/* Notify user by sending hwmon uevent. */
    99		mlxreg_hotplug_udev_event_send(&priv->hwmon->kobj, data, true);
   100	
   101		/*
   102		 * Return if adapter number is negative. It could be in case hotplug
   103		 * event is not associated with hotplug device.
   104		 */
   105		if (data->hpdev.nr < 0)
   106			return 0;
   107	
   108		pdata = dev_get_platdata(&priv->pdev->dev);
   109		data->hpdev.adapter = i2c_get_adapter(data->hpdev.nr +
   110						      pdata->shift_nr);
   111		if (!data->hpdev.adapter) {
   112			dev_err(priv->dev, "Failed to get adapter for bus %d\n",
   113				data->hpdev.nr + pdata->shift_nr);
   114			return -EFAULT;
   115		}
   116	
   117		client = i2c_new_client_device(data->hpdev.adapter,
   118					       data->hpdev.brdinfo);
   119		if (IS_ERR(client)) {
   120			dev_err(priv->dev, "Failed to create client %s at bus %d at addr 0x%02x\n",
   121				data->hpdev.brdinfo->type, data->hpdev.nr +
   122				pdata->shift_nr, data->hpdev.brdinfo->addr);
   123	
   124			i2c_put_adapter(data->hpdev.adapter);
   125			data->hpdev.adapter = NULL;
   126			return PTR_ERR(client);
   127		}
   128	
   129		data->hpdev.client = client;
   130	
   131		return 0;
   132	}
   133	
   134	static void
   135	mlxreg_hotplug_device_destroy(struct mlxreg_hotplug_priv_data *priv,
   136				      struct mlxreg_core_data *data)
   137	{
   138		/* Notify user by sending hwmon uevent. */
   139		mlxreg_hotplug_udev_event_send(&priv->hwmon->kobj, data, false);
   140	
   141		if (data->hpdev.client) {
   142			i2c_unregister_device(data->hpdev.client);
   143			data->hpdev.client = NULL;
   144		}
   145	
   146		if (data->hpdev.adapter) {
   147			i2c_put_adapter(data->hpdev.adapter);
   148			data->hpdev.adapter = NULL;
   149		}
   150	}
   151	
   152	static ssize_t mlxreg_hotplug_attr_show(struct device *dev,
   153						struct device_attribute *attr,
   154						char *buf)
   155	{
   156		struct mlxreg_hotplug_priv_data *priv = dev_get_drvdata(dev);
   157		struct mlxreg_core_hotplug_platform_data *pdata;
   158		int index = to_sensor_dev_attr_2(attr)->index;
   159		int nr = to_sensor_dev_attr_2(attr)->nr;
   160		struct mlxreg_core_item *item;
   161		struct mlxreg_core_data *data;
   162		u32 regval;
   163		int ret;
   164	
   165		pdata = dev_get_platdata(&priv->pdev->dev);
   166		item = pdata->items + nr;
   167		data = item->data + index;
   168	
   169		ret = regmap_read(priv->regmap, data->reg, &regval);
   170		if (ret)
   171			return ret;
   172	
   173		if (item->health) {
   174			regval &= data->mask;
   175		} else {
   176			/* Bit = 0 : functional if item->inversed is true. */
   177			if (item->inversed)
   178				regval = !(regval & data->mask);
   179			else
   180				regval = !!(regval & data->mask);
   181		}
   182	
   183		return sprintf(buf, "%u\n", regval);
   184	}
   185	
   186	#define PRIV_ATTR(i) priv->mlxreg_hotplug_attr[i]
   187	#define PRIV_DEV_ATTR(i) priv->mlxreg_hotplug_dev_attr[i]
   188	
   189	static int mlxreg_hotplug_attr_init(struct mlxreg_hotplug_priv_data *priv)
   190	{
   191		struct mlxreg_core_hotplug_platform_data *pdata;
   192		struct mlxreg_core_item *item;
   193		struct mlxreg_core_data *data;
   194		unsigned long mask;
   195		u32 regval;
   196		int num_attrs = 0, id = 0, i, j, k, ret;
   197	
   198		pdata = dev_get_platdata(&priv->pdev->dev);
   199		item = pdata->items;
   200	
   201		/* Go over all kinds of items - psu, pwr, fan. */
   202		for (i = 0; i < pdata->counter; i++, item++) {
   203			if (item->capability) {
   204				/*
   205				 * Read group capability register to get actual number
   206				 * of interrupt capable components and set group mask
   207				 * accordingly.
   208				 */
   209				ret = regmap_read(priv->regmap, item->capability,
   210						  &regval);
   211				if (ret)
   212					return ret;
   213	
 > 214				item->mask = GENMASK((regval & item->mask) - 1, 0);
   215			}
   216	
   217			data = item->data;
   218	
   219			/* Go over all unmasked units within item. */
   220			mask = item->mask;
   221			k = 0;
   222			for_each_set_bit(j, &mask, item->count) {
   223				if (data->capability) {
   224					/*
   225					 * Read capability register and skip non
   226					 * relevant attributes.
   227					 */
   228					ret = regmap_read(priv->regmap,
   229							  data->capability, &regval);
   230					if (ret)
   231						return ret;
   232					if (!(regval & data->bit)) {
   233						data++;
   234						continue;
   235					}
   236				}
   237				PRIV_ATTR(id) = &PRIV_DEV_ATTR(id).dev_attr.attr;
   238				PRIV_ATTR(id)->name = devm_kasprintf(&priv->pdev->dev,
   239								     GFP_KERNEL,
   240								     data->label);
   241	
   242				if (!PRIV_ATTR(id)->name) {
   243					dev_err(priv->dev, "Memory allocation failed for attr %d.\n",
   244						id);
   245					return -ENOMEM;
   246				}
   247	
   248				PRIV_DEV_ATTR(id).dev_attr.attr.name =
   249								PRIV_ATTR(id)->name;
   250				PRIV_DEV_ATTR(id).dev_attr.attr.mode = 0444;
   251				PRIV_DEV_ATTR(id).dev_attr.show =
   252							mlxreg_hotplug_attr_show;
   253				PRIV_DEV_ATTR(id).nr = i;
   254				PRIV_DEV_ATTR(id).index = k;
   255				sysfs_attr_init(&PRIV_DEV_ATTR(id).dev_attr.attr);
   256				data++;
   257				id++;
   258				k++;
   259			}
   260			num_attrs += k;
   261		}
   262	
   263		priv->group.attrs = devm_kcalloc(&priv->pdev->dev,
   264						 num_attrs,
   265						 sizeof(struct attribute *),
   266						 GFP_KERNEL);
   267		if (!priv->group.attrs)
   268			return -ENOMEM;
   269	
   270		priv->group.attrs = priv->mlxreg_hotplug_attr;
   271		priv->groups[0] = &priv->group;
   272		priv->groups[1] = NULL;
   273	
   274		return 0;
   275	}
   276	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
